import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_web_worker_example/core/router/router.dart';
import 'package:flutter_web_worker_example/features/word_search/bloc/word_search_bloc.dart';
import 'package:flutter_web_worker_example/features/word_search/data/models/word.dart';

@RoutePage()
class WordSearchScreen extends StatefulWidget {
  const WordSearchScreen({super.key});

  @override
  State<WordSearchScreen> createState() => _WordSearchScreenState();
}

class _WordSearchScreenState extends State<WordSearchScreen> with RouteAware {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => WordSearchBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB3D9FF), Color(0xFFF8AFC3)],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.32,
                  vertical: screenHeight * 0.04,
                ),
                child: Container(
                  width: screenWidth * 0.84,
                  height: screenHeight * 0.72,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 38,
                        child: Builder(builder: (context) {
                          return TextField(
                            controller: _searchController,
                            onChanged: (text) => context
                                .read<WordSearchBloc>()
                                .add(WordSearchTextChangeEvent(text)),
                            cursorHeight: 0,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Пошук слова',
                              labelStyle: TextStyle(
                                color: Colors.black.withAlpha(100),
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: BlocBuilder<WordSearchBloc, WordSearchState>(
                          builder: (context, state) {
                            if (state is WordSearchLoadedState) {
                              return _List(words: (state).words);
                            } else {
                              return _List(words: []);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _List extends StatefulWidget {
  const _List({
    required this.words,
  });

  final List<WordModel> words;

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<WordSearchBloc>().add(WordSearchLoadMoreEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.words.isEmpty) {
      return Center(
        child: Text(
          'Немає результатів для вашого запиту.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.words.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            widget.words[index].wordBasicWord ?? '',
            style: const TextStyle(color: Colors.black),
          ),
          onTap: () {
            final word = widget.words[index];
            context.read<WordSearchBloc>().add(WordSearchSelectEvent(word));
            context.router.push(WordDetailsRoute(wordModel: word));
          },
        );
      },
    );
  }
}
