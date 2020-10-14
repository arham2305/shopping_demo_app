import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_demo_app/models/cart_item.dart';
import 'package:shopping_demo_app/models/user.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(var data) {
    _firestore.collection(collection).doc(data["uid"]).set(data);
  }

  getUserById(String id) {
    try {
      _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
    } catch (e, s) {
      print(s);
      Fluttertoast.showToast(msg: "Something went wrong");
      return;
    }
  }

  void addToCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}
