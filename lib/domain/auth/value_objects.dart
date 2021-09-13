import 'package:dartz/dartz.dart';
import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAdderss(input)
    );
  }

  EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input)
    );
  }

  Password._(this.value);
}