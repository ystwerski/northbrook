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
      $http.get("/api/v1/persons.json").then(function(response){
        var apiAllPersonsData = response.data;
        $scope.allPersonsData = apiAllPersonsData.all_persons_info;
      })
  	});
  }

  $scope.getPersonData = function(person_id){
    if (person_id){
      $http.get("/api/v1/persons/" + person_id + ".json").then(function(response){
        $scope.personData = response.data;
        // $scope.personData = $scope.personApiData.person_data;
      });
    } else {
        $http.get("/api/v1/persons.json").then(function(response){
          var apiAllPersonsData = response.data;
          $scope.allPersonsData = apiAllPersonsData.all_persons_info;
        });
      }
    $scope.showPersonData = false;
    $scope.showAllPersonsData = false;
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

  $scope.switchToEdit = function(){
    $scope.parshious = "edit";
  }

  $scope.addNewPerson = function(firstName, lastName, email, password, phoneNumber, address, city, state, birthday){
  	var person = {first_name: firstName, last_name: lastName, email: email, password: password, phone_number: phoneNumber, address: address, city: city, state: state, birthday: birthday};
  	$http.post("api/v1/persons.json", person).then(function(response){
       $scope.errors = null;
  	}, function(errors){
  		$scope.errors = error.data.errors;
  	})
  	$scope.parshious = "index";
  }

  $scope.findPerson = function(email, password){
    $scope.getPersonData(null);
    $scope.foundPerson = false;
    angular.forEach($scope.allPersonsData, function(particularPerson){
      if (particularPerson.email == email && particularPerson.password == password){
        $scope.personOfInterest = particularPerson;
        $scope.foundPerson = true;
      }
    })
    if (!$scope.foundPerson){
        $scope.personOfInterest = "I'm sorry, we have no record of such a person. Please check to make sure you have spelled everything correctly.";
    }
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