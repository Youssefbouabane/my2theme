<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    <div class="login-reg-panel2">
        <div class="white-panel2">
            

        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
           <div class="show-log-panel" style="padding: 1px;">
            <div class="row" style="margin-top:25px">
                <ol class="show-grid col-md-8 col-md-offset-2">
                      <li class="col-md-6 active" id="btndp">
                       <div class="media">
                          <div class="pull-left" href="#">
                            <span class="glyphicon glyphicon-user"></span>
                          </div>
                        <div class="media-body">
                            <h5 class="media-heading"><strong>Step 1:</strong></h5>
                            Données personnelles
                        </div>
                    </div>
                      </li>
                      <li class="col-md-6 inactive" id="btnda">
                      <div class="media">
                          <div class="pull-left" href="#">
                            <span class="glyphicon glyphicon-briefcase"></span>
                          </div>
                        <div class="media-body">
                            <h5 class="media-heading"><strong>Step 2:</strong></h5>
                            Données complémentaires
                        </div>
                    </div>
                      </li>
                      
                </ol>
            </div>
            <div class="row" style="margin: auto">
                <div class="col-md-8 col-md-offset-2" style="text-align: left;padding:0">
                            
                        <fieldset id="dp" style="text-align: left;">
    
                            <div class="form-group col-md-6">
                                <label for="first_name">Nom</label>
                                <input type="text" id="firstName" class="${properties.kcInputClass!}  form-control" name="firstName"
            value="${(register.formData.firstName!'')}" placeholder="Nom"
            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                            />
                            </div>
    
                            <div class="form-group col-md-6">
                                <label for="last_name">Prénom</label>
                                <input type="text" id="lastName" class="${properties.kcInputClass!}  form-control" name="lastName"
                                value="${(register.formData.lastName!'')}" placeholder="Prénom"
                                aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                            />                            </div>
    
                            <div class="form-group col-md-6">
                                <label for="">Email</label>
                                <input type="text" id="email" class="${properties.kcInputClass!}  form-control" name="email"
                                value="${(register.formData.email!'')}" autocomplete="email" placeholder="email"
                                aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"/>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="">Nom d'utilisateur</label>
                                <input type="text" id="username" class="${properties.kcInputClass!}  form-control" name="username"
                                value="${(register.formData.username!'')}" autocomplete="username" placeholder="Nom d'utilisateur"
                                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                            />
                            </div>

                            
    
                            <div class="form-group col-md-6">
                                <label for="password">Mot de Passe</label>
                                <input type="password" id="password" class="${properties.kcInputClass!}  form-control" placeholder="Mot de Passe" name="password"
                                autocomplete="new-password"
                                aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                            />                            </div>
    
                            <div class="form-group col-md-6">
                                <label for="confirm_password">Confirmation mot de passe</label>
                                <input type="password" id="password-confirm" placeholder="Mot de Passe" class="${properties.kcInputClass!}  form-control"
                                name="password-confirm"
                                aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            />      
                                              </div>

                                              <div class="form-group col-md-6">
                                                <label for="last_name">CIN</label>
                                                <input type="text" id="user.attributes.cin" placeholder="CIN" class="${properties.kcInputClass!}  form-control" name="user.attributes.cin"
                                                value="${(register.formData['user.attributes.cin']!'')}"
                                                aria-invalid="<#if messagesPerField.existsError('cin')>true</#if>"
                                            />
                                                                  </div>
                
                                        <div class="form-group col-md-6">
                                            <label for="confirm_password">Conseil régional</label>
                                            <select id="password-confirm" placeholder="Conseil régional" class="${properties.kcInputClass!}  form-control"
                                            name="user.attributes.creg" value="${(register.formData['user.attributes.creg']!'')}"
                                        >
                                        <option value="CROA – zone du centre -">CROA – zone du centre –</option>
                                        <option value="CROA – zone du sud -">CROA – zone du sud –</option>
                                        <option value="CROA – zone eljadida –">CROA – zone eljadida –</option>
                                        <option value="CROA – zone fes –">CROA – zone fes –</option>
                                        <option value="CROA – zone kenitra –">CROA – zone kenitra –</option>
                                        <option value="CROA – zone marrakech safi –">CROA – zone marrakech safi –</option>
                                        <option value="CROA – zone meknes –">CROA – zone meknes –</option>
                                        <option value="CROA – zone nador –">CROA – zone nador –</option>
                                        <option value="CROA – zone oujda –">CROA – zone oujda –</option>
                                        <option value="CROA – zone rabat –">CROA – zone rabat –</option>
                                        <option value="CROA – zone tanger –">CROA – zone tanger –</option>
                                        <option value="CROA – zone tetouan –">CROA – zone tetouan –</option>
                                    </select>                            </div>

                                
    
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="" id="">
                                            J'accepte <a href="#" style="color:orange">les termes et conditions</a>.
                                        </label>
                                    </div>
                                </div>
                            </div>
        
                            
                            <div class="${properties.kcFormGroupClass!} row" style="margin-bottom: 30px;margin-top:20px;text-align: center;">
                                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}" style="display: inline-block;">
                                    <div class="${properties.kcFormOptionsWrapperClass!}">
                                        <span><a class="btn btnbtn" href="${url.loginUrl}">Connexion</a></span>
                                    </div>
                                </div>
                
                                <div id="kc-form-buttons btn" class="${properties.kcFormButtonsClass!}" style="display: inline-block;" >
                                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} btnbtn" onclick="goToStep2()" type="button" value="Suivant"/>
                                </div>
                            </div>
                        </fieldset>
    
                     <fieldset id="da" style="text-align: left;display:none;">
    
                            <div class="form-group col-md-6">
                                <label for="typearch">Architecte de :</label>
                                <select  id="typearch" class="${properties.kcInputClass!}  form-control" value="${(register.formData['user.attributes.typearchi']!'')}"  name="user.attributes.typearchi" >
                                    <option value="Secteur privé">Secteur privé</option>
                                    <option value="Secteur privé salarié">Secteur privé salarié</option>
                                    <option value="Secteur publique">Secteur publique</option>
                                    <option value="Enseignant">Enseignant</option>
                                </select>
                            </div>

    
                            <div class="form-group col-md-6">
                                <label for="">Numéro de l'autorisation d'exercer</label>
                                <input type="text" id="user.attributes.naexec" placeholder="Numéro de l'autorisation d'exercer" class="${properties.kcInputClass!}  form-control" name="user.attributes.naexec"
            value="${(register.formData['user.attributes.naexec']!'')}"
            aria-invalid="<#if messagesPerField.existsError('naexec')>true</#if>"
        />
                            </div>

                            <div class="form-group col-md-6">
                                <label for="">Date de l'autorisation d'exercer</label>
                                <input type="date" id="user.attributes.daexe" placeholder="Date de l'autorisation d'exercer" class="${properties.kcInputClass!}  form-control" name="user.attributes.daexe"
            value="${(register.formData['user.attributes.daexe']!'')}"
            aria-invalid="<#if messagesPerField.existsError('daexe')>true</#if>"
        />
                            </div>

                            
    
                            <div class="form-group col-md-6">
                                <label for="password">Patente N°</label>
                                <input type="text" id="user.attributes.patente" placeholder="Patente N°" class="${properties.kcInputClass!}  form-control" name="user.attributes.patente"
            value="${(register.formData['user.attributes.patente']!'')}"
            aria-invalid="<#if messagesPerField.existsError('patente')>true</#if>"
        />                           </div>
    
                            <div class="form-group col-md-6">
                                <label for="confirm_password">Domiciliation</label>
                                <input type="text" id="user.attributes.domiciliation" placeholder="Domiciliation" class="${properties.kcInputClass!}  form-control" name="user.attributes.domiiciliation"
            value="${(register.formData['user.attributes.domiiciliation']!'')}"
            aria-invalid="<#if messagesPerField.existsError('domiiciliation')>true</#if>"
        />
                              </div>

                              <div class="form-group col-md-6">
                                <label for="confirm_password">TVA N°</label>
                                <input type="text" id="user.attributes.tva" placeholder="TVA N°" class="${properties.kcInputClass!}  form-control" name="user.attributes.tva"
            value="${(register.formData['user.attributes.tva']!'')}"
            aria-invalid="<#if messagesPerField.existsError('tva')>true</#if>"
        />
                              </div>

                              <div class="form-group col-md-6">
                                <label for="confirm_password">CNSS N°</label>
                                <input type="text" id="user.attributes.cnss"  placeholder="CNSS N°" class="${properties.kcInputClass!}  form-control" name="user.attributes.cnss"
            value="${(register.formData['user.attributes.cnss']!'')}"
            aria-invalid="<#if messagesPerField.existsError('cnss')>true</#if>"
        />
                              </div>

                              <div class="form-group col-md-6">
                                <label for="confirm_password">Adresse du cabinet</label>
                                <input type="text" id="user.attributes.adresse" placeholder="Adresse du cabinet" class="${properties.kcInputClass!}  form-control" name="user.attributes.adresse"
            value="${(register.formData['user.attributes.adresse']!'')}"
            aria-invalid="<#if messagesPerField.existsError('adresse')>true</#if>"
        />
                              </div>
    
                             <div class="col-md-12" style="height: 40px;"></div>
                            
                        <div class="${properties.kcFormGroupClass!} row" style="margin-bottom: 30px;margin-top:20px;text-align: center;">
                            <div id="kc-form-options" class="${properties.kcFormOptionsClass!}" style="display: inline-block;">
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <span><a class="btn btnbtn" onclick="backToStep1()">Retour</a></span>
                                </div>
                            </div>
            
                            <div id="kc-form-buttons btn" class="${properties.kcFormButtonsClass!}" style="display: inline-block;" >
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} btnbtn" type="submit" value="${msg("doRegister")}"/>
                            </div>
                        </div>
    
                        </fieldset> 
    
                        
                    
                </div>
                
            
            </div>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            
            </div>
        </form>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>