app = angular.module('myApp', [])

app.directive 'dumbPassword', ->

  notification = angular.element('<div>{{ password }}</div>')

  link = (scope) ->
    scope.$watch 'password', (value) ->
      if value is 'password'
        notification.addClass('alert-box alert')
      else
        notification.removeClass('alert-box alert')

  return {
    restrict: 'E'
    replace: true
    template: '<div><input type="text" ng-model="password" placeholder="Enter a password"></div>'
    compile: (tElem) ->
      tElem.append(notification)
      return link
  }