namespace Proyecto.Entities.VaccineStatus
{
    public class VaccineState
    {
        public int Id { get; set; }
        public string VaccineStep { get; set; }

        public VaccineState(string vaccineStep)
        {
            this.VaccineStep = vaccineStep;
        }
    }
}