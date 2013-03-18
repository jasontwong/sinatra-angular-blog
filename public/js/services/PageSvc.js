(function() {
  'use strict';

  angular
    .module('blog.PageSvc', ['ngResource'])
    .factory('Page', function($resource) {
      var Page = $resource('/api/1.1/page');
      return Page;
    });
}());
