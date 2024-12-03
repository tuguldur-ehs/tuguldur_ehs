class ResponseBase<T> {
  final bool? success;
  final String? message;
  final T? data;

  ResponseBase({this.success, this.message, this.data});
}