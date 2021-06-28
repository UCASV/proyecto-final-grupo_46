namespace Proyecto.Entities.CitizenAddresses
{
    public class CitizenAddress
    {
        public int Id { get; set; }
        public string Suburb { get; set; }
        public string Street { get; set; }
        public int HouseNo { get; set; }
        public string Municipality { get; set; }
        public string Department { get; set; }

        public CitizenAddress(string suburb, string street, int houseNo, string municipality, string department)
        {
            this.Suburb = suburb;
            this.Street = street;
            this.HouseNo = houseNo;
            this.Municipality = municipality;
            this.Department = department;
        }
    }
}