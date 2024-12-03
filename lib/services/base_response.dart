class ResponseBase<T> {
  final String? message;
  final num? statusCode;
  final T? data;

  ResponseBase({this.message, this.statusCode, this.data});
}