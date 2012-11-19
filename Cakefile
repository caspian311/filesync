{exec} = require "child_process"

task "compile", "compile coffee script", ->
   run "./node_modules/.bin/coffee 
      --compile --output lib/filesync src/
   "
   
task "test", "run tests", ->
   invoke "compile"
   run "NODE_ENV=test 
      ./node_modules/.bin/mocha 
      --compilers coffee:coffee-script 
      --reporter spec
      --require coffee-script 
      --require test/test_helper.coffee 
      --colors
   "


task "install", "install package", (cb) ->
   invoke "compile"

run = (command) ->
   exec command, (err, output) ->
      console.log output
      throw err if err
