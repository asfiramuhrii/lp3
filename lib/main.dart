import 'package:flutter/material.dart';
import 'package:laporan3lagi/main2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      
      ),
      home: const MyHomePage(title: 'Biodata Input'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  
  final _formKey = GlobalKey<FormState>();

 
      TextEditingController nama = new TextEditingController();
      TextEditingController pass = new TextEditingController();
      TextEditingController alamat = new TextEditingController();
      TextEditingController motto = new TextEditingController();
  
  bool nilaiCheckBox = false; 
  bool nilaiCheckBox2 = false;
      
  
  List<String> _listagama = ["Islam", "Kristen", "Katolik", "Hindu", "Budha"];
  int? nilaiagama;
  String agama = "Islam";
  void pilihagama(String value){
    setState(() {
      agama = value;
    });
  }

  String jk = "Laki-Laki";
  void _pilihjk(String value){
    setState(() {
      jk = value;
    });
  }

List<CheckBoxListTileModel> checkBoxListTileModel = CheckBoxListTileModel.getUsers();

void itemChange(bool value, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = value;
    });
  }

void kirimdata(){
  content: new Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nama Lengkap : ${nama}"),
                Text("Password : ${pass}"),
                Text("Alamat : ${alamat}"),
                Text("Jenis Kelamin : $jk"),
                Text("Agama : ${agama}"),
                Text("Motto Hidup: ${motto}"),
                Text("Sosial Media: ${checkBoxListTileModel}"),
               
              ],
              
    ),
  );
   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage (nama: nama.text, pass: pass.text, alamat: alamat.text, motto:motto.text, agama: agama, jk:jk)),
                          );
}


  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: ListView.builder(
        itemCount: checkBoxListTileModel.length,
        itemBuilder: (BuildContext context, int index)
        {
        return new Card( 
        child: 
          Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20)),
                TextField(
                  controller: nama,
                  decoration: new InputDecoration(
                    hintText: "Contoh : Asfira Muhri",
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20)
                      ),
                  ),
                ),

                Padding(padding: EdgeInsets.all(20)),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20)
                      ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Jenis Kelamin"),
                      SizedBox(width: 20),
                      RadioListTile(
                        value: "Laki-Laki", 
                        title: new Text("Laki-Laki"),
                        groupValue: jk,
                        onChanged: (String ? value){
                          setState(() {
                            jk=value!;
                          });
                          //_pilihjk(value??"");
                        },
                        activeColor: Colors.red,
                        subtitle: new Text("Pilih jika Anda laki-laki"),
                      ),

                      RadioListTile(
                        value: "Perempuan", 
                        title: new Text("Perempuan"),
                        groupValue: jk,
                        onChanged: (String ? value){
                          setState(() {
                            jk=value!;
                          });
                          //_pilihjk(value??"");
                        },
                        activeColor: Colors.red,
                        subtitle: new Text("Pilih jika Anda perempuan"),
                      ),
                    ],
                  ),
                  ),
                  
                
                

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Agama', style: TextStyle(fontSize: 20.0, color: Colors.blue),),
                      SizedBox(width: 20,),
                      DropdownButton(
                        //hint: Text("Agama"),
                        value: agama,
                        onChanged:(String ? value){
                          setState(() {
                            agama = value!;
                          });
                          //pilihagama(value??"");
                          nilaiagama= _listagama.indexOf(value??"");
                        },
                        items: _listagama.map(
                          (String value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                          );
                       }
                       ).toList(),
                      ),
                    ],
                  )
                  ),


                Padding(padding: EdgeInsets.all(20)),
                TextField(
                  controller: alamat,
                  decoration: new InputDecoration(
                    hintText: "Komp Pesona Prima Griya",
                    labelText: "Alamat",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20)
                      ),
                  ),
                ),

                Padding(padding: EdgeInsets.all(20)),
                TextField(
                  controller: motto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                    labelText: "Motto Hidup",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20)
                      ),
                  ),
                ),

                new Card(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        new CheckboxListTile(
                          activeColor: Colors.red, 
                          dense: true,
                          title: new Text(checkBoxListTileModel[index].title,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),),
                          value: checkBoxListTileModel[index].isCheck,
                          secondary: Container(
                          height: 50,
                          width: 50,
                          ),
                          onChanged: (bool ? value){
                            itemChange(value!, index);
                          }),
                      ],
                    ),
                  ),

                ),

                
                
                RaisedButton(
                  child: Text ("OK"),
                  onPressed: (){kirimdata();},)
              ],
              ),
              ),
              
        
        );
        },
      ),
    );
  }
}


class CheckBoxListTileModel{
  int UserId;
  String title;
  bool isCheck;

  CheckBoxListTileModel ({required this.UserId, required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers(){
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
        UserId: 1,
        title: "Instagram",
        isCheck: true,
      ),
      CheckBoxListTileModel(
        UserId: 2,
        title: "Facebook",
        isCheck: false,
      ),
      CheckBoxListTileModel(
        UserId: 3,
        title: "Twitter",
        isCheck: false,
      ),
      CheckBoxListTileModel(
        UserId: 4,
        title: "Tiktok",
        isCheck: false,
      ),
      CheckBoxListTileModel(
        UserId: 5,
        title: "Youtube",
        isCheck: false,
      ),
    ];
  }
}
