import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 考试记录表
const ExamrecordModel = sequelize.define('ExamrecordModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	userid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '用户id'
	},
	username: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '用户名'
	},
	paperid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '试卷id（外键）'
	},
	papername: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '试卷名称'
	},
	questionid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '试题id（外键）'
	},
	questionname: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '试题名称'
	},
	options: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '选项，json字符串'
	},
	score: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '分值'
	},
	answer: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '正确答案'
	},
	analysis: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '答案解析'
	},
	myscore: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '试题得分'
	},
	myanswer: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '考生答案'
	},
	addtime: {
  		type: DataTypes.DATE,
  		defaultValue: DataTypes.NOW,
    	allowNull: false,
    	get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD HH:mm:ss')
        },
		comment: '添加时间'
	}
}, {
	timestamps: false,
	freezeTableName: true,
	tableName: 'examrecord'
})

export default ExamrecordModel
