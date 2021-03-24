import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 课程文件
const KechengwenjianModel = sequelize.define('KechengwenjianModel', {
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
	kechengwenjian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '课程文件'
	},
	faburiqi: {
		type: DataTypes.DATEONLY,
		allowNull: true,
		get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD')
        },
		comment: '发布日期'
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
	tableName: 'kechengwenjian'
})

export default KechengwenjianModel
