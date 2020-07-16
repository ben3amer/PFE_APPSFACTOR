import 'package:pfe_appsfactor/services/firestore_service.dart';
import 'package:pfe_appsfactor/services/code_generator.dart';
import 'package:pfe_appsfactor/models/user.dart';
import 'package:pfe_appsfactor/locator.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:rxdart/rxdart.dart';
import 'dart:async';

 class AuthenticationService {

    User _currentUser;
    User get currentUser => _currentUser;



    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FirestoreService _firestoreService = locator<FirestoreService>() ;
    final FacebookLogin facebookSignIn = new FacebookLogin();
  
  //google sign in
  
  Future<FirebaseUser> signInWithGoogle() async {
    String code = randomAlphaNumeric(6);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

    final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
  
    
    _currentUser = User(
      id: user.uid,
      fullName: user.displayName,
      email: user.email,
      code : code,
      photoUrl: user.photoUrl,
       gender : null,
        phoneNumber : null,
        country : null,
        city : null,
        address : null,
        postalCode : null,
        description : null,
           );

    await _firestoreService.createUser(_currentUser);
    //print("signed in " + user.displayName);

    return user;
    }

  //  Sign in facebook
 
 Future<FirebaseUser> signInFacebook() async {
  String code = randomAlphaNumeric(6); 
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
  FacebookAccessToken facebookAccessToken = result.accessToken;
  AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);
  FirebaseUser user;
  user = (await _firebaseAuth.signInWithCredential(authCredential)).user;
  
  _currentUser = User(
        id : user.uid,
        fullName : user.displayName,
        email : user.email,
        gender : null,
        code : code,
        phoneNumber : null,
        country : null,
        city : null,
        address : null,
        postalCode : null,
        photoUrl : user.photoUrl,
         description : null,
        
        );

    await _firestoreService.createUser(_currentUser);

    return user;
  }
  


  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
// Sign in with email

  Future loginWithEmail({
        @required String email,
        @required String password,
      }) async {
            try{
              var authResult = await _firebaseAuth.signInWithEmailAndPassword(
                email: email, 
                password: password,
                );
                await _populateCurrentUser(authResult.user); // Populate the user information

                return authResult.user != null;

            }catch(e){
              return e.message ;
            }

      }
// sign up with email

  Future signUpWithEmail({
        @required String email,
        @required String password,
        @required String fullName,
        @required String gender,

      }) async{
          try{
            String code = randomAlphaNumeric(6);
              var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
                email: email, 
                password: password,
                
                );
                //create a new user on firestore

                _currentUser = User(
                  id: authResult.user.uid ,
                  fullName: fullName ,
                  email: email,
                  gender: gender,
                  code: code ,
                  phoneNumber : null,
                  country : null,
                  city : null,
                  address : null,
                  postalCode : null,
                  photoUrl :'https://i.pinimg.com/564x/19/92/c1/1992c1d65b5e2eae62b2eaa299a0ab0b.jpg',
                   description : null,
                  );
                
                await _firestoreService.createUser(_currentUser);
              
              return authResult.user != null ;
          }catch(e){
            return e.message ;
          }

      }
  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user); // Populate the user information
    return user != null;
  }

//sign out

 void signOut() {
    _firebaseAuth.signOut();
  }

 }