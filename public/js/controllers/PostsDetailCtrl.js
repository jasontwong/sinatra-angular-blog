(function() {
  'use strict';

  angular
    .module('blog')
    .controller('PostsDetailCtrl', function($scope, $routeParams) {
      $scope.foo = 'posts detail';
    });
}());
