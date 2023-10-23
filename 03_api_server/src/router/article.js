// 导入 express
const express = require('express')
// 创建路由对象
const router = express.Router()

const article_handler = require('../router_handler/article')

// 获取文章分类的列表数据
router.get('/cates',article_handler.getArticleCates)

// 向外共享路由对象
module.exports = router