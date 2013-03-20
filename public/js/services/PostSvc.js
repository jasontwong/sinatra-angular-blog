(function() {
  'use strict';

  angular
    .module('blog.PostSvc', ['ngResource'])
    .factory('Post', function($resource) {
      var Post = $resource('/api/1.0/posts/:id', {}, {
        update: { method: 'PUT', params: { id: '@id' }}
      });
      return Post;
    });
}());
