{ PublishFiles } = require "./publish_files"

class Command
   constructor: (@publish_files=new PublishFiles()) ->

   run: (args) ->
      all_arguments = args._
      command = all_arguments.reverse().pop()
      all_arguments.reverse()
      @publish_files.execute(all_arguments)

   print_out: (s) ->
      console.log s

root = exports ? window
root.Command = Command
