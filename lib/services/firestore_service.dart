//import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_appsfactor/models/user.dart';



class FirestoreService{
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollectionReference =
  Firestore.instance.collection('users');
  // Create User and Adding data to Database
  Future createUser(User user) async{
    try {
      await _userCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      print("Error : $e");
    }
  }
  // Get Current User Data to Display on Profile
  Future getUser(String uid) async {
    try {
      var userData = await _userCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      print("Error : $e");
    }
  }
// return User fulName
Future <String>  getfullName() async{
    try {
      var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).fullName;
      
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getEmail() async{
   try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).email;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getCode() async{
   try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).code;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getGender() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).gender;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future  <String> getphoneNumber() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).phoneNumber;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getCountry() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).country;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getCity() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).city;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getAddress() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).address;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getpostalCode() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).postalCode;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
}
Future <String> getphotoUrl() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      if (User.fromData(userData.data).photoUrl != null)
      return  User.fromData(userData.data).photoUrl;
      else return null;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
  
}
Future <String> getDescription() async{
  try {
     var user = await _firebaseAuth.currentUser();
      var userData = await _userCollectionReference.document(user.uid).get();
      return  User.fromData(userData.data).description;
    } catch (e) {
      print("Error : $e");
      return null ;
    }
  
}
  // Update User Data
  Future updatefullName( String fullName) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'fullName' : fullName});
          return true;
    } catch (e) {
      print('Error : $e');
    }
}
  /*Future updateEmail(String email) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'email' : email});
        
          return true ;
    } catch (e) {
      
      print('Error : $e');
    }
}*/
  Future updateGender(String gender) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'gender' : gender});
          return true ;
    } catch (e) {
      print('Error : $e');
    }
}
  Future updatephoneNumber(String phoneNumber) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'phoneNumber' : phoneNumber});
          return true ;
    } catch (e) {
    print('Error : $e');
    }
}
  Future updateCountry(String country ) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'country' : country});
          return true ;
    } catch (e) {
     print('Error : $e');
    }
}
  Future updateCity(String city) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'city' : city});
          return true ;
    } catch (e) {
      print('Error : $e');
    }
}
  Future updateAddress(String address) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'address' : address});
          return true ;
    } catch (e) {
      print('Error : $e');
    }
}
  Future updatepostalCode(String postalCode) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'postalCode' : postalCode});
          return true ;
    } catch (e) {
     print('Error : $e');
    }
  }
  Future updatephoUrl(String photoUrl) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'photoUrl' : photoUrl});
          return true ;
    } catch (e) {
     print('Error : $e');
    }
  }
  Future updateDescription(String description) async {
    try {
      var user = await _firebaseAuth.currentUser();
      await _userCollectionReference
          .document(user.uid)
          .updateData({'description' : description});
          return true ;
    } catch (e) {
     print('Error : $e');
    }
  }

}