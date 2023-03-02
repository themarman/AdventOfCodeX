using System;
using System.IO;

namespace AdventOfCode
{
    class Program
    {
        static void Main(string[] args)
        {
            // Read the input file
            string input = File.ReadAllText("input.txt");

            int floor = 0;

            // Process each character in the input
            for (int i = 0; i < input.Length; i++)
            {
                char c = input[i];

                if (c == '(')
                {
                    floor++;
                }
                else if (c == ')')
                {
                    floor--;
                }
            }

            Console.WriteLine("Santa ended up on floor: " + floor);
            Console.ReadLine();
        }
    }
}
