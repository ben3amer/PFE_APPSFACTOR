class User{
  final String id;
  final String fullName;
  final String email;
  final String gender;
  final String code;
  final String phoneNumber;
  final String country;
  final String city;
  final String address ;
  final String postalCode;
  final String photoUrl ;
  final String description ;

User({this.id,this.fullName,this.email,this.gender,this.code,this.phoneNumber,this.country,this.city,this.address,this.postalCode,this.photoUrl,this.description});

User.fromData(Map<String,dynamic> data )
: id = data['id'],
  fullName = data['fullName'],
  email = data['email'],
  code = data['code'],
  gender = data['gender'],
  phoneNumber = data['phoneNumber'],
  country = data['country'],
  city = data['city'],
  address = data['address'],
  postalCode = data['postalCode'],
  photoUrl = data['photoUrl'],
  description = data['description'];
  
  Map<String , dynamic> toJson(){
    return {
      'id' : id,
      'fullName' : fullName,
      'email' : email,
      'gender' : gender,
      'code' : code,
      'phoneNumber' : phoneNumber,
      'country' : country, 
      'city': city,
      'address' : address,
      'postalCode' : postalCode,
      'photoUrl' : photoUrl ,
      'description' : description ,
    };
  }
}