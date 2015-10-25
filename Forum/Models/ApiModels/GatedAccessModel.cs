using VisibilityLevel = Models.ApiModels.EnumModel.VisibilityLevel;

namespace Models.ApiModels
{
    public class GatedAccessModel
    {
        public VisibilityLevel VisibilityDefaultLevel { get; set; }
        public bool IsDeleted { get; set; }
    }
}
