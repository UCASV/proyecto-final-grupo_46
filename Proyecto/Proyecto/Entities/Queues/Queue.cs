using System;
using Proyecto.Entities.Citizens;

namespace Proyecto.Entities.Queues
{
    public class Queue
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public DateTime Time { get; set; }
        
        //Foreign Key
        public Citizen Citizens { get; set; }

        public Queue(DateTime date, DateTime time)
        {
            this.Date = date;
            this.Time = time;
        }
    }
}