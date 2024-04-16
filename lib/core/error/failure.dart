abstract class Failure {
  final String message;

  Failure(this.message);
}

class ShowSpecificError extends Failure {
  ShowSpecificError(String message) : super(message);
}
