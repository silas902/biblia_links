// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class ExceptionError implements Exception {
  final String errorMessage;

  ExceptionError({
    required StackTrace? stackTrace,
    required String? label,
    //dynamic exeption,
     this.errorMessage = '',
  }) {
    debugPrintStack(label: label, stackTrace: stackTrace);
  }
}

class UnknownError extends ExceptionError {
  final StackTrace? stackTrace;
  final String? label;
  UnknownError({
   required this.stackTrace,
   required this.label,
    super.errorMessage = 'Unknown Error',
  }) : super(
          stackTrace: stackTrace,
          label: label,
        );
}
