import 'package:flutter/material.dart';
import 'package:latihan_/database/database_kontak.dart';
import 'package:latihan_/ui/lihat_kontak.dart';



class TambahKontak extends StatefulWidget {
  const TambahKontak({Key? key}) : super(key: key);

  @override
  State<TambahKontak> createState() => _TambahKontakState();
}

class _TambahKontakState extends State<TambahKontak> {
  DatabaseKontak databaseKontak = DatabaseKontak();
  TextEditingController namaController = TextEditingController();
  TextEditingController noHpController = TextEditingController();

  @override
  void initState() {
    databaseKontak.database();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children:[ Center(
          child: Column(
            children: [
              SizedBox(
                height: media.height * 0.3,
              ),
              Container(
                width: media.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: const Text(
                  'Nama',
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: media.width * 0.9,
                child: TextField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: media.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: const Text(
                  'No Hp',
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: media.width * 0.9,
                child: TextField(
                  controller: noHpController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
               SizedBox(
                height: media.height * 0.07,
              ),
              SizedBox(
                width: media.width * 0.85,
                height: media.height * 0.09,
                child: ElevatedButton(
                  onPressed: () async {int idInsert = await databaseKontak.insert({
                     'nama': namaController.text,
                        'no_hp': noHpController.text,
                  })
                      ;
                   Navigator.pushNamed(context, 'lihat_kontak');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 97, 198, 255),
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ),
              ),
            ],
          ),
        ),]
      ),
    );
  }
}
