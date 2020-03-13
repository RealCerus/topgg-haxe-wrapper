# topgg-haxe-wrapper
API wrapper for the top.gg website written in Haxe

## Installation
1. `haxelib git topgg-wrapper https://github.com/RealCerus/topgg-haxe-wrapper.git`
2. Add `--library topgg-wrapper` to your `build.hxml` file

## Usage
1. Obtain a wrapper:
```haxe
var wrapper:TopGgWrapper = WrapperBuilder.builder()
        .setToken("<token>")
        .setBotId("<botid>")
        .create();
```

2. You can now access the implemented endpoints. for example the get stats endpoint:
```haxe
var stats:StatsBasic = wrapper.getStats(wrapper.getBotId());
```

## Note
This is my first real Haxe project. I appreciate constructive criticism and feedback in general!

## License
This project is licensed under the MIT license.