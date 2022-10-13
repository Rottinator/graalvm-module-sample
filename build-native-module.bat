CALL "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

SET JAVA_HOME=C:\dev\tools\graalvm\java17-22.2.0
SET GRAALVM_HOME=C:\dev\tools\graalvm\java17-22.2.0\bin

CALL mvn clean package

CALL %GRAALVM_HOME%\native-image --module-path target/graalvm-module-sample-1.0-SNAPSHOT.jar --module graalvmmodulesample/de.example.graalvmmodulesample.Application -H:IncludeResources=.*csv -H:Log=registerResource:5 --verbose -o module-sample