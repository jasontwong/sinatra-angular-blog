(function() {
  'use strict';

  angular
    .module('blog.NavSvc', ['ngResource'])
    .factory('Nav', function($resource) {
      var Nav = $resource('/api/1.1/nav');
      return Nav;
    });
}());
