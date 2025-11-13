import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});
  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final TextEditingController _namaController = TextEditingController();
  String _selectedHobi = 'Coding';
  String _selectedGender = 'Pria';
  DateTime? _selectedDate;

  // Data yang akan ditampilkan di profil
  String _profilNama = '';
  String _profilHobi = '';
  String _profilGender = '';

  final List<String> _hobiList = ['Coding', 'Olahraga', 'Musik', 'Traveling'];

  void _simpanProfil() {
    setState(() {
      _profilNama = _namaController.text;
      _profilHobi = _selectedHobi;
      _profilGender = _selectedGender;
    });
    // Anda bisa menambahkan snackbar jika ingin notifikasi
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Profil berhasil disimpan!')));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTextStyle(
        style: TextStyle(fontFamily: 'Questrial'),
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Foto, Nama, Gender, Hobi
                  Container(
                    // color: Colors.blue,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text("Biodata", style: TextStyle(fontSize: 30)),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/Profil.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16),
                        Container(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama: ${_profilNama.isEmpty ? '' : _profilNama}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Gender: ${_profilGender.isEmpty ? '' : _profilGender}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Hobi: ${_profilHobi.isEmpty ? '' : _profilHobi}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Questrial',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // FORM INPUT
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF31363F),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama
                  Text(
                    "Nama",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      hintText: "Masukkan nama",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Dropdown Hobi
                  Text(
                    "Hobi",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedHobi,
                    style: TextStyle(
                      fontFamily: 'Questrial', // font untuk item terpilih
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    items: _hobiList
                        .map(
                          (hobi) => DropdownMenuItem(
                            value: hobi,
                            child: Text(
                              hobi,
                              style: TextStyle(
                                fontFamily:
                                    'Questrial', // font untuk semua item
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedHobi = value!;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Radio Gender
                  Text(
                    "Gender",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Pria',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      Text('Pria', style: TextStyle(color: Colors.white)),
                      Radio<String>(
                        value: 'Wanita',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      Text('Wanita', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Calendar
                  Text(
                    "Tanggal Lahir",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate ?? DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        _selectedDate == null
                            ? "Pilih tanggal lahir"
                            : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Tombol Simpan
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF810CA8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: _simpanProfil,
                      child: Text("Simpan", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
