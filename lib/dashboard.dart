import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Random random = Random();
  late Timer _timer;

  String currentTime = '';
  String currentDate = '';
  int temperature = 22;
  String weatherCondition = 'Cerah Berawan';

  // Data statistik
  int todayVisitors = 1234;
  int monthlyVisitors = 45678;
  double airQuality = 85.5;
  int humidity = 65;

  final List<QuickAccessItem> quickAccess = [
    QuickAccessItem(
      icon: Icons.wb_sunny,
      title: 'Cuaca',
      color: Color(0xFFFFB347),
    ),
    QuickAccessItem(
      icon: Icons.newspaper,
      title: 'Berita',
      color: Color(0xFF4A90E2),
    ),
    QuickAccessItem(
      icon: Icons.calendar_today,
      title: 'Kalender',
      color: Color(0xFF50C878),
    ),
    QuickAccessItem(
      icon: Icons.settings,
      title: 'Pengaturan',
      color: Color(0xFF9B59B6),
    ),
  ];

  final List<ActivityItem> recentActivities = [
    ActivityItem(
      icon: Icons.cloud,
      title: 'Update Cuaca',
      description: 'Cuaca cerah berawan, 22°C',
      time: '5 menit yang lalu',
      color: Colors.blue,
    ),
    ActivityItem(
      icon: Icons.article,
      title: 'Berita Terbaru',
      description: 'Ada 3 berita terbaru hari ini',
      time: '15 menit yang lalu',
      color: Colors.orange,
    ),
    ActivityItem(
      icon: Icons.notifications,
      title: 'Notifikasi',
      description: 'Pengingat: Periksa cuaca sore ini',
      time: '1 jam yang lalu',
      color: Colors.green,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _startTimer();
    _updateRandomData();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        _updateDateTime();

        // Update data setiap 5 detik
        if (timer.tick % 5 == 0) {
          _updateRandomData();
        }
      }
    });
  }

  void _updateDateTime() {
    final now = DateTime.now();
    setState(() {
      currentTime =
          '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

      final days = [
        'Minggu',
        'Senin',
        'Selasa',
        'Rabu',
        'Kamis',
        'Jumat',
        'Sabtu',
      ];
      final months = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
      ];

      currentDate =
          '${days[now.weekday % 7]}, ${now.day} ${months[now.month - 1]} ${now.year}';
    });
  }

  void _updateRandomData() {
    if (mounted) {
      setState(() {
        temperature = 18 + random.nextInt(15);
        humidity = 40 + random.nextInt(40);
        airQuality = 70.0 + random.nextDouble() * 30;
        todayVisitors = 1000 + random.nextInt(500);
        monthlyVisitors = 40000 + random.nextInt(10000);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(28, 31, 35, 1)),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header dengan greeting
              _buildHeader(),

              SizedBox(height: 25),

              // Weather & Time Card
              _buildWeatherTimeCard(),

              SizedBox(height: 25),

              // Statistics Cards
              Text(
                'Statistik',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Pengunjung Hari Ini',
                      todayVisitors.toString(),
                      Icons.people,
                      Color(0xFF3498DB),
                      '+12%',
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: _buildStatCard(
                      'Pengunjung Bulan Ini',
                      monthlyVisitors.toString(),
                      Icons.trending_up,
                      Color(0xFF2ECC71),
                      '+8%',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Kualitas Udara',
                      '${airQuality.toStringAsFixed(1)}%',
                      Icons.air,
                      Color(0xFF9B59B6),
                      'Baik',
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: _buildStatCard(
                      'Kelembapan',
                      '$humidity%',
                      Icons.water_drop,
                      Color(0xFFE74C3C),
                      'Normal',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              // Quick Access
              Text(
                'Akses Cepat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                itemCount: quickAccess.length,
                itemBuilder: (context, index) {
                  return _buildQuickAccessCard(quickAccess[index]);
                },
              ),

              SizedBox(height: 25),

              // Recent Activities
              Text(
                'Aktivitas Terkini',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),

              ...recentActivities.map(
                (activity) => _buildActivityCard(activity),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // color: Colors.blue,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 0, right: 0),
          child: Text(
            "Dashboard",
            style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Questrial'),
          ),
        ),
        Divider(color: Colors.white, thickness: 1, indent: 0, endIndent: 0),
      ],
    );
  }

  Widget _buildWeatherTimeCard() {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xFF810CA8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    currentDate,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.white, size: 50),
                  SizedBox(height: 10),
                  Text(
                    '$temperature°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherCondition,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String trend,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF31363F),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 15),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 12, color: Color(0xFF7F8C8D))),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              trend,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard(QuickAccessItem item) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF31363F),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: item.color, size: 28),
            ),
            SizedBox(height: 8),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(ActivityItem activity) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF31363F),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(activity.icon, color: activity.color, size: 24),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  activity.description,
                  style: TextStyle(fontSize: 13, color: Color(0xFF7F8C8D)),
                ),
                SizedBox(height: 4),
                Text(
                  activity.time,
                  style: TextStyle(fontSize: 11, color: Color(0xFF95A5A6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Model untuk Quick Access Item
class QuickAccessItem {
  final IconData icon;
  final String title;
  final Color color;

  QuickAccessItem({
    required this.icon,
    required this.title,
    required this.color,
  });
}

// Model untuk Activity Item
class ActivityItem {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color color;

  ActivityItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.color,
  });
}
