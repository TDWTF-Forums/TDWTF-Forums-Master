using System.Collections.Generic;

namespace Models.ApiModels
{
    public class ForumTopicSummaryModel
    {
        public int ForumTopicSummaryID { get; set; }
        public ForumPostModel FirstPost { get; set; }
        public List<ForumUserModel> TopicTopPosters { get; set; }
    }
}
