app = angular.module('myApp', [])

app.directive 'country', ->
  restrict: 'E'
  controller: ->
    @makeAnnouncement = ->
      console.log 'This country is awesome!'
    @electOfficial = (official) ->
      console.log "New official: #{ official }"
    @

app.directive 'state', ->
  restrict: 'E'
  require: '^country'
  controller: ->
    @makeLaw = (law) ->
      console.log "Law: #{ law }"
    @
  link: (scope, elem, attrs, countryCtrl) ->
    countryCtrl.makeAnnouncement()
    countryCtrl.electOfficial 'Albert Wu'

app.directive 'city', ->
  restrict: 'E'
  require: ['^country', '^state']
  link: (scope, elem, attrs, ctrls) ->
    ctrls[0].makeAnnouncement()
    ctrls[0].electOfficial 'Veronika Wu'
    ctrls[1].makeLaw 'Go to bed sooner!'
