import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deeprooted_parikshit/cubits/cubit/repositories/coins_repo.dart';
import 'package:deeprooted_parikshit/models/bids_and_ask.dart';
import 'package:deeprooted_parikshit/models/conversion_brief.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'search_coins_state.dart';

class SearchCoinsCubit extends Cubit<SearchCoinsState> {
  SearchCoinsCubit({this.coinsRepo}) : super(SearchCoinsInitial());
  final CoinsRepo? coinsRepo;

  void getMeaningFromWord(
      {String searchKeyword = '', bool showDetails = false}) async {
    try {
      if (searchKeyword.isNotEmpty) {
        emit(LoadingState());
        final movies = await coinsRepo!.getConversionBrief(searchKeyword);
        emit(LoadedState(movies));
      } else {
        emit(ErrorState(
            errorMessage:
                "The user has denied the use of speech recognition."));
        log("The user has denied the use of speech recognition.");
      }
      // some time later...

    } catch (e) {
      emit(ErrorState(errorMessage: "Something Went Wrong"));
    }
  }
}
