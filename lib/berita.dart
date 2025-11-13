import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});
  @override
  Widget build(BuildContext context) {
    // Data kontak (bisa ditambah sesuai kebutuhan)
    final List<Map<String, String>> beritaList = [
      {
        "nama": "CNN",
        "gambar": "assets/images/berita1.jpeg",
        "berita":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        "waktu": "2024-06-01 10:00",
      },
      {
        "nama": "CNN",
        "gambar": "assets/images/berita1.jpeg",
        "berita":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        "waktu": "2024-06-01 10:00",
      },
      {
        "nama": "CNN",
        "gambar": "assets/images/berita1.jpeg",
        "berita":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        "waktu": "2024-06-01 10:00",
      },
      {
        "nama": "CNN",
        "gambar": "assets/images/berita1.jpeg",
        "berita":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        "waktu": "2024-06-01 10:00",
      },
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
              child: Text(
                "Berita",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
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
              // Container berita
              child: Column(
                children: List.generate(beritaList.length, (index) {
                  final berita = beritaList[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF31363F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        berita['gambar'] ?? '',
                                        width: 160,
                                        height: 119,
                                        fit: BoxFit.cover,
                                      ),

                                      SizedBox(width: 10),
                                      Container(
                                        // color: Colors.red,
                                        width: 145,
                                        height: 119,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              berita['berita'] ?? '',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                  211,
                                                  211,
                                                  211,
                                                  1,
                                                ),
                                                fontSize: 12,
                                              ),
                                              maxLines: 8,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    berita['nama'] ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    berita['waktu'] ?? '',
                                    style: TextStyle(
                                      color: Color.fromRGBO(211, 211, 211, 1),
                                      fontSize: 14,
                                    ),
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
