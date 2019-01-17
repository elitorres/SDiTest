using SDiProgrammingTestProject.Core.DBModels;
using SDiProgrammingTestProject.DAL.Interface;
using SDiProgrammingTestProject.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SDiProgrammingTestProject.DAL
{
    public class PersonData : IBase<PersonGPA>
    {
        protected readonly SDiProgrammingTestEntities sdiEntities;

        public PersonData()
        {
            sdiEntities = new SDiProgrammingTestEntities();
        }

        public IEnumerable<PersonGPA> GetAll()
        {
            try
            {
                // return all Person GPA's where enabled.
                
                return sdiEntities.vPersonGPAs.Where(x => x.Enabled)
                                .AsEnumerable()
                                .Select(x => MapEntity(x)).ToList();
            }
            catch (Exception)
            {
                throw;
            }
            
        }

        public PersonGPA Insert(PersonGPA obj)
        {
            try
            {
                ObjectParameter gpaID = new ObjectParameter("gpaID", obj.GPAID);

                // add the person and GPA to the database
                sdiEntities.CreatePersonGPA(obj.FirstName, obj.LastName, obj.DateOfBirth,
                    obj.GPA, obj.PersonID, gpaID);

                // check if gpaid returned a value convert it and return model or null if failed
                return gpaID != null ? GetGPAByID(Convert.ToInt32(gpaID.Value)) : null;
            }
            catch (Exception)
            {
                throw;
            }
        }

        private PersonGPA GetGPAByID(int id)
        {
            try
            {
                //Filter list of PersonGPA by GPAID
                return GetAll().FirstOrDefault(x => x.GPAID == id);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public PersonGPA MapEntity<S>(S entity)
        {
            //Map data to model
            var personGPA = entity as vPersonGPA;

            return new PersonGPA
            {
                DateCreated = personGPA.DateCreated,
                DateOfBirth = personGPA.DateOfBirth,
                Enabled = personGPA.Enabled,
                FirstName = personGPA.FirstName,
                GPA = personGPA.GPA,
                GPAID = personGPA.GPAID,
                LastName = personGPA.LastName,
                PersonID = personGPA.PersonID
            };
        }
    }
}
