import 'package:flutter/material.dart';
import 'kontak.dart';
import 'profil.dart';
import 'kalkulator.dart';
import 'berita.dart';
import 'cuaca.dart';
import 'dashboard.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemob',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF810CA8),
          foregroundColor: Color.fromRGBO(238, 238, 238, 1),
        ),
      ),

      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});
  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const BiodataPage(),
    const KontakPage(),
    const KalkulatorPage(),
    const CuacaPage(),
    const BeritaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontFamily: 'Questrial'),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: IndexedStack(index: _currentIndex, children: _pages),
        backgroundColor: Color.fromRGBO(28, 31, 35, 1),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF31363F),
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF810CA8),
          selectedLabelStyle: TextStyle(fontFamily: 'Questrial'),
          unselectedItemColor: Color.fromRGBO(211, 211, 211, 1),
          unselectedLabelStyle: TextStyle(fontFamily: 'Questrial'),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Biodata"),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: "Kontak",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Kalkulator",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Cuaca"),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: "Berita"),
          ],
        ),
      ),
    );
  }
}
