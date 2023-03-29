# DarkMagic

[![CI Status](https://img.shields.io/travis/liuhongli/DarkMagic.svg?style=flat)](https://travis-ci.org/liuhongli/DarkMagic)
[![Version](https://img.shields.io/cocoapods/v/DarkMagic.svg?style=flat)](https://cocoapods.org/pods/DarkMagic)
[![License](https://img.shields.io/cocoapods/l/DarkMagic.svg?style=flat)](https://cocoapods.org/pods/DarkMagic)
[![Platform](https://img.shields.io/cocoapods/p/DarkMagic.svg?style=flat)](https://cocoapods.org/pods/DarkMagic)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DarkMagic is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DarkMagic'
```

## Usage
```
    override func viewDidLoad() {
        super.viewDidLoad()

        // save Int value to UserDefaults
        DMUserDefaults.save(3, "key1")
        
        // get Int value from UserDefaults
        _ = DMUserDefaults.get("key1", Int.self)
        
        // delete from UserDefaults
        DMUserDefaults.delete("key1")
        
        // save dict value to UserDefaults
        let dict: [String: Any] = ["name": "Lily", "age": 18]
        DMUserDefaults.save(dict, "key2")
        
        // get dict value from UserDefaults
        let dictValue = DMUserDefaults.get("key2", [String: Any].self)
        
        // delete from UserDefaults
        DMUserDefaults.delete("key2")
        
    }
```

## Author

liuhongli, liuhongli2120@gmail.com

## License

DarkMagic is available under the MIT license. See the LICENSE file for more info.
