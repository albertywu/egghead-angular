app = angular.module('myApp', [])

app.directive 'clock', ->
  restrict: 'E'
  scope:
    timezone: '@'
  template: '<div>12:00 {{ timezone }}</div>'

app.directive 'panel', ->
  restrict: 'E'
  transclude: true
  scope:
    title: '@'
  template: '<div style="border: 3px solid black;"><div class="alert-box box">{{ title }}</div><div ng-transclude></div></div>'