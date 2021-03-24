import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 课程信息
const KechengxinxiModel = sequelize.define('KechengxinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	kechengmingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '课程名称'
	},
	kechengleixing: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '课程类型'
	},
	kechengfengmian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '课程封面'
	},
	zaixiankecheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '在线课程'
	},
	jiage: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '价格'
	},
	kechengxiangqing: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '课程详情'
	},
	gonghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '工号'
	},
	jiaoshixingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '教师姓名'
	},
	thumbsupnum: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '赞'
	},
	crazilynum: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '踩'
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
	tableName: 'kechengxinxi'
})

export default KechengxinxiModel
