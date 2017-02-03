class Raffler.Routers.Entries extends Backbone.Router
	routes:
		'': 'index'
		'entries/:id': 'show'

	initialize: ->
		@collection = new Raffler.Collections.Entries()
		@collection.fetch()
		console.log("VERY FIRST  " + @collection.length)

	index: ->
		console.log("FIRST  " + @collection.length)
		view = new Raffler.Views.EntriesIndex(collection: @collection)
		$('#container').html(view.render().el)

	show: (id) ->
		alert "ENTRY #{id}"