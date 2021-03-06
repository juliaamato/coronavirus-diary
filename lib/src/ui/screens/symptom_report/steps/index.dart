import 'package:flutter/material.dart';

import 'intro.dart';
import 'location.dart';
import 'subjective.dart';
import 'temperature.dart';

abstract class SymptomReportStep extends Widget {
  SymptomReportStep();

  bool get isLastStep;
}

final List<SymptomReportStep> steps = [
  IntroStep(),
  LocationStep(),
  SubjectiveStep(),
  TemperatureStep(),
];
