app = angular.module('myApp', ['ngRoute'])

app.config ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'homepage.html'
    controller: 'ViewCtrl'
    resolve:
      loadData: viewCtrl.loadData

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

app.controller 'AppCtrl', ($rootScope) ->
  $rootScope.$on '$routeChangeError', (event, current, previous, rejection) ->
    console.log rejection

  $rootScope.$on '$routeChangeSuccess', (event, current, previous) ->
    console.log event

viewCtrl = app.controller 'ViewCtrl', ($scope, $routeParams, $route) ->
  $scope.model =
    message: "You found #{ $routeParams.country } > #{ $routeParams.state } > #{ $routeParams.city }"

viewCtrl.loadData = ($q, $timeout) ->
  deferred = $q.defer()
  $timeout ->
    deferred.reject('your internet is down')
  , 1000
  deferred.promise
