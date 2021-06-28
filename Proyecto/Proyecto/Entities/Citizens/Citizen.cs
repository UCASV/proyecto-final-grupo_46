using System.ComponentModel.DataAnnotations;
using Proyecto.Entities.CitizenAddresses;
using Proyecto.Entities.Diseases;
using Proyecto.Entities.Doses;
using Proyecto.Entities.Institutions;
using Proyecto.Entities.PhoneNumbers;
using Proyecto.Entities.VaccineStatus;

namespace Proyecto.Entities.Citizens
{
    public class Citizen
    {
        [Key]
        public int Id { get; set; }
        public string Dui { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        
        public CitizenAddress CitizenHouseAddresses { get; set; }
        public Dose Doses { get; set; }
        public Disease Diseases { get; set; }
        public Institution Institutions { get; set; }
        public VaccineState VaccineStatus { get; set; }

        public Citizen(string dui, string name, string email)
        {
            Dui = dui;
            Name = name;
            Email = email;
        }

    }
}