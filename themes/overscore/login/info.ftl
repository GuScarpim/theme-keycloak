<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("infoTitle")}</h2>
            <p>${msg("infoSubtitle")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div class="info-message">
                    <#if message?has_content>
                        <div class="alert alert-info">
                            <span class="info-icon"></span>
                            <span class="message-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>
                    
                    <div class="info-actions">
                        <#if skipLink??>
                        <#else>
                            <#if pageRedirectUri?has_content>
                                <a href="${pageRedirectUri}" class="login-button">${msg("doContinue")}</a>
                            <#elseif actionUri?has_content>
                                <a href="${actionUri}" class="login-button">${msg("doContinue")}</a>
                            <#else>
                                <a href="${url.loginUrl}" class="login-button">${msg("backToLogin")}</a>
                            </#if>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 