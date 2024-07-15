class SubmitModel {
  String? body;
  bool? success;

  SubmitModel({this.body, this.success});

  SubmitModel.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['success'] = this.success;
    return data;
  }
}