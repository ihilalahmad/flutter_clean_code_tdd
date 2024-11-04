
import 'package:dartz/dartz.dart';
import 'package:flutter_project_template/domain/repositories/number_trivia_repository.dart';

import '../../core/error/failures.dart';
import '../entities/number_trivia.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failures, NumberTrivia>> call({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
