angular.module('app')
    .service('dataService', ['$http', function ($http) {

	var urlBase = '/api/memos';

	this.get = function () {
		return $http.get(urlBase);
	};

	this.getTypes = function () {
		return $http.get('/api/types');
	};

	this.insert = function (memo) {
		return $http.post(urlBase, memo);
	};

	this.update = function (memo) {
		return $http.put(urlBase, memo)
	};

	this.remove = function (id) {
		return $http.delete(urlBase + '/' + id);
	};
}]);