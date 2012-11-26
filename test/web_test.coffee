{ Web } = require "../src/web"

describe "Web", ->
   test_object = new Web()

   describe "#get", ->
      it "should fetch the data from a website", (done) ->

         test_object.get "www.google.com", (data) ->
            assert !!~ data.indexOf "<html"
            assert !!~ data.indexOf "</html>"
            assert !!~ data.indexOf "Google"
            done()

      it "should work without a callback", ->
         test_object.get "www.google.com"

   describe "#post", ->
      it "need to test this", ->
         assert true

