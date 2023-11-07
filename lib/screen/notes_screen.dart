import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../providers/notes_provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: Get.size.width * 0.9,
              child: const TextField(
                // controller: noteContoller,

                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Recherche",
                    labelStyle:
                        TextStyle(fontFamily: 'Montserrat', fontSize: 13),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(112, 74, 209, 1),
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(112, 74, 209, 1),
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(112, 74, 209, 1),
                    ))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: Get.size.width * 0.9,
                height: Get.size.height * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Consumer(builder: (context, ref, child) {
      final notesAsyncValue = ref.watch(notesProvider);

      return notesAsyncValue.when(
        data: (notes) {
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Text(note['title']);
            },
          );
        },
        loading: () {
          return CircularProgressIndicator();
        },
        error: (error, stackTrace) {
          return Text('Error: $error');
        },
      );
    }),
                      /* ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 15,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: Get.size.width * 0.9,
                            height: Get.size.height * 0.16,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 197, 187, 1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(47, 47, 47, 0.2),
                              ),
                            ),
                            child: Text(""),
                          );
                        },
                      ), */
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
