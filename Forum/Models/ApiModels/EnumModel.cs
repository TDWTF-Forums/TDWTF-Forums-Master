using System;

namespace Models.ApiModels
{
    public static class EnumModel
    {
        public enum VisibilityLevel
        {
            None = 0,
            Admin = 1,
            Moderator = 2,
            User = 3,
            Guest = 4
        }

        [Flags]
        public enum OAuthPermission
        {
            All = 0,
            AdminRead = 1,
            AdminEdit = 2,
            ModeratorRead = 3,
            ModeratorEdit = 4,
            UserRead = 5,
            UserEdit = 6,
            UserSensitive = 7,
            GuestRead = 99
        }
    }
}
