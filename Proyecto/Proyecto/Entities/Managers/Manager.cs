namespace Proyecto.Entities.Managers
{
    public class Manager
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        
        //Foreign Key
        public Register Registers { get; set; }
    }
}