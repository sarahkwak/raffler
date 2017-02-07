class Raffler.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events: ->
  	"submit #new_entry": "createEntry"
  	"click #draw": "drawWinner"

  initialize: ->
  	@collection.on("reset", @render, this)
  	@collection.on("add", @appendEntry, this)

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendEntry)
  	this

 	createEntry: (event) ->
 		event.preventDefault()
 		attribute = name: $('#new_entry_name').val()
 		@collection.create attribute,
 			wait: true
			success: -> $('#new_entry')[0].reset()
		 	error: @handleError 


 	appendEntry: (entry) ->
 		view = new Raffler.Views.Entry(model: entry)
 		$('#entry_list').append(view.render().el)

 	handleError: (entry, response) ->
 		if response.status == 422
 			errors = $.parseJSON(response.responseText).errors
 			for attribute, messages of errors
 				alert "#{attribute} #{message}" for message in messages

 	drawWinner: (event) ->
 		event.preventDefault()
 		@collection.drawWinner()