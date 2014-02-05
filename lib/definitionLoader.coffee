#Load the definition form the path given in argument.
loadDefinitionsFromFile = (path)->
	FS = require('q-io/fs')
	return FS.read("#{__dirname}/../#{path}/index.json")
	  		 .then(JSON.parse)

#Load the definition from the url given in argument.
loadDefinitionsFromUrl = (url)->
	HTTP = require('q-io/http')
	return HTTP.read(url)
	           .then(JSON.parse)

# Read the  definition file depending on the file.
exports.load = (source)->
	switch source.type
		when "file" then return loadDefinitionsFromFile(source.value)
		when "url" then return loadDefinitionsFromUrl(source.value)