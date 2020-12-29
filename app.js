require("dotenv").config();
const express = require("express");
const authRoutes = require("./routes/authRoutes");
const cors = require("cors");
const cookieParser = require("cookie-parser");

const app = express();

// middleware
app.use(express.static("public"));

app.use(cors());

// parse the body
app.use(express.json());
app.use(cookieParser());

// view engine
app.set("view engine", "ejs");

// routes
app.get("/", (req, res) => res.render("home"));
app.get("/smoothies", (req, res) => res.render("smoothies"));
app.use(authRoutes);

app.get("/cookieSet", (req, res) => {
    res.cookie("loggedIn", false, {
        maxAge: 1000 * 60,
        httpOnly: true
    });
    res.send("you got the cookies.");
});

app.get("/cookieGet", (req, res) => {
    const pagla = req.cookies;
    console.log(pagla);
    res.json(pagla);
});

app.listen(3000, () => {});
