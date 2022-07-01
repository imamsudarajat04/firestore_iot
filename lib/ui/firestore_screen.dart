import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({Key? key}) : super(key: key);
  @override
  _FirestoreScreenKaryawanState createState() =>
      _FirestoreScreenKaryawanState();
}

class _FirestoreScreenKaryawanState extends State<FirestoreScreen> {
  final TextEditingController? _controllerTxtPerintah1 =
      TextEditingController();
  final TextEditingController? _controllerTxtPerintah2 =
      TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference iot = FirebaseFirestore.instance.collection('iot');

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateFirestore(String perintah1, String perintah2) {
    print("send perintah");
    return iot
        .doc('perintah')
        .update({'lampu1': perintah1, 'lampu2': perintah2}).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Berhasil")));
    }).catchError((error) {
      print("$error");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update firestore")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Firestore View",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _controllerTxtPerintah1,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Lampu 1",
                  ),
                ),
                TextFormField(
                  controller: _controllerTxtPerintah2,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Lampu 2",
                  ),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String? perintah1 =
                        _controllerTxtPerintah1!.text.toString();
                    String? perintah2 =
                        _controllerTxtPerintah2!.text.toString();
                    updateFirestore(perintah1, perintah2);
                    // updateFirestoree(perintah2);
                  },
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
