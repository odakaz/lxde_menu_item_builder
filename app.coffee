class CategoryViewModel
  constructor: (name, selected = false) ->
    @name = name
    @selected = ko.observable selected

class DesktopFileViewModel
  constructor: ->
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

    @blob

    @selectedCategoriesAsString = ->
      res = "";
      for c in @categories
        res = res + "#{c.name};" if c.selected()
      res

    @updateDownloadLink = (content) ->
      @blob = new Blob [content], {type: "text/plain"}
      a = document.getElementById 'download_link'
      a.setAttribute 'href', window.URL.createObjectURL @blob
      @

    @desktopFileContent = ko.computed ->
      content = """
                [Desktop Entry]
                Encoding=#{@encoding}
                Exec=#{@exec()}
                Icon=#{@icon()}
                Type=#{@type()}
                Terminal=#{@terminal()}
                Name=#{@name()}
                GenericName=#{@genericName()}
                StartupNotify=#{@startupNotify()}
                Categories=#{@selectedCategoriesAsString()}
                """
      @updateDownloadLink content
      content
    , @

    @

exports = this
exports.viewModel = new DesktopFileViewModel()
ko.applyBindings exports.viewModel
