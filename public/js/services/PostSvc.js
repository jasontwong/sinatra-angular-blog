(function() {
  'use strict';

  angular
    .module('blog.PostSvc', ['ngResource'])
    .factory('Post', function($resource) {
      var Post = $resource('/api/1.1/posts/:slug', { 'slug' : '@slug' }, {});
      return Post;
    });
}());
