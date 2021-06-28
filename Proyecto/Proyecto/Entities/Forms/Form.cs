using System.Net;
using Proyecto.Entities.Citizens;
using Proyecto.Entities.Managers;
using Proyecto.Entities.PriorityGroups;

namespace Proyecto.Entities.Forms
{
    public class Form
    {
        public int Id { get; set; }
        public int NoForm { get; set; }
        
        //Foreign Keys
        public PriorityGroup PriorityGroups { get; set; }
        public Citizen Citizens { get; set; }
        public Manager Managers { get; set; }

        public Form(int id, int noForm)
        {
            this.Id = id;
            this.NoForm = noForm;
        }
    }
}