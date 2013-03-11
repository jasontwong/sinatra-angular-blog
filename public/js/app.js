(function() {
  "use strict";
  angular
    .module('posts', [])
    .config([
      '$routeProvider',
      '$locationProvider',
      function($routeProvider, $locationProvider) {
        $locationProvider.html5Mode(true);
        $routeProvider
          .when('/posts', { templateUrl: '/tpl/posts', controller: 'PostsCtrl' })
          .when('/posts/new', { templateUrl: '/tpl/posts/form', controller: 'PostsFormCtrl' })
          .when('/posts/edit/:id', { templateUrl: '/tpl/posts/form', controller: 'PostsFormCtrl' })
          .when('/posts/:slug', { templateUrl: '/tpl/posts/detail', controller: 'PostsDetailCtrl' })
          .otherwise({ redirectTo: '/posts' });
      }
    ]);
}());
