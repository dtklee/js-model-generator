#Load the definition form the path given in argument.
loadDefinitionsFromFile = (path, cb)->
	#return require("../#{path}")
	FS = require('q-io/fs')
	return FS.read("#{__dirname}/../#{path}/index.json ")
	  		 .then(JSON.parse, console.log)

#Load the definition from the url given in argument.
loadDefinitionsFromUrl = (url, cb)->
	throw new Error('NOT YET IMPLEMENTED')
	HTTP = require('q-io/http')
	return {}

exports.load = (source, cb)->
	switch source.type
		when "file" then return loadDefinitionsFromFile(source.value, cb)
		when "url" then return loadDefinitionsFromUrl(source.value, cb)