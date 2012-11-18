{ Command } = require "../src/command.coffee"

original_log = null

describe "Command", ->
   test_object = new Command

   describe "#run", ->
      it "should call _ on mock_args", ->
         mock_args = {}
         mock_args._ = "this is the _ variable"

         test_object.print_out = sinon.spy()

         test_object.run mock_args

         assert test_object.print_out.calledWith(mock_args._)

