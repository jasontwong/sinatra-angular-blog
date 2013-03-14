(function() {
  'use strict';

  angular
    .module('blog.NavSvc', ['ngResource'])
    .factory('Nav', function($resource) {
      var Nav = $resource('/1.1/nav');
      return Nav;
    });
}());
