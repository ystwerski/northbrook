(function () {
  "use strict";

  angular.module("app", []).controller("rotationsCtrl", ['$scope', '$http', function($scope, $http) {

  $scope.getInfo = function(){
  	$http.get("/api/v1/rotations.json").then(function(response){
  		$scope.apiData = response.data;
  		$scope.beraishis = $scope.apiData.beraishis;
  		$scope.shemos = $scope.apiData.shemos;
  		$scope.vayikrah = $scope.apiData.vayikrah;
  		$scope.bamidbar = $scope.apiData.bamidbar;
  		$scope.devorim = $scope.apiData.devorim;
  	});
  }

  $scope.checkAvailable = function(parsha){
    if (parsha.available){
    	return "success";
    } else {
    	return "danger";
    }
  }

  $scope.correctMessage = function(parsha){
  	if (parsha.available){
  		return "Reserve";
  	} else {
  		return "Cancel Reservation";
  	}
  }

  $scope.showForm = false;

    window.scope = $scope;
    
  }]);
})();