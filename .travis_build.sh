echo "Generating googletest libraly"
clang++ -std=c++1y -pthread -g -Wall -Wextra -isystem tests/googletest/googletest/include -isystem tests/googletest/googletest/ -c -o tests/gtest-all.o tests/googletest/googletest/src/gtest-all.cc
echo "Done compiling gtest-all.cc"
ar -rv tests/libgtest.a tests/gtest-all.o
echo "Done archiving gtest-all.o"
echo "Compiling sources..."
clang++ -std=c++1y -pthread -g -Wall -Wextra  -I/usr/local/include -c -o tests/mat_generator.o sources/mat_generator.hpp
echo "Done compiling kmosaic.cpp"
echo "Compiling unit tests..."
clang++ -std=c++1y -pthread -g -Wall -Wextra -isystem tests/googletest/googletest/include -c -o tests/main.o tests/main.cpp
echo "Done compiling main.cpp"
clang++ -std=c++1y -pthread -g -Wall -Wextra -I/usr/local/include -isystem tests/googletest/googletest/include  -c -o tests/mat_generator_test.o tests/mat_generator_test.cpp
echo "Done compiling kmosaic_test.cpp"
clang++ -std=c++1y -g -Wall -Wextra -o tests/gtest tests/mat_generator.o tests/main.o tests/mat_generator_test.o -pthread -Ltests/ -L/usr/local/lib  -lgtest -lopencv_core
echo "Running unit tests..."
tests/gtest -v
result=$?
rm -r tests/gtest tests/mat_generator.o tests/main.o tests/mat_generator_test.o tests/gtest-all.o tests/libgtest.a
echo "Unit tests completed : $result"
exit $result
