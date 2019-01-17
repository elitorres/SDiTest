using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SDiProgrammingTestProject.Core.DBModels;

namespace SDiProgrammingTestProject.DAL.Interface
{ 
    public interface IBase<T> where T: class
    {
        IEnumerable<T> GetAll();
        T Insert(T obj);
        T MapEntity<S>(S entity);
    }
}
