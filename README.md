# liquid-ruby-generator

## Template-based file generator for your code and beyond.

Generate code modules (or any other files) with specified directory structure. Templates should follow the [liquid](https://github.com/Shopify/liquid) syntax. The output directory structure is exactly the same as in the input template folder.

## Usage

Invoke the script passing the template folder name as an argument:

```
ruby ModuleGenerator.rb "YourModuleName"
```

The generated folder with the module contents will appear near the template folder.

