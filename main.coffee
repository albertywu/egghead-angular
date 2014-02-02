app = angular.module('myApp', [])

app.directive 'zippy', ->
  restrict: 'E'
  transclude: true
  scope:
    title: '@'
  template: '<h1 ng-click="toggleShowContent()">{{ title }}</h1><div ng-transclude ng-show="shouldShowContent"></div>'
  link: (scope, element, attrs) ->
    scope.shouldShowContent = false

    scope.toggleShowContent = ->
      scope.shouldShowContent = !scope.shouldShowContent