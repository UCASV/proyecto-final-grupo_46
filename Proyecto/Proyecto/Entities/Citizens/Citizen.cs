using System.ComponentModel.DataAnnotations;

namespace Proyecto.Entities.Citizens
{
    public class Citizen
    {
        [Key]
        public int Id { get; set; }
        public string Dui { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        
        public CitizenAddresses CitizenAdresses { get; set; }
        public Doses Doses { get; set; }
        public 
        
        
        
    }
}