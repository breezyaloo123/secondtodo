
class Task {

  String task;
  String datedeb;
  String dateFin;
  String type;
  String userID;

  Task({this.task,this.datedeb,this.dateFin,this.type,this.userID});

    Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = type;
    map["nom"] = task;
    map["datedeb"] = datedeb;
    map["datefin"] = dateFin;
    map["userID"] = userID;
    return map;
  }
  
}