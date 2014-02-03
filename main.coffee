

app = angular.module('myApp', [])

app.controller 'PromiseCtrl', ($scope, $q) ->

  think = (time) ->
    deferred = $q.defer()
    setTimeout ->
      alert "I've thought it through"
      deferred.resolve()
    , 2000
    return deferred.promise

  distributeArms = $q.defer()

  doneArming = distributeArms.promise.then (weapon) ->
    alert "you can have my #{ weapon }"
    return 'axe'
  .then (weapon) ->
    alert "and my #{ weapon }"
    return 'bow'
  .then (weapon) ->
    alert "and my #{ weapon }"

  doneArming.then ->
    think().then ->
      alert "... CHARGE!!!"

  setTimeout ->
    distributeArms.resolve('sword')
  , 2000

