library time_calculator;

import 'package:time_calculator/model/age_difference_model.dart';
import 'package:time_calculator/model/age_model.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class TimeCalculator {
  static String timeAgoSinceDate(DateTime time, {bool numericDates = true}) {
    DateTime givenDateTime = time;
    final date2 = DateTime.now();

    final difference = date2.difference(givenDateTime);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 min ago' : 'A min ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} sec ago';
    } else {
      return 'Just now';
    }
  }

  /// Calculates the age of a person based on their birth date.
  static Age calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += 12;
    }

    if (days < 0) {
      final monthAgo =
          DateTime(currentDate.year, currentDate.month - 1, birthDate.day);
      days = currentDate.difference(monthAgo).inDays;
      months--;
    }

    return Age(years: years, months: months, days: days);
  }

  /// Calculates the age of a person at a specific date.
  static Age calculateAgeAtDate(DateTime birthDate, DateTime atDate) {
    int years = atDate.year - birthDate.year;
    int months = atDate.month - birthDate.month;
    int days = atDate.day - birthDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += 12;
    }

    if (days < 0) {
      final monthAgo = DateTime(atDate.year, atDate.month - 1, birthDate.day);
      days = atDate.difference(monthAgo).inDays;
      months--;
    }

    return Age(years: years, months: months, days: days);
  }

  /// Formats the age of a person in a human-readable format.
  static String formatAge(DateTime birthDate) {
    Age age = calculateAge(birthDate);

    if (age.years > 0) {
      return '${age.years} year${age.years == 1 ? '' : 's'} old';
    } else if (age.months > 0) {
      return '${age.months} month${age.months == 1 ? '' : 's'} old';
    } else {
      return '${age.days} day${age.days == 1 ? '' : 's'} old';
    }
  }

  /// Get the age difference between two dates.
  static AgeDifference calculateTimeDifference(DateTime from, DateTime to) {
    Duration difference = to.difference(from);
    int years = to.year - from.year;
    int months = to.month - from.month;
    int days = to.day - from.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += 12;
    }

    if (days < 0) {
      final monthAgo = DateTime(to.year, to.month - 1, from.day);
      days = to.difference(monthAgo).inDays;
      months--;
    }

    return AgeDifference(
      years: years,
      months: months,
      days: days,
      hours: difference.inHours % 24,
      minutes: difference.inMinutes % 60,
      seconds: difference.inSeconds % 60,
    );
  }

  /// Calculates the number of days until a person's next birthday.'
  static int daysUntilNextBirthday(DateTime birthDate) {
    DateTime now = DateTime.now();
    DateTime nextBirthday = DateTime(now.year, birthDate.month, birthDate.day);
    if (nextBirthday.isBefore(now) || nextBirthday == now) {
      nextBirthday = DateTime(now.year + 1, birthDate.month, birthDate.day);
    }
    return nextBirthday.difference(now).inDays;
  }

  /// Calculates the number of working days between two dates, excluding weekends and specified holidays.
  static int calculateWorkingDays(
    DateTime startDate,
    DateTime endDate, {
    List<DateTime>? holidays,
  }) {
    int workingDays = 0;
    DateTime currentDate = startDate;
    while (currentDate.isBefore(endDate) || currentDate == endDate) {
      if (currentDate.weekday != DateTime.saturday &&
          currentDate.weekday != DateTime.sunday &&
          !(holidays?.contains(currentDate) ?? false)) {
        workingDays++;
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }
    return workingDays;
  }

  /// Converts a date and time from one time zone to another.
  static DateTime convertTimeZone(
      DateTime dateTime, String fromTimeZone, String toTimeZone) {
    tz.initializeTimeZones();
    final fromTZ = tz.getLocation(fromTimeZone);
    final toTZ = tz.getLocation(toTimeZone);
    final fromTZDateTime = tz.TZDateTime.from(dateTime, fromTZ);
    return tz.TZDateTime.from(fromTZDateTime, toTZ);
  }
}
