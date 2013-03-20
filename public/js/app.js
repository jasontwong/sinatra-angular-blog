(function(){
  "use strict";

  angular
    .module('blog', [ 'blog.NavSvc', 'blog.PageSvc', 'blog.PostSvc' ])
    .config([
      '$routeProvider',
      '$locationProvider',
      function($routeProvider, $locationProvider) {
        var post_form = { 
            templateUrl: '/tpl/posts/form', 
            controller: 'PostsFormCtrl',
            activeNav: 'posts'
          };
        $locationProvider.html5Mode(true);
        $routeProvider
          .when('/page/about-us', {
            templateUrl: '/tpl/page', 
            controller: 'PageCtrl',
            activeNav: 'about-us'
          })
          .when('/page/contact-us', {
            templateUrl: '/tpl/page', 
            controller: 'PageCtrl',
            activeNav: 'contact-us'
          })
          .when('/posts', { 
            templateUrl: '/tpl/posts', 
            controller: 'PostsCtrl',
            activeNav: 'posts'
          })
          .when('/posts/new', post_form)
          .when('/posts/edit/:slug', post_form)
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
