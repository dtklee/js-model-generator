# Module dependencies
program = require 'commander'
_ = require 'underscore'

# Define command line options.
program
  .version('0.0.1')
  .option('-c --configuration', "Choose configuration file, default search is using the defaultConfig file.")
  .option('-d --destination', "Choose destination for the genreated classes, default is './generated' ")
  .option('-e --extension', "Choose the file extension for the generated objects, default is '.js'")
  .option('-g --generated', "Choose the file generated extension, default is '.generated'")

# Display the default help
program.on('--help', ()->
  console.log ' Examples :'
  console.log ''
  console.log  '  generator -c customConf.json -d "../generatedDir/" -e .js -g .gen' 
)

#Parse the command line options.
program.parse(process.argv)

#Combine the application configuration.
config = require('../config/default')
console.log("../" , program.configuration)
configUser = if(program.config) then require("../" + program.config) else {}
cmdConfig = _.pick(program, 'destination','extension', 'generated')
#
_.extend(config, configUser, cmdConfig)

module.exports = config