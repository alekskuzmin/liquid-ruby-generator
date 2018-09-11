# liquid-ruby-generator

## Template-based file generator for your code and beyond.

Generate code modules (or any other files) with specified directory structure.

Templates should follow the [liquid](https://github.com/Shopify/liquid) syntax, although two custom filters were added to facilitate the typical program code generation: `camelcase` and `uncapitalize`. The `camelcase` acts on the argument consisting of words separated by hyphens (see below).

Template files should end with `.liquid` extension which is removed by the generator to get the resulting filename. Filenames can be templated using the {{module_name}} syntax. Filenames are camel-cased by default assuming the wrods in the name are separated by hyphens. For example, `{{module_name}}-abstract-factory.kt.liquid` rendered with `my-module` as an argument will result in a generated file `MyModuleAbstractFactory.kt`.

The output directory structure is exactly the same as the template folder structure.

## Usage

Invoke the script passing the template folder name as an argument:

```
ruby ModuleGenerator.rb your-module-name
```

The generated folder with the module contents will appear near the template folder.