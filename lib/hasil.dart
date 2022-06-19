import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  // const Hasil({ Key? key }) : super(key: key);
  int totalSkor;
  Function resetKuis;

  Hasil(this.totalSkor, this.resetKuis);

  //Getter
  String get hasilText {
    String hasil = 'Anda Berhasil';
    if (totalSkor <= 8) {
      hasil = 'Sepi banget ya hidupmu';
    } else if (totalSkor <= 12) {
      hasil = 'Hmm... Lumayan juga ya kamu';
    } else if (totalSkor <= 16) {
      hasil = 'Keren banget';
    } else {
      hasil = 'Wow energi kamu luar biasa';
    }
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            hasilText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetKuis,
            child: Text('Tekan Untuk Mulai Lagi'),
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
