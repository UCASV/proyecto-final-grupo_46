namespace Proyecto.Entities.Diseases
{
    public class Disease
    {
        public int Id { get; set; }
        public string ChronicDisease { get; set; }

        public Disease(string chronicDisease)
        {
            this.ChronicDisease = chronicDisease;
        }
    }
}