import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:note_app/firebase_options.dart';
import 'package:note_app/screen/notes_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      home: NotesScreen(),
    );
  }
}

/* class AddUser extends StatelessWidget {
  AddUser();

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference notes = FirebaseFirestore.instance.collection('note');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return notes
          .add({
            'title': "ALaa benhassen", // John Doe
            'company': "company", // Stokes and Sons
            'age': "hhhh" // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: addUser,
          child: FutureBuilder<DocumentSnapshot>(
            future: notes.doc("RY5VXlYrb5wGuQ5EgkGT").get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                    "Full Name: ${data['title']} ${data['age']}");
              }

              return Text("loading");
            },
          ),
        ),
      ),
    );
  }
}
 */