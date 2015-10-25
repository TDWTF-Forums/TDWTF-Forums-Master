using System;
using Logger;

namespace Models.ApiModels
{
    public class ForumUserModel
    {
        // Private fields
        private bool isSuspended { get; set; }
        private bool isBanned { get; set; }

        // Public fields
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string DisplayName { get; set; }
        public string Email { get; set; } // Todo: Enable privacy

        /// <summary>
        /// Returns whether or not a user is suspended. If the suspended until date is not set, or is expired, mark the user as not suspended.
        /// </summary>
        public bool IsSuspended
        {
            get
            {
                if (SuspendedUntil == null || SuspendedUntil < DateTime.UtcNow)
                {
                    return false;
                }
                else
                {
                    return isSuspended;
                }
            }
            set
            {
                if (SuspendedUntil == null || SuspendedUntil < DateTime.UtcNow)
                {
                    Log.WriteLogFile(Log.LogLevel.Critical, "Suspension was set, but suspended until is not set. Cancelling suspension.");
                    isSuspended = false;
                }
                else
                {
                    isSuspended = value;
                }
            }
        }
        public DateTime? SuspendedUntil { get; set; }

        /// <summary>
        /// Bans are permanent unless an admin lifts them. By default, they do not expire.
        /// </summary>
        public bool IsBanned
        {
            get { return isBanned; }
            set
            {
                isBanned = value;
                if (BannedOnDate == null)
                {
                    BannedOnDate = DateTime.UtcNow;
                }
            }
        }
        public DateTime? BannedOnDate { get; set; }

        public ReputationModel Reputation { get; set; }
    }
}
