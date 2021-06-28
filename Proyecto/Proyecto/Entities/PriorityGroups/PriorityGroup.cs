namespace Proyecto.Entities.PriorityGroups
{
    public class PriorityGroup
    {
        public int Id { get; set; }
        public string PriorityGroupName { get; set; }

        public PriorityGroup(string priorityGroupName)
        {
            this.PriorityGroupName = priorityGroupName;
        }
    }
}