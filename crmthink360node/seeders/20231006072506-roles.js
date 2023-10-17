'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Roles', [
    {
      name: 'Admin',
      slug: 'admin',
      active: '1',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'HR',
      slug: 'hr',
      active: '1',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Sr php developer',
      slug: 'sr_php_developer',
      active: '1',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Developer',
      slug: 'developer',
      active: '1',
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: 'Jr php developer',
      slug: 'jr_php_developer',
      active: '1',
      createdAt: new Date(),
      updatedAt: new Date()
    }
    ]);
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Roles', null, {});
  }
};