// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// Copyright 2019-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.

import PackageDescription

let package = Package(
    name: "OpenAPISwiftCodeGenerate",
    platforms: [
        .macOS(.v10_15), .iOS(.v10)
    ],
    products: [
        .library(
            name: "SwaggerServiceModel",
            targets: ["SwaggerServiceModel"]),
        .library(
            name: "OpenAPIServiceModel",
            targets: ["OpenAPIServiceModel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tachyonics/SwaggerParser.git", from: "0.6.4"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.0"),
        .package(url: "https://github.com/mattpolzin/OpenAPIKit.git", from: "3.0.0-alpha.9"),
        .package(url: "https://github.com/amzn/service-model-swift-code-generate", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "SwaggerServiceModel",
            dependencies: [
                .product(name: "ServiceModelCodeGeneration", package: "service-model-swift-code-generate"),
                .product(name: "Yams", package: "Yams"),
                .product(name: "SwaggerParser", package: "SwaggerParser"),
                .product(name: "OpenAPIKit30" , package: "OpenAPIKit")
            ]
        ),
        .target(
            name: "OpenAPIServiceModel",
            dependencies: [
                .product(name: "ServiceModelCodeGeneration", package: "service-model-swift-code-generate"),
                .product(name: "Yams", package: "Yams"),
                .product(name: "SwaggerParser", package: "SwaggerParser"),
                .product(name: "OpenAPIKit30" , package: "OpenAPIKit")
            ]
        )
    ],
      swiftLanguageVersions: [.v5]
)
