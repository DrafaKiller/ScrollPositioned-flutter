# Example 1

<center>
	<img src="https://user-images.githubusercontent.com/42767829/172643871-f366b2a8-731a-4f1f-98cb-87eead37fe8a.gif" width=200>
</center>

<br>

```dart
final size = MediaQuery.of(context).size;

ListView(
	children: [
		SizedBox(
			height: 300,
			child: ScrollPositioned.expand(
				child: Center(child: const FlutterLogo(size: 150)),
			),
		),
		Container(
			height: size.height - 24 - 15 * 2,
			padding: EdgeInsets.only(top: 30),
			margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
			decoration: BoxDecoration(
				color: Color(0xff30B3EE),
				borderRadius: BorderRadius.circular(30),
			),
			child: Center(
				child: Opacity(
					opacity: 0.9,
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
						child: FlutterLogo(size: 100),
					),
				)
			),
		),
	],
)
```

# Example 2

<center>
	<img src="https://user-images.githubusercontent.com/42767829/172622987-8503d003-8c15-496a-b654-40c520441c15.gif" width=200>
</center>

<br>

```dart
final size = MediaQuery.of(context).size;

ListView(
  children: [
		Container(height: size.height * 0.25, color: Colors.cyan),
		SizedBox(
			height: size.height * 0.5,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: Center(child: const FlutterLogo(size: 200)),
			),
		),
		Container(height: size.height * 0.25, color: Colors.blue),
		Container(height: size.height * 0.25, color: Colors.green),
		SizedBox(
			height: size.height * 0.5,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
						child: const FlutterLogo(size: 200),
					)
				),
			),
		),
		Container(height: size.height * 0.25, color: Colors.green),
		Container(height: size.height * 0.25, color: Colors.red),
		SizedBox(
			height: size.height * 0.5,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
						child: const FlutterLogo(size: 200),
					)
				),
			),
		),
		Container(height: size.height * 0.25, color: Colors.red),
		Container(height: size.height * 0.25, color: Colors.cyan),
		SizedBox(
			height: size.height * 0.5,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: Center(child: const FlutterLogo(size: 200)),
			),
		),
		Container(height: size.height * 0.25, color: Colors.blue),
  ],
);
```

# Example 3

<center>
	<img src="https://user-images.githubusercontent.com/42767829/172634476-7bcdf257-bb36-4530-8912-8f0d4a9dbee3.gif" width=200>
</center>

<br>

```dart
final size = MediaQuery.of(context).size;ListView(
	children: [
		SizedBox(
			height: 200,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: Center(child: const FlutterLogo(size: 200)),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: ColorFiltered(
					colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
					child: Center(child: const FlutterLogo(size: 200)),
				),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: ColorFiltered(
					colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
					child: Center(child: const FlutterLogo(size: 200)),
				),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: ColorFiltered(
					colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
					child: Center(child: const FlutterLogo(size: 200)),
				),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: ColorFiltered(
					colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
					child: Center(child: const FlutterLogo(size: 200)),
				),
			),
		),
		SizedBox(
			height: 200,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: Center(child: const FlutterLogo(size: 200)),
			),
		),
	],
);
```

## Litte Extra

To animate it, like in the GIFs, you can do it using a scroll controller, `animateTo` method and a `Timer.periodic`:

```dart
ScrollController? controller;

@override
void initState() {
	controller = ScrollController();
	bool tick = false;
	Timer.periodic(new Duration(seconds: 4), (timer) {
		tick = !tick;
		controller?.animateTo(tick ? controller?.position.maxScrollExtent ?? 0 : 0, duration: Duration(seconds: 3), curve: Curves.easeInOut);
	});
	super.initState();
}
```