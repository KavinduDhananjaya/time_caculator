class AgeDifference {
  final int years;
  final int months;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  AgeDifference({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  String toString() {
    return 'AgeDifference(years: $years, months: $months, days: $days, hours: $hours, minutes: $minutes, seconds: $seconds)';
  }
}