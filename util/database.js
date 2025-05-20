const Sequelize = require("sequelize");
const fs = require('fs');

// const sequelize = new Sequelize(process.env.DB_SCHEMA_NAME, process.env.DB_USER_NAME, process.env.DB_USER_PASSWORD, {
//   dialect: "mysql",
//   host: process.env.DB_HOST_URL,
// });

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  dialect: 'mysql',
  dialectOptions: {
    ssl: {
      require: process.env.DB_SSL,
      rejectUnauthorized: process.env.DB_SSL,
      ca: fs.readFileSync(__dirname + '/../certs/ca.pem')
    }
  },
  logging: false
});

module.exports = sequelize;
