using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace qua
{
    class Program
    {
        static void Main(string[] args)
        {
            var sb = new StringBuilder();
            for (int i = 0; i < 100; i++)
                sb.Append("$"+ Numberify(i) + "$,");

            var ss = sb.ToString();
            Console.WriteLine(ss);
            Console.ReadKey();
        }

        static string Numberify(int n)
        {
            if (n < 0)
                throw new Exception("end of universe");
            if (n == 0)
                return @"\nul";
            if (n == 1)
                return @"\qua";

            return @"\quat{" + string.Join(",", Factorize(n).Select(k => Numberify(k))) + @"}";
        }

        static IEnumerable<int> Factorize(int n)
        {
            var p = 2;
            var k = 0;
            while (n > 1) 
            {
                if (n % p == 0)
                {
                    k++;
                    n /= p;
                }
                else
                {
                    yield return k;
                    p = NextPrime(p);
                    k = 0;
                }
            }

            yield return k;
        }

        static int NextPrime(int p)
        {
            while (!IsPrime(++p)) ;
            return p;
        }

        static bool IsPrime(int p)
        {
            var t = 2;
            while(t * t <= p)
            {
                if (p % t == 0)
                    return false;
                t++;
            }

            return true;
        }
    }
}
