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