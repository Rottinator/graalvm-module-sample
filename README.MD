1. Build the project via: `docker build -t graalvm-module-sample .`
2. Run the JVM-Version via: `docker run --rm graalvm-module-sample java --module-path /code/target/graalvm-module-sample-1.0-SNAPSHOT.jar --module graalvmmodulesample/de.example.graalvmmodulesample.Application`
3. Run the native-image-Version via: `docker run --rm graalvm-module-sample`

Both versions should have the same output, but the native-image version fails, loading the resource via moduel api in first try.
