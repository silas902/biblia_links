import 'package:biblia_links/errors/failure.dart';
import 'package:flutter/material.dart';

abstract class IJsonError implements Exception {
  IJsonError({
    required String completeError,
  }) {
    debugPrint.call(completeError);
  }
}

class JsonError extends IJsonError {
  JsonError({required super.completeError});
  
}

class ErrorBibleOflline extends ExceptionError {
  ErrorBibleOflline({required StackTrace stackTrace, required String errorMessage, required String label})
      : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
          label: label,
        );
}
