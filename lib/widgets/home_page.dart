import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartq_assignment/bloc/change_color_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChangeColorBloc _changeColorBloc;

  @override
  void didChangeDependencies() {
    _changeColorBloc = BlocProvider.of<ChangeColorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            'SmartQ Assignment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            _buildFirstScreen(),
            BlocBuilder<ChangeColorBloc, ChangeColorState>(
              builder: (context, state) {
                if (state is ChangeColorInitial) {
                  return _buildSecondScreen();
                } else if (state is ShowUpdatedColor) {
                  return _buildSecondScreen(screenColor: state.color);
                } else {
                  return const Center(
                    child: Text('Welcome to Home Screen'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstScreen() {
    return Expanded(
      flex: 1,
      child: Card(
        elevation: 10,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 25,
          itemBuilder: (context, index) {
            Color itemColor = index % 2 == 0 ? Colors.red : Colors.green;
            return _buildItem(itemColor, index);
          },
        ),
      ),
    );
  }

  Widget _buildItem(Color itemColor, int index) {
    return InkWell(
      onTap: () {
        _changeColorBloc.add(UpdateNewColor(color: itemColor));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: itemColor),
        height: 50,
        child: Center(
          child: Text(
            '${index + 1}',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondScreen({Color screenColor = Colors.white}) {
    return Expanded(
      flex: 1,
      child: Card(
          elevation: 10,
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: screenColor))),
    );
  }
}
