// модель слова, яка містить базову інформацію
class WordModel {
  WordModel({
    required this.wordId,
    required this.wordBasicWord,
    required this.wordSplitWord,
  });

  final int wordId; // ідентифікатор слова

  final String? wordBasicWord; // базова форма слова

  final String? wordSplitWord; // розділена форма слова

  @override
  String toString() {
    return 'WordModel{wordId: $wordId, '
        'wordBasicWord: $wordBasicWord, '
        'wordSplitWord: $wordSplitWord}';
  }
}
