angular.module('app')
	.service('memoService', ['$uibModal',
		function ($uibModal) {

		var defaults = {
			backdrop: true,			
			keyboard: true,
			modalFade: true,
			templateUrl: '/app/shared/modals/memo.html'
		};
		
		var options = {
			title: '',
			content: '',
			type: null,
			typeList: null
		};

		this.showModal = function (customDefaults, customOptions) {
			if (!customDefaults) customDefaults = {};
			customDefaults.backdrop = 'static';
			return this.show(customDefaults, customOptions);
		};

		this.show = function (customDefaults, customOptions) {
			var tempDefaults = {};
			var tempOptions = {};

			angular.extend(tempDefaults, defaults, customDefaults);
			angular.extend(tempOptions, options, customOptions);

			if (!tempDefaults.controller) {
				tempDefaults.controller = function ($scope, $uibModalInstance) {
					$scope.options = tempOptions;
					$scope.options.ok = function (result) {
						$uibModalInstance.close($scope.options);
					};
					$scope.options.close = function (result) {
						$uibModalInstance.dismiss('cancel');
					};
				}
			}

			return $uibModal.open(tempDefaults).result;
        };

    }]);