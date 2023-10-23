// 导入定义验证规则的模块
const joi = require('joi')


// * alphanum() 值只能是包含 a-zA-Z0-9 的字符串
// 定义 分类名称 和 分类别名 的校验规则
const name = joi.string().required()
const alias = joi.string().alphanum().required()

// 校验规则对象 - 添加分类
exports.add_cate_schema = {
  body: {
    name,
    alias,
  },
}