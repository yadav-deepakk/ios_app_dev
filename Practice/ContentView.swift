//
//  ContentView.swift
//  Practice
//
//  Created by Deepak Kumar Yadav on 04/09/26.
//

import SwiftUI

struct ContentView : View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var currWord = ""
    @FocusState private var currWordFocus: Bool

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    var score: Int { usedWords.reduce(0) { $0 + $1.count } }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter a word", text: $currWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .onSubmit(addWord)
                        .focused($currWordFocus)
                }
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){ Text("\(usedWords.count) | \(score)") }
                ToolbarItem(placement: .bottomBar){ Button("Restart", action: reStartGame) }
            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") { currWordFocus = true }
            } message: { Text("\(alertMessage)") }
            .navigationTitle(rootWord)
            .onAppear(perform: loadWord)
        }
    }
    
    func loadWord() {
        guard let file = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("Could not find start.txt in the app bundle.")
        }
        guard let fileContent = try? String(contentsOf: file, encoding: .utf8) else {
            fatalError("Could not load start.txt.")
        }
        let stringList = fileContent.components(separatedBy: "\n")
        rootWord = stringList.randomElement() ?? "swiftui"
        currWordFocus = true
    }

    func reStartGame() {
        usedWords = [String]()
        rootWord = ""
        currWord = ""
        loadWord()
    }

    func addWord() {
        let word = currWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard word != rootWord else {
            showFaultAlert("Root word can not be used", "Please enter a word with 3 or more letters.")
            return
        }
        
        guard word.count >= 3 else {
            showFaultAlert("Insufficient letters in word", "Please enter a word with 3 or more letters.")
            return
        }
        
        guard !isDuplicate(word) else {
            showFaultAlert("Word Used Already", "Please enter a new word.")
            return
        }

        // check if possible word
        guard isPossible(word) else {
            showFaultAlert("letter(s) are not in root word", "we can't spell that word from \(rootWord).")
            return
        }
        
        // check if validWord
        guard isRealWord(word) else {
            showFaultAlert("Meaningless Word", "Please enter a meaningful word")
            return
        }
        
        withAnimation { usedWords.insert(word, at: 0) }
        currWord = ""
        currWordFocus = true
    }
    
    func isSufficientLetters(_ word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isDuplicate(_ word: String) -> Bool {
        usedWords.contains(word)
    }
    
    func isPossible(_ word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let index = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: index)
            } else { return false }
        }
        return true
    }
    
    func isRealWord(_ word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word, range: range, startingAt: 0, wrap: false, language: "en"
        )
        return misspelledRange.location == NSNotFound
    }
    
    func showFaultAlert(_ title: String, _ message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
        currWord = ""
        currWordFocus = true
    }
}

#Preview {
    ContentView()
}

