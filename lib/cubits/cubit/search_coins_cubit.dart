import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_coins_state.dart';

class SearchCoinsCubit extends Cubit<SearchCoinsState> {
  SearchCoinsCubit() : super(SearchCoinsInitial());
}
