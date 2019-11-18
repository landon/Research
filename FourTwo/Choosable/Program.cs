using System;
using System.Collections.Generic;
using System.Linq;

namespace Choosable
{
    class Program
    {
        static int[] A = { 0b01000110,
                           0b10100001,
                           0b01010000,
                           0b00101000,
                           0b00010100,
                           0b10001001,
                           0b10000001,
                           0b01000110 };


        static void Main(string[] args)
        {
            
            Console.WriteLine("checking...");

            foreach (var s in NonDecreasingSequences(8))
            {
            }

            Console.ReadKey();
        }
        
        static IEnumerable<List<int>> NonDecreasingSequences(int length)
        {
            if (length == 1)
            {
                yield return new List<int>() { 15 };
                yield break;
            }

            foreach (var s in NonDecreasingSequences(length - 1))
            {
                var l = s.ToList();
                var last = l[l.Count - 1];

                while(last < 256)
                {
                    var ll = l.ToList();
                    ll.Add(last);
                    yield return ll;
                    last = Gosper(last);
                }
            }
        }

        static int Gosper(int set)
        {
            var c = set & -set;
            var r = set + c;
            return (((r ^ set) >> 2) / c) | r;
        }

        static string Bits(int b) => Convert.ToString(b, 2).PadLeft(8, '0');
    }
}
