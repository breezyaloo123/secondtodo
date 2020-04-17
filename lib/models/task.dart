
class Task {

  String task;
  String datedeb;
  String dateFin;
  String type;
  int etat;
  bool val=false;
  int id;

  Task({this.id,this.task,this.datedeb,this.dateFin,this.type,this.etat,this.val});


  // factory Task.fromdd(Map<String, dynamic> data) => Task(
  //   type: data["type"],
  //   task: data["nom"],
  //   datedeb: data["datedeb"],
  //   dateFin: data["datefin"],
  //   userID: data["userID"],
  //   val: data["val"]==0?false:true,
  // );

    Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = type;
    map["nom"] = task;
    map["datedeb"] = datedeb;
    map["datefin"] = dateFin;
    map["etat"] = etat;
    
    return map;
  }
  
  Task.fromMap(dynamic obj)
  {
    type=obj["type"];
    task = obj["nom"];
    datedeb=obj["datedeb"];
    dateFin=obj["dateFin"];
    etat=obj["etat"];
  }

  bool get iscomplet
  {
    val=false;
    return val;
  }
  set isCompleted(bool value)
  {
    val = value;
  }
}