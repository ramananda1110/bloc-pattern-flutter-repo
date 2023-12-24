import 'package:bloc_api_call/bloc/user_bloc.dart';
import 'package:bloc_api_call/bloc/user_event.dart';
import 'package:bloc_api_call/bloc/user_state.dart';
import 'package:bloc_api_call/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Bloc Pattern'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetAllUsersList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserError) {
          return Center(
            child: Text(state.message.toString()),
          );
        } else if (state is UserDataLoaded) {
          _view(context, state.userList);
        } else {
          return const SizedBox();
        }
        return Container();
      }),
    );
  }


  Widget _view(BuildContext context, List<UserModel> userList) {
    return ListView.builder(
      itemBuilder: (context, itemIndex) {
        UserModel userModel = userList[itemIndex];
        return ListTile(
          leading: Text(userModel.id.toString()),
          title: Text(userModel.name.toString()),
          subtitle: Text(userModel.email.toString()),
        );
      },
      itemCount: userList.length,
    );
  }
}
