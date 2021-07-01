using Proyecto.Entities.Cabins;
using Proyecto.Entities.Managers;
using Proyecto.Entities.Types;

namespace Proyecto.Entities.EmployeeAddresses
{
    public class EmployeeAddress
    {
        public int Id { get; set; }
        public string Suburb { get; set; }
        public string Street { get; set; }
        public int HouseNo { get; set; }
        public string Municipality { get; set; }
        public string Department { get; set; }
        
        //Foreign Key
        public EmployeeAddress EmployeeAddresses { get; set; }
        public Manager Managers { get; set; }
        public Cabin Cabins { get; set; }
        public Type Types { get; set; }
    }
}