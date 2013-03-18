(function() {
  'use strict';

  angular
    .module('blog')
    .controller('PostsCtrl', function($scope, Post) {
      $scope.posts = Post.query({ limit: 10 });
    });
}());
