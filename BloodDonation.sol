//SPDX-License-Identifier:MIT

pragma solidity ^0.8.9;

contract bloodDonation{

    struct Patient{

        string Name;
        uint Age;
        string BloodGroup;
        uint Contact;
        string HomeAddress;
        uint Aadhar;

}

Patient[] patientDetails;

mapping(uint => uint) patientDetailsIndex;



function getAllRecords() view external returns(Patient[] memory){
    return patientDetails;
}


function registerPatient(string memory _name , uint _age , string memory _BloodGroup , uint _contact , string memory _HomeAddress , uint _Aadhar) external {

    uint index = patientDetails.length;

    patientDetails.push();

    patientDetais[index].Name = _name; 
    patientDetais[index].Age = _age;
    patientDetais[index].BloodGroup = _BloodGroup;
    patientDetais[index].contact = _contact;
    patientDetais[index].HomeAddress = _HomeAddress;
    patientDetais[index].Aadhar = _Aadhar;
  
    patientDetailsIndex[_Aadhar] = index;


}



}