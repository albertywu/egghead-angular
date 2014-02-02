app = angular.module('myApp', [])

app.directive 'panel', ->
  restrict: 'E'
  transclude: true
  template: '<div ng-transclude></div>'

app.directive 'alertOnClick', ->
  restrict: 'A'
  scope:
    msg: '@alertOnClick'
  link: (scope, element, attrs) ->
    element.bind 'click', ->
      alert element.html()