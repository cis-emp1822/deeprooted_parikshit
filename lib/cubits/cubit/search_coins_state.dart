part of 'search_coins_cubit.dart';

@immutable
abstract class SearchCoinsState extends Equatable {}

class SearchCoinsInitial extends SearchCoinsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SearchCoinsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends SearchCoinsState {
  LoadedState(this.conversionBrief);

  final ConversionBrief conversionBrief;

  @override
  List<Object> get props => [conversionBrief];
}

class ErrorState extends SearchCoinsState {
  ErrorState({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [];
}
