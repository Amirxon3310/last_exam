import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:last_exam/model/card_model.dart';

class MyController extends GetxController {
  RxList<CardModel> cardsList = <CardModel>[].obs;

  void addCard(CardModel card) {
    cardsList.add(card);
  }

  void removeCard(int index) {
    if (index >= 0 && index < cardsList.length) {
      cardsList.removeAt(index);
    }
  }

  void clearAllCards() {
    cardsList.clear();
  }
}
