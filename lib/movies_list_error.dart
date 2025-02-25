// {
//   "status_code": 7,
//   "status_message": "Invalid API key: You must be granted a valid key.",
//   "success": false
// }

class MoviesListError {
  String statusMessage;
  int statusCode;
  bool success;

  @override
  String toString() {
    return 'MoviesListError(statusMessage: $statusMessage, statusCode: $statusCode, success: $success)';
  }

  MoviesListError({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });

  static MoviesListError fromJson(Map<String, dynamic> json) {
    return MoviesListError(
      statusMessage: json['status_message'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }
}
