(function() {
  'use strict';

  angular
    .module('blog')
    .controller('PageCtrl', function($scope, $route, Page) {
      $scope.page = Page.get({ slug: $route.current.activeNav });
    });
}());
