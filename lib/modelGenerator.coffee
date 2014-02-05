fs = require('q-io/fs')

module.exports = (destination, domainsPath, definitions)->
	domains = require domainsPath

# Process the system name in order to clean it, camelize, remove prefix, enlight date, id, code,...
processSystemName = (name)->
  if _s.include(name, config.prefix)
  	name = name.split(config.prefix)[1]
  name = _s.classify(name)
  name = lowerFirstLetter(name)
  for occ in config.endNames
  	name = replaceLastOccurence(name, occ) 
  #console.log "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  #console.log "name", name
  name
replaceLastOccurence = (string, occurence)->
	if(_s.endsWith(string,occurence))
	  strLength = string.length
	  occLength = occurence.length
	  if strLength > occLength
	    return string.slice(0, strLength - occLength)+_s.capitalize(occurence)
	string
# Capitalize the first letter of the word.
capitaliseFirstLetter = (string)->
    string.charAt(0).toUpperCase() + string.slice(1)

# Lower the first character of the string.
lowerFirstLetter = (string)->
    string.charAt(0).toLowerCase() + string.slice(1)

#Generate file name
generateFileName = (name, options)->
	name = processSystemName(name)
	options = options or {}
	extension = options.extension or '.js'
	directory = options.directory or './'
	generatedExtension = options.generatedExtension or '.generated'
	#console.log "###########################################"
	#console.log "fileNAme","#{directory}#{name}#{extension}"
	"#{directory}#{name}#{generatedExtension}#{extension}"

generFile = (fileName, stringFile)->
	fn = fn = generateFileName(fileName, {directory: config.destination})
	fs.write(fn, stringFile)
	.then(
		()->
		console.log "#{fileName} saved to #{fn}"
		,(err)->
			console.log "Error writing file : #{err}"
		)

# Generate files for each entities
generateFiles = ()->
	console.log "\n## Generated files"
	#processEntity(entity) for entity in entitiesConfig