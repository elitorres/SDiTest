using SDiProgrammingTestProject.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SDiProgrammingTest.Services.Interface
{
    public interface IPersonGPAService
    {
        PersonGPA CreatePersonGPA(PersonGPA personGPA);
        List<PersonGPA> GetAllGPAs();
    }
}
