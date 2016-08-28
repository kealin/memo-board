var app = angular.module('app', 
['ngRoute', 
'blockUI',
'ui.bootstrap',
'ui-notification'
]);

app.config(function(NotificationProvider) {
	NotificationProvider.setOptions({
		delay: 10000,
		startTop: 20,
		startRight: 10,
		verticalSpacing: 20,
		horizontalSpacing: 20,
		positionX: 'right',
		positionY: 'bottom'
	});
});
