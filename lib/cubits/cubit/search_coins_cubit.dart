import 'package:bloc/bloc.dart';
import 'package:deeprooted_parikshit/models/conversion_brief.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'search_coins_state.dart';

class SearchCoinsCubit extends Cubit<SearchCoinsState> {
  SearchCoinsCubit() : super(SearchCoinsInitial());
}
