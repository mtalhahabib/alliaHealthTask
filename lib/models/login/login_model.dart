class LoginModel {
  Body? body;
  bool? success;

  LoginModel({this.body, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Body {
  Client? client;
  String? accessToken;
  String? refreshToken;
  String? chatToken;

  Body({this.client, this.accessToken, this.refreshToken, this.chatToken});

  Body.fromJson(Map<String, dynamic> json) {
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    chatToken = json['chatToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['chatToken'] = this.chatToken;
    return data;
  }
}

class Client {
  bool? detailsAdded;
  bool? onboardingDone;
  String? email;
  int? id;
  List<ClientClinicians>? clientClinicians;

  Client(
      {this.detailsAdded,
      this.onboardingDone,
      this.email,
      this.id,
      this.clientClinicians});

  Client.fromJson(Map<String, dynamic> json) {
    detailsAdded = json['detailsAdded'];
    onboardingDone = json['onboardingDone'];
    email = json['email'];
    id = json['id'];
    if (json['clientClinicians'] != null) {
      clientClinicians = <ClientClinicians>[];
      json['clientClinicians'].forEach((v) {
        clientClinicians!.add(new ClientClinicians.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detailsAdded'] = this.detailsAdded;
    data['onboardingDone'] = this.onboardingDone;
    data['email'] = this.email;
    data['id'] = this.id;
    if (this.clientClinicians != null) {
      data['clientClinicians'] =
          this.clientClinicians!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientClinicians {
  int? id;
  Clinician? clinician;

  ClientClinicians({this.id, this.clinician});

  ClientClinicians.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinician = json['clinician'] != null
        ? new Clinician.fromJson(json['clinician'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.clinician != null) {
      data['clinician'] = this.clinician!.toJson();
    }
    return data;
  }
}

class Clinician {
  int? id;
  String? email;

  Clinician({this.id, this.email});

  Clinician.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}
