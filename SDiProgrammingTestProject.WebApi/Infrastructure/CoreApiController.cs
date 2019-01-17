using SDiProgrammingTest.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SDiProgrammingTestProject.WebApi.Infrastructure
{
    public class CoreApiController : ApiController
    {
        private PersonGPAService _personGPAService;
        protected PersonGPAService personGPAService => _personGPAService ?? (_personGPAService = new PersonGPAService());
    }
}
