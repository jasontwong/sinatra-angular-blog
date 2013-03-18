(function() {
  'use strict';

  angular
    .module('blog')
    .controller('PostsDetailCtrl', function($scope, $routeParams, Post) {
      $scope.post = Post.get($routeParams);
    });
}());
