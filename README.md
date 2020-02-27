# Climate Data demo app for Servirtium-Dart 

## Installing dart

```
brew tap dart-lang/dart
brew install dart
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
