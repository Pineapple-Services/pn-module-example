local API = exports["pn-hacker"]:API()
local isInModule = false

API.Modules.create({
    name = "example_module_name",
    action = function()
        API.UI.SendMessage([[
Available Commands:
  exit - Exit from the module
  poop - You can poop, yeah.
        ]])
        isInModule = true
        while isInModule do
            local input = API.UI.GetInputFromConsole()
            local args = API.Utils.ParseArgs(input)

            if args[1] == "exit" then
                isInModule = false
            elseif args[1] == "poop" then
                API.UI.SendMessage("I just pooped.")
            else
                API.UI.SendMessage("Invalid module command.")
            end
        end
    end,
    canUse = function()
        return API.Utils.HasItem("example_module_item") -- in this case im checking if it got an item in the storage, but you can check whatever u want
    end,
})
