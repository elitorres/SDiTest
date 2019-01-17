using SDiProgrammingTestProject.Infrastructure.Models;
using SDiProgrammingTestProject.WebApi.Infrastructure;
using Swashbuckle.Swagger.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SDiProgrammingTestProject.WebApi.Controllers
{
    public class PersonGPAController : CoreApiController
    {
        // GET api/<controller>
        /// <summary>
        /// Get a list of PersonGPA
        /// </summary>
        /// <returns></returns>
        [SwaggerResponse(HttpStatusCode.BadRequest)]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(List<PersonGPA>))]
        public HttpResponseMessage Get()
        {
            // Get all gpa's
            var personGPAs = personGPAService.GetAllGPAs();

            // create response
            var response = Request.CreateResponse(HttpStatusCode.OK, personGPAs);

            return response;
        }

        /// <summary>
        /// Create Person Gpa
        /// </summary>
        /// <param name="personGPA"></param>
        /// <returns></returns>
        [SwaggerResponse(HttpStatusCode.BadRequest)]
        [SwaggerResponse(HttpStatusCode.OK)]
        public HttpResponseMessage Post([FromBody]PersonGPA personGPA)
        {
            var pgpa = personGPAService.CreatePersonGPA(personGPA);

            if (pgpa == null)
                return Request.CreateResponse(HttpStatusCode.BadRequest);

            return Request.CreateResponse(HttpStatusCode.OK);

        }
    }
}