//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final cardSelectedProvider = StateProvider<int>((ref) {
  return 0;
});

final cardSlotProvider = StateProvider<int>((ref) {
  return 0;
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Odds Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 4, 31, 185)),
        useMaterial3: true,
      ),
      home: const Center(child: CalculationPage()),
    );
  }
}

int cardSelectedForOne = 0;
int cardSelectedForTwo = 0;
int cardSelectedForThree = 0;
int cardSelectedForFour = 0;
int cardSelectedForFive = 0;
int cardSelectedForSix = 0;
int cardSelectedForSeven = 0;

class CalculationPage extends ConsumerStatefulWidget {
  const CalculationPage({super.key});

  @override
  ConsumerState<CalculationPage> createState() => _CalculationPage();
}

class _CalculationPage extends ConsumerState<CalculationPage> {
  List<String> brainArray = [
    "...",
    "...",
    "...",
    "...",
    "...",
    "...",
    "...",
    "...",
    "...",
    "..."
  ];

  bool needButton = true;

  @override
  Widget build(BuildContext context) {
    if (ref.watch(cardSlotProvider) == 1) {
      cardSelectedForOne = ref.watch(cardSelectedProvider);
    }
    if (ref.watch(cardSlotProvider) == 2) {
      cardSelectedForTwo = ref.watch(cardSelectedProvider);
    }
    if (ref.watch(cardSlotProvider) == 3) {
      cardSelectedForThree = ref.watch(cardSelectedProvider);
    }
    if (ref.watch(cardSlotProvider) == 4) {
      cardSelectedForFour = ref.watch(cardSelectedProvider);
    }
    if (ref.watch(cardSlotProvider) == 5) {
      cardSelectedForFive = ref.watch(cardSelectedProvider);
    }
    if (ref.watch(cardSlotProvider) == 6) {
      cardSelectedForSix = ref.watch(cardSelectedProvider);
    }
    if (ref.watch(cardSlotProvider) == 7) {
      cardSelectedForSeven = ref.watch(cardSelectedProvider);
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    color: const Color.fromARGB(255, 242, 211, 243),
                    margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
                    height: 350,
                    width: 330,
                    child: Text(
                        "     Royal Flush           Straight \n     ${brainArray[0]}                     ${brainArray[5]}\n     Straight Flush       Trips \n     ${brainArray[1]}                     ${brainArray[6]}\n     Quads                    Two Pair \n     ${brainArray[2]}                     ${brainArray[7]}\n     Full House             Pair \n     ${brainArray[3]}                     ${brainArray[8]}\n     Flush                      High Card \n     ${brainArray[4]}                     ${brainArray[9]}\n",
                        textScaler: const TextScaler.linear(1.5),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ))),
                Positioned(
                  left: 115,
                  top: 333,
                  child: Visibility(
                    visible: needButton,
                    child: InkWell(
                        onTap: (() {
                          setState(() {
                            brainArray = brain();
                            //needButton = false;
                          });
                        }),
                        child: Container(
                          width: 100.0,
                          height: 30.0,
                          margin: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 1.0),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(10, 5)),
                            color: const Color.fromARGB(255, 255, 154, 238),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text('Recalculate',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )),
                          ),
                        )),
                  ),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 365.0,
                      height: 190.0,
                      margin:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 85, 46, 1),
                            width: 10.0),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(100, 50)),
                        color: const Color.fromARGB(255, 17, 97, 20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  'lib/icons/$cardSelectedForOne.png',
                                  scale: 8,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectCardPage()));
                                ref
                                    .read(cardSlotProvider.notifier)
                                    .update((state) => 1);
                                setState(() {
                                  brainArray = [
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "..."
                                  ];
                                  needButton = true;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  'lib/icons/$cardSelectedForTwo.png',
                                  scale: 8,
                                ),
                              ),
                              onTap: () {
                                ref
                                    .read(cardSlotProvider.notifier)
                                    .update((state) => 2);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectCardPage()));
                                setState(() {
                                  brainArray = [
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "..."
                                  ];
                                  needButton = true;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  'lib/icons/$cardSelectedForThree.png',
                                  scale: 8,
                                ),
                              ),
                              onTap: () {
                                ref
                                    .read(cardSlotProvider.notifier)
                                    .update((state) => 3);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectCardPage()));
                                setState(() {
                                  brainArray = [
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "..."
                                  ];
                                  needButton = true;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  'lib/icons/$cardSelectedForFour.png',
                                  scale: 8,
                                ),
                              ),
                              onTap: () {
                                ref
                                    .read(cardSlotProvider.notifier)
                                    .update((state) => 4);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectCardPage()));
                                setState(() {
                                  brainArray = [
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "..."
                                  ];
                                  needButton = true;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  'lib/icons/$cardSelectedForFive.png',
                                  scale: 8,
                                ),
                              ),
                              onTap: () {
                                ref
                                    .read(cardSlotProvider.notifier)
                                    .update((state) => 5);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectCardPage()));
                                setState(() {
                                  brainArray = [
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "...",
                                    "..."
                                  ];
                                  needButton = true;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Image.asset(
                      'lib/icons/$cardSelectedForSix.png',
                      scale: 4,
                    ),
                    onTap: () {
                      ref.read(cardSlotProvider.notifier).update((state) => 6);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectCardPage()));
                      setState(() {
                        brainArray = [
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "..."
                        ];
                        needButton = true;
                      });
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: Image.asset(
                        'lib/icons/$cardSelectedForSeven.png',
                        scale: 4,
                      ),
                    ),
                    onTap: () {
                      ref.read(cardSlotProvider.notifier).update((state) => 7);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectCardPage()));
                      setState(() {
                        brainArray = [
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "...",
                          "..."
                        ];
                        needButton = true;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

var brainedArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var cardsArray = [0, 0, 0, 0, 0, 0, 0];

List<String> brain() {
  cardsArray[0] = cardSelectedForOne;
  cardsArray[1] = cardSelectedForTwo;
  cardsArray[2] = cardSelectedForThree;
  cardsArray[3] = cardSelectedForFour;
  cardsArray[4] = cardSelectedForFive;
  cardsArray[5] = cardSelectedForSix;
  cardsArray[6] = cardSelectedForSeven;

  int howManyBoard = 0;
  if (cardSelectedForOne != 0) {
    howManyBoard++;
  }
  if (cardSelectedForTwo != 0) {
    howManyBoard++;
  }
  if (cardSelectedForThree != 0) {
    howManyBoard++;
  }
  if (cardSelectedForFour != 0) {
    howManyBoard++;
  }
  if (cardSelectedForFive != 0) {
    howManyBoard++;
  }
  if ((cardSelectedForSix != 0 && cardSelectedForSeven != 0) &&
      ((howManyBoard == 3 &&
              cardSelectedForFour == 0 &&
              cardSelectedForFive == 0) ||
          (howManyBoard == 4 && cardSelectedForFive == 0) ||
          (howManyBoard == 5) ||
          (howManyBoard == 0))) {
    if (howManyBoard == 5) {
      brainedArray = fiveCardCalculation(cardsArray);
    }
    if (howManyBoard == 4) {
      brainedArray = fourCardCalculation(cardsArray);
    }
    if (howManyBoard == 3) {
      brainedArray = threeCardCalculation(cardsArray);
    }
    if (howManyBoard == 0) {
      //you were asking for it pal
      brainedArray = zeroSpeedCardCalculation(cardsArray);
    }
  } else {
    return [
      "...",
      "...",
      "...",
      "...",
      "...",
      "...",
      "...",
      "...",
      "...",
      "..."
    ];
  }
  return makeIntoPercents(brainedArray);
}

List<int> zeroSpeedCardCalculation(List<int> cardsArray) {
  var twoCardArray = [0, 0];
  twoCardArray[0] = cardsArray[5];
  twoCardArray[1] = cardsArray[6];
  int suitOne = 0;
  int suitTwo = 0;
  if (twoCardArray[0] < 14) {
    suitOne = 1;
  } else if (twoCardArray[0] < 27) {
    suitOne = 2;
  } else if (twoCardArray[0] < 40) {
    suitOne = 3;
  } else {
    suitOne = 4;
  }

  if (twoCardArray[1] < 14) {
    suitTwo = 1;
  } else if (twoCardArray[1] < 27) {
    suitTwo = 2;
  } else if (twoCardArray[1] < 40) {
    suitTwo = 3;
  } else {
    suitTwo = 4;
  }

  var twoCards = [0, 0];

  for (int i = 0; i < 2; i++) {
    twoCards[i] = twoCardArray[i] % 13;
    if (twoCards[i] == 0) {
      twoCards[i] = 13;
    }
  }

  if ((suitOne == suitTwo) || (twoCards[0] == twoCards[1])) {
    return [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  } else {
    return firstPillar(twoCards);
  }
}

List<int> firstPillar(List<int> twoCards) {
  var returnArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  bool aceTenOrFace1 = false;
  bool aceTenOrFace2 = false;
  int totalRF = 0;
  for (int i = 0; i < 2; i++) {
    if ((twoCards[i] == 1) || (twoCards[i] >= 10)) {
      if (i == 0) {
        aceTenOrFace1 = true;
      } else {
        aceTenOrFace2 = true;
      }
    }
  }
  if (!aceTenOrFace1 && !aceTenOrFace2) {
    totalRF = 4;
  } else if (aceTenOrFace1 != aceTenOrFace2) {
    totalRF = 3 + C(46, 1);
  } else {
    totalRF = 2 + 2 * C(46, 1);
  }
  returnArray[0] = totalRF;
  //Royal Flush

  int totalSF = 0;
  for (int k = 0; k <= 1; k++) {
    for (int i = 1; i <= 9; i++) {
      for (int j = 0; j <= 4; j++) {
        if (twoCards[k] == i + j) {
          totalSF += C(4, 4) * C(45, 1);
        } else {
          totalSF += C(5, 5);
        }
      }
    }
  }
  totalSF = totalSF + 9 * 2;
  returnArray[1] = totalSF;
  //Straight Flush

  int totalFoK = 0;
  totalFoK += 2 * C(3, 3) * C(47, 2); //case 1,2
  totalFoK += C(11, 1) * C(4, 4) * C(46, 1); //case 3
  returnArray[2] = totalFoK;
  //FoK

  int totalFH = 0;
  totalFH += 2 * C(3, 2) * C(3, 1) * C(47, 2); // case 1,2
  totalFH += 2 * C(3, 2) * C(11, 1) * C(4, 2) * C(46, 1); // case 3,4
  totalFH += 2 * C(3, 1) * C(11, 1) * C(4, 3) * C(46, 1); // case 5,6
  totalFH += C(11, 2) * C(4, 3) * C(4, 2) * 2; // case 7
  //cases
  totalFH -= C(3, 2) * C(3, 2) * C(46, 1); //case 1->2
  totalFH -= 2 * C(3, 2) * C(3, 1) * C(11, 1) * C(4, 2); //case 1->3,2->4
  totalFH -= 2 * C(3, 2) * C(11, 1) * C(4, 3); //case 3->5,4->6
  totalFH -= C(3, 1) * C(11, 1) * C(4, 3) * C(3, 1); //case 5->6
  //intra-double-counting
  totalFH -= 2 * C(3, 3) * C(3, 1) * C(46, 1); //dc case 1,2
  totalFH -= 2 * C(3, 3) * C(11, 1) * C(4, 2); //dc case 3,4
  totalFH -= 2 * C(3, 1) * C(11, 1) * C(4, 4); //dc case 5,6
  //inter-double counting
  returnArray[3] = totalFH;
  //FH

  int totalF = 0;
  totalF += 2 * C(13, 5); //case 1,2
  totalF += 2 * C(12, 4) * C(46, 1); //case 3,4
  //cases
  totalF = totalF - (totalRF + totalSF);
  //inter-double counting
  returnArray[4] = totalF;
  //Flush

  int totalS = 0;
  for (int i = 1; i <= 10; i++) {
    int counter = 0;
    if (i != 9) {
      if (twoCards[0] == i + 5 || twoCards[1] == i + 5) {
      } else {
        for (int j = 0; j <= 4; j++) {
          if (twoCards[0] == i + j || twoCards[1] == i + j) {
            counter++;
          }
        }
      }
    } else {
      if (twoCards[0] == 1 || twoCards[1] == 1) {
      } else {
        for (int j = 0; j <= 4; j++) {
          if (twoCards[0] == i + j || twoCards[1] == i + j) {
            counter++;
          }
        }
      }
    }
    if (i != 10) {
      if (counter == 0) {
        totalS += C(5, 5) * (pow(4, 5) as int);
      } else if (counter == 1) {
        totalS += C(4, 4) * (pow(4, 4) as int) * C(42, 1);
      } else {
        totalS += C(3, 3) * (pow(4, 3) as int) * C(43, 2);
      }
    } else {
      if (counter == 0) {
        totalS += C(5, 5) * (pow(4, 5) as int);
      } else if (counter == 1) {
        totalS += C(4, 4) * (pow(4, 4) as int) * C(46, 1);
      } else {
        totalS += C(3, 3) * (pow(4, 3) as int) * C(47, 2);
      }
    }
  }
  //cases
  totalS = totalS - (totalRF + totalSF);
  //inter-double-counting
  returnArray[5] = totalS;
  //Straight

  int totalToK = 0;
  totalToK += 2 * C(3, 2) * C(48, 3); //case 1,2
  totalToK += C(11, 1) * C(4, 3) * C(47, 2); //case 3
  //cases
  totalToK -= C(3, 2) * C(3, 2) * C(46, 1); //case 1->2
  totalToK -= 2 * C(3, 2) * C(11, 1) * C(4, 3); //case 1->3,2->3
  //intra-double-counting
  totalToK = totalToK - (totalFoK + totalFH);
  totalToK -= 2 * C(1, 1) * C(2, 1) * C(11, 3); //case 1,2 flush
  for (int i = 1; i <= 10; i++) {
    int counter = 0;
    for (int j = 0; j <= 4; j++) {
      if (twoCards[0] == i + j || twoCards[1] == i + j) {
        counter++;
      }
    }
    if (counter == 2) {
      totalToK -=
          2 * C(3, 2) * C(3, 3) * (pow(4, 3) as int); //case 1,2 straight
      totalToK -=
          C(11, 1) * C(4, 3) * C(2, 2) * (pow(4, 2) as int); //case 3 straight
      totalToK += 2 *
          C(1, 1) *
          C(2, 1) *
          C(3, 3) *
          C(2, 1); //case 1,2 reverse dc for SF
    }
  }
  //inter-double-counting
  returnArray[6] = totalToK;
  //ToK

  int totalTP = 0;
  totalTP += C(3,1)*C(3,1)*C(48,3); //case 1
  totalTP += 2*C(3,1)*C(4,2)*C(47,2)*C(11,1); //case 2,3
  totalTP += C(4,2)*C(4,2)*C(46,1)*C(11,2); //case 4
  //cases
  totalTP -= 2*C(3,1)*C(3,1)*C(4,2)*C(46,1)*C(11,1); //case 1->2,1->3
  totalTP -= C(3,1)*C(4,2)*C(11,1)*C(3,1)*C(46,1); //case 2->3
  totalTP -= 2*C(3,1)*C(4,2)*C(4,2)*C(11,2); //case 2->4,3->4
  //intra-double-counting
  totalTP -= totalFH;
  totalTP -= 2*C(3,3)*C(3,1)*C(46,1); //dc FoK 
  totalTP -= 2*C(3,1)*C(4,4)*C(11,1); //dc FoK
  totalTP -= 2*C(1,1)*C(3,1)*C(11,3); //dc F
  totalTP -= 2*C(1,1)*C(1,1)*C(3,1)*C(11,2); //dc F
  totalTP -= C(1,1)*C(1,1)*C(11,3)*2; //dc F
  for (int i = 1; i <= 10; i++) {
    int counter = 0;
    for (int j = 0; j <= 4; j++) {
      if (twoCards[0] == i + j || twoCards[1] == i + j) {
        counter++;
      }
    }
    if (counter == 2) {
      totalTP -=
          C(3, 3) * (pow(4, 3) as int)* C(5,2) *C(3,1) *C(3,1) *C(2,2); //dc straight
      totalTP += 2*C(1,1)*C(3,1)*C(3,3); //reverse dc for SF
      totalTP += 2*C(1,1)*C(3,3)*C(3,1)*C(3,1); //reverse dc for SF
      totalTP += 2*C(1,1)*C(1,1)*C(3,3); //reverse dc for SF
    }
  }
  //inter-double-counting
  returnArray[7] = totalTP;
  //TP
  
  int totalP = 0;
  totalP += 2*C(3,1)*C(49,4); //case 1,2
  totalP += C(11,1)*C(4,2)*C(48,3); //case 3
  //cases
  totalP -= C(3,1)*C(3,1)*C(48,3); //case 1->2
  totalP -= 2*C(3,1)*C(11,1)*C(4,2)*C(47,2); //case 1->3,2->3
  //intra-double-counting
  totalP -= (totalFoK + totalFH + totalToK + totalTP);
  totalP -= C(1,1)*C(12,4)*2*2; //dc for F
  totalP -= C(11,1)*C(1,1)*C(3,1)*C(11,3)*2; //dc for F
  totalP -= C(1,1)*C(11,3)*C(44,1)*2; //dc for F
  totalP += 2*C(11,1)*C(3,1)*C(1,1)*C(10,2); //reverse dc for F
  totalP -= C(2,1)*C(12,4)*4; //dc for F
  for (int i = 1; i <= 10; i++) {
    int counter = 0;
    if (i != 9) {
      if (twoCards[0] == i + 5 || twoCards[1] == i + 5) {
      } else {
        for (int j = 0; j <= 4; j++) {
          if (twoCards[0] == i + j || twoCards[1] == i + j) {
            counter++;
          }
        }
      }
    } else {
      if (twoCards[0] == 1 || twoCards[1] == 1) {
      } else {
        for (int j = 0; j <= 4; j++) {
          if (twoCards[0] == i + j || twoCards[1] == i + j) {
            counter++;
          }
        }
      }
    }
    if (i != 10) {
      if (counter == 0) {

      } else if (counter == 1) {
        totalP -= C(4, 4) * (pow(4, 4) as int) * C(6,1)*C(3,1);
        totalP += C(4,4)*C(6,1)*C(3,1)+C(5,5)*3;
      } else {
        totalP -= C(3,3)*(pow(4, 3) as int)*(C(5,1)*C(3,1)+C(1,1)*(C(28,1)*C(3,1)+C(15,1)*C(2,1)));
        totalP += C(4,4)*C(45,1)*2+C(5,5)*2;
      }
    } else {
      if (counter == 0) {
        
      } else if (counter == 1) {
        totalP -= C(4, 4) * (pow(4, 4) as int) * C(6,1)*C(3,1);
        totalP += C(4,4)*C(6,1)*C(3,1)+C(5,5)*3;
      } else {
        totalP -= C(3,3)*(pow(4, 3) as int)*(C(5,1)*C(3,1)+C(1,1)*(C(32,1)*C(3,1)+C(15,1)*C(2,1)));
        totalP += C(4,4)*C(46,1)*2+C(5,5)*2;
      }
    }
  } //S dc and reverse dc for SF
  //inter-double-counting

  returnArray[8] = totalP;
  //P

  int totalLeft = C(50, 5);
  for (int i = 0; i <= 8; i++) {
    totalLeft -= returnArray[i];
  }
  returnArray[9] = totalLeft;
  //High Card

  return returnArray;
}

int C(int n, int r) {
  double returnValue = 0;
  if (r > n) {
    return 0;
  } else if (r == 0 || n == r) {
    return 1;
  }

  for (int i = 0; i < r; i++) {
    returnValue = returnValue + log(n - i) - log(i + 1);
  }
  return pow(e, returnValue).round();

  /*int nFac = 1;
  int kFac = 1;
  int nmkFac = 1;
  for (int i = 1; i <= n; i++) {
    nFac = nFac * i;
  }

  for (int i = 1; i <= k; i++) {
    kFac = kFac * i;
  }

  for (int i = 1; i <= (n - k); i++) {
    nmkFac = nmkFac * i;
  }
  int returnValue = ((nFac) /* (kFac * nmkFac)*/).round();
  return returnValue;
  numbers get too big
  */
}

List<String> makeIntoPercents(List<int> theValuesArray) {
  int total = 0;
  var returnArray = ["", "", "", "", "", "", "", "", "", ""];
  for (int i = 0; i < 10; i++) {
    total = total + theValuesArray[i];
  }
  for (int i = 0; i < 10; i++) {
    double temp = (theValuesArray[i] / total) * 100;
    returnArray[i] = "${temp.toStringAsPrecision(3)}%";
  }
  return returnArray;
}

List<int> zeroCardCalculation(List<int> thisZeroCardsArray) {
  var returnArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  for (int i = 1; i < 53; i++) {
    if (!(thisZeroCardsArray.contains(i))) {
      thisZeroCardsArray[0] = i;
      for (int j = 0; j < 10; j++) {
        returnArray[j] =
            returnArray[j] + (oneCardCalculation(thisZeroCardsArray))[j];
      }
      thisZeroCardsArray[0] = 0;
    }
  }
  return returnArray;
}

List<int> oneCardCalculation(List<int> thisOneCardsArray) {
  var returnArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  for (int i = 1; i < 53; i++) {
    if (!(thisOneCardsArray.contains(i))) {
      thisOneCardsArray[1] = i;
      for (int j = 0; j < 10; j++) {
        returnArray[j] =
            returnArray[j] + (twoCardCalculation(thisOneCardsArray))[j];
      }
      thisOneCardsArray[1] = 0;
    }
  }
  return returnArray;
}

List<int> twoCardCalculation(List<int> thisTwoCardsArray) {
  var returnArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  for (int i = 1; i < 53; i++) {
    if (!(thisTwoCardsArray.contains(i))) {
      thisTwoCardsArray[2] = i;
      for (int j = 0; j < 10; j++) {
        returnArray[j] =
            returnArray[j] + (threeCardCalculation(thisTwoCardsArray))[j];
      }
      thisTwoCardsArray[2] = 0;
    }
  }
  return returnArray;
}

List<int> threeCardCalculation(List<int> thisThreeCardsArray) {
  var returnArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  for (int i = 1; i < 53; i++) {
    if (!(thisThreeCardsArray.contains(i))) {
      thisThreeCardsArray[3] = i;
      for (int j = 0; j < 10; j++) {
        returnArray[j] =
            returnArray[j] + (fourCardCalculation(thisThreeCardsArray))[j];
      }
      thisThreeCardsArray[3] = 0;
    }
  }
  return returnArray;
}

List<int> fourCardCalculation(List<int> thisFourCardsArray) {
  var returnArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  for (int i = 1; i < 53; i++) {
    if (!(thisFourCardsArray.contains(i))) {
      thisFourCardsArray[4] = i;
      for (int j = 0; j < 10; j++) {
        returnArray[j] =
            returnArray[j] + (fiveCardCalculation(thisFourCardsArray))[j];
      }
      thisFourCardsArray[4] = 0;
    }
  }
  return returnArray;
}

List<int> fiveCardCalculation(List<int> thisFiveCardsArray) {
  for (int i = 0; i < 4; i++) {
    if (thisFiveCardsArray.contains(1 + 13 * i) &&
        thisFiveCardsArray.contains(10 + 13 * i) &&
        thisFiveCardsArray.contains(11 + 13 * i) &&
        thisFiveCardsArray.contains(12 + 13 * i) &&
        thisFiveCardsArray.contains(13 + 13 * i)) {
      return [1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }
  //Royal Flush

  for (int i = 1; i < 10; i++) {
    if (thisFiveCardsArray.contains(i) &&
        thisFiveCardsArray.contains(i + 1) &&
        thisFiveCardsArray.contains(i + 2) &&
        thisFiveCardsArray.contains(i + 3) &&
        thisFiveCardsArray.contains(i + 4)) {
      return [0, 1, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }
  for (int i = 14; i < 23; i++) {
    if (thisFiveCardsArray.contains(i) &&
        thisFiveCardsArray.contains(i + 1) &&
        thisFiveCardsArray.contains(i + 2) &&
        thisFiveCardsArray.contains(i + 3) &&
        thisFiveCardsArray.contains(i + 4)) {
      return [0, 1, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }
  for (int i = 27; i < 36; i++) {
    if (thisFiveCardsArray.contains(i) &&
        thisFiveCardsArray.contains(i + 1) &&
        thisFiveCardsArray.contains(i + 2) &&
        thisFiveCardsArray.contains(i + 3) &&
        thisFiveCardsArray.contains(i + 4)) {
      return [0, 1, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }
  for (int i = 40; i < 49; i++) {
    if (thisFiveCardsArray.contains(i) &&
        thisFiveCardsArray.contains(i + 1) &&
        thisFiveCardsArray.contains(i + 2) &&
        thisFiveCardsArray.contains(i + 3) &&
        thisFiveCardsArray.contains(i + 4)) {
      return [0, 1, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }
  //Straight Flush

  for (int i = 1; i < 14; i++) {
    if (thisFiveCardsArray.contains(i) &&
        thisFiveCardsArray.contains(i + 13) &&
        thisFiveCardsArray.contains(i + 26) &&
        thisFiveCardsArray.contains(i + 39)) {
      return [0, 0, 1, 0, 0, 0, 0, 0, 0, 0];
    }
  }
  //Quads

  bool tripsToo = false;
  for (int i = 1; i < 14; i++) {
    if ((thisFiveCardsArray.contains(i) &&
            thisFiveCardsArray.contains(i + 13) &&
            thisFiveCardsArray.contains(i + 26)) ||
        (thisFiveCardsArray.contains(i + 13) &&
            thisFiveCardsArray.contains(i + 26) &&
            thisFiveCardsArray.contains(i + 39)) ||
        (thisFiveCardsArray.contains(i + 26) &&
            thisFiveCardsArray.contains(i + 39) &&
            thisFiveCardsArray.contains(i)) ||
        (thisFiveCardsArray.contains(i + 39) &&
            thisFiveCardsArray.contains(i) &&
            thisFiveCardsArray.contains(i + 13))) {
      tripsToo = true;
      for (int j = 0; j < 14; j++) {
        if (((thisFiveCardsArray.contains(j) &&
                    thisFiveCardsArray.contains(j + 13)) ||
                (thisFiveCardsArray.contains(j) &&
                    thisFiveCardsArray.contains(j + 26)) ||
                (thisFiveCardsArray.contains(j) &&
                    thisFiveCardsArray.contains(j + 39)) ||
                (thisFiveCardsArray.contains(j + 13) &&
                    thisFiveCardsArray.contains(j + 26)) ||
                (thisFiveCardsArray.contains(j + 13) &&
                    thisFiveCardsArray.contains(j + 39)) ||
                (thisFiveCardsArray.contains(j + 26) &&
                    thisFiveCardsArray.contains(j + 39))) &&
            (i % 13 != j % 13)) {
          return [0, 0, 0, 1, 0, 0, 0, 0, 0, 0];
        }
      }
    }
  }
  //Full House

  int spadesCount = 0;
  int heartsCount = 0;
  int diamondsCount = 0;
  int clubsCount = 0;
  for (int i = 0; i < 7; i++) {
    if (thisFiveCardsArray[i] < 14) {
      spadesCount++;
    } else if (thisFiveCardsArray[i] < 27) {
      heartsCount++;
    } else if (thisFiveCardsArray[i] < 40) {
      diamondsCount++;
    } else {
      clubsCount++;
    }
  }
  if ((spadesCount > 4) ||
      (heartsCount > 4) ||
      (diamondsCount > 4) ||
      (clubsCount > 4)) {
    return [0, 0, 0, 0, 1, 0, 0, 0, 0, 0];
  }
  //Flush

  var suitlessArray = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  for (int i = 0; i < 7; i++) {
    suitlessArray[i] = thisFiveCardsArray[i] % 13;
    if (suitlessArray[i] == 0) {
      suitlessArray[i] = 13;
    }
    if (suitlessArray[i] == 1) {
      suitlessArray[7] = 14;
    }
  }
  for (int i = 1; i < 11; i++) {
    if (suitlessArray.contains(i) &&
        suitlessArray.contains(i + 1) &&
        suitlessArray.contains(i + 2) &&
        suitlessArray.contains(i + 3) &&
        suitlessArray.contains(i + 4)) {
      return [0, 0, 0, 0, 0, 1, 0, 0, 0, 0];
    }
  }
  //Straight

  if (tripsToo) {
    return [0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
  }
  //Trips

  int howManyPairs = 0;
  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 7; j++) {
      if ((suitlessArray[i] == suitlessArray[j]) && (i != j)) {
        howManyPairs++;
      }
    }
  }
  if ((howManyPairs == 4) || (howManyPairs == 6)) {
    return [0, 0, 0, 0, 0, 0, 0, 1, 0, 0];
  }
  //2 Pair

  if (howManyPairs == 2) {
    return [0, 0, 0, 0, 0, 0, 0, 0, 1, 0];
  }
  //Pair

  return [0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
  //High Card
}

class SelectCardPage extends ConsumerWidget {
  const SelectCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: Stack(children: [
      Container(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: <Widget>[
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/1.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 1);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/14.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 14);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/27.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 27);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/40.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 40);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/2.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 2);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/15.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 15);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/28.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 28);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/41.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 41);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/3.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 3);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/16.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 16);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/29.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 29);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/42.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 42);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/4.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 4);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/17.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 17);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/30.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 30);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/43.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 43);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/5.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 5);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/18.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 18);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/31.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 31);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/44.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 44);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/6.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 6);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/19.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 19);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/32.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 32);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/45.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 45);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/7.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 7);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/20.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 20);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/33.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 33);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/46.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 46);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/8.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 8);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/21.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 21);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/34.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 34);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/47.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 47);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/9.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 9);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/22.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 22);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/35.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 35);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/48.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 48);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/10.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 10);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/23.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 23);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/36.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 36);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/49.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 49);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/11.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 11);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/24.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 24);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/37.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 37);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/50.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 50);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/12.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 12);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/25.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 25);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/38.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 38);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/51.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 51);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/13.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 13);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/26.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 26);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/39.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 39);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/52.png'),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 52);
                        Navigator.pop(context);
                      }),
                  InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('lib/icons/0.png', scale: 8),
                      ),
                      onTap: () {
                        ref
                            .read(cardSelectedProvider.notifier)
                            .update((state) => 0);
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ],
        ),
      )
    ])));
  }
}
