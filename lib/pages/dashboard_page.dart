import 'package:deeprooted_parikshit/cubits/cubit/search_coins_cubit.dart';
import 'package:deeprooted_parikshit/healers/globals.dart';
import 'package:deeprooted_parikshit/models/conversion_brief.dart';
import 'package:deeprooted_parikshit/widgets/conversion_brief_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchBar = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCoinsCubit, SearchCoinsState>(
        builder: (context, state) {
      return Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(
                height: 45,
              ),
              TextField(
                  controller: _searchController,
                  onSubmitted: (value) => callfunction(context),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Globals.textFieldColor,
                      suffixIcon: IconButton(
                          onPressed: () => callfunction(context),
                          icon: const Icon(
                            Icons.search,
                          )),
                      hintText: "Enter Currency Pair",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)))),
              if (state is LoadingState)
                LinearProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Globals.themeColor!),
                ),
              if (state is SearchCoinsInitial)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Icon(
                      Icons.search,
                      color: Globals.customIcoColor,
                      size: getHeight(context, 24),
                    ),
                  ),
                ),
              if (state is SearchCoinsInitial)
                const Center(
                  child: Text(
                    "Enter A currency Pair to load Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              if (state is LoadedBriefState || state is LoadedBidsState)
                Flexible(
                  child: ConversionBriefHolder(
                      conversionBrief: state.props[0] as ConversionBrief,
                      conversionName: _searchController.text),
                ),
              if (state is! SearchCoinsInitial)
                TextButton(
                    onPressed: () =>
                        callfunction(context, showBidsTapped: true),
                    child: Text(context.read<SearchCoinsCubit>().showBids
                        ? "HIDE ORDER BOOK"
                        : "SHOW ORDER BOOK"))
            ],
          ),
        )),
        floatingActionButton: state is SearchCoinsInitial
            ? const SizedBox(
                height: 0,
              )
            : FloatingActionButton(
                onPressed: () => callfunction(context),
                child: const Icon(Icons.refresh_sharp),
              ),
      );
    });
  }

  void callfunction(BuildContext context, {bool showBidsTapped = false}) {
    context.read<SearchCoinsCubit>().getDataForCoins(
        searchKeyword: _searchController.text, showBidsTapped: showBidsTapped);
  }
}
