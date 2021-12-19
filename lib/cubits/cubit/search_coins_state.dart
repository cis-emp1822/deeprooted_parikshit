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

class LoadedBriefState extends SearchCoinsState {
  LoadedBriefState(this.conversionBrief);

  final ConversionBrief conversionBrief;

  @override
  List<Object> get props => [conversionBrief];
}

class LoadedBidsState extends SearchCoinsState {
  LoadedBidsState(this.bidAndAsk, this.conversionBrief);
  final ConversionBrief conversionBrief;
  final BidAndAsk bidAndAsk;

  @override
  List<Object> get props => [bidAndAsk, conversionBrief];
}

class ErrorState extends SearchCoinsState {
  ErrorState({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [];
}
