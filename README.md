# OpenAPISwiftCodeGenerate
OpenAPISwiftCodeGenerate is an extension of [ServiceModelSwiftCodeGenerate](https://github.com/amzn/service-model-swift-code-generate) that can be used to generate code based on OpenAPI/Swagger service models. This library can be integrated into higher level code generation applications.

# Getting Started

## Step 1: Add the OpenAPISwiftCodeGenerate dependency

OpenAPISwiftCodeGenerate uses the Swift Package Manager. To use the framework, add the following dependency
to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/amzn/openapi-swift-code-generate.git", .upToNextMajor(from: "0.1.0"))
]
```

## Step 2: Use the library to generate code
`OpenAPIServiceModel` and `SwaggerServiceModel` both implement the `ServiceModel` protocol so they can be passed into the `ServiceModelGenerate.generateFromModel` function defined in [ServiceModelSwiftCodeGenerate](https://github.com/amzn/service-model-swift-code-generate).

For example, given the following code generator:
```swift
public struct MyCodeGeneration {
    static let asyncResultType = AsyncResultType(typeName: "HTTPResult",
                                                 libraryImport: "SmokeHTTPClient")
    
    public static func generateFromModel<ModelType: ServiceModel>(
        modelFilePath: String,
        modelType: ModelType.Type,
        customizations: CodeGenerationCustomizations,
        applicationDescription: ApplicationDescription,
        modelOverride: ModelOverride?,
        ...) throws {
            func generatorFunction(codeGenerator: ServiceModelCodeGenerator,
                                   serviceModel: ModelType) throws {
                try codeGenerator.generateFromModel(serviceModel: serviceModel, ...)
            }
        
            try ServiceModelGenerate.generateFromModel(
                    modelFilePath: modelFilePath,
                    customizations: customizations,
                    applicationDescription: applicationDescription,
                    modelOverride: modelOverride,
                    generatorFunction: generatorFunction)
    }
}
```
OpenAPI and Swagger files can be parsed as follows:
```swift

let modelFilePath = ...
let customizations = ...
let applicationDescription = ...
let modelOverride = ...

// For OpenAPI files
try MyCodeGeneration.generateFromModel(
    modelFilePath: modelFilePath,
    modelType: OpenAPIServiceModel.Type, // Defined in OpenAPIServiceModel target
    customizations: customizations,
    applicationDescription: applicationDescription,
    modelOverride: modelOverride
)

// For Swagger files
try MyCodeGeneration.generateFromModel(
    modelFilePath: modelFilePath,
    modelType: SwaggerServiceModel.Type, // Defined in OpenAPIServiceModel target
    customizations: customizations,
    applicationDescription: applicationDescription,
    modelOverride: modelOverride
)
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This project is licensed under the Apache-2.0 License.

