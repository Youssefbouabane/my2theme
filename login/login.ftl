<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
    
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
        <div class="login-reg-panel">
            <div class="login-info-box">
                <h2>J’ai déjà un compte !</h2>
                <p>Plateforme de digitalisation du contrat
                    d’architecte</p>
                <label id="label-register" for="log-reg-show" class="btn-org">SE CONNECTER</label>
                <input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
            </div>
                                
            <div class="register-info-box"> 
                <h2>Vérification du visa du contrat</h2>
                <p>Plateforme de digitalisation du contrat d’architecte</p>
                <label id="label-login" style="text-transform: uppercase;" class="btn-org" for="log-login-show">Vérifier</label>
                <input type="radio" name="active-log-panel" id="log-login-show">
            </div>
                                
            <div class="white-panel">
                <div class="login-show">
                    <h2>Se connecter</h2>
                    <div class="form-container-lgn"> 
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <div class="${properties.kcFormGroupClass!}">
                                <#if messagesPerField.existsError('username','password')>
                                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" style="color: #dc6e06;" aria-live="polite">
                                            Adresse e-mail ou mot de passe invalide
                                        </span>
                                        </#if>
                                <div class="${properties.kcInputWrapperClass!}">
                                    <div class="group inputHL">      
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!} inputHL" name="username" required valuex="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                 />                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="inputHL" >E-mail</label>
                                        <i class="fa fa-envelope iconHL"></i>
                                    </div>
                                         
                                   
                                </div>
                                <div class="${properties.kcFormGroupClass!} group inputHL">
                                    <!-- <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label> -->
                                    <div class="group inputHL">      
                                        <input tabindex="2" id="password" class="${properties.kcInputClass!} inputHL" name="password" required type="password" autocomplete="off"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                 />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="inputHL" >Mot de passe</label>
                                        <i class="fa fa-lock iconHL"></i>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                
                
                                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                    <input type="submit" class="btn-org" style="border: none;padding: 3px 10px;border-radius: 2px;" value="Se connecter" value="${msg("doSubmit")}"/>
                                </div>
                            </div>
                        </form>

                    </div>
                    <!-- <input type="button" class="btn-org" value="Se connecter" (click)="connect(f)" onclickcc="location.href='home'"> -->
                    <a href="${url.loginResetCredentialsUrl}" style="color: #999;margin-top: 20px;">Mot de passe oublié ?</a>
                </div>
                <div class="register-show">
                    <h2>Vérification Contrat</h2>
                    <div  *ngIf="show=='dactif'" id="show-dactif" class="form-container">
                       <form #f="ngForm">
                        <div class="group inputHL">      
                            <input class="inputHL" name="timbre" ngModel type="text" required>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label class="inputHL" >Timbre numérique</label>
                            <i class="fa fa-stamp iconHL"></i>
                          </div>
                          <input type="button" onclick="checkContrat()" class="btn-org" value="Vérifier">
                       </form>    
                    </div>
                    <div *ngIf="show=='load'" id="show-load" class="gl-load-gif">
                        <img  style="height: 142px;" src="${url.resourcesPath}/img/load.gif"/>
                    </div>
                    <div *ngIf="show=='actif'" id="show-actif" class="form-container">
                        <div class="card">
                            <div class="prv-card-bc">
                                <div  >
                                    <span onclick="ignore()" style="    cursor: pointer;
                                    position: absolute;
                                    right: 15px;
                                    font-size: 23px;
                                    top: 15px;">X</span>
                                    <h5>CONTRAT D'ARCHITECTE</h5>
                                    <div class="det-card" >
                                        <label>
                                            Architecte
                                        </label>
                                        <span id="nomComplet">
                                            {{contrat.architecte.nomComplet}}
                                        </span>
                                    </div>
                                    <div class="det-card" >
                                        <label>
                                            Date d'envoi
                                        </label>
                                        <span id="createDateTime">
                                            Le {{ contrat.createDateTime.toString().split("T")[0] }}
                                        </span>
                                    </div>
                                    <div class="det-card" >
                                        <label>
                                            Commune
                                        </label>
                                        <span id="commune">
                                            {{ contrat.donneesProjets.commune.valeur }}
                                        </span>
                                    </div>
                                    <div class="det-card" >
                                        <label>
                                            Statut
                                        </label>
                                        <div  id="isSignedn" class="stat">Non-visé</div>
                                        <div  id="isSigned" style="color: green !important;" class="stat">visé</div>
                                    </div>
                                    
                                </div>
                                <div class="prv-card-bc-det">
                                    <div class="stat" style="color: #FFF !important;" onclick="openDoc()">AFFICHER DOCUMENT</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div *ngIf="show=='notfound'" id="show-notfound" class="gl-load-gif" style="font-size: 14px;">
                        <p>Ce timbre n’existe pas. Veuillez renseigner le timbre du document tel qu’il figure sur le contrat.</p>
                        <input type="button" (click)="ignore()" class="btn-org" value="Réessayer">
                    </div>
        
                </div>
            </div>
        </div>
        </#if>
        </div>
    </div>
    </#if>

</@layout.registrationLayout>
