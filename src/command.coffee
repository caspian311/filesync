{ PublishFiles } = require "../src/publish_files.coffee"

class Command
   constructor: (@publish_files=new PublishFiles()) ->

   run: (args) ->
      all_arguments = args._
      commadn = all_arguments.reverse().pop()
      all_arguments.reverse()
      @publish_files.execute(all_arguments)

   print_out: (s) ->
      console.log s

root = exports ? window
root.Command = Command
