import Foundation

/// A node in the trie
class TrieNode<T: Hashable> {
    var value: T?
    weak var parentNode: TrieNode?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    var isLeaf: Bool {
        return children.count == 0
    }

    init(value: T? = nil, parentNode: TrieNode? = nil) {
        self.value = value
        self.parentNode = parentNode
    }

    func add(value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value: value, parentNode: self)
    }
}

class Trie: NSObject, NSCoding {
    typealias Node = TrieNode<Character>

    public var count: Int {
        return wordCount
    }

    public var isEmpty: Bool {
        return wordCount == 0
    }

    public var words: [String] {
        return wordsInSubtrie(rootNode: root, partialWord: "")
    }
    let root: Node
    fileprivate var wordCount: Int

    override init() {
        root = Node()
        wordCount = 0
        super.init()
    }

    required convenience init?(coder decoder: NSCoder) {
        self.init()
        let words = decoder.decodeObject(forKey: "words") as? [String]
        for word in words! {
            self.insert(word: word)
        }
    }

    func encode(with coder: NSCoder) {
        coder.encode(self.words, forKey: "words")
    }
}

extension Trie {
    func insert(word: String) {
        guard !word.isEmpty else {
            return
        }
        var currentNode = root
        for character in word {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                currentNode.add(value: character)
                currentNode = currentNode.children[character]!
            }
        }
        // Word already present?
        guard !currentNode.isTerminating else {
            return
        }
        wordCount += 1
        currentNode.isTerminating = true
    }

    fileprivate func wordsInSubtrie(rootNode: Node, partialWord: String) -> [String] {
        var subtrieWords = [String]()
        var previousLetters = partialWord
        if let value = rootNode.value {
            previousLetters.append(value)
        }
        if rootNode.isTerminating {
            subtrieWords.append(previousLetters)
        }
        for childNode in rootNode.children.values {
            let childWords = wordsInSubtrie(rootNode: childNode, partialWord: previousLetters)
            subtrieWords += childWords
        }
        return subtrieWords
    }
}

class Solution {
    let trie = Trie()

    func longestCommonPrefix(_ A: inout [String]) -> String {
        for word in A {
            trie.insert(word: word)
        }

        return walkTrie()
    }

    fileprivate func walkTrie() -> String {
        var currentNode = trie.root
        var prefix = ""

        while currentNode.children.count == 1 && !currentNode.isTerminating {
            guard let child = currentNode.children.first, let letter = child.value.value else {
                return prefix
            }

            prefix += String(letter)
            currentNode = child.value
        }

        return prefix
    }
}
