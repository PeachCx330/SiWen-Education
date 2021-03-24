import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 课程购买
const KechenggoumaiModel = sequelize.define('KechenggoumaiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	dingdanbianhao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '订单编号'
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
	gonghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '工号'
	},
	jiage: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '价格'
	},
	goumairiqi: {
		type: DataTypes.DATEONLY,
		allowNull: true,
		get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD')
        },
		comment: '购买日期'
	},
	beizhu: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '备注'
	},
	xuehao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '学号'
	},
	xueshengxingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '学生姓名'
	},
	ispay: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '是否支付'
	},
	userid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '用户id'
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
	tableName: 'kechenggoumai'
})

export default KechenggoumaiModel
