Note - The World Bank took down their climate WebAPI. Darn it. We now depend on a docker version of the same until we work out what to do long term. Docker build and deploy this locally - https://github.com/servirtium/worldbank-climate-recordings - see README

TL;DR:

```
docker build git@github.com:servirtium/worldbank-climate-recordings.git#main -t worldbank-api
docker run -d -p 4567:4567 worldbank-api
```

The build for this demo project needs that docker container running

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
