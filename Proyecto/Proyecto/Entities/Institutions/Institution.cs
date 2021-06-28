namespace Proyecto.Entities.Institutions
{
    public class Institution
    {
        public int Id { get; set; }
        public string InstitutionName { get; set; }

        public Institution(string institutionName)
        {
            this.InstitutionName = institutionName;
        }
    }
}