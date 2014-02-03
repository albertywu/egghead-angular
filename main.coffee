app = angular.module('myApp', ['ngRoute'])

app.config ($routeProvider) ->
  $routeProvider.when('/page2',
    templateUrl: 'app-2.html'
    controller: 'AppCtrl'
  ).otherwise(
    templateUrl: 'app.html'
    controller: 'AppCtrl'
  )

app.controller 'AppCtrl', ($scope) ->
  $scope.model =
    message: 'This is my app!'

