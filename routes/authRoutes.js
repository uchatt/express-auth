const { Router } = require("express");
const authController = require("../controllers/authController");
const { body } = require("express-validator");

const router = Router();

router.get("/signup", authController.signup_get);
router.get("/login", authController.login_get);

router.post(
    "/signup",
    [
        body("first")
            .not()
            .isEmpty()
            .withMessage(`Cannot be Empty.`)
            .trim()
            .escape(),
        body("last")
            .not()
            .isEmpty()
            .withMessage(`Cannot be Empty.`)
            .trim()
            .escape(),
        body("email").not().isEmpty().trim().isEmail().normalizeEmail(),
        body("phone").not().isEmpty().isMobilePhone("en-IN"),
        body("dob").not().isEmpty().isDate().withMessage("Invalid date, correct it asshole."),
        body("password")
            .not()
            .isEmpty()
            .isLength({ min: 3 })
            .withMessage(`Must be greater than 3 characters`)
    ],
    authController.signup_post
);
router.post("/login", authController.login_post);

module.exports = router;
