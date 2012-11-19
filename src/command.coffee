class Command
   run: (args) ->
      this.print_out args._

   print_out: (s) ->
      console.log s

root = exports ? window
root.Command = Command
