# OpenAI
Apps that use OpenAIApi

## Recipes:
A SwiftUI app that allows the user to ask ChatGPT for recipes, and save/view/delete them. 

### OpenAIApi Key:
Documentation: https://platform.openai.com/docs/introduction

Please note that Config.Swift file (Recipes/Recipes/Model/Config.swift) is in .gitignore, because it contains an API key.
So, to get this project to build, add a Config file with the following code:
```
struct APIKeys {
    static let openAIApiKey = [YOUR OPENAIApi KEY]
}
```
