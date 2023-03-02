open System.IO

let currentDirectory = Directory.GetCurrentDirectory()
printfn "Current directory: %s" currentDirectory

let input = File.ReadAllText("../input.txt")

let finalFloor =
    input
    |> Seq.fold (fun acc c ->
        match c with
        | '(' -> acc + 1
        | ')' -> acc - 1
        | _ -> acc
    ) 0

printfn "Santa ended up on floor %d" finalFloor
