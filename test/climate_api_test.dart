import 'package:climate_data_api/climate_api.dart';
import 'package:test/test.dart';

void main() {
  group('Climate Api Tests', () {
    test(
      'Test average rainfall for Great Britain from 1980 to 1999 exists',
      () async {
        expect(
          await ClimateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["gbr"],
          ),
          988.8454972331015,
        );
      },
    );

    test(
      'Test average rainfall for France from 1980 to 1999 exists',
      () async {
        expect(
          await ClimateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["fra"],
          ),
          913.7986955122727,
        );
      },
    );

    test(
      'Test average rainfall for Egypt from 1980 to 1999 exists',
      () async {
        expect(
          await ClimateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["egy"],
          ),
          54.58587712129825,
        );
      },
    );

    test(
      'Test average rainfall for Great Britain from 1985 to 1995 does not exist',
      () async {
        try {
          await ClimateApi.getAverageAnnualRainfall(
            fromYear: 1985,
            toYear: 1995,
            countryISOs: ["gbr"],
          );
        } on ArgumentError catch (e) {
          expect(
            e,
            predicate((e) =>
                e is ArgumentError &&
                e.message == 'Date range 1985 - 1995 not supported'),
          );
        }
      },
    );

    test(
      'Test average rainfall for Middle Earth from 1980 to 1999 does not exist',
      () async {
        try {
          await ClimateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["mde"],
          );
        } on ArgumentError catch (e) {
          expect(
            e,
            predicate((e) =>
                e is ArgumentError &&
                e.message == 'Country code mde not recognized by climateweb'),
          );
        }
      },
    );

    test(
      'Test average rainfall for Great Britain and France from 1980 to 1999 can be calculated',
      () async {
        expect(
          await ClimateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["gbr", "fra"],
          ),
          951.3220963726872,
        );
      },
    );
  });
}
