import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op } from 'sequelize'
import toRes from '../lib/toRes'
import MingshiModel from '../models/MingshiModel'
import jwt from 'jsonwebtoken'
import moment from 'moment'

export default ({ config, db }) => {
	let api = Router()

	// 用户登录接口
	api.all('/login', async (req, res) => {

		try {

			let userinfo = await MingshiModel.findOne({ where: { gonghao: req.query.username, mima: req.query.password } })
			if (userinfo === null) {
				toRes.session(res, -1, '用户名或密码错误！')
				return;
			}

			const token = jwt.sign(
				{
					id: userinfo.dataValues.id,
					username: userinfo.dataValues.gonghao,
					role: '名师',
                    loginUserColumn: 'gonghao',
                    tableName: 'mingshi'
				},
				config.jwtSecret,
				{
					expiresIn: 60 * 60 * 24 * 1
				}
			)

			userinfo.dataValues.token = token
			userinfo.dataValues.role = '名师'
			userinfo.dataValues.loginUserColumn = 'gonghao'
			userinfo.dataValues.tableName = 'mingshi'
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

			const userinfo = await MingshiModel.create(req.body)

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

			toRes.record(res, 0, await MingshiModel.findOne({ where: { id: req.session.userinfo.id } }))
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 忘记密码（找回密码）
	api.all('/resetPass', async (req, res) => {

		try {

			await MingshiModel.update({
				mima: '123456'
			}, {
				where: {
				  gonghao: req.query.username
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
			var gonghao = req.query.gonghao
			if (gonghao) {

				if (gonghao.indexOf('%') != -1) {
					where.gonghao = {
						[Op.like]: gonghao
					}
				} else {
					where.gonghao = {
						[Op.eq]: gonghao
					}
				}
			}
			var jiaoshixingming = req.query.jiaoshixingming
			if (jiaoshixingming) {

				if (jiaoshixingming.indexOf('%') != -1) {
					where.jiaoshixingming = {
						[Op.like]: jiaoshixingming
					}
				} else {
					where.jiaoshixingming = {
						[Op.eq]: jiaoshixingming
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

			let result = await MingshiModel.findAndCountAll({
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
			var gonghao = req.query.gonghao
			if (gonghao) {

				if (gonghao.indexOf('%') != -1) {
					where.gonghao = {
						[Op.like]: gonghao
					}
				} else {
					where.gonghao = {
						[Op.eq]: gonghao
					}
				}
			}
			var jiaoshixingming = req.query.jiaoshixingming
			if (jiaoshixingming) {

				if (jiaoshixingming.indexOf('%') != -1) {
					where.jiaoshixingming = {
						[Op.like]: jiaoshixingming
					}
				} else {
					where.jiaoshixingming = {
						[Op.eq]: jiaoshixingming
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

			let result = await MingshiModel.findAndCountAll({
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


			const userinfo = await MingshiModel.create(req.body)

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


			const userinfo = await MingshiModel.create(req.body)

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

			await MingshiModel.update(req.body, {
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

			await MingshiModel.destroy({
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


			toRes.record(res, 0, await MingshiModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 详情接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await MingshiModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindStart) sql = "SELECT COUNT(*) AS count FROM mingshi WHERE " + req.params.columnName + " >= '" + req.query.remindStart + "'"
				if (req.query.remindEnd) sql = "SELECT COUNT(*) AS count FROM mingshi WHERE " + req.params.columnName + " <= '" + req.query.remindEnd + "'"
			}

			if (req.params.type == 2) {
				if (req.query.remindStart) {
					let remindStart = util.getDateTimeFormat(0 - req.query.remindStart, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM mingshi WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindEnd) {
					let remindEnd = util.getDateTimeFormat(req.query.remindEnd, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM mingshi WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
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

	// 赞、踩接口
	api.get('/thumbsup/:id', async (req, res) => {

		try {

			let type = req.query.type

			const recordInfo = await MingshiModel.findOne({ where: { id: req.params.id } })
			if (type == 1) {
				await recordInfo.increment('thumbsupnum')
			}
			if (type == 2) {
				await recordInfo.increment('crazilynum')
			}

			toRes.session(res, 0, '操作成功！')
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})






	return api
}
