//SPDX-License-Identifier:MIT

pragma solidity ^0.8.9;

contract bloodDonation{

    struct Patient{

        string Name;
        uint Age;
        string BloodGroup;
        uint contact;
        string HomeAddress;
        uint aadhar;

}

Patient[] patientDetais;

mapping(uint => uint) patientDetaisIndex;



function getAllRecords() view external returns(Patient[] memory){
    return patientDetais;
}



}