app = angular.module('myApp', [])

app.controller 'RoomCtrl', ->
  @openDoor = ->
    alert @doorSound

  @doorSound = 'creeeeaaaak'

  @doorName = 'My Door'

  debugger

  @