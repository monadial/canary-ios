import ProjectDescription

let projectName: String = "Canary"
let deploymentTargetVersion: String = "15.0"

let canaryTargetSettings = Settings(
    base: [
        "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": "$(inherited)",
    ]
)

let targetActions = [
    TargetAction.pre(
        path: "Scripts/RswiftRunScript.sh",
        arguments: [],
        name: "R.Swift",
        inputPaths: [Path("$TEMP_DIR/rswift-lastrun")],
        inputFileListPaths: [],
        outputPaths: [Path("$SRCROOT/Projects/\(projectName)/Resources/R.generated.swift")],
        outputFileListPaths: []
    ),
    TargetAction.post(
        path: "Scripts/SwiftlintRunScript.sh",
        arguments: [],
        name: "SwiftLint"
    )
]

let project = Project(
    name: "\(projectName)",
    targets: [
        Target(
            name: "\(projectName)",
            platform: .iOS,
            product: .app,
            bundleId: "com.monadial.canary.mobile.\(projectName)",
            deploymentTarget: .iOS(targetVersion: deploymentTargetVersion, devices: .iphone),
            infoPlist: InfoPlist(stringLiteral: "Projects/\(projectName)/Supporting Files/\(projectName)-Info.plist"),
            sources: ["Projects/\(projectName)/Sources/**"],
            resources: ["Projects/\(projectName)/Resources/**"],
            actions: targetActions,
            dependencies: [
                .cocoapods(path: "."),
            ],
            settings: canaryTargetSettings
        )
    ],
    additionalFiles: [
        "Projects/\(projectName)/Resources/R.generated.swift"
    ]
)
