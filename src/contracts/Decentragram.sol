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

 event ImageCreated(
     uint id,
     string hash,
     string description,
     uint tipAmount,
     address payable author
 );

 event ImageTipped(
     uint id,
     string hash,
     string description,
     uint tipAmount,
     address payable author
 );

  constructor() public {
    name = "Decentragram";
  }

 // Create images
 function uploadImage(string memory _imgHash, string memory _description) public {
    // Make sure that the image Hash exits
    
    require(bytes(_imgHash).length > 0);

    // Make sure that the image decription exits
    
    require(bytes(_description).length > 0);

    // Make sure that uploader dress exits
    
    require(msg.sender != address(0x0));
 
    // Increment image id
    imageCount ++;
        
     // Add image to contract
     images[imageCount] = Image(imageCount, _imgHash, _description, 0, msg.sender);

     // Trigger on event
     emit ImageCreated(imageCount, _imgHash, _description, 0, msg.sender);
 }

 // Tip Images
 function tipImageOwner(uint _id) public payable {
// Make sure that the id is valid
require(_id > 0 && _id <= imageCount);
// Fetch Image
Image memory _image = images[_id];
// Fetch author
address payable _author = _image.author;
// Pay the autor by sendng them ether
address(_author).transfer(msg.value);
// Increment the tip amount
_image.tipAmount = _image.tipAmount + msg.value;
// Update the image
images[_id] = _image;
// Trigger a nd event
emit ImageTipped(_id, _image.hash, _image.description, _image.tipAmount, _author);
 }


}
