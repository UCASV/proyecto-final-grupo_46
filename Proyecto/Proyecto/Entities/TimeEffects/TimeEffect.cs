using System;
using System.Windows.Forms.VisualStyles;

namespace Proyecto.Entities.TimeEffects
{
    public class TimeEffect
    {
        public int Id { get; set; }
        public DateTime TimeForEffect { get; set; }

        public TimeEffect(DateTime timeEffect)
        {
            this.TimeForEffect = timeEffect;
        }
    }
}