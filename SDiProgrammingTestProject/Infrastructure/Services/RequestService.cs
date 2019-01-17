using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace SDiProgrammingTestProject.Infrastructure.Services
{
    public class RequestService
    {
        public async Task<T> Get<T>(string apiMethod) where T : class, new()
        {
            T obj = new T();
            
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:58507/api/");

                var response = await client.GetAsync(apiMethod);

                if(response.IsSuccessStatusCode)
                {
                    obj = await response.Content.ReadAsAsync<T>();
                }
                
            }

            return obj;
        }

        public async Task<bool> Post<T>(string apiMethod, T obj ) where T : class, new()
        {
            bool result = false;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:58507/api/");

                var response = await client.PostAsJsonAsync(apiMethod, obj);

                result = response.IsSuccessStatusCode;

            }

            return result;
        }
    }
}