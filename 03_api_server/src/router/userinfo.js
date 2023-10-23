// 导入 express
const express = require('express')
// 创建路由对象
const router = express.Router()

const userinfo_handler = require('../router_handle/userinfo_handle')

// 获取用户的基本信息
router.get('/userinfo', userinfo_handler.getUserinfo)














// 向外共享路由对象
module.exports = router