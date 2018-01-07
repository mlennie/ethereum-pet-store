pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {

    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // Testing the adopt() function
    function testUserCanAdoptPet() public {

        uint returnedId = adoption.adopt(8);
        uint expectedId = 8;
        string memory failureMessage = "Adoption of petId 8 should be recorded";

        Assert.equal(returnedId, expectedId, failureMessage );

    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {

        // Expected owner is this contract
        address expectedOwner = this;
        address adopter = adoption.adopters(8);
        string memory failureMessage = "Owner of petId 8 should be recorded";

        Assert.equal(adopter, expectedOwner, failureMessage);

    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {

        // Expected owner is this contract
        address expectedOwner = this;

        // Store adopters in memory rather than in storage
        address[16] memory adopters = adoption.getAdopters();

        string memory failureMessage = "Owner of petId 8 should be recorded";

        Assert.equal(adopters[8], expectedOwner, failureMessage);
    }
}
