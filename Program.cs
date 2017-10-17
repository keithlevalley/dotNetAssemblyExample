using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestLibrary1
{
    public static class TestStaticClass
    {
        public static int timesMethodStatic(int x, int y)
        {
            return x * y;
        }
        public static int addMethodStatic(int x, int y)
        {
            return x + y;
        }
    }
    public static class TestExtentionMethodClass
    {
        public static int timesMethodStatic(this int x, int y)
        {
            return x * y;
        }
        public static int addMethodStatic(this int x, int y)
        {
            return x + y;
        }
    }
    public class TestInstanceClass
    {
        public int X { get; set; }
        public int Y { get; set; }
        public TestInstanceClass(int x, int y)
        {
            X = x;
            Y = y;
        }
        public int timesMethodInstance()
        {
            return this.X * this.Y;
        }
        public int addMethodInstance()
        {
            return X + Y;
        }
    }
    public class UsingLinq
    {
        IEnumerable<int> numbers;

        public UsingLinq(IEnumerable<int> ints)
        {
            numbers = ints;
        }

        public IEnumerable<int> lessThanNumAndEven(int checkNumber)
        {
            return numbers.Where(i => i < checkNumber && i % 2 == 0);
        }
        public IEnumerable<int> lessThanNumAndEvenParallel(int checkNumber)
        {
            return numbers.Where(i => i < checkNumber && i % 2 == 0);
        }
    }
}
