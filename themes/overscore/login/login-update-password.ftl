<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password-new','password-confirm'); section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("updatePasswordTitle")}</h2>
            <p>${msg("updatePasswordSubtitle")}</p>
            <p class="login-instruction">${msg("updatePasswordInstruction")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="password-new" class="form-label">${msg("passwordNew")}</label>
                        <input tabindex="1" id="password-new" class="form-control" name="password-new" type="password" autofocus autocomplete="off" />
                    </div>

                    <div class="form-group">
                        <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                        <input tabindex="2" id="password-confirm" class="form-control" name="password-confirm" type="password" autocomplete="off" />
                    </div>

                    <div class="form-group login-button-container">
                        <input tabindex="3" class="login-button" name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 