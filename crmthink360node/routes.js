const express = require('express');
const router = express.Router();
const { registerUser, loginUser, getAllUser, getUser, verifytoken } = require("./controllers/users");
const { dashboard } = require("./controllers/panel/dashboard");
const { productlist, categoryList } = require("./controllers/panel/product");
const { userAuth } = require("./middlewares/auth");

router.get('/api/user/getall', [userAuth, getAllUser]);
router.get('/api/user/get', getUser);
router.post('/api/user/register', registerUser);
router.post('/api/user/login', loginUser);
router.post('/api/user/verifytoken', [userAuth, verifytoken]);

/* Admin panel */
router.get('/api/admin/dashboard', dashboard);
router.get('/api/admin/produclist', productlist);
router.post('/api/admin/product-category-list', categoryList);

module.exports = router;