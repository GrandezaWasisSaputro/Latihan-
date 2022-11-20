import 'package:flutter/material.dart';
import 'package:latihan_/database/database_kontak.dart';

class LihatKontak extends StatefulWidget {
  const LihatKontak({Key? key}) : super(key: key);

  @override
  State<LihatKontak> createState() => _LihatKontakState();
}

class _LihatKontakState extends State<LihatKontak> {
  DatabaseKontak? databaseKontak;

  Future _refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    databaseKontak = DatabaseKontak();
    initDatabase();
    super.initState();
  }

  Future initDatabase() async {
    await databaseKontak!.database();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
     var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Kontak"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: media.height *0.01,
            ),
            FutureBuilder<List<Model >>(
                future: databaseKontak!.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  } else {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(snapshot.data![index].nama!),
                                  subtitle: Text(snapshot.data![index].no_hp!));
                            }),
                      );
                    } else {
                      return const Text("data belum dimasukkan");
                    }
                  }
                })
          ],
        )),
      ),
    );
  }
}