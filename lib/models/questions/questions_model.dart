class QuestionsModel {
  List<Body>? body;
  bool? success;

  QuestionsModel({this.body, this.success});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Body {
  int? id;
  String? question;
  String? answerType;
  List<Options>? options;

  Body({this.id, this.question, this.answerType, this.options});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answerType = json['answerType'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answerType'] = this.answerType;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? id;
  String? option;
  bool? isFreeForm;
  int? questionId;

  Options({this.id, this.option, this.isFreeForm, this.questionId});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    option = json['option'];
    isFreeForm = json['isFreeForm'];
    questionId = json['questionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['option'] = this.option;
    data['isFreeForm'] = this.isFreeForm;
    data['questionId'] = this.questionId;
    return data;
  }
}
