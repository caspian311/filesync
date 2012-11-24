{ PublishFiles } = require "../src/publish_files"

describe "PublishFiles", ->
   test_object = new PublishFiles()

   describe "#execute", ->
      it "should make call to webserver", ->
         args = []
         test_object.execute args
         
