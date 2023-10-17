'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Menus extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.hasMany(this, {
        foreignKey: 'parentid',
        as: 'Submenus'
      })

      this.belongsTo(this, {
        foreignKey: 'parentid',
        as: 'ParentMenu'
      })
    }
  }
  Menus.init({
    name: DataTypes.STRING,
    slug: DataTypes.STRING,
    parentid: DataTypes.NUMBER,
    active: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'Menus',
  });
  return Menus;
};