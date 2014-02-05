app = angular.module('myApp', [])

app.provider 'game', ->

  type = 'star'

  setType: (value) ->
    type = value

  $get: ->
    title: type + 'craft'

app.config (gameProvider) ->
  gameProvider.setType('star')

app.controller 'AppCtrl', ($scope, game) ->
  $scope.title = game.title
