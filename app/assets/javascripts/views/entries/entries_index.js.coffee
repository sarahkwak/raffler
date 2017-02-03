class Raffler.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  initialize: ->
  	console.log("THIS IS FROM  RESET " + @collection.length)
  	@collection.on('reset', @render, this)

  render: ->
  	$(@el).html(@template(entries: @collection))
  	this