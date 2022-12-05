# is_app_upgraded

A simple flutter package that checks if the running app has just been upgraded.

Internally it uses the [shared_preferences](https://pub.dev/packages/shared_preferences) plugin and the [package_info_plus](https://pub.dev/packages/package_info_plus) plugin.

## Getting Started

To use this plugin, add `is_app_upgraded` as a [dependency in your `pubspec.yaml` file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Usage

Import `is_app_upgraded`:

```dart
import 'package:is_app_upgraded/is_app_upgraded.dart';
```

To check if this is the first time the app is run:

```dart
bool isappupgraded = await IsAppUpgraded.isAppUpgraded();
```

## Maintainers

* [Sacha Vieux Roy](https://github.com/sachavieuxroy)

Pull requests are always very welcome.
