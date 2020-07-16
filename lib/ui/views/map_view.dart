import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


import 'package:share/share.dart';

import 'package:pfe_appsfactor/constants/route_names.dart';
import 'package:pfe_appsfactor/locator.dart';

import 'package:pfe_appsfactor/services/navigation_service.dart';
import 'package:pfe_appsfactor/services/auth.dart';


class MapView extends StatefulWidget {
  const  MapView({Key key}) : super(key: key);
  
  @override
  State<MapView> createState() => MapViewState();
}
class MapViewState extends State<MapView> with SingleTickerProviderStateMixin{
    
    TextEditingController select = new TextEditingController() ;
  LatLng _lastMapPosition = _center;
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  // MapType _currentMapType = MapType.normal;
   
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  var _currentLoc ;
  final AuthenticationService _authenticationService =    locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final Map<String, Marker> markersGps = {};
  //final FirestoreService _firestoreService = locator<FirestoreService>();

   void navigateToHome(){
    _navigationService.navigateTo(HomeViewRoute);
  }
  void navigateToInfo(){
    _navigationService.navigateTo(InfoViewRoute);
  }

  //log out
  void logout(){
    _authenticationService.signOut();
    _navigationService.navigateTo(LoginViewRoute);
  }
  /*
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }*/
 bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  
  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

 
  void getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _currentLoc = currentLocation;
      _markers.add(Marker(
          markerId: MarkerId("curr_loc"),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          infoWindow: InfoWindow(title: 'Votre Position'),
           icon: BitmapDescriptor.defaultMarker,
      ),
     
      );
      
    });
  }
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Your Position',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _currentLoc = _lastMapPosition ;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  @override
  Widget build(BuildContext context) {
    return /*ViewModelBuilder<MapViewModel>.reactive(
      viewModelBuilder: () => MapViewModel(),
      builder:(context, model, child) =>*/ Scaffold(
        
         
         drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: Text(
            'Map Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle ,color: Colors.amber,),
          title: Text('Profile',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
            onTap: () =>
         navigateToHome(),
        ),
        ListTile(
          leading: Icon(Icons.info , color: Colors.amber,),
          title: Text('Edit Profile',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
            onTap: () =>
         navigateToInfo(),
            
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.amber,),
          title: Text('Logout',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),),
             onTap: () =>
         logout(),
        ),
      ],
    ),
  ),
        body: 
        Stack(
          children: <Widget>[
            new GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.27442, 9.87391),
                zoom: 11.0,
              ),
              mapType: MapType.hybrid,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget> [
                   Transform(
                      transform: Matrix4.translationValues(
                  0.0, _translateButton.value * 3.0,0.0,
                    ),
          child: sendEmail(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: sendFacebook(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: share(),
        ),
        toggle(),
                
                  SizedBox(height: 10.0),
                  autoPos(),
                     SizedBox(height: 10.0),
                    manuelPos()
                  ],
                ),
              ),
            ),
          ],
        ),
      );   
   
  }
   Widget toggle() {
    return Container(
       child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),  );
  }

 Widget sendFacebook() {
    return new Container(
      child: FloatingActionButton(
        onPressed: shareFacebook,
        tooltip: 'Share Location with Facebook',
        child: FaIcon(FontAwesomeIcons.facebook,),
      ),
    );
  }

  Widget share() {
    return new Container(
      child: FloatingActionButton(
        onPressed: _share,
        tooltip: 'Share your Location',
        child: Icon(Icons.share),
      ),
    );
  }

  Widget sendEmail() {
    return new Container(
      child: FloatingActionButton(
        onPressed: shareEmail,
        tooltip: 'View Group Location',
        child: Icon(Icons.group),
      ),
    );
  }
Widget autoPos() {
    return new Container( 
      child: FloatingActionButton(
                      onPressed: getLocation,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      tooltip: 'Ajouter Votre Position avec GPS',
                      child: const Icon(Icons.my_location, size: 36.0),
                    ),

    );}
      Widget manuelPos() {
    return new Container(
      child:  FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      tooltip: 'Ajouter Position  manuellement',
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),
    );
    }

    void shareFacebook() async{
      /*
        File file = await ImagePicker.pickImage(source: ImageSource.gallery);
        await SocialSharePlugin.shareToFeedFacebook(path: file.path);
        await SocialSharePlugin.shareToFeedFacebookLink(quote: 'quote', url: 'https://flutter.dev');
    */
    }
    void _share()  async {
      final String text = 'My location at ' +  _currentLoc.toString();
    Share.share(text,
    subject: 'My Location'  ); 
  }
    void shareEmail() async{
    }
}
