#!/usr/bin/env coffee

#Configuration.
config = require('./lib/configBuilder')
console.log('config used: ', config)
#Load the definitions
definition = require('./lib/definitionLoader').load(config.source)
console.log("definition loaded: " , JSON.stringify(definition))
