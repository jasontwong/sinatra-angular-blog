(function() {
  'use strict';

  angular
    .module('blog')
    .controller('BlogCtrl', function($scope, $route, Nav) {
      $scope.$route = $route;
      $scope.hLinks = Nav.query();
      $scope.fLinks = Nav.query({ type: 'footer' });
    });
}());
