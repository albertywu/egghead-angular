app = angular.module('myApp', [])

app.controller 'PhoneProviderCtrl', ($scope) ->
  $scope.leaveMessage = (number, message) ->
    alert "phone number #{ number } left the message: #{ message }"

app.directive 'phonecall', ->
  restrict: 'E'
  scope:
    number: '@'
    network: '=' # 2-way binding on 'network' model
    makeCall: '&' # function reference, called in scope outside the directive!
  templateUrl: 'templates/phonecall.html'
  controller: ($scope) ->
    $scope.networks = ['Verizon', 'AT&T', 'TMobile']
    $scope.network = $scope.networks[0]