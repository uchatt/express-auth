const { validationResult } = require("express-validator");
const { pool } = require("../services/database");
const bcrypt = require("bcrypt");

module.exports.signup_get = (req, res) => {
    res.render("signup");
};

module.exports.login_get = (req, res) => {
    res.render("login");
};

/**
 * User Registration.
 * POST handler.
 */

module.exports.signup_post = async (req, res) => {
    // Handle errors from input validation
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({
            errors: errors
                .array()
                .map((x) => `Param: ${x.param}, Message: ${x.msg}`)
        });
    }

    // Extract data from Request body
    const { first, last, email, phone, dob } = req.body;
    // let password = req.body["password"];
    let salt = await bcrypt.genSalt();
    let password_hash = await bcrypt.hash(req.body["password"], salt);

    // DB Query
    let DEBUG = false;
    if (DEBUG) {
        console.log(req.body);
        res.status(200).json("IN DEBUG MODE.");
    } else {
        let conn;
        try {
            conn = await pool.getConnection();
            const db_res = await conn.query(
                "select id from t_user_profile where email=? and phone=?",
                [email, phone]
            );

            if (db_res.length === 0) {
                const db_res = await conn.query(
                    "INSERT INTO t_user_profile (first, last, email, phone, dob, password_hash, salt ) values (?, ?, ?, ?, ?, ?, ?)",
                    [first, last, email, phone, dob, password_hash, salt]
                );
                res.status(201).json({
                    success: true,
                    message: `Thanks for signing up.`
                });
            } else if (db_res.length === 1) {
                res.json({
                    success: false,
                    message: `A user with the same credential exists.`
                });
            }
        } catch (err) {
            console.log(err.message);
            res.status(400).json({
                success: false,
                message: `Failed due to some technical issues. Kindly contact admin.`
            });
        } finally {
            if (conn) return conn.end();
        }
    }
};

module.exports.login_post = (req, res) => {
    const { email, password } = req.body;
    res.json(`You logged in with email ${email} and password ${password}`);
};
