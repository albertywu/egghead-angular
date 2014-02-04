app = angular.module('myApp', ['ngRoute'])

app.config ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'homepage.html'

    resolve:
      app: ($q, $timeout) ->
        deferred = $q.defer()
        $timeout ->
          deferred.resolve()
        , 2000
        deferred.promise

  ).when('/map/:country/:state/:city',

    templateUrl: 'app.html'
    controller: 'AppCtrl'
    redirectTo: (routeParams, path, search) ->
      console.log routeParams
      console.log path
      console.log search

      return "/map/USA/#{ routeParams.state }/#{ routeParams.city }" unless routeParams.country is 'USA'

  ).otherwise(
    redirectTo: '/'
  )

app.controller 'AppCtrl', ($scope, $routeParams) ->
  $scope.model =
    message: "You found #{ $routeParams.country } > #{ $routeParams.state } > #{ $routeParams.city }"

