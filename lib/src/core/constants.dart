import 'dart:io';

import 'flavor/flavor_config.model.dart';
import 'flavor/flavor_values.model.dart';

import 'features.dart';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');

FlavorValues get flavor => FlavorConfig.values();

final kFlavorDev = FlavorValues(
  baseUrl: kBaseUrl,
  features: () => Features.dev,
);

final kFlavorQa = FlavorValues(
  baseUrl: kBaseUrl,
  features: () => Features.qa,
);

final kFlavorProd = FlavorValues(
  baseUrl: kBaseUrl,
  features: () => Features.prod,
);

const kLocalhost = 'http://localhost';
const kLocalhostAndroid = 'http://10.0.2.2';
const kBaseUrl = 'https://www.scalablepath.com/api/';
