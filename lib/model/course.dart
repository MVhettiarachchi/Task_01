import 'dart:convert';

List<Course> CourseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String welcomeToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
    Course({
        this.id,
        this.shortname,
        this.fullname,
        this.displayname,
        this.enrolledusercount,
        this.idnumber,
        this.visible,
        this.summary,
        this.summaryformat,
        this.format,
        this.showgrades,
        this.lang,
        this.enablecompletion,
        this.completionhascriteria,
        this.completionusertracked,
        this.category,
        this.progress,
        this.completed,
        this.startdate,
        this.enddate,
        this.marker,
        this.lastaccess,
        this.isfavourite,
        this.hidden,
        this.overviewfiles,
    });

    int id;
    String shortname;
    String fullname;
    String displayname;
    int enrolledusercount;
    String idnumber;
    int visible;
    String summary;
    int summaryformat;
    String format;
    bool showgrades;
    String lang;
    bool enablecompletion;
    bool completionhascriteria;
    bool completionusertracked;
    int category;
    double progress;
    bool completed;
    int startdate;
    int enddate;
    int marker;
    int lastaccess;
    bool isfavourite;
    bool hidden;
    List<dynamic> overviewfiles;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        shortname: json["shortname"],
        fullname: json["fullname"],
        displayname: json["displayname"],
        enrolledusercount: json["enrolledusercount"],
        idnumber: json["idnumber"],
        visible: json["visible"],
        summary: json["summary"],
        summaryformat: json["summaryformat"],
        format: json["format"],
        showgrades: json["showgrades"],
        lang: json["lang"],
        enablecompletion: json["enablecompletion"],
        completionhascriteria: json["completionhascriteria"],
        completionusertracked: json["completionusertracked"],
        category: json["category"],
        progress: json["progress"].toDouble(),
        completed: json["completed"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        marker: json["marker"],
        lastaccess: json["lastaccess"] == null ? null : json["lastaccess"],
        isfavourite: json["isfavourite"],
        hidden: json["hidden"],
        overviewfiles: List<dynamic>.from(json["overviewfiles"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shortname": shortname,
        "fullname": fullname,
        "displayname": displayname,
        "enrolledusercount": enrolledusercount,
        "idnumber": idnumber,
        "visible": visible,
        "summary": summary,
        "summaryformat": summaryformat,
        "format": format,
        "showgrades": showgrades,
        "lang": lang,
        "enablecompletion": enablecompletion,
        "completionhascriteria": completionhascriteria,
        "completionusertracked": completionusertracked,
        "category": category,
        "progress": progress,
        "completed": completed,
        "startdate": startdate,
        "enddate": enddate,
        "marker": marker,
        "lastaccess": lastaccess == null ? null : lastaccess,
        "isfavourite": isfavourite,
        "hidden": hidden,
        "overviewfiles": List<dynamic>.from(overviewfiles.map((x) => x)),
    };
}