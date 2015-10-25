using System.Collections.Generic;

namespace Models.ApiModels
{
    public class ForumCategoryModel
    {
        public int ForumCategoryID { get; set; }
        public List<ForumTopicSummaryModel> CategoryTopics { get; set; }

    }
}
