using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SDiProgrammingTestProject.Infrastructure.Models
{
    public class PersonGPA
    {
        public int GPAID { get; set; } = -1;
        public int PersonID { get; set; } = -1;
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public double GPA { get; set; }
        public DateTime DateCreated { get; set; }
        public bool Enabled { get; set; }
    }
}
