// 导入 express 模块
const express = require('express')
// 创建 express 的服务器实例
const app = express()

// 导入 cors 中间件
const cors = require('cors')
// 将 cors 注册为全局中间件
app.use(cors())
app.use(express.urlencoded({ extended: false }))
app.use(express.json())


// 导入并注册用户路由模块
const userRouter = require('./src/router/user')
app.use('/api', userRouter)



// 响应数据的中间件
app.use(function (req, res, next) {
    // status = 0 为成功； status = 1 为失败； 默认将 status 的值设置为 1，方便处理失败的情况
    res.cc = function (err, status = 1) {
      res.send({
        // 状态
        status,
        // 状态描述，判断 err 是 错误对象 还是 字符串
        message: err instanceof Error ? err.message : err,
      })
    }
    next()
  })
  

// write your code here...

// 调用 app.listen 方法，指定端口号并启动web服务器
app.listen(12138, function () {
  console.log('api server running at http://127.0.0.1:12138')
})
