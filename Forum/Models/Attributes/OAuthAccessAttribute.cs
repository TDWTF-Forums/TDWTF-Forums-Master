using System;
using OAuthPermission = Models.ApiModels.EnumModel.OAuthPermission;

namespace Models.Attributes
{
    [AttributeUsage(AttributeTargets.All, AllowMultiple = true)]
    public class RequiredOAuthPermission : Attribute
    {
        private OAuthPermission _requiredOAuthPermission { get; set; }

        public RequiredOAuthPermission(OAuthPermission permission)
        {
            _requiredOAuthPermission = permission;
        }
    }
}
