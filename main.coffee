app = angular.module('myApp', ['ngRoute'])

app.config ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'homepage.html'
    controller: 'AppCtrl'
    resolve:
      loadData: appCtrl.loadData,
      prepData: appCtrl.prepData

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

appCtrl = app.controller 'AppCtrl', ($scope, $routeParams, $route) ->
  debugger
  $scope.model =
    message: "You found #{ $routeParams.country } > #{ $routeParams.state } > #{ $routeParams.city }"

appCtrl.loadData = ($q, $timeout) ->
  deferred = $q.defer()
  $timeout ->
    console.log 'loading data'
    deferred.resolve()
  , 1000
  deferred.promise

appCtrl.prepData = ($q, $timeout) ->
  deferred = $q.defer()
  $timeout ->
    console.log 'prepping data'
    deferred.resolve()
  , 1000
  deferred.promise

