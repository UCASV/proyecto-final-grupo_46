using Proyecto.Entities.Citizens;

namespace Proyecto.Entities.PhoneNumbers
{
    public class PhoneNumber
    {
        public int Id { get; set; }
        public string TelephoneNumber { get; set; }
        
        //Foreign Key
        public Citizen Citizens { get; set; }

        public PhoneNumber(string phoneNumber)
        {
            this.TelephoneNumber = phoneNumber;
        }
    }
}