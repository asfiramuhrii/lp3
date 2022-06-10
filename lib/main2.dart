import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  //const NewPage({ Key? key }) : super(key: key);
  NewPage ({required this.nama, required this.nim, required this.alamat, required this.jurusan, required this.agama, required this.jk, required this.sosmed});

  String nama;
  String nim;
  String alamat;
  String jurusan;
   String jk;
  String agama;
  String sosmed;
  

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biodata Output")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Lengkap : ${nama}"),
                Text("NIM : ${nim}"),
                Text("Alamat : ${alamat}"),
                Text("Jenis Kelamin : $jk"),
               Text("Agama : ${agama}"),
                Text("Jurusan: ${jurusan}"),
                Text("Sosisal Media: ${sosmed}"),
              ],
            ),
            Padding(padding: EdgeInsets.all(20)),
            Center(
              child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Go Back"),)
      ),
          ],
        ),   
         
    );
  }
}

