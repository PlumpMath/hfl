assert = require "assert"
{index, register} = require "../../src/routes"

describe "routes", () ->
    describe "#index", () ->
        it "should render the index view", () ->
            view = ""
            index null, render: (str) -> view = str
            assert.equal "index", view
    
    describe "#register", () ->
        it "should render the register view", () ->
            view = ""
            register null, render: (str) -> view = str
            assert.equal "register", view