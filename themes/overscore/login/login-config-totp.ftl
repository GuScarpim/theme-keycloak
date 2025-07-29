<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('totp'); section>
    <#if section = "header">
        <div class="header-content">
            <h2>${msg("configureTotpTitle")}</h2>
            <p>${msg("configureTotpSubtitle")}</p>
            <p class="login-instruction">${msg("configureTotpInstruction")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-totp-settings-form" action="${url.loginAction}" method="post">
                    <div class="totp-setup">
                        <div class="qr-code">
                            <img src="data:image/png;base64,${totp.policy.qrCode}" alt="QR Code" />
                        </div>
                        
                        <div class="totp-info">
                            <p><strong>${msg("totpStep1")}</strong></p>
                            <p>${msg("totpStep1Description")}</p>
                            
                            <p><strong>${msg("totpStep2")}</strong></p>
                            <p>${msg("totpStep2Description")}</p>
                            
                            <div class="totp-secret">
                                <label>${msg("totpSecret")}:</label>
                                <code>${totp.policy.totpSecretEncoded}</code>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="totp" class="form-label">${msg("authenticatorCode")}</label>
                        <input tabindex="1" id="totp" class="form-control" name="totp" type="text" autofocus autocomplete="off" />
                    </div>

                    <div class="form-group login-button-container">
                        <input tabindex="2" class="login-button" name="submitAction" id="kc-totp-submit" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 