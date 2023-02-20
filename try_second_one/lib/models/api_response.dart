class ApiResponse {
  bool? status;
  int? code;
  String? message;
  String? type;
  Object? data;
  List<Object>? errors;

  ApiResponse(
      {this.status,
      this.code,
      this.message,
      this.type,
      this.data,
      this.errors});

  Map<String, dynamic> _toMap() {
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
  }
}
