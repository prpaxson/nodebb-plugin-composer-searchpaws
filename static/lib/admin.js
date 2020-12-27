'use strict';
/* globals $, app, socket */

define('admin/plugins/composer-searchpaws', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
		Settings.load('composer-searchpaws', $('.composer-searchpaws-settings'));

		$('#save').on('click', function() {
			Settings.save('composer-searchpaws', $('.composer-searchpaws-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'composer-searchpaws-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				});
			});
		});
	};

	return ACP;
});