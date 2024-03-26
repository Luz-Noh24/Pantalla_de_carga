import 'package:flutter/material.dart';
import 'package:pantalla_animada/data_backup_animation/data_backup_home.dart';

const _duration = Duration(milliseconds: 500);

enum DataBackupState {
  initial,
  start,
  end,
}

class DataBackupInitialPage extends StatefulWidget 
{
  final VoidCallback onAnimtionStarted;
  const DataBackupInitialPage({Key? key,required this.onAnimtionStarted}): super(key: key);
  @override
  _DataBackupInitialPageState createState() => _DataBackupInitialPageState();
}

class _DataBackupInitialPageState extends State<DataBackupInitialPage> {
  DataBackupState _currentState = DataBackupState.initial;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Cloud Storage',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            if(_currentState == DataBackupState.end )
            Expanded
            (
              flex: 2,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: _duration,
                builder: (context, value, child) {
                  return Opacity
                  (opacity: value, child: child,);
                },
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: 
                  [
                    Text('uploading file',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w300,),),
                    const SizedBox(height: 10),
                    Expanded
                    (child: FittedBox
                    (child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ProgressCounter(),
                    ),) )
                  ]
                ),
              ),
              if(_currentState != DataBackupState.end )
            Expanded(
              flex: 2,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 1.0, end: _currentState != DataBackupState.initial? 0.0 : 1.0),
                duration: _duration,
                onEnd: () {
                  setState(() {
                    _currentState = DataBackupState.end;
                  });
                },
                builder: (_,value, child)
                {
                  return Opacity
                  (opacity: value, Transform.translate
                  (
                    offset: Offset(0.0, -50 * value),
                    child: child
                  ),);
                },
                child: Column(
                  children: [
                    Text('last backup:'),
                    const SizedBox(height: 5),
                    Text(
                      '26 marzo 2024',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedSwitcher(
                  duration: _duration,
                  child: _currentState == DataBackupState.initial
                      ? SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            color: mainDataBackupColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Create Backup',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _currentState = DataBackupState.start;
                              });
                              widget.onAnimtionStarted();
                            },
                          ))
                      : OutlinedButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 40),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: mainDataBackupColor),
                            ),
                          ),
                          onPressed: () {},
                        )),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class ProgressCounter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}