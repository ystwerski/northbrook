(function () {
  "use strict";

  angular.module("app", []).controller("rotationsCtrl", ['$scope', '$http', '$location', '$filter', function($scope, $http, $location, $filter) {





  $scope.changed = function (model) {
    model.changed = true
  };

    window.scope = $scope;

  }]);
})();