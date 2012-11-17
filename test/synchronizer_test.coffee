{ Synchronizer } = require "../src/synchronizer"

describe "Synchronizer", ->
   describe "#diffs", ->
      test_object = new Synchronizer()

      it "should return all remote items when local items are empty", ->
         remote_items = ["monkeys", "zebras", "elephants"]
         results = test_object.diffs [], remote_items

         3.should.be.equal results.length
         "monkeys".should.be.equal results[0]
         "zebras".should.be.equal results[1]
         "elephants".should.be.equal results[2]

      it "should return only remote items not found in local items", ->
         remote_items = ["monkeys", "zebras", "elephants"]
         local_items = ["zebras"]
         results = test_object.diffs local_items, remote_items

         2.should.be.equal results.length
         "monkeys".should.be.equal results[0]
         "elephants".should.be.equal results[1] 
