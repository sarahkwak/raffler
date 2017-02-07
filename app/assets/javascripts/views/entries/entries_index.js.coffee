class Raffler.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events: ->
  	"submit #new_entry": "createEntry"

  initialize: ->
  	@collection.on("reset", @render, this)
  	@collection.on("add", @appendEntry, this)

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendEntry)
  	this

 	createEntry: (event) ->
 		event.preventDefault();
 		@collection.create name: $('#new_entry_name').val()
 		$('#new_entry')[0].reset()

 	appendEntry: (entry) ->
 		view = new Raffler.Views.Entry(model: entry)
 		$('#entry_list').append(view.render().el)