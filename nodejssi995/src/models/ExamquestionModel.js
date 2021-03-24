import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 试题表
const ExamquestionModel = sequelize.define('ExamquestionModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	paperid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '所属试卷id（外键）'
	},
	papername: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '试卷名称'
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
	type: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）'
	},
	sequence: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '试题排序，值越大排越前面'
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
	tableName: 'examquestion'
})

export default ExamquestionModel
