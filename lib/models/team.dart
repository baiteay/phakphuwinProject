class Team {
  List<Course>? course;

  Team({this.course});

  Team.fromJson(Map<String, dynamic> json) {
    if (json['TeamName'] != null) {
      course = <Course>[];
      json['TeamName'].forEach((v) {
        course!.add(new Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['TeamName'] = this.course!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course{
  String? id;
  String? teamname;
  String? teamdetail;
  String? teamlat;
  String? teamlong;
  String? teamlogo;

  Course({
    this.id,
    this.teamname,
    this.teamdetail,
    this.teamlat,
    this.teamlong,
    this.teamlogo
  });
  
  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamname = json['team_name'];
    teamdetail = json['team_detail'];
    teamlat = json['team_lat'];
    teamlong = json['team_long'];
    teamlogo = json['team_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_name'] = this.teamname;
    data['team_detail'] = this.teamdetail;
    data['team_lat'] = this.teamlat;
    data['team_long'] = this.teamlong;
    data['team_logo'] = this.teamlogo;
    return data;
  }
  
}