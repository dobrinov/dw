window.DevWanted =
  Views: {}

  initialize: ->
    DevWanted.initializeElement document
    DevWanted.Wysiwyg.initialize document

  initializeElement: (element) ->
    @initializeViews(element)

  initializeViews: (element) ->
    @forEachWrapFor element, DevWanted.Views, (key, element, view) ->
      options = {}
      options[key] = element
      new view(options).render()

  forEachWrapFor: (element, namespace, iterator) ->
    for name, object of namespace when object.wrapFor
      unless _.keys(object.wrapFor).length is 1
        throw new Error("#{name}.wrapFor should have exactly one key")

      [name, selector] = _.pairs(object.wrapFor)[0]

      element = $(element)
      elements = element.find(selector)
      elements = elements.add(element) if element.is(selector)

      elements.each ->
        iterator(name, this, object)

$(document).on 'turbolinks:load', ->
  DevWanted.initialize()
