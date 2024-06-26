import 'dart:io';

import 'package:copter_game/game/assets.dart';
import 'package:copter_game/game/copter_game.dart';
import 'package:copter_game/game/handle_custom.dart';
import 'package:flutter/material.dart';

String? selectedCharacterPath = "";

class ChooseCharacterScreen extends StatefulWidget {
  final CopterGame game;
  static const String id = 'chooseCharacter';

  const ChooseCharacterScreen({super.key, required this.game});

  @override
  State<ChooseCharacterScreen> createState() => _ChooseCharacterScreenState();
}

class _ChooseCharacterScreenState extends State<ChooseCharacterScreen> {
  static String? _selectedOption = 'bird';

  @override
  Widget build(BuildContext context) {
  widget.game.pauseEngine();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.menu),
                    fit: BoxFit.cover
                )
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 16),
              child: SizedBox(
                width: 270,
                height: 500,
                child: ListView(
                  children: [
                    RadioListTile<String>(
                      activeColor: Colors.white,
                      title: Text('Bird', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Game'), ),
                      value: 'bird',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                      secondary: Image.asset(Assets.bird, width: 80, height: 80,),
                    ),

                    SizedBox(height: 20,),

                    RadioListTile<String>(
                      activeColor: Colors.white,
                      title: Text('Modi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Game')),
                      value: 'modi',
                      groupValue: _selectedOption,
                      onChanged: (value){
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                      secondary: Image.asset(Assets.modi, width: 80, height: 80,),
                    ),

                    SizedBox(height: 20,),

                    RadioListTile<String>(
                      activeColor: Colors.white,
                      title: Text('Pappu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Game')),
                      value: 'pappu',
                      groupValue: _selectedOption,
                      onChanged: (value){
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                      secondary: Image.asset(Assets.pappu, width: 80, height: 80,),
                    ),

                    SizedBox(height: 20,),

                    RadioListTile<String>(
                      activeColor: Colors.white,
                      title: Text('Pickachu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Game')),
                      value: 'pickachu',
                      groupValue: _selectedOption,
                      onChanged: (value) async {
                        //selectedCharacterPath = await HandleCustom().chooseGalleryImage();
                        print(selectedCharacterPath);
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                      secondary: Image.asset(Assets.pickachu, width: 80, height: 80,),
                    ),
                    
                    SizedBox(height: 20,),
                    
                    RadioListTile<String> (
                      activeColor: Colors.white,
                      title: Text('Shinchan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Game')),
                      value: 'shinchan',
                      groupValue: _selectedOption,
                      onChanged: (value){
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                      secondary: Image.asset(Assets.shinchan, width: 80, height: 80,),
                    ),


                    SizedBox(height: 40,),

                    ElevatedButton(onPressed: (){

                      widget.game.bird.updateCharacter(_selectedOption);
                      widget.game.overlays.add('mainMenu');
                      widget.game.overlays.remove('chooseCharacter');

                    }, style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        child: Text('Next', style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Game' ),))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
