# Climate Data demo app for Servirtium-Dart 


## Progress so far

Step 2 of https://github.com/servirtium/README/blob/master/starting-a-new-implementation.md complete

Step 3 next..


## Running it

```
brew tap dart-lang/dart
brew install dart
pub get 
pub run test --reporter expanded --concurrency=1
```  

Unfortunately Dart's test-runner's output rounds test times to the second, which means you can't see 
precisely how fast the 'playback' tests are versus 'direct'