# Climate data demo app for Servirtium-Dart 

## Installing Dart

```
brew tap dart-lang/dart
brew install dart
```

## Getting the Servirtium library

The Servirtium library is maintained in a different repo [servirtium/servirtium-dart](https://github.com/servirtium/servirtium-dart) 
and has not yet been pushed to pub.dev (package-land for Dart/Flutter)

```
# TODO
```

## Running the example

```
pub get 
pub run test --reporter expanded --concurrency=1
```

Unfortunately Dart's test-runner's output rounds test times to the second, which means you can't see 
precisely how fast the 'playback' tests are versus 'direct' on the console.

## Get reports and analyze difference

```
pub run test --reporter json --concurrency=1 > output.report
dart report.dart
```
