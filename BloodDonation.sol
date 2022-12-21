//SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract bloodDonation{

        struct hospitalDetails{

            string _Name;
            uint _Contact;
            string _Location;
            uint _Fees;
             
        }

//Declaring An Enum With Name patientType To Know Whether The Patient Is Donor Or Receiver.

        enum patientType{

            donor,
            receiver

        }


//Declaring Struct With Name bloodTransaction To Record The Details Of bloodTransaction.

        struct bloodTransaction{

            patientType Type;
            uint Date;
            address From;
            address To;

        }

//Declaring Struct With Name Patient To Record The Details Of A Patient.

    struct Patient{

        string Name;
        uint Age;
        string BloodGroup;
        uint Contact;
        string HomeAddress;
        uint Aadhar;
        bloodTransaction[] bT;  //Making An Array With Name bT Through bloodtransaction Struct To Store The Details In Pateint Struct Which We Stored Inside The bloodTransaction Struct. 

        }

address public owner;



hospitalDetails[] hospitalInfo;

Patient[] patientDetails;   //Making An Array With Patient Struct To Store All Details Inside An Array. 

mapping(uint => uint) patientDetailsIndex;  //Declaring Mapping To Access Patient Location With The Help Of His/Her Aadhar.

constructor(){
    
    owner = msg.sender;

}

modifier onlyOwner(){

    require(msg.sender == owner,"Only Owner Can Access This Function");

    _;

}


function setHospitalInfo(string memory Name_ , uint Contact_ , string memory Location_ , uint Fees_) external onlyOwner{

    hospitalDetails memory _hospital;

    _hospital._Name = Name_;
    _hospital._Contact = Contact_;
    _hospital._Location = Location_;
    _hospital._Fees = Fees_;

    hospitalInfo.push(_hospital);

}

function getHospitalInfo() view external returns(hospitalDetails[] memory){
    return hospitalInfo;
}

//Making A Function Through Which Hospital Can Get All Records At One Go.

function getAllRecords() view external onlyOwner returns(Patient[] memory){
    return patientDetails;
}

//Making A Function Through Which Hospital Can Get Record Of A Particular Patient.

function getParticularRecord(uint _Aadhar) view external returns(Patient memory){
    
    uint index = patientDetailsIndex[_Aadhar];  //Accessing The Patient Location With The Help Of His/Her Aadhar.

    return patientDetails[index];   //Getting The Data Of That Particular Patient From Array.

}

//Making A Function Through Which Patients Can Register Themselves.

function registerPatient(string memory _Name , uint _Age , string memory _BloodGroup , uint _Contact , string memory _HomeAddress , uint _Aadhar) external {

    uint index = patientDetails.length; //Storing The Array's Length Into A Variable Which Is 0 For Now.

    patientDetails.push();  //Sending An Empty Push Into The Array Because We Cannot Enter Something Directly On The Index If It Doesnt Have Something. 

//Using Dot Method To Enter Data Into Our Array.Using Index Variable Here Because We Want To Start Our Data's Index From 0 And Because Of Empty Push Array's Length Has Become 1,Therefore We Stored The Value Of Array's Length Into A Variable So That We Can Store Data At 0th Index. 

    patientDetails[index].Name = _Name; 
    patientDetails[index].Age = _Age;
    patientDetails[index].BloodGroup = _BloodGroup;
    patientDetails[index].Contact = _Contact;
    patientDetails[index].HomeAddress = _HomeAddress;
    patientDetails[index].Aadhar = _Aadhar;
  
    patientDetailsIndex[_Aadhar] = index;   //Storing The Above Data(Which We Stored In Index Variable) In Refrence With The Aadhar With The Help Of Mapping.This Means This Particular Aadhar Contains This Particular Person/Patient's Information

    
}

//Making A Function Through Which Hospital Can Add The Details Of A BloodTrasaction Into The Particular Patient Details. 

function Bloodtransaction(patientType _type , address _from , address _to , uint _Aadhar) external onlyOwner{

    uint index = patientDetailsIndex[_Aadhar];  //Accessing The Patient Location With The Help Of His/Her Aadhar.

//Entering The Data Of bloodTransaction Struct Into Particular Patient's Struct.

    patientDetails[index].bT.push(bloodTransaction(_type , block.timestamp , _from , _to));

}

}





