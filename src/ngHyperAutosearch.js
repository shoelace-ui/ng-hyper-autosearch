var angular = window.angular || require('angular');
var suggestionListTemplate = require('./suggestionList.html');
var selectionListTemplate = require('./selectionList.html');

var pkg = module.exports = angular.module('ng-hyper-autosearch', ['ng-hyper']);

pkg.directive('hyperAutosearch', [
  '$compile',
  'hyperBackend',
  function ($compile, hyperBackend) {
    return {
      scope: true,
      link: function ($scope, element, attributes) {
      }
    };
  }
]);

pkg.name = 'ng-hyper-autosearch';
