<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("emailForgotTitle")}</h2>
            <p>${msg("emailForgotSubtitle")}</p>
            <p class="login-instruction">${msg("emailForgotInstruction")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="username" class="form-label">${msg("usernameOrEmail")}</label>
                        <input tabindex="1" id="username" class="form-control" name="username" value="${(auth.attemptedUsername!'')}" type="text" autofocus autocomplete="off" />
                    </div>
                    <div class="form-group login-button-container">
                        <input tabindex="2" class="login-button" name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        <div class="reset-info">
            <p>${msg("emailInstruction")}</p>
            <div class="back-to-login">
                <a href="${url.loginUrl}">${msg("backToLogin")}</a>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 