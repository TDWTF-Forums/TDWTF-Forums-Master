namespace Models.ApiModels
{
    public static class ApiVersioningModel
    {
        public static int VersionID { get; set; }
        public static string FullVersionString { get; set; }
        public static int MajorVersion { get; set; }
        public static int MinorVersion { get; set; }
        public static int RevisionVersion { get; set; }
        public static int BuildVersion { get; set; }

        static ApiVersioningModel()
        {
            // Todo: Move this to DB
            VersionID = 1;
            FullVersionString = "1.0.0.0";
            MajorVersion = 1;
            MinorVersion = 0;
            RevisionVersion = 0;
            BuildVersion = 0;
        }
    }
}
