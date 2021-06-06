<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
    Vous devez changer votre mot de passe pour activer votre compte.
    <#elseif section = "form">
    
        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="login-reg-panel">
                <div class="login-show show-log-panel">
                    <div class="white-panel">
                        <div class="login-show">
                            <h2>Changer mot de passe</h2>
                            <br/>
                        
            <input type="text" id="username" name="username" value="${username}" autocomplete="username"
                   readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

            <div class="${properties.kcFormGroupClass!}">
               
                <div class="${properties.kcInputWrapperClass!}">
                   
                    <div class="group inputHL">      
                        <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!} inputHL"
                        autofocus autocomplete="new-password"
                        aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                 />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label class="inputHL" >Nouveau mot de passe</label>
                        <i class="fa fa-lock iconHL"></i>
                    </div>
                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                
                <div class="group inputHL">      
                    <input type="password" id="password-confirm" name="password-confirm"
                           class="${properties.kcInputClass!} inputHL"
                           autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                    />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label class="inputHL" >Confirmer mot de passe</label>
                    <i class="fa fa-lock iconHL"></i>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if>

                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <#if isAppInitiatedAction??>
                            <div class="checkbox">
                                <label><input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked> ${msg("logoutOtherSessions")}</label>
                            </div>
                        </#if>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#if isAppInitiatedAction??>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                    <#else>
                        <input type="submit" class="btn-org" style="border: none;padding: 3px 10px;border-radius: 2px;" value="Envoyer" value="${msg("doSubmit")}"/>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>    
            </div>
        </form>
    </#if>
</@layout.registrationLayout>