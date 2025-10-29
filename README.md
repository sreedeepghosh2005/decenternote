# 📝 Decentralized Notes - A Simple Blockchain Note Storage DApp

### 🚀 Deployed Smart Contract  
**Network:** Celo Sepolia Testnet  
**Transaction / Deployment Link:** [View on Blockscout](https://celo-sepolia.blockscout.com/tx/0x9ed3c86797aae3d4d53127033166ce2ef203263bc5f4c916e543f0aa1c2601ad)

---

## 📖 Project Description

**Decentralized Notes** is a simple smart contract written in Solidity that allows anyone to **store, retrieve, and manage their personal notes directly on the blockchain**.  
Instead of relying on centralized servers or apps, this DApp ensures your notes are **secure, censorship-resistant, and always accessible** through your wallet address.

It’s designed as a **beginner-friendly blockchain project** — perfect for learning how smart contracts work with mappings, events, and state variables in Solidity.

---

## 💡 What It Does

- Lets users **add** new notes to the blockchain.  
- Allows users to **view all their notes** at any time.  
- Enables fetching a **specific note by index**.  
- Keeps notes **private to the wallet address** that created them.  
- Stores all data **permanently and immutably** on the blockchain.

---

## ✨ Features

| Feature | Description |
|----------|-------------|
| 🧠 **Personal Notes** | Each wallet address can store its own private list of notes. |
| 🔒 **Privacy** | Notes are stored in a mapping tied to the sender’s address — only the note owner can view them. |
| ⚡ **Fast & Simple** | Lightweight design using Solidity’s mapping and array structures. |
| 🏷️ **Events** | Emits a `NoteAdded` event every time a new note is created. |
| 🧱 **Immutable Storage** | Once added, notes remain permanently recorded on the blockchain. |

---

## 🧩 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * @title Decentralized Note Storage
 * @dev A simple contract to let users store and retrieve their own notes on the blockchain.
 */

contract DecentralizedNotes {
    // Each user's address maps to an array of notes they’ve created
    mapping(address => string[]) private userNotes;

    // Event emitted when a new note is added
    event NoteAdded(address indexed user, string note);

    // Function to add a note
    function addNote(string memory _note) public {
        require(bytes(_note).length > 0, "Note cannot be empty");
        userNotes[msg.sender].push(_note);
        emit NoteAdded(msg.sender, _note);
    }

    // Function to get all notes of the sender
    function getMyNotes() public view returns (string[] memory) {
        return userNotes[msg.sender];
    }

    // Function to get a specific note by index
    function getMyNoteByIndex(uint index) public view returns (string memory) {
        require(index < userNotes[msg.sender].length, "Invalid index");
        return userNotes[msg.sender][index];
    }

    // Function to get the count of notes for the sender
    function getMyNotesCount() public view returns (uint) {
        return userNotes[msg.sender].length;
    }
}
