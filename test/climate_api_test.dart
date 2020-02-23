// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:climate_data_api/climate_api.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  group('Climate Api Tests', () {
    ClimateApi climateApi;

    setUpAll(() async {
      climateApi = ClimateApi(apiUrl: ClimateApi.climateApiUrl);
    });

    test(
      AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_FROM_1980_TO_1999_EXISTS,
      () async {
        expect(
          await climateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["gbr"],
          ),
          988.8454972331015,
        );
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_FRANCE_FROM_1980_TO_1999_EXISTS,
      () async {
        expect(
          await climateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["fra"],
          ),
          913.7986955122727,
        );
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_EGYPT_FROM_1980_TO_1999_EXISTS,
      () async {
        expect(
          await climateApi.getAverageAnnualRainfall(
            fromYear: 1980,
            toYear: 1999,
            countryISOs: ["egy"],
          ),
          54.58587712129825,
        );
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_FROM_1985_TO_1995_DOES_NOT_EXIST,
      () async {
        try {
          await climateApi.getAverageAnnualRainfall(
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
      AVERAGE_RAINFALL_FOR_MIDDLE_EARTH_FROM_1980_TO_1999_DOES_NOT_EXIST,
      () async {
        try {
          await climateApi.getAverageAnnualRainfall(
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
      AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_AND_FRANCE_FROM_1980_TO_1999_CAN_BE_CALCULATED_FROM_TWO_REQUESTS,
      () async {
        expect(
          await climateApi.getAverageAnnualRainfall(
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
