import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  static String formatShortDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat.yMMMd().format(date);
  }

  static String formatTime(DateTime date) => DateFormat.Hm().format(date);

  static String formatFullDate(DateTime date) =>
      DateFormat('EEEE, d MMMM yyyy').format(date);

  static String formatDayName(DateTime date) => DateFormat('EEEE').format(date);

  static String formatNumericDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);
}
