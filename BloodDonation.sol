//SPDX-License-Identifier:MIT

pragma solidity ^0.8.9;

contract bloodDonation{

        enum patientType{

            donor,
            receiver

        }

        struct bloodTransaction{

            patientType Type;
            uint Date;
            address From;
            address To;

        }

    struct Patient{

        string Name;
        uint Age;
        string BloodGroup;
        uint Contact;
        string HomeAddress;
        uint Aadhar;
        bloodTransaction[] bT;

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

function Bloodtransaction(patientType _type , address _from , address _to , uint _Aadhar) external {

    uint index = patientDetailsIndex[_Aadhar];

    patientDetails[index].bT.push(bloodTransaction(_type , block.timestamp , _from , _to));


}



}