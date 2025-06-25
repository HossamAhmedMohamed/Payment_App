abstract class Failures{

  final String errMessage;
  Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);
  
}