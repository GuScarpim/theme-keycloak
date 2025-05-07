<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link href="${url.resourcesPath}/css/styles.css" rel="stylesheet" />
</head>

<body>
    <div class="login-container">
        <div class="left-panel">
            <div class="left-content">
                <div class="illustration">
                    <img src="${url.resourcesPath}/img/overscore_logo.svg" alt="overscore" class="person-img" />
                </div>
                <p class="welcome-text">
                    ${msg("welcomeMessage")}
                </p>
            </div>
        </div>
        <div class="right-panel">
            <div class="right-content">
                <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                    <div class="language-selector">
                        <div class="language-dropdown">
                            <div class="language-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <line x1="2" y1="12" x2="22" y2="12"></line>
                                    <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
                                </svg>
                            </div>
                            <select id="kc-locale-dropdown" onchange="window.location.href = this.value">
                                <#list locale.supported as l>
                                    <option value="${l.url}" <#if l.label == locale.current>selected</#if>>
                                        <#if l.label == "en" || l.label == "en-US">English</#if>
                                        <#if l.label == "pt-BR" || l.label == "pt">Português</#if>
                                        <#if l.label == "es">Español</#if>
                                        <#if l.label != "en" && l.label != "en-US" && l.label != "pt-BR" && l.label != "pt" && l.label != "es">${l.label}</#if>
                                    </option>
                                </#list>
                            </select>
                        </div>
                    </div>
                </#if>

                <#nested "header">

                <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                    <div class="alert alert-${message.type}">
                        <#if message.type = 'success'><span class="success-icon"></span></#if>
                        <#if message.type = 'warning'><span class="warning-icon"></span></#if>
                        <#if message.type = 'error'><span class="error-icon"></span></#if>
                        <#if message.type = 'info'><span class="info-icon"></span></#if>
                        <span class="message-text">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>

                <#nested "form">

                <#if displayInfo>
                    <#nested "info">
                </#if>
            </div>
        </div>
    </div>
    <script src="${url.resourcesPath}/js/language-selector.js"></script>
</body>
</html>
</#macro>
