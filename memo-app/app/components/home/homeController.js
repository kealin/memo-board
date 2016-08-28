angular.module('app')
	.controller('homeController', ['$scope', 'dataService', '$routeParams', 'Notification', 'newMemoService', 'blockUI',
		function($scope, dataService, $routeParams, Notification, newMemoService, blockUI){
	
	$scope.memos = {};
	$scope.types = {};
	
	
	get();
	getTypes();

	function get() {
		dataService.get()
			.then(function (response) {		
			$scope.memos = response.data;
			}, function (error) {
				if(error.message) Notification.error({message: error.message, title: 'Error fetching objects'});
				else Notification.error('Error fetching objects');
		});				
	}
	
	function getTypes() {
		dataService.getTypes()
			.then(function (response) {
				$scope.types = response.data;
			}, function (error) {
				if(error.message) Notification.error({message: error.message, title: 'Error fetching types'});
				else Notification.error('Error fetching types');	
		});
	}
	
	
	$scope.new = function() {
		var options = { types: $scope.types };
		newMemoService.show({}, options).then(function (result) {
			var payload = { 'memo_title' : result.title, 'memo_content'  : result.content, 'status_id' : result.type }
			dataService.insert(payload).then(function (response) {
				var insert = {'title' : payload.memo_title, 'content' : payload.memo_content, 'status_id' : payload.status_id}
				$scope.memos.push(insert);
				Notification.success('Note added');
			}, function (error) {
				if(error.message) Notification.error({message: error.message, title: 'Error adding note'});
				else Notification.error('Error adding note');
			});
		});
	}    	
	
	$scope.delete = function(id) {
		dataService.remove(id).then(function (response) {
				Notification.success('Note removed');
			}, function (error) {
				if(error.message) Notification.error({message: error.message, title: 'Error removing note'});
				else Notification.error('Error removing note');
			});
	}
}]);
       
                