namespace Models.ApiModels
{
    public class ForumTopicModel
    {
        public int ForumTopicID { get; set; }
        public ForumPostListModel ForumPostList { get; set; }
        public ReputationModel Reputation { get; set; }
        public GatedAccessModel GatedAccess { get; set; }
    }
}
