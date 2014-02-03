app = angular.module('myApp', [])

app.directive 'zippy', ->
  restrict: 'E'
  transclude: true
  scope:
    title: '@'
  templateUrl: 'templates/zippy.html'
  link: (scope, element, attrs) ->
    scope.shouldShowContent = true

    scope.toggleShowContent = ->
      scope.shouldShowContent = !scope.shouldShowContent