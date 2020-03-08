# test coverage is achieved usding gcov (part of gcc suite)
# this is done with the flags  -ftest-coverage -fprofile-arcs
IDIR = src/
LIBDIR = src/ch1
TESTDIR = test

CXX = g++
CXXFLAGS = -I $(IDIR) -Wall -ftest-coverage -fprofile-arcs

LIB = $(patsubst %, $(LIBDIR)/%, lib.cpp)
TEST = $(patsubst %, $(TESTDIR)/%, test-library.cpp)
OBJ = $(patsubst %, $(TESTDIR)/%, test-library.o lib.o)

test/test-library: $(OBJ)
	$(CXX) -o $@ $^ $(CXXFLAGS) -lm -lncurses -Os

$(TESTDIR)/test-library.o: $(TEST)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

$(TESTDIR)/lib.o: $(LIB)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

clean:
	cd $(TESTDIR); rm -f *.out *.o *.gc* *.info test-library lib
