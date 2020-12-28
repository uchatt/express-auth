/**
 * Database services
 */
const mariadb = require("mariadb");

// database connection
exports.pool = mariadb.createPool({
    host: process.env.host,
    user: process.env.user,
    password: process.env.password,
    connectionLimit: 5,
    database: process.env.database
});
