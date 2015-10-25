using System.Collections.Generic;

namespace Models.ApiModels
{
    public class ForumTopicListModel
    {
        public int ForumTopicListID { get; set; }
        public List<ForumTopicModel> ForumTopicList { get; set; }
    }
}
