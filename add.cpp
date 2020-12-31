#include <argparse.hpp>

using argparse::ArgValue;
using argparse::ConvertedValue;

struct Args {
    ArgValue<int> number1;
    ArgValue<int> number2;
};

int main(int argc, const char** argv) {
    Args args;
    auto parser = argparse::ArgumentParser(argv[0], "Try libargparse");

    parser.version("Version: 0.0.1");

    parser.add_argument(args.number1, "number 1")
        .help("First number to process");

    parser.add_argument(args.number2, "number 2")
        .help("Second number to process");

    parser.parse_args(argc, argv);

    //Show the arguments
    std::cout << "args.number1: " << args.number1 << "\n";
    std::cout << "args.number2: " << args.number2 << "\n";
    std::cout << "\n";

    //Do work
    int result=args.number1+args.number2;
    std::cout<<"result: "<<result<<"\n";

    return result;
}

