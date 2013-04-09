CategoryViewModel = (name, selected = false) ->
  @name = name
  @selected = ko.observable selected
  @

DesktopFileViewModel = ->
  @encoding = 'UTF-8'
  @exec = ''
  @icon = ''
  @type = 'Application'
  @terminal = false
  @name = ''
  @genericName = ''
  @startupNotify = false
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

ko.applyBindings new DesktopFileViewModel()
