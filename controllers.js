'use strict';

var Controllers = {};

Controllers.renderAdminPage = function (req, res, next) {
	res.render('admin/plugins/composer-searchpaws', {});
};

module.exports = Controllers;