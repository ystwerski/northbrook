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

  $scope.parshious = "index";

  $scope.switchToNew = function(){
  	$scope.parshious = "new";
  }

  $scope.switchToIndex = function(){
    $scope.parshious = "index";
  }

   $scope.switchToShow = function(parsha){
    $scope.parshious = "show";
    $scope.parshaOfInterest = parsha;
  }

  $scope.addNewPerson = function(firstName, lastName, email, password, phoneNumber, address, city, state, birthday){
  	var person = {first_name: firstName, last_name: lastName, email: email, password: password, phone_number: phoneNumber, address: address, city: city, state: state, birthday: birthday};
  	$http.post("api/v1/persons.json", person).then(function(response){
       $scope.errors = null;
  	}, function(errors){
  		$scope.errors = error.data.errors;
  	})
  	$scope.parshious = true;
  }

  $scope.reserveParsha = function(parsha, firstId, password){
    var authentic = {first_id: firstId, password: password};
    var parshaID = parsha["id"];
    $http.patch("api/v1/rotations/" + parshaID + ".json", authentic).then(function(response){
    	$scope.errors = null;
    }, function(errors){
    	$scope.errors = error.data.errors;
    })
    $scope.firstId = ""
    $scope.password = ""
    $scope.getInfo();
    $scope.parshious = "index";
  }

    window.scope = $scope;
    
  }]);
})();