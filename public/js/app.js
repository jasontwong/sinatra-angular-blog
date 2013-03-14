(function(){
  "use strict";

  angular
    .module('blog', [ 'blog.NavSvc' ])
    .config([
      '$routeProvider',
      '$locationProvider',
      function($routeProvider, $locationProvider) {
        $locationProvider.html5Mode(true);
        $routeProvider
          .when('/posts', { 
            templateUrl: '/tpl/posts', 
            controller: 'PostsCtrl',
            activeNav: 'posts'
          })
          .when('/posts/new', { 
            templateUrl: '/tpl/posts/form', 
            controller: 'PostsFormCtrl',
            activeNav: 'posts'
          })
          .when('/posts/edit/:id', { 
            templateUrl: '/tpl/posts/form', 
            controller: 'PostsFormCtrl',
            activeNav: 'posts'
          })
          .when('/posts/:slug', { 
            templateUrl: '/tpl/posts/detail', 
            controller: 'PostsDetailCtrl',
            activeNav: 'posts'
          })
          .otherwise({ 
            redirectTo: '/' 
          });
      }
    ]);
}());
