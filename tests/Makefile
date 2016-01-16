CXX = clang++
CXXFLAGS = -std=c++1y -g -Wall
VPATH = ../sources
.SUFFIXES: .hpp .cpp .o

program = gtest
objs = mat_generator.o main.o mat_generator_test.o
libs = -lopencv_core -lgtest

$(program): $(objs)
	$(CXX) $(CXXFLAGS) -L/usr/local/lib -L./ $(libs) -o $@ $^

.hpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

mat_generator.o: CXXFLAGS += -I/usr/local/include

main.o: CXXFLAGS += -isystem googletest/googletest/include

mat_generator_test.o: CXXFLAGS += -I/usr/local/include -isystem googletest/googletest/include
mat_generator_test.o: mat_generator.o

.PHONY: run
run: $(program)
	./$(program)

.PHONY: clean
clean:
	-$(RM) $(program) $(objs)
