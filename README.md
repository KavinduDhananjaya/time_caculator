# Time Calculator

A Flutter package for time-related calculations, including age computation, time differences, working days calculation, and time zone conversions.

## Features

- Calculate age from a birth date
- Calculate age at a specific date
- Format age as a human-readable string
- Calculate time difference between two dates
- Calculate days until next birthday
- Calculate working days between two dates
- Convert time between different time zones
- Get relative time (e.g., "5 days ago")

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  time_calculator: ^0.0.2
```

---

## Usage

Import the package in your Dart file:
```
import 'package:time_calculator/time_calculator.dart';
```
---

## Example

Here are examples of how to use each function in the Time Calculator package:

1. Calculate time ago since a date:
```
DateTime pastDate = DateTime.now().subtract(const Duration(days: 5));
String timeAgo = TimeCalculator.timeAgoSinceDate(pastDate);
print(timeAgo); // Output: 5 days ago

```

2. Calculate age from birth date:
```
DateTime birthDate = DateTime(1990, 5, 15);
Age age = TimeCalculator.calculateAge(birthDate);
print(age); // Output: Age(years: 33, months: 0, days: 12)
```
3. Calculate age at a specific date:
```
DateTime birthDate = DateTime(1990, 5, 15);
DateTime atDate = DateTime(2023, 1, 1);
Age ageAtDate = TimeCalculator.calculateAgeAtDate(birthDate, atDate);
print(ageAtDate); // Output: Age(years: 32, months: 7, days: 17)
```
4. Format age as a string:
```
DateTime birthDate = DateTime(1990, 5, 15);
String formattedAge = TimeCalculator.formatAge(birthDate);
print(formattedAge); // Output: 33 years old

```
5. Calculate time difference:
```
DateTime from = DateTime(2023, 1, 1);
DateTime to = DateTime(2023, 12, 31);
AgeDifference difference = TimeCalculator.calculateTimeDifference(from, to);
print(difference); // Output: AgeDifference(years: 0, months: 11, days: 30, hours: 0, minutes: 0, seconds: 0)

```
6. Calculate days until next birthday:
```
DateTime birthDate = DateTime(1990, 5, 15);
int daysUntilBirthday = TimeCalculator.daysUntilNextBirthday(birthDate);
print(daysUntilBirthday); // Output varies based on current date

```
7. Calculate working days:
```
DateTime startDate = DateTime(2023, 1, 1);
DateTime endDate = DateTime(2023, 12, 31);
int workingDays = TimeCalculator.calculateWorkingDays(startDate, endDate);
print(workingDays); // Output: Approximately 261 (may vary based on holidays)

```
8. Convert time zone:
```
DateTime dateTime = DateTime.now();
String fromTimeZone = 'America/New_York';
String toTimeZone = 'Asia/Tokyo';
DateTime convertedTime = TimeCalculator.convertTimeZone(dateTime, fromTimeZone, toTimeZone);
print(convertedTime); // Output: DateTime object in Tokyo time zone

```

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

MIT License © Kavindu Dhannjaya

---

Happy coding! 🚀
