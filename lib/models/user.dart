class User{
 String nom;
 String prenom;
 String pseudo;
 String password;
 String image;


 User(this.prenom,this.nom,this.pseudo,this.password,this.image);
 

//the getter and setter


String get name
{
  return this.nom;
}

String get firstname
{
  return this.prenom;
}
String get pseudo1{ return this.pseudo;}
String get pwd{ return this.password;}

set name(String nom){ this.nom = nom;}
set firstname(String prenom){ this.prenom = prenom;}
set pseudo1(String pseudo){ this.pseudo = pseudo;}
set pwd(String password){ this.password = password;}




  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["prenom"] = prenom;
    map["nom"] = nom;
    map["username"] = pseudo;
    map["password"] = password;
    map["image"] = image;
    return map;
  }
  


}