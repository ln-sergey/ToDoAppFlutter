import 'package:dartz/dartz.dart';
import 'failures.dart';

/// Validates email [input] with reg. exp.
/// 
/// Returns [ValueFailure] if [input] is invalid
Either<ValueFailure<String>, String> validateEmailAdderss(String input) {
  const emailRegExp = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegExp).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

/// Validates that password [input] length is longer than 6
/// 
/// Throws [ValueFailure] if [input] is invalid
Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}