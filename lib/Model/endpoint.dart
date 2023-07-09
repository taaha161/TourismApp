class Endpoint {
  static const apischeme = 'https';
  static const apiHost = 'fluttercrashcourse.com';
  static const prefix = '/api/v1';

  static Uri server(String path,
      {required Map<String, dynamic> queryParameters}) {
    final uri = Uri(
      scheme: apischeme,
      host: apiHost,
      path: '$prefix$path',
      queryParameters: queryParameters,
    );
    return uri;
  }
}
