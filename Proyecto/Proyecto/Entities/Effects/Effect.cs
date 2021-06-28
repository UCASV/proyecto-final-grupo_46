namespace Proyecto.Entities.Effects
{
    public class Effect
    {
        public int Id { get; set; }
        public string EffectName { get; set; }

        public Effect(string effect)
        {
            this.EffectName = effect;
        }
    }
}