import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  //const NewPage({ Key? key }) : super(key: key);
  NewPage ({required this.nama, required this.pass, required this.alamat, required this.motto, required this.agama, required this.jk});

  String nama;
  String pass;
  String alamat;
  String motto;
   String jk;
  String agama;
  

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biodata Output")),
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nama Lengkap : ${nama}"),
                Text("Password : ${pass}"),
                Text("Alamat : ${alamat}"),
                Text("Jenis Kelamin : $jk"),
               Text("Agama : ${agama}"),
                Text("Motto Hidup: ${motto}"),
              ],
            ),
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

