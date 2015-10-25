using Logger;
using Models.Attributes;
using OAuthPermission = Models.ApiModels.EnumModel.OAuthPermission;

namespace Models.ApiModels
{
    /// <summary>
    /// Manages meta data for users reputation score
    /// Users can influence other users reputation
    /// Reputation can be used to control visibility
    /// </summary>
    public class ReputationModel
    {
        private int likeCount;
        private int dislikeCount;
        private int honorCount;
        private int dishonorCount;

        /// <summary>
        /// Number of times an item has been marked as 'liked'
        /// Incremented when a user presses 'Like'
        /// Decremented when a user 'Unlikes'
        /// </summary>
        public int LikeCount
        {
            get { return likeCount; }
            set
            {
                if (likeCount < 0)
                {
                    Log.WriteLogFile(Log.LogLevel.Critical, "Like count is less than 0");
                    likeCount = 0;
                }
                else
                {
                    likeCount = value;
                }
            }
        }

        /// <summary>
        /// Number of times an item has been marked as 'disliked'
        /// Incremented when a user presses 'Dislike'
        /// Decremented when a user 'Un-Dislikes'
        /// </summary>
        public int DislikeCount
        {
            get { return dislikeCount; }
            set
            {
                if (dislikeCount < 0)
                {
                    Log.WriteLogFile(Log.LogLevel.Critical, "Dislike count is less than 0");
                    dislikeCount = 0;
                }
                else
                {
                    dislikeCount = value;
                }
            }
        }

        /// <summary>
        /// Number of times an item has been given honor
        /// Incremented when a user assigns honor
        /// Can not be decremented
        /// </summary>
        public int HonorCount
        {
            get { return honorCount; }
            set
            {
                if (honorCount < 0)
                {
                    Log.WriteLogFile(Log.LogLevel.Critical, "Honor count is less than 0");
                    honorCount = 0;
                }
                else
                {
                    honorCount = value;
                }
            }
        }

        /// <summary>
        /// Number of times an item has been given dishonor
        /// Incrememented when an item is reported for violating community guidelines
        /// Can not be decremented
        /// Hides an item after a threshold
        /// For reported topics, dishonor is also applied to the original poster
        /// </summary>
        [RequiredOAuthPermission(OAuthPermission.AdminRead | OAuthPermission.ModeratorRead)]
        public int DishonorCount
        {
            get { return dishonorCount; }
            set
            {
                if (dishonorCount < 0)
                {
                    Log.WriteLogFile(Log.LogLevel.Critical, "Dishonor count is less than 0");
                    dishonorCount = 0;
                }
                else
                {
                    dishonorCount = value;
                }
            }
        }
    }
}
