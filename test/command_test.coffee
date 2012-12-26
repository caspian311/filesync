{ Command } = require "../src/command.coffee"

original_log = null

describe "Command", ->
   mock_publish_files = {}
   test_object = new Command mock_publish_files

   describe "#run", ->
      it "should publish_files when given a publish command", ->
         mock_args =
            _: ["publish", "arg1", "arg2", "arg3"]

         mock_publish_files.execute = sinon.spy()

         test_object.run mock_args

         assert mock_publish_files.execute.calledWith(["arg1", "arg2", "arg3"])

