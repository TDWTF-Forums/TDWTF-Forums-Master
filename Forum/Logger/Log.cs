using System;
using System.Diagnostics;

namespace Logger
{
    public static class Log
    {
        public static LogLevel MinimumLogLevel = LogLevel.Debug;
        public enum LogInBatch
        {
            False = 0,
            True = 1
        }

        public enum LogStorage
        {
            Disk = 0,
            Database = 1
        }
        public enum LogLevel
        {
            Debug = 0,
            Info = 1,
            Warn = 2,
            Trace = 3,
            Critical = 4,
            Fatal = 5
        }

        public static void SetMinimumLogLevel(LogLevel logLevel)
        {
            MinimumLogLevel = logLevel;
        }

        public static void WriteLogFile(string message, LogInBatch logInBatch = LogInBatch.False)
        {
            WriteLogFile(LogLevel.Debug, message, logInBatch);
        }

        public static void WriteLogFile(LogLevel logLevel, string message, LogInBatch logInBatch = LogInBatch.False)
        {
            WriteLogFile(LogStorage.Disk, logLevel, message, logInBatch);
        }

        public static void WriteLogFile(LogStorage logStorage, LogLevel logLevel, string message, LogInBatch logInBatch = LogInBatch.False)
        {
#if DEBUG
            Debug.Print(string.Format(@"Log to: {0}|Log Level: {1}|Log In Batch: {2}{3}{4}", logStorage, logLevel, logInBatch, Environment.NewLine, message));
            Console.WriteLine(string.Format(@"Log to: {0}|Log Level: {1}|Log In Batch: {2}{3}{4}", logStorage, logLevel, logInBatch, Environment.NewLine, message));
#endif
            //Todo: Log to disk or DB
        }
    }
}
