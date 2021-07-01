using Proyecto.Entities.Employees;
using Proyecto.Entities.Registers;

namespace Proyecto.Entities.RegistersXEmployees
{
    public class RegisterXEmployee
    {
        public int Id { get; set; }
        
        //Foreign Key
        public Register Registers { get; set; }
        public Employee Employees { get; set; }
    }
}