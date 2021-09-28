import ProjectDescription // <1>

let infoPlist: [String: InfoPlist.Value] = [ // <1>
    "UILaunchScreen": [:]
]

let project = Project(
    name: "Canary",
    targets: [
        Target(
            name: "Canary",
            platform: .iOS,
            product: .app,
            bundleId: "com.monadial",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: [
                "Sources/**"
            ],
            resources: [
                "Resources/**"
            ]
        )
    ]
)
