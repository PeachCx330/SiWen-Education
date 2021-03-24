import { Router } from 'express'
import UsersController from './Users'
import FileController from './File'
import ConfigController from './Config'
import CommonController from './Common'
import XueshengController from './Xuesheng'
import MingshiController from './Mingshi'
import KechengxinxiController from './Kechengxinxi'
import JisuanjixueyuanController from './Jisuanjixueyuan'
import ShejixueyuanController from './Shejixueyuan'
import KechenggoumaiController from './Kechenggoumai'
import KechengwenjianController from './Kechengwenjian'
import ForumController from './Forum'
import ExampaperController from './Exampaper'
import ExamquestionController from './Examquestion'
import ExamrecordController from './Examrecord'
import StoreupController from './Storeup'
import MessagesController from './Messages'
import DiscussmingshiController from './Discussmingshi'
import DiscusskechengxinxiController from './Discusskechengxinxi'

export default ({ config, db }) => {
	let api = Router()

	api.use('/users', UsersController({ config, db }))

	api.use('/file', FileController({ config, db }))

	api.use('/config', ConfigController({ config, db }))

	api.use('/', CommonController({ config, db }))

	api.use('/xuesheng', XueshengController({ config, db }))

	api.use('/mingshi', MingshiController({ config, db }))

	api.use('/kechengxinxi', KechengxinxiController({ config, db }))

	api.use('/jisuanjixueyuan', JisuanjixueyuanController({ config, db }))

	api.use('/shejixueyuan', ShejixueyuanController({ config, db }))

	api.use('/kechenggoumai', KechenggoumaiController({ config, db }))

	api.use('/kechengwenjian', KechengwenjianController({ config, db }))

	api.use('/forum', ForumController({ config, db }))

	api.use('/exampaper', ExampaperController({ config, db }))

	api.use('/examquestion', ExamquestionController({ config, db }))

	api.use('/examrecord', ExamrecordController({ config, db }))

	api.use('/storeup', StoreupController({ config, db }))

	api.use('/messages', MessagesController({ config, db }))

	api.use('/discussmingshi', DiscussmingshiController({ config, db }))

	api.use('/discusskechengxinxi', DiscusskechengxinxiController({ config, db }))

	return api
}
