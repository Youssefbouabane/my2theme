<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
           <div class="login-reg-panel">
            <div class="login-show show-log-panel">
                <div class="white-panel">
                    <div class="login-show">
                        <h2>Mot de passe oublié</h2>
                        <br/>
                        <div class="${properties.kcFormGroupClass!}">
                            
                            <div class="${properties.kcInputWrapperClass!}">
                            
                                
                                <div class="group inputHL">      
                                    <input type="text" id="username" name="username" class="${properties.kcInputClass!} inputHL" autofocus aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="inputHL" >E-mail</label>
                                    <i class="fa fa-lock iconHL"></i>
                                </div>
        
                                <#if messagesPerField.existsError('username')>
                                    <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        Adresse e-mail invalide
                                    </span>
                                </#if>
                            </div>
                        </div>
                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <span><a href="${url.loginUrl}">Revenir à la page de login</a></span>
                                </div>
                            </div>
        
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <input type="submit" class="btn-org" style="border: none;padding: 3px 10px;border-radius: 2px;" value="Envoyer" value="${msg("doSubmit")}"/>
                            </div>
                        </div>
                    </div>       
                </div> 
                
            </div>
                
            </div>
        </form>
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
