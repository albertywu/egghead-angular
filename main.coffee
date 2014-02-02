app = angular.module('myApp', [])

app.directive 'panel', ->
  restrict: 'E'
  transclude: true
  template: '<div ng-transclude></div>'

app.directive 'alertOnClick', ->
  restrict: 'A'
  scope:
    message: '@'
  link: (scope, element, attrs) ->
    alert "message is #{ message }"