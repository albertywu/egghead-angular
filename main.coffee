app = angular.module('myApp', ['ngRoute'])

app.config ($routeProvider) ->
  $routeProvider.when('/map/:country/:state/:city',
    templateUrl: 'app.html'
    controller: 'AppCtrl'
  )

app.controller 'AppCtrl', ($scope, $routeParams) ->
  $scope.model =
    message: "You found #{ $routeParams.country } > #{ $routeParams.state } > #{ $routeParams.city }"

