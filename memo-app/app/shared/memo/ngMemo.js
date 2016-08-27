angular.module('app').directive('ngMemo', function () {
	return {
		restrict: 'E',
		templateUrl: 'app/shared/memo/memoTemplate.html',
		scope: {
			memo: '=',
		},
		link: function ($scope, element, attr) {
			
		}
	};
});