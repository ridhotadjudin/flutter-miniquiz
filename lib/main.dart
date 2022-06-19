import 'package:flutter/material.dart';

import './kuis.dart';
import './hasil.dart';

// void main(){
//   runApp(new MyApp());
// }

void main() => runApp(MyApp());

// shortcut membuat stateless widget == stl
// merapikan kode panjang == shift alt f
// shortcut membuat stateless widget == stf

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({ Key? key }) : super(key: key);
  var _soalIndex = 0;
  var totalSkor = 0;

  var pertanyaan = [
    {
      'pertanyaan': 'Tempat apa yang akan Anda kunjungi?',
      'jawaban': [
        {'teks': 'Pegunungan', 'skor': 10},
        {'teks': 'Pantai', 'skor': 5},
        {'teks': 'Mall', 'skor': 3},
        {'teks': 'Hutan', 'skor': 7},
      ],
    },
    {
      'pertanyaan': 'Apa warna kesukaan Anda?',
      'jawaban': [
        {'teks': 'Merah', 'skor': 7},
        {'teks': 'Biru', 'skor': 3},
        {'teks': 'Hijau', 'skor': 5},
        {'teks': 'Hitam', 'skor': 1},
      ],
    },
    {
      'pertanyaan': 'Apa hobby Anda?',
      'jawaban': [
        {'teks': 'Sepak Bola', 'skor': 2},
        {'teks': 'Basket', 'skor': 3},
        {'teks': 'Berenang', 'skor': 6},
        {'teks': 'Ngoding', 'skor': 4},
      ],
    },
  ];

  void resetKuis() {
    setState(() {
      _soalIndex = 0;
      totalSkor = 0;
    });
  }

  void _jawaban(int skor) {
    totalSkor = totalSkor + skor;
    setState(() {
      _soalIndex += 1;
    });
    if (_soalIndex < pertanyaan.length) {
      print('Masih ada soal berikutnya.');
    } else {
      print('Sudah tidak ada soal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Kuis Interaktif')),
        ),
        body: _soalIndex < pertanyaan.length
            ? Kuis(
                jawaban: _jawaban,
                pertanyaan: pertanyaan,
                soalIndex: _soalIndex,
              )
            : Hasil(totalSkor, resetKuis),
      ),
    );
  }
}
