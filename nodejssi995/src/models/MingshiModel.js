import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 名师
const MingshiModel = sequelize.define('MingshiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	gonghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '工号'
	},
	mima: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '密码'
	},
	jiaoshixingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '教师姓名'
	},
	xingbie: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '性别'
	},
	touxiang: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '头像'
	},
	zhicheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '职称'
	},
	jiaoshishouji: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '教师手机'
	},
	beizhu: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '备注'
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
	tableName: 'mingshi'
})

export default MingshiModel
