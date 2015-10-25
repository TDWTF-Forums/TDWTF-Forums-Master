using System;
using OAuthPermission = Models.ApiModels.EnumModel.OAuthPermission;

namespace Models.Attributes
{
    [AttributeUsage(AttributeTargets.All, AllowMultiple = true)]
    public class AutoDocumentAttribute : Attribute
    {
        private Type attributeType { get; set; }
        private string attributeName { get; set; }
        private string attributeDescription { get; set; }
        private int apiVersionID { get; set; }
        private bool isUniqueIdentifier { get; set; }
        private OAuthPermission minimumOAuthRequired { get; set; }

        public AutoDocumentAttribute(Type _attributeType, string _attributeName, string _attributeDescription, int _apiVersionID, bool _isUniqueIdentifier, OAuthPermission _minimumOAuthPermission = OAuthPermission.All)
        {
            attributeType = _attributeType;
            attributeName = _attributeName;
            attributeDescription = _attributeDescription;
            apiVersionID = _apiVersionID;
            isUniqueIdentifier = _isUniqueIdentifier;
            minimumOAuthRequired = _minimumOAuthPermission;
        }
    }
}
