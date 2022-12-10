class ResultFields {
  static   String studentID = "Student ID";
  static  String studentName = "Student Name";
  static  String studentType = "Student Type";
  static  String submitTime = "Submit Time";

  static List<String> getFields() =>
      [studentID, studentName, studentType, submitTime];
}

class ResultModel {
  late String _studentID;
  late String _studentName;
  late String _result;
  late String _submitTime;

  ResultModel({
    required studentID,
    required studentName,
    required result,
    required submitTime,
  }) {
    _submitTime = submitTime;
    _studentID = studentID;
    _studentName = studentName;
    _result = result;
  }

  ResultModel.fromJson(Map<String, dynamic> json) {
    _submitTime = json['submitTime'];
    _studentID = json['studentID'];
    _studentName = json['studentName'];
    _result = json['result'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['submitTime'] = _submitTime;
    data['studentID'] = _studentID;
    data['studentName'] = _studentName;
    data['result'] = _result;

    return data;
  }
}
