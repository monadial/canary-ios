source 'https://github.com/CocoaPods/Specs.git'
plugin 'cocoapods-binary-cache'

inhibit_all_warnings!
use_frameworks!

platform :ios, '15.0'

# Resources
pod 'R.swift', binary: true

target 'Canary'

config_cocoapods_binary_cache(
  cache_repo: {
    'default' => {
      'local' => '~/.cocoapods-binary-cache/canary-ios/prebuilt-frameworks'
    }
  },
  prebuild_config: 'Debug'
)