using SDiProgrammingTestProject.Infrastructure.Services;
using SDiProgrammingTestProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace SDiProgrammingTestProject.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index()
        {
            RequestService requestService = new RequestService();
            var response = await requestService.Get<List<Infrastructure.Models.PersonGPA>>("PersonGPA");
            var viewModel = new HomeViewModel()
            {
                PersonGPAs = response
            };
            return View(viewModel);
        }

        public ActionResult _PersonGPAForm()
        {
            var model = new PersonGPAViewModel();
            return View(model);
        }

        [HttpPost]
        public async Task<ActionResult> Create(Infrastructure.Models.PersonGPA model)
        {
            RequestService requestService = new RequestService();
            var response = await requestService.Post("PersonGPA", model);
            return Json(new {success = false});
        }
        
    }
}