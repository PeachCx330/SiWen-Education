import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op } from 'sequelize'
import toRes from '../lib/toRes'
import ExampaperModel from '../models/ExampaperModel'
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
			var name = req.query.name
			if (name) {

				if (name.indexOf('%') != -1) {
					where.name = {
						[Op.like]: name
					}
				} else {
					where.name = {
						[Op.eq]: name
					}
				}
			}

			let result = await ExampaperModel.findAndCountAll({
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
			var name = req.query.name
			if (name) {

				if (name.indexOf('%') != -1) {
					where.name = {
						[Op.like]: name
					}
				} else {
					where.name = {
						[Op.eq]: name
					}
				}
			}

			let result = await ExampaperModel.findAndCountAll({
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


			const userinfo = await ExampaperModel.create(req.body)

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


			const userinfo = await ExampaperModel.create(req.body)

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

			await ExampaperModel.update(req.body, {
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

			await ExampaperModel.destroy({
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


			toRes.record(res, 0, await ExampaperModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 详情接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {


			toRes.record(res, 0, await ExampaperModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindStart) sql = "SELECT COUNT(*) AS count FROM exampaper WHERE " + req.params.columnName + " >= '" + req.query.remindStart + "'"
				if (req.query.remindEnd) sql = "SELECT COUNT(*) AS count FROM exampaper WHERE " + req.params.columnName + " <= '" + req.query.remindEnd + "'"
			}

			if (req.params.type == 2) {
				if (req.query.remindStart) {
					let remindStart = util.getDateTimeFormat(0 - req.query.remindStart, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM exampaper WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindEnd) {
					let remindEnd = util.getDateTimeFormat(req.query.remindEnd, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM exampaper WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
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
