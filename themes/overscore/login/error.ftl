<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("errorTitle")}</h2>
            <p>${msg("errorSubtitle")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div class="error-message">
                    <#if message?has_content>
                        <div class="alert alert-error">
                            <span class="error-icon"></span>
                            <span class="message-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>
                    
                    <div class="error-actions">
                        <a href="${url.loginUrl}" class="login-button">${msg("backToLogin")}</a>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 