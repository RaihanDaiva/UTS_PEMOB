import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  final Random random = Random();
  late StreamController<WeatherData> _weatherController;

  String location = 'Bandung';
  WeatherData currentWeather = WeatherData(
    temperature: 22,
    condition: 'Cerah Berawan',
    humidity: 65,
    windSpeed: 12,
    rainfall: 30,
  );

  final List<String> conditions = [
    'Cerah',
    'Cerah Berawan',
    'Berawan',
    'Hujan Ringan',
    'Hujan Lebat',
    'Petir',
  ];

  final List<DailyForecast> forecasts = [
    DailyForecast(
      day: 'Sen',
      condition: 'Cerah Berawan',
      temp: 28,
      minTemp: 21,
    ),
    DailyForecast(day: 'Sel', condition: 'Hujan', temp: 25, minTemp: 20),
    DailyForecast(day: 'Rab', condition: 'Berawan', temp: 27, minTemp: 22),
    DailyForecast(day: 'Kam', condition: 'Cerah', temp: 30, minTemp: 23),
    DailyForecast(day: 'Jum', condition: 'Petir', temp: 24, minTemp: 19),
    DailyForecast(day: 'Sab', condition: 'Hujan Ringan', temp: 26, minTemp: 21),
    DailyForecast(day: 'Min', condition: 'Cerah', temp: 29, minTemp: 22),
  ];

  @override
  void initState() {
    super.initState();
    _weatherController = StreamController<WeatherData>();
    _startWeatherStream();
  }

  void _startWeatherStream() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      final newWeather = WeatherData(
        temperature: 18 + random.nextInt(15),
        condition: conditions[random.nextInt(conditions.length)],
        humidity: 40 + random.nextInt(40),
        windSpeed: 5 + random.nextInt(20),
        rainfall: random.nextInt(80),
      );

      if (!_weatherController.isClosed) {
        _weatherController.add(newWeather);
      }
    });
  }

  @override
  void dispose() {
    _weatherController.close();
    super.dispose();
  }

  IconData _getWeatherIcon(String condition) {
    if (condition.contains('Cerah')) return Icons.wb_sunny;
    if (condition.contains('Hujan')) return Icons.grain;
    if (condition.contains('Petir')) return Icons.flash_on;
    if (condition.contains('Berawan')) return Icons.wb_cloudy;
    return Icons.wb_sunny;
  }

  Color _getWeatherColor(String condition) {
    if (condition.contains('Cerah')) return Colors.orange;
    if (condition.contains('Hujan')) return Colors.blue;
    if (condition.contains('Petir')) return Colors.purple;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(28, 31, 35, 1)),
      child: StreamBuilder<WeatherData>(
        stream: _weatherController.stream,
        initialData: currentWeather,
        builder: (context, snapshot) {
          final weather = snapshot.data!;

          return SingleChildScrollView(
            padding: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      // color: Colors.blue,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                      child: Text(
                        "Cuaca",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Questrial',
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Current Weather Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Color(0xFF31363F),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(
                              _getWeatherIcon(weather.condition),
                              color: Colors.white,
                              size: 80,
                            ),
                            SizedBox(height: 20),
                            Text(
                              '${weather.temperature}°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 72,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              weather.condition,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildWeatherStat(
                                  Icons.water_drop,
                                  '${weather.rainfall}%',
                                  'Hujan',
                                ),
                                _buildWeatherStat(
                                  Icons.opacity,
                                  '${weather.humidity}%',
                                  'Kelembapan',
                                ),
                                _buildWeatherStat(
                                  Icons.air,
                                  '${weather.windSpeed} km/h',
                                  'Angin',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),

                      // Today's Forecast
                      Text(
                        'Prakiraan Hari Ini',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),

                      Container(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            final hour = 8 + (index * 2);
                            final temp = 20 + random.nextInt(8);
                            return _buildHourlyCard(
                              '${hour}:00',
                              temp,
                              conditions[random.nextInt(conditions.length)],
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 30),

                      // 7-Day Forecast
                      Text(
                        'Prakiraan 7 Hari',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),

                      ...forecasts.map(
                        (forecast) => _buildDailyForecastCard(forecast),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeatherStat(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.8), size: 24),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildHourlyCard(String time, int temp, String condition) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFF31363F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(color: Colors.white, fontSize: 12)),
          SizedBox(height: 10),
          Icon(_getWeatherIcon(condition), color: Colors.white, size: 28),
          Text(
            '$temp°',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyForecastCard(DailyForecast forecast) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF31363F),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              forecast.day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Icon(
                  _getWeatherIcon(forecast.condition),
                  color: Colors.white.withOpacity(0.9),
                  size: 24,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    forecast.condition,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${forecast.temp}°/${forecast.minTemp}°',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Model untuk data cuaca
class WeatherData {
  final int temperature;
  final String condition;
  final int humidity;
  final int windSpeed;
  final int rainfall;

  WeatherData({
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.rainfall,
  });
}

// Model untuk prakiraan harian
class DailyForecast {
  final String day;
  final String condition;
  final int temp;
  final int minTemp;

  DailyForecast({
    required this.day,
    required this.condition,
    required this.temp,
    required this.minTemp,
  });
}
