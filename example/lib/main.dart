import 'package:flutter/material.dart';
import 'package:time_calculator/time_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Calculator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TimeCalculatorDemo(),
    );
  }
}

class TimeCalculatorDemo extends StatelessWidget {
  const TimeCalculatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Calculator Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFunctionDemo('timeAgoSinceDate', () {
              DateTime pastDate = DateTime.now().subtract(const Duration(days: 5));
              return TimeCalculator.timeAgoSinceDate(pastDate);
            }),
            _buildFunctionDemo('calculateAge', () {
              DateTime birthDate = DateTime(1990, 5, 15);
              return TimeCalculator.calculateAge(birthDate).toString();
            }),
            _buildFunctionDemo('calculateAgeAtDate', () {
              DateTime birthDate = DateTime(1990, 5, 15);
              DateTime atDate = DateTime(2023, 1, 1);
              return TimeCalculator.calculateAgeAtDate(birthDate, atDate).toString();
            }),
            _buildFunctionDemo('formatAge', () {
              DateTime birthDate = DateTime(1990, 5, 15);
              return TimeCalculator.formatAge(birthDate);
            }),
            _buildFunctionDemo('calculateTimeDifference', () {
              DateTime from = DateTime(2023, 1, 1);
              DateTime to = DateTime(2023, 12, 31);
              return TimeCalculator.calculateTimeDifference(from, to).toString();
            }),
            _buildFunctionDemo('daysUntilNextBirthday', () {
              DateTime birthDate = DateTime(1990, 5, 15);
              return TimeCalculator.daysUntilNextBirthday(birthDate).toString();
            }),
            _buildFunctionDemo('calculateWorkingDays', () {
              DateTime startDate = DateTime(2023, 1, 1);
              DateTime endDate = DateTime(2023, 12, 31);
              return TimeCalculator.calculateWorkingDays(startDate, endDate).toString();
            }),
            _buildFunctionDemo('convertTimeZone', () {
              DateTime dateTime = DateTime.now();
              String fromTimeZone = 'America/New_York';
              String toTimeZone = 'Asia/Tokyo';
              return TimeCalculator.convertTimeZone(dateTime, fromTimeZone, toTimeZone).toString();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionDemo(String functionName, Function() calculation) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              functionName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Output: ${calculation()}'),
          ],
        ),
      ),
    );
  }
}