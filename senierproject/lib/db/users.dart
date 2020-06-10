import 'package:firebase_database/firebase_database.dart';

class UserServices {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(String uid, Map value) {

    String id = value["userID"];

    _database.reference().child("$ref/$id").push().set(value).catchError(
          (err) => print(
            err.toString(),
          ),
        );
  }
}
