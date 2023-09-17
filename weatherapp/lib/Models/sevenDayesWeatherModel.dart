class DayWeather {
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String? imgUrl;

  DayWeather(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition,
      required this.imgUrl});
}
