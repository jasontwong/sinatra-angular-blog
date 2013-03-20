(function() {
  'use strict';

  angular
    .module('blog')
    .controller('PostsFormCtrl', function($scope, $routeParams, Post) {
      $scope.isEdit = $routeParams.hasOwnProperty('id'); 
      $scope.post = $scope.isEdit ? Post.get($routeParams) : new Post();
      $scope.save = function() {
        if ($scope.isEdit) {
          $scope.post.$update();
        } else {
          $scope.post.$save();
        }
      };
    });
}());
