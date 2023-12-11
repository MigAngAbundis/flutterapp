import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// Assuming 'SearchTextFieldWidget' and 'SearchHistoryAndTrending' are defined elsewhere in the project
import '../../widgets/search/search_text_field.dart';
import '../../widgets/search/search_history_and_trending.dart';
import '../../../controllers/search_controller.dart' as searchCtrl;

class SearchScreenOne extends StatefulWidget {
  const SearchScreenOne({super.key});

  static const routeName = '/SearchScreen';

  @override
  _SearchScreenOneState createState() => _SearchScreenOneState();
}

class _SearchScreenOneState extends State<SearchScreenOne> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<searchCtrl.SearchController>(context, listen: false)
          .getSearchHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (!Provider.of<searchCtrl.SearchController>(context).isWeb &&
                  Provider.of<searchCtrl.SearchController>(context).isTapped)
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<searchCtrl.SearchController>(context,
                                  listen: false)
                              .onExitTapTextField();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: CupertinoSearchTextField(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 10), // Space for the button
                      Material(
                        color: Colors.white,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            // Define the action when the button is pressed
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const SizedBox(
                              width: 48,
                              height: 48,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                const SearchTextFieldWidget(),
              if (Provider.of<searchCtrl.SearchController>(context).isTapped &&
                  Provider.of<searchCtrl.SearchController>(context).isWeb)
                // Your logic for web
                Container()
              else if (Provider.of<searchCtrl.SearchController>(context)
                      .isTapped &&
                  !Provider.of<searchCtrl.SearchController>(context).isWeb)
                const SearchHistoryAndTrending()
              else
                // Your default home screen or content here
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.9,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
