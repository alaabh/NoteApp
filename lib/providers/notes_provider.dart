import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/note_model.dart';

final notesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final firestore = FirebaseFirestore.instance;
  final querySnapshot = await firestore.collection('note').get();
  final notes = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();
  print(notes);
  return notes;
});
