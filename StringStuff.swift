// Copyright (c) 2022 Mel Aguoth All rights reserved.
//
// Created By: Mel Aguoth
// Date: January 11, 2022
// Given a string passed as an argument, this program returns the length of the largest run in
// the string. A "run" is a series of zero or more adjacent characters that are the same.

// Import modules.
import Foundation

func maxRun(theString: String) -> Int {

  // Declare constants.
  let theStringArray: [Character] = Array(theString)

  // Declare variables.
  var runCount: Int = 1
  var maxRun: Int = 0

  // Find the maximum run.
  for charCounter in 1..<theStringArray.count {
    if theStringArray[charCounter] == theStringArray[charCounter - 1] {
      runCount += 1
      if runCount > maxRun {
        maxRun = runCount
      }
    } else {
      runCount = 1
    }
  }

  // Return the run.
  return maxRun
}

// Declare constants.
let runFile = "/home/ubuntu/ICS4U/Assignments/Assign-02/Assign-02-Swift/run.txt"
let text = ""

// Introduce the program.
print("This program finds, exports and displays the number of the longest repetition of a character"
    + " (a.k.a the 'run') when given a string.")

// Get the user's string.
print("Enter your string:", terminator: " ")
let userString: String = readLine() ?? ""

// Call maxRun.
let resultRun: Int = maxRun(theString: userString)

// Write the run to run.txt.
try text.write(to: URL(fileURLWithPath: "/home/ubuntu/ICS4U/Assignments/Assign-02/"
             + "Assign-02-Swift/run.txt"), atomically: false, encoding: .utf8)
if let fileWriter = try? FileHandle(forUpdating: URL(fileURLWithPath: "/home/ubuntu/ICS4U/"
                  + "Assignments/Assign-02/Assign-02-Swift/run.txt")) {
  let resultRunString = ("The max run of '\(userString)' is: \(resultRun)")
  fileWriter.seekToEndOfFile()
  fileWriter.write(resultRunString.data(using: .utf8)!)
  fileWriter.closeFile()
}

// Read and display the run from run.txt.
let answer: String = try String(contentsOfFile: runFile)
print("\n" + answer)
