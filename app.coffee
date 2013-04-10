CategoryViewModel = (name, selected = false) ->
  @name = name
  @selected = ko.observable selected
  @

DesktopFileViewModel = ->
  @encoding = 'UTF-8'
  @exec = ko.observable ''
  @icon = ko.observable ''
  @type = ko.observable 'Application'
  @terminal = ko.observable false
  @name = ko.observable ''
  @genericName = ko.observable ''
  @startupNotify = ko.observable false
  @categories = [
    new CategoryViewModel 'AudioVideo'
    new CategoryViewModel 'Audio'
    new CategoryViewModel 'Video'
    new CategoryViewModel 'Development'
    new CategoryViewModel 'Education'
    new CategoryViewModel 'Game'
    new CategoryViewModel 'Graphics'
    new CategoryViewModel 'Network'
    new CategoryViewModel 'Office'
    new CategoryViewModel 'Settings'
    new CategoryViewModel 'System'
    new CategoryViewModel 'Utility'
  ]
  @

exports = this
exports.viewModel = new DesktopFileViewModel()
ko.applyBindings exports.viewModel
