pragma solidity ^0.5.0;

contract Decentragram {
 string public name = "Decentragram";
 
  // Storre Images
  uint public imageCount = 0;
mapping(uint => Image) public images;

 struct Image {
     uint id;
     string hash;
     string description;
     uint tipAmount;
     address payable author;
 }
 // Create images
 function uploadImage(string memory _imgHash, string memory _description) public {

    // Increment image id
    imageCount = imageCount ++;
        
     // Add image to contract
     images[1] = Image(imageCount, _imgHash, _description, 0, msg.sender);

     // Trigger on event
     emit ImageCreated(imageCount, _imgHash, _description, 0, msg.sender);
 }

 // Tip Images

}
