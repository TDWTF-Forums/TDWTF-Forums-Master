using System;
using Models.Attributes;
using OAuthPermission = Models.ApiModels.EnumModel.OAuthPermission;

namespace Models.ApiModels
{
    public class ForumPostModel
    {
        [AutoDocument(typeof(int), "PostID", "Forum post ID", 1, true)]
        public int PostID { get; set; }
        
        [AutoDocument(typeof(string), "PostRawMessage", "Raw post text, unaltered in any way from what the user input.", 1, false)]
        public string PostRawMessage { get; set; }
        
        [AutoDocument(typeof(string), "PostHtmlMessage", "Generated post HTML output. This will be the display HTML for the post after filtering.", 1, false)]
        public string PostHtmlMessage { get; set; }
        
        [AutoDocument(typeof(ForumUserModel), "PostAuthor", "Forum user information. This is the author of the post.", 1, false)]
        public ForumUserModel PostAuthor { get; set; }
        
        [AutoDocument(typeof(ReputationModel), "Reputation", "Post reputation. Cumulative likes/dislikes/honor/dishonor scores", 1, false)]
        public ReputationModel Reputation { get; set; }

        [AutoDocument(typeof(GatedAccessModel), "GatedAccess", "Gated access defines information about post visibility, whether or not the post is considered deleted, etc.", 1, false)]
        [RequiredOAuthPermission(OAuthPermission.AdminRead | OAuthPermission.ModeratorRead)]
        public GatedAccessModel GatedAccess { get; set; }
    }
}
