using System;
using Proyecto.Entities.Effects;
using Proyecto.Entities.TimeEffects;

namespace Proyecto.Entities.Doses
{
    public class Dose
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public DateTime Time { get; set; }
        
        //Foreign Keys
        public Effect Effects { get; set; }
        public TimeEffect TimeEffects { get; set; }
        
    }
}