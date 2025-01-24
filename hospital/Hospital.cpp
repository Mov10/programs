#include <iostream>
#include <string>
using namespace std;

// bool isEmpty();
// bool isFull();
// bool search();

class Branch
{
public:
  string id;
  string name;
  string location;
  Branch *next;

  Branch(string id, string name, string location)
  {
    this->id = id;
    this->name = name;
    this->location = location;
    this->next = NULL;
  }
};

class Doctor
{
public:
  string id;
  string name;
  string specialization;
  // Patient *patient;
  Doctor *next;
  Doctor(string id, string name, string specialization)
  {
    this->id = id;
    this->name = name;
    this->specialization = specialization;
    // this->patient = NULL;
    this->next = NULL;
  }
};

class Patient
{
public:
  string id;
  string name;
  string address;
  string appointment;
  Doctor *doctor;
  Branch *branch;
  Patient *next;

  Patient(string id, string name, string address, string appointment)
  {
    this->id = id;
    this->name = name;
    this->address = address;
    this->appointment = appointment;
    this->doctor = NULL;
    this->branch = NULL;
    this->next = NULL;
  }
};

class listBranch
{
public:
  Branch *head;
  listBranch()
  {
    head = NULL;
  }

  void addBranch(string id, string name, string location)
  { // -----------------
    Branch *temp = head;
    Branch *newbranch = new Branch(id, name, location);

    if (head == NULL)
    {
      head = newbranch;
      newbranch->next = NULL;
    }

    else
    {
      while (temp->next != NULL)
      {
        temp = temp->next;
      }
      temp->next = newbranch;
      newbranch->next = NULL;
    }
  } //--------------------------
  int searchBranch(string id)
  { // -----------------
    Branch *temp = head;
    if (head == NULL)
    {
      cout << "There are no branches" << endl;
      return 0;
    }
    else
    {
      while (temp->id != id)
      {
        temp = temp->next;
        cout << "not found" << endl;
        return 0;
      }
      cout << "Branch ID: " << temp->id << "\n Branch Name: " << temp->name << "\n Branch location:" << temp->location << endl;
      return 1;
    }
  } // ----------------------------

  void displayBranch()
  { // ---------------------------------------
    Branch *temp = head;
    if (head == NULL)
    {
      cout << "there  are no branches " << endl;
    }
    else
    {
      while (temp != NULL)
      {
        cout << "Branch ID: " << temp->id << "\n Branch Name: " << temp->name << "\n Branch location:" << temp->location << endl;
        temp = temp->next;
      }
    }
    cout << " END " << endl;

  } // -------------------------
  void deleteBranch(string id)
  {
    Branch *temp = head;
    Branch *temp2 = NULL;
    if (head == NULL)
    {
      cout << "there are no branches" << endl;
    }
    else if (head->id == id && head->next == NULL)
    {
      head = NULL;
      delete (temp);
    }
    else
    {
      while (temp->id != id && temp->next != NULL)
      {
        temp2 = temp;
        temp = temp->next;
      }
      temp2->next = temp->next;
      delete (temp);
    }
  }
  Branch *getHead()
  {
    return head;
  }
};

class listDoctor
{
public:
  Doctor *head;
  listDoctor()
  {
    head = NULL;
  }
  void addDoctor(string id, string name, string specialization)
  {
    Doctor *temp = head;
    Doctor *newdoctor = new Doctor(id, name, specialization);
    if (head == NULL)
    {
      newdoctor->next = NULL;
      head = newdoctor;
    }
    else
    {
      while (temp->next != NULL)
      {
        temp = temp->next;
      }
      newdoctor->next = NULL;
      temp->next = newdoctor;
    }
  }
  void displayDoctor()
  {
    Doctor *temp = head;
    if (head == NULL)
    {
      cout << "there are no Doctors" << endl;
    }
    else
    {
      while (temp != NULL)
      {
        cout << "Doctor ID: " << temp->id << "\nDoctor Name: " << temp->name << "\nDoctor Specialization: " << temp->specialization << endl;
        temp = temp->next;
      }
    }
    cout << "END" << endl;
  }

  void deleteDoctor(string id)
  {
    Doctor *temp = head;
    Doctor *temp2 = NULL;
    if (head == NULL)
    {
      cout << "there are no branches" << endl;
    }
    else if (head->id == id && head->next == NULL)
    {
      head = NULL;
      delete (temp);
    }
    else
    {
      while (temp->id != id && temp->next != NULL)
      {
        temp2 = temp;
        temp = temp->next;
      }
      temp2->next = temp->next;
      delete (temp);
    }
  }

  Doctor *getHead()
  {
    return head;
  }
};

class listPatient
{
public:
  Patient *head;
  listPatient()
  {
    head = NULL;
  }
  void addPatient(string id, string name, string address, string appointment)
  { // -----------------
    Patient *temp = head;
    Patient *newPatient = new Patient(id, name, address, appointment);

    if (head == NULL)
    {
      head = newPatient;
      newPatient->next = NULL;
    }

    else
    {
      while (temp->next != NULL)
      {
        temp = temp->next;
      }
      temp->next = newPatient;
      newPatient->next = NULL;
    }
  }
  void displayPatient()
  {
    Patient *temp = head;
    if (head == NULL)
    {
      cout << "there are no Patients" << endl;
    }
    else
    {
      while (temp != NULL)
      {
        cout << "Patient ID: " << temp->id << "\nPatient Name: " << temp->name << "\n Patient address: " << temp->address << "\nPatient appointment: " << temp->appointment << endl;
        temp = temp->next;
      }
    }
    cout << "END" << endl;
  }

  void deletePatient(string id)
  {
    Patient *temp = head;
    Patient *temp2 = NULL;
    if (head == NULL)
    {
      cout << "there are no Patients" << endl;
    }
    else if (head->id == id && head->next == NULL)
    {
      head = NULL;
      delete (temp);
    }
    else
    {
      while (temp->id != id && temp->next != NULL)
      {
        temp2 = temp;
        temp = temp->next;
      }
      temp2->next = temp->next;
      delete (temp);
    }
  }

  int searchName(string name) // can't determine if the name found or not
  {                           // -----------------
    Patient *temp = head;
    if (head == NULL)
    {
      cout << "There are no Patients" << endl;
      return -1;
    }
    else
    {
      while (temp != NULL)
      {
        if (temp->name == name)
        {
          cout << "Patient: " << temp->name << " found seccessfully" << endl;
          return 0;
        }
        temp = temp->next;
      }
    }
    cout << "Patient not found" << endl;

    return -1;
  }
  void updatePatient(string id)
  {
    string name;
    string address;
    string appointment;

    Patient *temp = head;
    if (head == NULL)
    {
      cout << "There are no Patients" << endl;
    }
    else
    {
      while (temp->id != id && temp->next != NULL)
      {
        temp = temp->next;
      }
      cout << "Patient: " << temp->name << " found seccessfully" << endl;
      cout << "enter the new id: ";
      cin >> id;
      cout << "enter the new name: ";
      cin >> name;
      cout << "enter the new address: ";
      cin >> address;
      cout << "enter the new appointment: ";
      cin >> appointment;

      temp->id = id;
      temp->name = name;
      temp->address = address;
      temp->appointment = appointment;
    }
  }

  Patient *getHead()
  {
    return head;
  }
};

class hospital
{
public:
  Branch *branchHead;
  Doctor *doctorHead;
  Patient *patientHead;
  listPatient patients;
  listDoctor doctors;
  listBranch branches;
  // Patient *patientTemp = patients.getHead();
  // Branch *branchTemp = branchHead;

  hospital()
  {
    branchHead = NULL;
    doctorHead = NULL;
    //  patientHead = NULL;
  }
  void displayPatient()
  {
    Patient *patientTemp = patients.getHead();

    if (patientTemp == NULL)
    {
      cout << "there are no Patients" << endl;
    }
    else
    {
      while (patientTemp != NULL)
      {
        cout << "Patient ID: " << patientTemp->id << "\nPatient Name: " << patientTemp->name << "\n Patient address: " << patientTemp->address << "\nPatient appointment: " << patientTemp->appointment << endl;
        patientTemp = patientTemp->next;
      }
    }
    cout << "END" << endl;
  }

  Patient *searchPatient(string id)
  {
    Patient *patientTemp = patients.getHead();

    //  Patient *patientTemp = patientHead;

    if (patientHead == NULL)
      return NULL;
    else
    {
      while (patientTemp != NULL)
      {
        if (patientTemp->id == id)
          return patientTemp;
        else
          patientTemp = patientTemp->next;
      }
      return NULL;
    }
  }

  Doctor *searchDoctor(string id)
  {
    Doctor *doctorTemp = doctors.getHead();

    //  Doctor *doctorTemp = doctorHead;

    if (doctorTemp == NULL)
      return NULL;
    else
    {
      while (doctorTemp != NULL)
      {
        if (doctorTemp->id == id)
          return doctorTemp;
        else
          doctorTemp = doctorTemp->next;
      }
      return NULL;
    }
  }

  Branch *searchBranch(string id)
  {
    Branch *branchTemp = branches.getHead();

    //  Doctor *doctorTemp = doctorHead;

    if (branchTemp == NULL)
      return NULL;
    else
    {
      while (branchTemp != NULL)
      {
        if (branchTemp->id == id)
          return branchTemp;
        else
          branchTemp = branchTemp->next;
      }
      return NULL;
    }
  }

  void bookAnAppointment(string patientID, string doctorID,string branchID, string appointment)
  {
    Patient *patient = searchPatient(patientID);
    if (patient == NULL)
    {
      cout << "patient not found " << endl;
      return;
    }
    Doctor *doctor = searchDoctor(doctorID);
    if (doctor == NULL)
    {
      cout << "Doctor not found " << endl;
      return;
    }
    Branch *branch = searchBranch(patientID);
    if (branch == NULL)
    {
      cout << "Branch not found " << endl;
      return;
    }
    patient->appointment = appointment;
    patient->doctor = doctor;
    patient->branch = branch;
    cout << "appointment booked successefully for " << patient->name << " with Dr. " << doctor->name << " in branch: "<< branch->name << endl;
  }


  void displayAllAppointments()
  {
    Patient *patientTemp = patients.getHead();
    while (patientTemp != NULL)
    {
      if (patientTemp->doctor != NULL && patientTemp->branch != NULL)
      {
        cout << "\nPatient: " << patientTemp->name
             << " with Doctor: " << patientTemp->doctor->name
             << " has an appointment at: " << patientTemp->appointment
             << " in branch " << patientTemp->branch->name << endl;
      }
      else
      {
        cout << "\nPatient: " << patientTemp->name
             << " has no appointment." << endl;
      }
      patientTemp = patientTemp->next;
    }
  }
};

int main()
{

  // listPatient listp;
  // listp.addPatient("1", "ahmed", "helway", "10PM");
  // listp.addPatient("2", "mero", "helway", "10PM");
  // listp.addPatient("2", "hero", "helway", "10PM");

  // listDoctor listd;
  // listd.addDoctor("1" , "nemo","surgery");
  // listd.addDoctor("2" , "kero","surgery");
  // listd.addDoctor("3" , "sero","surgery");

  hospital hos;
  hos.branches.addBranch("1","BMB","helwaan");
    hos.branches.addBranch("2","sms","nasir city");

  hos.patients.addPatient("1", "ahmed", "helwan", "10PM");
  hos.patients.addPatient("2", "mohamed", "nasir city", "11PM");

  hos.doctors.addDoctor("1", "nabil", "surgery");
  hos.doctors.addDoctor("2", "samy", "eyes");

  hos.bookAnAppointment("1", "1", "1", "1april");
  hos.bookAnAppointment("2", "2", "2", "15smp");

 cout << "------------------------------------" << endl;


  hos.displayAllAppointments();

// listBranch branchl;
// branchl.addBranch("1","bms","helwaan");
// branchl.displayBranch();


  return 0;
}

// bool isEmpty(string *head)
// {
//   if (head == NULL)
//     return true;
//   else
//     return false;
// }
// bool isFull(string *newnode)
// {
//   if (newnode == NULL)
//     return true;
//   else
//     return false;
// }

  //   void displayAllAppointments()
  //   {
  //     Patient *patientTemp = patients.getHead();
  //     Doctor *doctorTemp = doctors.getHead();
  //     while(patientTemp != NULL && doctorTemp !=NULL){
  //       cout << "\npatient: " << patientTemp->name << " with Doctor: "<< doctorTemp->name << " have an appointment at: "<< patientTemp->appointment << endl;
  //       patientTemp = patientTemp->next;
  //       doctorTemp = doctorTemp->next;
  //     }
  //     return;
  //   }