angular.module('app').directive('ngMemo', function () {
	return {
		restrict: 'E',
		templateUrl: 'app/shared/memo/memoTemplate.html',
		scope: {
			memo: '=',
			remove: '&',
			edit: '&'
		},
		link: function ($scope, element, attr) {
			
		}
	};
});