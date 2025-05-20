require('dotenv').config();
const path = require("path");
const fs = require('fs');

const errorController = require("./controllers/error");
const sequelize = require("./util/database");
const Product = require("./models/product");
const User = require("./models/user");
const Cart = require("./models/cart");
const CartItem = require("./models/cart-item");
const Order = require("./models/order");
const OrderItem = require("./models/order-item");
// const helmet = require('helmet');
const compression = require('compression');
const morgan = require('morgan');

const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.set("view engine", "ejs");
app.set("views", "views");

const adminRoutes = require("./routes/admin");
const shopRoutes = require("./routes/shop");

const accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), { flags: 'a' })

// app.use(helmet());
app.use(compression());
app.use(morgan('combined', { stream: accessLogStream }));


app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));

app.use((req, res, next) => {
  User.findByPk(1)
    .then((user) => {
      req.user = user;
      next();
    })
    .catch((error) => {
      console.log("Error in App.js, in user retrieval, {}", error);
    });
});

// Routes
app.use(shopRoutes);
app.use("/admin", adminRoutes);

// Place 404 in bottom of route
app.use(errorController.get404);

// One direction is enough
Product.belongsTo(User, { constraints: true, onDelete: "CASCADE" });
User.hasMany(Product);

// One direction is enough
User.hasOne(Cart);
Cart.belongsTo(User);

// One direction is enough
Cart.belongsToMany(Product, { through: CartItem })
Product.belongsToMany(Cart, { through: CartItem })

// One direction is enough
Order.belongsTo(User);
User.hasMany(Order);

Order.belongsToMany(Product, { through: OrderItem })

sequelize
  // .sync({ force: true })
  .sync()
  .then((result) => {
    return User.findByPk(1);
  })
  .then((user) => {
    if (!user) {
      return User.create({ name: "Rendy", email: "rendyproklamanta@gmail.com" });
    }
    return user;
  })
  .then((user) => {
    return user.createCart();
  })
  .then(cart => {
    app.listen(3000, () => console.log('Server running on http://localhost:3000'));
  })
  .catch((error) => console.log("APP error, {}", error));
