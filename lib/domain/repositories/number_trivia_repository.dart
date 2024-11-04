import 'package:dartz/dartz.dart';
import 'package:flutter_project_template/core/error/failures.dart';
import 'package:flutter_project_template/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failures, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failures, NumberTrivia>> getRandomNumberTrivia();
}
