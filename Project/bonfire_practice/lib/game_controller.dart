import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/unit.dart';
import 'package:untitled/unit_card.dart';

class GameController extends StatefulWidget {
  const GameController({super.key});

  @override
  State<GameController> createState() => _GameControllerState();
}

class _GameControllerState extends State<GameController> {

  final List<Unit> _unitPool = [
    Unit(id: 'knight', name: "기사"),
    Unit(id: 'magician', name: "마법사"),
    Unit(id: 'warrior', name: "전사"),
    Unit(id: 'chanwoo', name: "찬우"),
    Unit(id: 'chulyong', name: "철용"),
    Unit(id: 'kangbba', name: "강빠"),
    // Add more units as needed
  ];
  String _debugString = "Initial Debug Info";
  set debugString(String value) {
    setState(() {
      _debugString = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_debugString),
          const SizedBox(height: 50,),
          ElevatedButton(
            onPressed: () async{
              await waitForPickingUnit();
            },
            child: const Text("Update Debug Info"),
        ),
      ],
    );
  }

  waitForPickingUnit() async{
    Unit? selectedUnit = await showCardsDialog(context, getRandomUnits(_unitPool,3));
    if(selectedUnit == null){
      debugString = "플레이어가 선택을 취소한 경우입니다";
      return;
    }
    debugString = "${selectedUnit!.name}, ${selectedUnit.id} 라는 유닛을 선택하셨습니다";
  }

  List<Unit> getRandomUnits(List<Unit> unitPool, int count) {
    Random random = Random();
    // Shuffle the list to randomize and then take the first `count` elements
    List<Unit> shuffledUnits = List<Unit>.from(unitPool)..shuffle(random);
    return shuffledUnits.take(count).toList();
  }

  Future<Unit?> showCardsDialog(BuildContext context, List<Unit> units) async {
    return showDialog<Unit>(
      context: context,
      barrierDismissible: true, // 다이얼로그 바깥을 터치하면 닫힘
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 200,
            width: 800,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var unit in units)
                    UnitCard(
                      unit: unit,
                      onTap: () {
                        Navigator.of(context).pop(unit); // 선택된 유닛을 반환하고 다이얼로그 닫기
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



}
