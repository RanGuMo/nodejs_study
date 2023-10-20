/**
 * 在这里定义和用户相关的路由处理函数，供 /router/user.js 模块进行调用
 */

// 导入数据库操作模块
const db = require('../db/index')
// 为了保证密码的安全性，不建议在数据库以 明文 的形式保存用户密码，推荐对密码进行 加密存储
// 在当前项目中，使用 bcryptjs 对用户密码进行加密，优点：
// 加密之后的密码，无法被逆向破解
// 同一明文密码多次加密，得到的加密结果各不相同，保证了安全性
const bcrypt = require('bcryptjs')




// 注册用户的处理函数
exports.regUser = (req, res) => {
    // 检测表单数据是否合法
    // 检测用户名是否被占用
    // 对密码进行加密处理
    // 插入新用户

    // 接收表单数据
    const userinfo = req.body
    console.log(userinfo, 12);
    // 判断数据是否合法
    if (!userinfo.username || !userinfo.password) {
        return res.send({ status: 1, message: '用户名或密码不能为空' })
    }
    // 检测用户名是否被占用
    const sql = `select * from ev_users where username=?`
    db.query(sql, [userinfo.username], function (err, result) {
        // 执行 SQL 语句失败
        if (err) {
            return res.send({ status: 1, message: err.message })
        }
        // 用户名被占用
        if (result.length > 0) {
            return res.send({ status: 1, message: '用户名被占用，请更换其他用户名！' }) 
        }

        // bcrypt.hashSync(明文密码, 随机盐的长度)
        /// 对用户的密码,进行 bcrype 加密，返回值是加密之后的密码字符串
        userinfo.password = bcrypt.hashSync(userinfo.password, 10)

        // 插入新用户
        const sql = 'insert into ev_users set ?'
        db.query(sql, { username: userinfo.username, password: userinfo.password }, function (err, results) {
            // 执行 SQL 语句失败
            if (err) return res.send({ status: 1, message: err.message })
            // SQL 语句执行成功，但影响行数不为 1
            if (results.affectedRows !== 1) {
                return res.send({ status: 1, message: '注册用户失败，请稍后再试！' })
            }
            // 注册成功
            res.send({ status: 0, message: '注册成功！' })
        })





    })


    // 加密密码
    // 插入新用户

    // 返回响应
    // res.send('注册成功')


}

// 登录的处理函数
exports.login = (req, res) => {
    res.send('login OK')
}
