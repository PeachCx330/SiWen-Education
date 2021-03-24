import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 试卷表
const ExampaperModel = sequelize.define('ExampaperModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	name: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '试卷名称'
	},
	time: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '考试时长(分钟)'
	},
	status: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '试卷状态'
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
	tableName: 'exampaper'
})

export default ExampaperModel
