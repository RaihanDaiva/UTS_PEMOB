import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});
  @override
  Widget build(BuildContext context) {
    // Data kontak (bisa ditambah sesuai kebutuhan)
    final List<Map<String, String>> kontakList = [
      {"nama": "Kontak 1", "nomor": "081234567890"},
      {"nama": "Kontak 2", "nomor": "082345678901"},
      {"nama": "Kontak 3", "nomor": "083456789012"},
      {"nama": "Kontak 4", "nomor": "084567890123"},
      {"nama": "Kontak 5", "nomor": "085678901234"},
      {"nama": "Kontak 6", "nomor": "086789012345"},
      {"nama": "Kontak 7", "nomor": "087890123456"},
      {"nama": "Kontak 8", "nomor": "088901234567"},
      {"nama": "Kontak 9", "nomor": "089012345678"},
      {"nama": "Kontak 10", "nomor": "080123456789"},
    ];

    return SingleChildScrollView(
      child: DefaultTextStyle(
        style: TextStyle(fontFamily: 'Questrial'),
        child: Column(
          children: [
            Container(
              // color: Colors.blue,
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text("Kontak", style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
              // Container Kontak
              child: Column(
                children: List.generate(kontakList.length, (index) {
                  final kontak = kontakList[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF31363F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/image 6.png',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        kontak['nama'] ?? '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        kontak['nomor'] ?? '',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                            211,
                                            211,
                                            211,
                                            1,
                                          ),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // color: Colors.red,
                              width: 100,
                              margin: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}