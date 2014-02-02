app = angular.module('myApp', [])

app.controller 'AppCtrl', ($scope) ->
  this.sayHi = ->
    alert 'hi'

  $scope.AppCtrl = this
