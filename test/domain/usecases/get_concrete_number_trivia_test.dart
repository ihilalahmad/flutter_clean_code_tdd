import 'package:dartz/dartz.dart';
import 'package:flutter_project_template/core/error/failures.dart';
import 'package:flutter_project_template/domain/entities/number_trivia.dart';
import 'package:flutter_project_template/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_template/domain/repositories/number_trivia_repository.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    // Make sure these are initialized before use.
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'Testing', number: 1);

  test('should get trivia for the number from the repository', () async {
    // Arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => const Right(tNumberTrivia));
    // Act
    final result = await usecase(number: tNumber);
    // Assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
