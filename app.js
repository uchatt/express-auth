require("dotenv").config();
const express = require("express");
const authRoutes = require("./routes/authRoutes");
const cors = require("cors");
const bcrypt = require("bcrypt");

const app = express();

// middleware
app.use(express.static("public"));

app.use(cors());

// parse the body
app.use(express.json());

// view engine
app.set("view engine", "ejs");

// routes
app.get("/", (req, res) => res.render("home"));
app.get("/smoothies", (req, res) => res.render("smoothies"));
app.use(authRoutes);

app.listen(3000, () => {});
