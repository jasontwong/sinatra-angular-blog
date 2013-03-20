(function() {
  'use strict';

  angular
    .module('blog.PostSvc', ['ngResource'])
    .factory('Post', function($resource) {
      var Post = $resource('/api/1.0/posts/:slug', {}, {
        update: { method: 'PUT', params: { slug: '@slug' }}
      });
      return Post;
    });
}());
