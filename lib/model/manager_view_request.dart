class ManagerViewRequestResponse {
  Response? response;

  ManagerViewRequestResponse({this.response});

  ManagerViewRequestResponse.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['Response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  Data? data;
  Status? status;

  Response({this.data, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Data {
  List<JobRequestDetails>? jobRequestDetails;
  List<ShiftDetails>? shiftDetails;
  List<HospitalDetails>? hospitalDetails;

  Data({this.jobRequestDetails, this.shiftDetails, this.hospitalDetails});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['job_request_details'] != null) {
      jobRequestDetails = <JobRequestDetails>[];
      json['job_request_details'].forEach((v) {
        jobRequestDetails!.add(new JobRequestDetails.fromJson(v));
      });
    }
    if (json['shift_details'] != null) {
      shiftDetails = <ShiftDetails>[];
      json['shift_details'].forEach((v) {
        shiftDetails!.add(new ShiftDetails.fromJson(v));
      });
    }
    if (json['hospital_details'] != null) {
      hospitalDetails = <HospitalDetails>[];
      json['hospital_details'].forEach((v) {
        hospitalDetails!.add(new HospitalDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobRequestDetails != null) {
      data['job_request_details'] =
          this.jobRequestDetails!.map((v) => v.toJson()).toList();
    }
    if (this.shiftDetails != null) {
      data['shift_details'] =
          this.shiftDetails!.map((v) => v.toJson()).toList();
    }
    if (this.hospitalDetails != null) {
      data['hospital_details'] =
          this.hospitalDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobRequestDetails {
  int? rowId;
  int? userId;
  String? userName;
  int? jobId;
  String? date;
  String? status;

  JobRequestDetails(
      {this.rowId,
        this.userId,
        this.userName,
        this.jobId,
        this.date,
        this.status});

  JobRequestDetails.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    jobId = json['job_id'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['job_id'] = this.jobId;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}

class ShiftDetails {
  int? shiftRowId;
  String? type;
  String? userType;
  int? category;
  String? jobTitle;
  String? hospital;
  String? date;
  String? timeFrom;
  String? timeTo;
  String? jobDetails;
  int? price;
  Null? allowances;
  String? createdDate;

  ShiftDetails(
      {this.shiftRowId,
        this.type,
        this.userType,
        this.category,
        this.jobTitle,
        this.hospital,
        this.date,
        this.timeFrom,
        this.timeTo,
        this.jobDetails,
        this.price,
        this.allowances,
        this.createdDate});

  ShiftDetails.fromJson(Map<String, dynamic> json) {
    shiftRowId = json['shift_row_id'];
    type = json['type'];
    userType = json['user_type'];
    category = json['category'];
    jobTitle = json['job_title'];
    hospital = json['hospital'];
    date = json['date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    jobDetails = json['job_details'];
    price = json['price'];
    allowances = json['allowances'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shift_row_id'] = this.shiftRowId;
    data['type'] = this.type;
    data['user_type'] = this.userType;
    data['category'] = this.category;
    data['job_title'] = this.jobTitle;
    data['hospital'] = this.hospital;
    data['date'] = this.date;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['job_details'] = this.jobDetails;
    data['price'] = this.price;
    data['allowances'] = this.allowances;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class HospitalDetails {
  int? hospitalRowId;
  String? hospitalName;
  String? email;
  String? address;
  String? phone;
  String? province;
  Null? longitude;
  Null? latitude;
  String? photo;

  HospitalDetails(
      {this.hospitalRowId,
        this.hospitalName,
        this.email,
        this.address,
        this.phone,
        this.province,
        this.longitude,
        this.latitude,
        this.photo});

  HospitalDetails.fromJson(Map<String, dynamic> json) {
    hospitalRowId = json['hospital_row_id'];
    hospitalName = json['hospital_name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    province = json['province'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hospital_row_id'] = this.hospitalRowId;
    data['hospital_name'] = this.hospitalName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['province'] = this.province;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['photo'] = this.photo;
    return data;
  }
}

class Status {
  int? count;
  int? statusCode;
  String? statusMessage;

  Status({this.count, this.statusCode, this.statusMessage});

  Status.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}

