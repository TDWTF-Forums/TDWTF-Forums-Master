using System.Collections.Generic;

namespace Models.ApiModels
{
    public class ForumPostListModel
    {
        public int ForumPostListID { get; set; }
        public List<ForumPostModel> ForumPostList { get; set; }
    }
}
