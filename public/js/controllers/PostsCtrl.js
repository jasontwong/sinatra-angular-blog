(function() {
  'use strict';

  angular
    .module('blog')
    .controller('PostsCtrl', function($scope) {
      $scope.foo = 'posts';
    });
}());
