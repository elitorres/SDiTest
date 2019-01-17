using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SDiProgrammingTestProject.Models
{
    public class PersonGPAViewModel
    {
        public int GPAID { get; set; } = -1;
        public int PersonID { get; set; } = -1;
        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        [Display(Name = "Date Of Birth")]
        [DataType(DataType.Date)]
        public DateTime DateOfBirth { get; set; }

        [Required]
        public double GPA { get; set; }
        
    }
}