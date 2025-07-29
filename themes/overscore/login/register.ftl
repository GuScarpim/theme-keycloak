<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("registerTitle")}</h2>
            <p>${msg("registerSubtitle")}</p>
            <p class="login-instruction">${msg("registerInstruction")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-register-form" action="${url.registrationAction}" method="post">
                    <div class="form-group">
                        <label for="firstName" class="form-label">${msg("firstName")}</label>
                        <input tabindex="1" id="firstName" class="form-control" name="user.attributes.firstName" value="${(register.formData['user.attributes.firstName']!'')}" type="text" autofocus autocomplete="off" />
                    </div>

                    <div class="form-group">
                        <label for="lastName" class="form-label">${msg("lastName")}</label>
                        <input tabindex="2" id="lastName" class="form-control" name="user.attributes.lastName" value="${(register.formData['user.attributes.lastName']!'')}" type="text" autocomplete="off" />
                    </div>

                    <div class="form-group">
                        <label for="email" class="form-label">${msg("email")}</label>
                        <input tabindex="3" id="email" class="form-control" name="user.attributes.email" value="${(register.formData['user.attributes.email']!'')}" type="text" autocomplete="off" />
                    </div>

                    <div class="form-group">
                        <label for="username" class="form-label">${msg("username")}</label>
                        <input tabindex="4" id="username" class="form-control" name="username" value="${(register.formData.username!'')}" type="text" autocomplete="off" />
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                        <div class="form-group">
                            <label for="email" class="form-label">${msg("email")}</label>
                            <input tabindex="5" id="email" class="form-control" name="user.attributes.email" value="${(register.formData['user.attributes.email']!'')}" type="text" autocomplete="off" />
                        </div>
                    </#if>

                    <#if passwordRequired??>
                        <div class="form-group">
                            <label for="password" class="form-label">${msg("password")}</label>
                            <input tabindex="6" id="password" class="form-control" name="user.attributes.password" type="password" autocomplete="off" />
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                            <input tabindex="7" id="password-confirm" class="form-control" name="user.attributes.password-confirm" type="password" autocomplete="off" />
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div class="form-group">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </#if>

                    <div class="form-group login-button-container">
                        <input tabindex="8" class="login-button" name="register" id="kc-register" type="submit" value="${msg("doRegister")}"/>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        <div class="register-info">
            <p>${msg("registerInfo")}</p>
            <div class="back-to-login">
                <a href="${url.loginUrl}">${msg("backToLogin")}</a>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 