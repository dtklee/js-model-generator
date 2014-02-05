#!/usr/bin/env coffee
#Module dependencies.
Promise = require("bluebird")

#Configuration.
config = require('./lib/configBuilder')
console.log('config used: ', config)

#Load the definitions
Promise.resolve()
       .then(
       	  # Load the definitions from the configuration source.
       	  ()-> require('./lib/definitionLoader').load(config.source)
       	)
       .then((content)->
              console.log(content.contact.name)
            ,(err)->
              console.console.log(err)
		)
