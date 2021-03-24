import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op } from 'sequelize'
import toRes from '../lib/toRes'
import ExamrecordModel from '../models/ExamrecordModel'
import jwt from 'jsonwebtoken'
import moment from 'moment'

export default ({ config, db }) => {
	let api = Router()


	// 分页接口（后端）
	api.get('/page', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
            if (req.session.userinfo.role != '管理员') {
				where.userid = {
					[Op.eq]: req.session.userinfo.id
				}
            }
			let myscore = req.query.myscore
			let userid  = req.query.userid
			let paperid = req.query.paperid
			if (myscore) {
				where.myscore = {
					[Op.eq]: myscore
				}
			}
			if (userid) {
				where.userid = {
					[Op.eq]: userid
				}
			}
			if (paperid) {
				where.paperid = {
					[Op.eq]: paperid
				}
			}

			let result = await ExamrecordModel.findAndCountAll({
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
            if (req.session.userinfo.role != '管理员') {
				where.userid = {
					[Op.eq]: req.session.userinfo.id
				}
            }
			let myscore = req.query.myscore
			let userid  = req.query.userid
			let paperid = req.query.paperid
			if (myscore) {
				where.myscore = {
					[Op.eq]: myscore
				}
			}
			if (userid) {
				where.userid = {
					[Op.eq]: userid
				}
			}
			if (paperid) {
				where.paperid = {
					[Op.eq]: paperid
				}
			}

			let result = await ExamrecordModel.findAndCountAll({
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

			if (!req.body.userid) {
				req.body.userid = req.session.userinfo.id
			}

			const userinfo = await ExamrecordModel.create(req.body)

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

			req.body.userid = req.session.userinfo.id

			const userinfo = await ExamrecordModel.create(req.body)

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

			await ExamrecordModel.update(req.body, {
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

			await ExamrecordModel.destroy({
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


			toRes.record(res, 0, await ExamrecordModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 详情接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await ExamrecordModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindStart) sql = "SELECT COUNT(*) AS count FROM examrecord WHERE " + req.params.columnName + " >= '" + req.query.remindStart + "'"
				if (req.query.remindEnd) sql = "SELECT COUNT(*) AS count FROM examrecord WHERE " + req.params.columnName + " <= '" + req.query.remindEnd + "'"
			}

			if (req.params.type == 2) {
				if (req.query.remindStart) {
					let remindStart = util.getDateTimeFormat(0 - req.query.remindStart, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM examrecord WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindEnd) {
					let remindEnd = util.getDateTimeFormat(req.query.remindEnd, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM examrecord WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
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





	// 考试记录试卷分页接口【仅查试卷和总分】(管理员看所有，普通用户仅看自己)
	api.get('/groupby', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 5

			let result = await ExamrecordModel.findAndCountAll({
				attributes: [
					'userid',
					'paperid',
					'papername',
					[Sequelize.fn('SUM', Sequelize.col('myscore')), 'myscore']
				],
				offset: (page - 1) * limit,
				limit,
				group: ['userid', 'paperid', 'papername']
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 当重新考试时，删除考生的某个试卷的所有考试记录
	api.post('/deleteRecords', async (req, res) => {

		try {

			await ExamrecordModel.destroy({
				where: {
				  userid: req.query.userid,
				  paperid: req.query.paperid
				}
			})

			toRes.session(res, 0, '删除成功！')
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	return api
}
