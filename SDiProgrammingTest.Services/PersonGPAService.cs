using SDiProgrammingTest.Services.Interface;
using SDiProgrammingTestProject.DAL;
using SDiProgrammingTestProject.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SDiProgrammingTest.Services
{
    public class PersonGPAService : IPersonGPAService
    {
        private PersonData _personData;

        protected PersonData PersonData => _personData ?? (_personData = new PersonData());
        public PersonGPA CreatePersonGPA(PersonGPA personGPA)
        {
            //validate model before inserting
            if (!ValidatePersonGPA(personGPA)) return null;

            return PersonData.Insert(personGPA);
        }

        public List<PersonGPA> GetAllGPAs() => PersonData.GetAll().ToList();

        private bool ValidatePersonGPA(PersonGPA personGPA)
        {
            // Check if personGPA is null
            if(personGPA != null)
            {
                //check if FirstName, LastName and DateOfBirth has values
                if(!string.IsNullOrEmpty(personGPA?.FirstName) || !string.IsNullOrEmpty(personGPA?.LastName) ||
                    personGPA.DateOfBirth != DateTime.MinValue)
                {
                    return true;
                }
            }

            return false;
        }
    }
}
