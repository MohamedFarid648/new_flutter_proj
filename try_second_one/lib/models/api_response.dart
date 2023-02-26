class ApiResponse {
  final bool? status;
  final int? code;
  final String? message;
  final String? type;
  final Object? data;
  final List<Object>? errors;

  const ApiResponse(
      {this.status,
      this.code,
      this.message,
      this.type,
      this.data,
      this.errors});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      type: json['type'],
      data: json['data'],
      errors: json['errors'],
    );
  }

  /*Map<String, dynamic> _toMap() {
    return {
      'status': status,
      'code': code,
      'message': message,
      'type': type,
      'data': data,
      'errors': errors,
    };
  }

  dynamic get(String propertyName) {
    var _mapRep = _toMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('propery not found');
  }*/
}
