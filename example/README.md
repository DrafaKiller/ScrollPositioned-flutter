# Example 1

<p align="center">
	<a href="https://dartpad.dev/?id=cabc7d4e38f8552fd21c6f19560814d6">
		<img src="https://user-images.githubusercontent.com/42767829/172643871-f366b2a8-731a-4f1f-98cb-87eead37fe8a.gif" width=200>
	</a>
</p>
<p align="center">
	<a href="https://dartpad.dev/?id=cabc7d4e38f8552fd21c6f19560814d6">
		Click to interact on DartPad
	</a>
</p>

<br>

```dart
final size = MediaQuery.of(context).size;

ListView(
	children: [
		const SizedBox(
			height: 300,
			child: ScrollPositioned.expand(
				child: Center(child: FlutterLogo(size: 150)),
			),
		),
		Container(
			height: size.height - 24 - 15 * 2,
			padding: const EdgeInsets.only(top: 30),
			margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
			decoration: BoxDecoration(
				color: const Color(0xff30B3EE),
				borderRadius: BorderRadius.circular(30),
			),
			child: const Center(
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
);
```

# Example 2

<p align="center">
	<a href="https://dartpad.dev/?id=db8f821b58da3d5c4168fcb6f17b095d">
		<img src="https://user-images.githubusercontent.com/42767829/172827014-80525ca9-c22e-42fe-b575-e12ce97981e6.gif" width=200>
	</a>
</p>
<p align="center">
	<a href="https://dartpad.dev/?id=db8f821b58da3d5c4168fcb6f17b095d">
		Click to interact on DartPad
	</a>
</p>

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
				child: const Center(child: FlutterLogo(size: 200)),
			),
		),
		Container(height: size.height * 0.25, color: Colors.blue),
		Container(height: size.height * 0.25, color: Colors.green),
		SizedBox(
			height: size.height * 0.5,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: const Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
						child: FlutterLogo(size: 200),
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
				child: const Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
						child: FlutterLogo(size: 200),
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
				child: const Center(child: FlutterLogo(size: 200)),
			),
		),
		Container(height: size.height * 0.25, color: Colors.blue),
	],
);
```

# Example 3

<p align="center">
	<a href="https://dartpad.dev/?id=304d5876750960da780f8a357f79f32c">
		<img src="https://user-images.githubusercontent.com/42767829/172634476-7bcdf257-bb36-4530-8912-8f0d4a9dbee3.gif" width=200>
	</a>
</p>
<p align="center">
	<a href="https://dartpad.dev/?id=304d5876750960da780f8a357f79f32c">
		Click to interact on DartPad
	</a>
</p>

<br>

```dart
final size = MediaQuery.of(context).size;

ListView(
	children: [
		SizedBox(height: (size.height - 200) / 2),
		SizedBox(
			height: 200,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: const Center(child: FlutterLogo(size: 200)),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: const Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
						child: FlutterLogo(size: 200),
					),
				),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: const Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
						child: FlutterLogo(size: 200),
					),
				),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: const Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
						child: FlutterLogo(size: 200),
					),
				),
			),
		),
		SizedBox(
			height: 150,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: const Center(
					child: ColorFiltered(
						colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
						child: FlutterLogo(size: 200),
					),
				),
			),
		),
		SizedBox(
			height: 200,
			child: ScrollPositioned.absolute(
				width: size.width,
				height: size.height,
				child: const Center(child: FlutterLogo(size: 200)),
			),
		),
		SizedBox(height: (size.height - 200) / 2),
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
	Timer.periodic(const Duration(seconds: 4), (timer) {
		tick = !tick;
		controller?.animateTo(
			tick ? controller?.position.maxScrollExtent ?? 0 : 0,
			duration: const Duration(seconds: 3),
			curve: Curves.easeInOut,
		);
	});
	super.initState();
}
```