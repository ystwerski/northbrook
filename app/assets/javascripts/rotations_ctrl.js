(function () {
  "use strict";

  angular.module("app", []).controller("rotationsCtrl", ['$scope', '$http', function($scope, $http) {

  $scope.getInfo = function(){
  	$http.get("/api/v1/rotations.json").then(function(response){
  		$scope.apiData = response.data;
  	});
  }

    window.scope = $scope;

  }]);
})();