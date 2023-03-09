import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class IAmNotInClass extends When {
  @override
  Future<void> executeStep() async {
    print('executing UserIsInDashboardStep..');
    // implement your code
  }

  @override
  RegExp get pattern => RegExp(r"I am not in class");
}