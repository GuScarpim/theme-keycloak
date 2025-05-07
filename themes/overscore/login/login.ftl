<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("loginWelcomeTitle")}</h2>
            <p>${msg("loginWelcomeSubtitle")}</p>
            <p class="login-instruction">${msg("loginInstruction")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="username" class="form-label">${msg("usernameLabel")}</label>
                        <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                    </div>

                    <div class="form-group">
                        <label for="password" class="form-label">${msg("passwordLabel")}</label>
                        <input tabindex="2" id="password" class="form-control" name="password" type="password" autocomplete="off" />
                    </div>

                    <div class="forgot-password">
                        <#if realm.resetPasswordAllowed>
                            <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("forgotPassword")}</a>
                        </#if>
                    </div>

                    <div class="form-group login-button-container">
                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <input tabindex="4" class="login-button" name="login" id="kc-login" type="submit" value="${msg("loginButton")}"/>
                    </div>

                    <div class="register-link">
                        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                            <a tabindex="6" href="${url.registrationUrl}">${msg("createAccount")}</a>
                        </#if>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
