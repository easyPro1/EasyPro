import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/item.dart';

abstract class Database {
  Future<void> setItem(Item item);
}

class FirestoreDatabase implements Database {
  final String uid;

  FirestoreDatabase({this.uid});

  @override
  Future<void> setItem(Item item) => _setData(
        path: '/users/$uid/items/item_abc',
        data: item.toMap(),
      );

  Future<void> _setData(
      {String path, Map<String, dynamic> data}) async {
    final ref = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await ref.set(data);
  }
}
