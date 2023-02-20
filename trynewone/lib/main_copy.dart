import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//check this: https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0
void main() {
  runApp(MyApp());
}

//Info about our app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'First Page',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          /**
           * Tip: Flutter's Colors class gives you a convenient access to a palette of hand-picked colors, such as Colors.deepOrange or Colors.red. But you can, of course, choose any color. To define pure green with full opacity, for example, use Color.fromRGBO(0, 255, 0, 1.0). If you're a fan of hexadecimal numbers, there's always Color(0xFF00FF00).

          Notice how the color animates smoothly. This is called an implicit animation. Many Flutter widgets will smoothly interpolate between values so that the UI doesn't just "jump" between states.

          The elevated button below the card also changes color. That's the power of using an app-wide Theme as opposed to hard-coding values.
           */
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
  /*
  the MyAppState class defines the app's...well...state. This is your first foray into Flutter, so this codelab will keep it simple and focused. There are many powerful ways to manage app state in Flutter. One of the easiest to explain is ChangeNotifier, the approach taken by this app.

MyAppState defines the data the app needs to function. Right now, it only contains a single variable with the current random word pair. You will add to this later.
The state class extends ChangeNotifier, which means that it can notify others about its own changes. For example, if the current word pair changes, some widgets in the app need to know.
The state is created and provided to the whole app using a ChangeNotifierProvider (see code above in MyApp). This allows any widget in the app to get hold of the state.
   */
}
/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pairCurrent = appState.current;

    //Change Like icon
    IconData icon;
    if (appState.favorites.contains(pairCurrent)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Scaffold(
      //body: Column(
      body: Center(
        //wrap with center
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, //Allign item center(horizontal) but still need to center all the column not just the text
          children: [
            // Text('A random idea:'),
            //Text(pairCurrent.asLowerCase),//Write Click and choose Refactor , and choose Extract widget and name it
            /**
             * Extract a widget
                The line responsible for showing the current word pair looks like this now: Text(appState.current.asLowerCase). To change it into something more complex, it's a good idea to extract this line into a separate widget. Having separate widgets for separate logical parts of your UI is an important way of managing complexity in Flutter.
      
                Flutter provides a refactoring helper for extracting widgets but before you use it, make sure that the line being extracted only accesses what it needs. Right now, the line accesses appState, but really only needs to know what the current word pair is.
      
      
             */
            BigCard(pair: pairCurrent),
            SizedBox(height: 10),
            /**
             * You can also add a SizedBox(height: 10) widget between BigCard and ElevatedButton. This way, there's a bit more separation between the two widgets. The SizedBox widget just takes space and doesn't render anything by itself. It's commonly used to create visual "gaps".

             */
            // ElevatedButton
            /* ElevatedButton(
              onPressed: () {
                //print('button pressed!');
                appState.getNext(); // ← This instead of print().
                /**
                 * What Happened?
                 * take the value of current and write it in Home Page
                 * When we press the button change the value of current
                 */
              },
              child: Text('Next'),
            ),*/
            /**
             * With the "business logic" out of the way, it's time to work on the user interface again. Placing the ‘Like' button to the left of the ‘Next' button requires a Row. The Row widget is the horizontal equivalent of Column, which you saw earlier.

              First, wrap the existing button in a Row. Go to MyHomePage's build() method, put your cursor on the ElevatedButton, call up the Refactor menu with Ctrl+. or Cmd+., and select Wrap with Row.
             */

            Row(
              /**
               * When you save, you'll notice that Row acts similarly to Column—by default, it lumps its children to the left. (Column lumped its children to the top.) To fix this, you could use the same approach as before, but with mainAxisAlignment. However, for didactic (learning) purposes, use mainAxisSize. This tells Row not to take all available horizontal space.
               */
              mainAxisSize: MainAxisSize
                  .min, //use mainAxisSize. This tells Row not to take all available horizontal space.
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    //print('button pressed!');
                    appState.getNext(); // ← This instead of print().
                    /**
                     * What Happened?
                     * take the value of current and write it in Home Page
                     * When we press the button change the value of current
                     */
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  /**
   * Lastly, there's MyHomePage, the widget you've already modified. Each numbered line below maps to a line-number comment in the code above:

    Every widget defines a build() method that's automatically called every time the widget's circumstances change so that the widget is always up to date.
    MyHomePage tracks changes to the app's current state using the watch method.
    Every build method must return a widget or (more typically) a nested tree of widgets. In this case, the top-level widget is Scaffold. You aren't going to work with Scaffold in this codelab, but it's a helpful widget and is found in the vast majority of real-world Flutter apps.
    Column is one of the most basic layout widgets in Flutter. It takes any number of children and puts them in a column from top to bottom. By default, the column visually places its children at the top. You'll soon change this so that the column is centered.
    You changed this Text widget in the first step.
    This second Text widget takes appState, and accesses the only member of that class, current (which is a WordPair). WordPair provides several helpful getters, such as asPascalCase or asSnakeCase. Here, we use asLowerCase but you can change this now if you prefer one of the alternatives.
    Notice how Flutter code makes heavy use of trailing commas. This particular comma doesn't need to be here, because children is the last (and also only) member of this particular Column parameter list. Yet it is generally a good idea to use trailing commas: they make adding more members trivial, and they also serve as a hint for Dart's auto-formatter to put a newline there. For more information, see Code formatting.

   */
}
*/

//To get to the meat of this step as soon as possible, split MyHomePage into 2 separate widgets.

/*
 
 First, notice that the entire contents of MyHomePage is extracted into a new widget, GeneratorPage. The only part of the old MyHomePage widget that didn't get extracted is Scaffold.
The new MyHomePage contains a Row with two children. 

The first widget is SafeArea, and the second is an Expanded widget.


 */

/*
 * 
 * Stateless versus stateful widgets
Stateless : get data from MyState class
stateful: get data from the widget itself


Place your cursor on the first line of MyHomePage (the one that starts with class MyHomePage...), and call up the Refactor menu using Ctrl+. or Cmd+.. Then, select Convert to StatefulWidget.


 */
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//The underscore (_) at the start of _MyHomePageState makes that class private and is enforced by the compiler. If you want to know more about privacy in Dart, and other topics, read the Language Tour.
//https://dart.dev/guides/language/language-tour#libraries-and-visibility

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavouritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
      /*
         If you ever add a new destination to the navigation rail and forget to update this code, the program crashes in development (as opposed to letting you guess why things don't work, or letting you publish a buggy code into production).

         */
    }

    /*
    Flutter provides several widgets that help you make your apps automatically responsive. For example, Wrap is a widget similar to Row or Column that automatically wraps children to the next "line" (called "run") when there isn't enough vertical or horizontal space. There's FittedBox, a widget that automatically fits its child into available space according to your specifications.

    But NavigationRail doesn't automatically show labels when there's enough space because it can't know what is enough space in every context. It's up to you, the developer, to make that call.

    Say you decide to show labels only if MyHomePage is at least 600 pixels wide.

    Note: Flutter works with logical pixels as a unit of length. They are also sometimes called device-independent pixels. A padding of 8 pixels is visually the same regardless of whether the app is running on an old low-res phone or a newer ‘retina' device. There are roughly 38 logical pixels per centimeter, or about 96 logical pixels per inch, of the physical display.

    The widget to use, in this case, is LayoutBuilder. It lets you change your widget tree depending on how much available space you have.

    Once again, use Flutter's Refactor menu in VS Code to make the required changes. This time, though, it's a little more complicated:

    Inside _MyHomePageState's build method, put your cursor on Scaffold.
    Call up the Refactor menu with Ctrl+. (Windows/Linux) or Cmd+. (Mac).
    Select Wrap with Builder and press Enter.
    Modify the name of the newly added Builder to LayoutBuilder.
    Modify the callback parameter list from (context) to (context, constraints).

     */

    // return Scaffold(
    return LayoutBuilder(builder: (context, constraints) {
      /*
        LayoutBuilder's builder callback is called every time the constraints change. This happens when, for example:

        The user resizes the app's window
        The user rotates their phone from portrait mode to landscape mode, or back
        Some widget next to MyHomePage grows in size, making MyHomePage's constraints smaller
        And so on */
      return Scaffold(
        body: Row(
          children: [
            //The SafeArea ensures that its child is not obscured by a hardware notch or a status bar. In this app, the widget wraps around NavigationRail to prevent the navigation buttons from being obscured by a mobile status bar, for example.

            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >=
                    600, //Use it with return LayoutBuilder()
                //Now, your app responds to its environment, such as screen size, orientation, and platform! In other words, it's responsive!.

                //extended:true, //Use it with return Scaffold()
                ////You can change the extended: false line in NavigationRail to true. This shows the labels next to the icons. In a future step, you will learn how to do this automatically when the app has enough horizontal space.

                //The navigation rail has two destinations (Home and Favorites), with their respective icons and labels. It also defines the current selectedIndex. A selected index of zero selects the first destination, a selected index of one selects the second destination, and so on. For now, it's hard coded to zero.
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                //The navigation rail also defines what happens when the user selects one of the destinations with onDestinationSelected. Right now, the app merely outputs the requested index value with print().
                onDestinationSelected: (value) {
                  /*
                   When the onDestinationSelected callback is called, instead of merely printing the new value to console, you assign it to selectedIndex inside a setState() call. This call is similar to the notifyListeners() method used previously—it makes sure that the UI updates.
                    */
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),

            /**
               * The second child of the Row is the Expanded widget. Expanded widgets are extremely useful in rows and columns—they let you express layouts where some children take only as much space as they need (NavigationRail, in this case) and other widgets should take as much of the remaining room as possible (Expanded, in this case). One way to think about Expanded widgets is that they are "greedy". If you want to get a better feel of the role of this widget, try wrapping the NavigationRail widget with another Expanded.
               */
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    IconData icon;
    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorites.length} favorites:'),
        ),
        for (var pair in favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
/*

call up the Refactor menu. In VS Code, you do this in one of two ways:

Right click the piece of code you want to refactor (Text in this case) and select Refactor... from the drop-down menu,
OR

Move your cursor to the piece code you want to refactor (Text, in this case), and press Ctrl+. (Win/Linux) or Cmd+. (Mac).


In the Refactor menu, select Extract Widget. Assign a name, such as BigCard, and click Enter.

This automatically creates a new class, BigCard, at the end of the current file. The class looks something like the following:
*/

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    /*return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(pair.asLowerCase),
    );
    Place your cursor on the Padding widget, pull up the Refactor menu, and select Wrap with widget....

This allows you to specify the parent widget. Type "Card" and press Enter.
    */
    /**
     * To make the card stand out more, paint it with a richer color. And because it's always a good idea to keep a consistent color scheme, use the app's Theme to choose the color.


     */
    var theme = Theme.of(context); // ← Add this.
    var myStyle = theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        //color: theme.colorScheme.onSecondary,
        //color: theme.colorScheme.onSurface,
        fontFamily: "Aria");
    return Card(
      color: theme.colorScheme.primary,
      //color: theme.colorScheme.surface,
      //color: theme.colorScheme.secondary,
      elevation: 20, //increasing shadow
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: myStyle,
          semanticsLabel: pair.asPascalCase, //for screen reader
          /**
           * Sometimes, though, some work is required. In the case of this app, the screen reader might have problems pronouncing some generated word pairs. While humans don't have problems identifying the two words in cheaphead, a screen reader might pronounce the ph in the middle of the word as f.

            A simple solution is to replace pair.asLowerCase with pair.asPascalCase. Pascal case (also known as "upper camel case"), means that each word in the string, including the first one, begins with an uppercase letter. So, "uppercamelcase" becomes "UpperCamelCase". Using upper camel case helps screen readers identify the individual words in the compound word and provides a better experience to visually impaired users.

            However, you might want to keep the visual simplicity of pair.asLowerCase. Use Text's semanticsLabel property to override the visual content of the text widget with a semantic content that is more appropriate for screen readers:


           */
        ),
      ),
    );
    // return Text(pair.asLowerCase);
    /*
   Add a Card
Now it's time to make this new widget into the bold piece of UI we envisioned at the beginning of this section.

Find the BigCard class and the build() method within it. As before, call up the Refactor menu on the Text widget. However, this time you aren't going to extract the widget.

Instead, select Wrap with Padding. This creates a new parent widget around the Text widget called Padding. After saving, you'll see that the random word already has more breathing room.
   */
  }
}
