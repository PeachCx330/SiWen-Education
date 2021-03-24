import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op } from 'sequelize'
import toRes from '../lib/toRes'
import XueshengModel from '../models/XueshengModel'
import jwt from 'jsonwebtoken'
import moment from 'moment'

export default ({ config, db }) => {
	let api = Router()

	// 用户登录接口
	api.all('/login', async (req, res) => {

		try {

			let userinfo = await XueshengModel.findOne({ where: { xuehao: req.query.username, mima: req.query.password } })
			if (userinfo === null) {
				toRes.session(res, -1, '用户名或密码错误！')
				return;
			}

			const token = jwt.sign(
				{
					id: userinfo.dataValues.id,
					username: userinfo.dataValues.xuehao,
					role: '学生',
                    loginUserColumn: 'xuehao',
                    tableName: 'xuesheng'
				},
				config.jwtSecret,
				{
					expiresIn: 60 * 60 * 24 * 1
				}
			)

			userinfo.dataValues.token = token
			userinfo.dataValues.role = '学生'
			userinfo.dataValues.loginUserColumn = 'xuehao'
			userinfo.dataValues.tableName = 'xuesheng'
			delete userinfo.dataValues.mima
			req.session.userinfo = userinfo

			toRes.session(res, 0, '登录成功！', token)
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 用户退出接口
	api.all('/logout', (req, res) => {
		
		req.session.destroy(err => {
			toRes.session(res, 0, '退出成功！')
		})
	})

	// 注册接口
	api.post('/register', async (req, res) => {

		try {

			const userinfo = await XueshengModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, '注册失败！')
			} else {

				toRes.session(res, 0, '注册成功！')
			}
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 获取session接口
	api.all('/session', async (req, res) => {

		try {

			toRes.record(res, 0, await XueshengModel.findOne({ where: { id: req.session.userinfo.id } }))
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 忘记密码（找回密码）
	api.all('/resetPass', async (req, res) => {

		try {

			await XueshengModel.update({
				mima: '123456'
			}, {
				where: {
				  xuehao: req.query.username
				}
			})

			toRes.session(res, 0, '密码已重置为：123456')
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 分页接口（后端）
	api.get('/page', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			var xuehao = req.query.xuehao
			if (xuehao) {

				if (xuehao.indexOf('%') != -1) {
					where.xuehao = {
						[Op.like]: xuehao
					}
				} else {
					where.xuehao = {
						[Op.eq]: xuehao
					}
				}
			}
			var xueshengxingming = req.query.xueshengxingming
			if (xueshengxingming) {

				if (xueshengxingming.indexOf('%') != -1) {
					where.xueshengxingming = {
						[Op.like]: xueshengxingming
					}
				} else {
					where.xueshengxingming = {
						[Op.eq]: xueshengxingming
					}
				}
			}
			var xingbie = req.query.xingbie
			if (xingbie) {

				if (xingbie.indexOf('%') != -1) {
					where.xingbie = {
						[Op.like]: xingbie
					}
				} else {
					where.xingbie = {
						[Op.eq]: xingbie
					}
				}
			}

			let result = await XueshengModel.findAndCountAll({
				order: [[sort, order]],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 分页接口（前端）
	api.get('/list', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			var xuehao = req.query.xuehao
			if (xuehao) {

				if (xuehao.indexOf('%') != -1) {
					where.xuehao = {
						[Op.like]: xuehao
					}
				} else {
					where.xuehao = {
						[Op.eq]: xuehao
					}
				}
			}
			var xueshengxingming = req.query.xueshengxingming
			if (xueshengxingming) {

				if (xueshengxingming.indexOf('%') != -1) {
					where.xueshengxingming = {
						[Op.like]: xueshengxingming
					}
				} else {
					where.xueshengxingming = {
						[Op.eq]: xueshengxingming
					}
				}
			}
			var xingbie = req.query.xingbie
			if (xingbie) {

				if (xingbie.indexOf('%') != -1) {
					where.xingbie = {
						[Op.like]: xingbie
					}
				} else {
					where.xingbie = {
						[Op.eq]: xingbie
					}
				}
			}

			let result = await XueshengModel.findAndCountAll({
				order: [[sort, order]],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})


	// 保存接口（后端）
	api.post('/save', async (req, res) => {

		try {


			const userinfo = await XueshengModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, '添加失败！')
			} else {

				toRes.session(res, 0, '添加成功！')
			}
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 保存接口（前端）
	api.post('/add', async (req, res) => {

		try {


			const userinfo = await XueshengModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, '添加失败！')
			} else {

				toRes.session(res, 0, '添加成功！')
			}
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 更新接口
	api.post('/update', async (req, res) => {

		try {

			await XueshengModel.update(req.body, {
				where: {
				  id: req.body.id
				}
			})

			toRes.session(res, 0, '编辑成功！')
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 删除接口
	api.post('/delete', async (req, res) => {

		try {

			await XueshengModel.destroy({
				where: {
				  id: {
					[Op.in]: req.body
				  }
				}
			})

			toRes.session(res, 0, '删除成功！')
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 详情接口（后端）
	api.all('/info/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await XueshengModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 详情接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await XueshengModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindStart) sql = "SELECT COUNT(*) AS count FROM xuesheng WHERE " + req.params.columnName + " >= '" + req.query.remindStart + "'"
				if (req.query.remindEnd) sql = "SELECT COUNT(*) AS count FROM xuesheng WHERE " + req.params.columnName + " <= '" + req.query.remindEnd + "'"
			}

			if (req.params.type == 2) {
				if (req.query.remindStart) {
					let remindStart = util.getDateTimeFormat(0 - req.query.remindStart, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM xuesheng WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindEnd) {
					let remindEnd = util.getDateTimeFormat(req.query.remindEnd, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM xuesheng WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
				}
			}

			const results = await sequelize.query(sql, {
				plain: true,
				raw: true,
				type: QueryTypes.SELECT
			})

			toRes.count(res, 0, results.count)
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})







	return api
}
