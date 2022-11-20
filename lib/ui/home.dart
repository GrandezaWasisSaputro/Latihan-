import 'package:flutter/material.dart';
import 'package:latihan_/ui/lihat_kontak.dart';
import 'package:latihan_/ui/tambah_kontak.dart';

class Home extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: media.height * 0.2,
            ),
            Flexible(
              child: SizedBox(
                width: media.width * 0.80,
                height: media.height * 0.08,
                child: ElevatedButton(
                  onPressed: () { 
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TambahKontak();
                    }));},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 97, 198, 255),
                  ),
                  child: const Text(
                    'Tambah Kontak',
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 10, 10),
                    ),
                    )
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.05,
            ),
            Flexible(
              child: SizedBox(
                width: media.width * 0.80,
                height: media.height * 0.08,
                child: ElevatedButton(
                  onPressed: () { 
                   Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return LihatKontak();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 97, 198, 255),
                  ),
                  child: const Text(
                    'Lihat Kontak',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}