(function() {
  'use strict';

  angular
    .module('blog')
    .controller('PostsFormCtrl', function($scope, Post) {
      $scope.foo = 'posts form';
    });
}());
