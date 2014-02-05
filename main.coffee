app = angular.module('myApp', [])

app.config ($logProvider) ->
  $logProvider.debugEnabled(false)

app.controller 'MyCtrl', ($scope, $log) ->
  $scope.doSomething = (event) ->
    $log.log event
