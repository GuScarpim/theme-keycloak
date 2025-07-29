<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('otp'); section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("otpTitle")}</h2>
            <p>${msg("otpSubtitle")}</p>
            <p class="login-instruction">${msg("otpInstruction")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-otp-login-form" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="otp" class="form-label">${msg("otpLabel")}</label>
                        <input tabindex="1" id="otp" class="form-control" name="otp" type="text" autofocus autocomplete="off" />
                    </div>

                    <div class="form-group login-button-container">
                        <input tabindex="2" class="login-button" name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 