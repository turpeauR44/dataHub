<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=social.displayInfo; section>

        <#if section="title">
            ${msg("loginTitle",(realm.displayName!''))}
            <#elseif section="header">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap"
                    rel="stylesheet">
                <link href="${url.resourcesPath}/img/favicon.png" rel="icon" />
                <script>
                    function togglePassword() {
                        var x = document.getElementById("password");
                        var v = document.getElementById("vi");
                        if (x.type === "password") {
                            x.type = "text";
                            v.src = "${url.resourcesPath}/img/eye.png";
                        } else {
                            x.type = "password";
                            v.src = "${url.resourcesPath}/img/eye-off.png";
                        }
                    }
                </script>
                <#elseif section="form">
                    <#if realm.password>
                        <div>
                            <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}"
                                method="post">

                                <div class="box-container">
                                    <div>
                                        <h1 class="application-name">Libre</h1>
                                        <span class="description">Sign in to your account</span>
                                    </div>
                                    <div class="container-input">
                                        <small>Email or username</small>
                                        <input id="username" class="login-field" placeholder="." type="text"
                                            name="username" tabindex="1">
                                        <#if message?has_content>
                                            <div class="alert alert-${message.type}">
                                                <#if message.type='success'><span
                                                        class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                                <#if message.type='warning'><span
                                                        class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                                <#if message.type='error'><span
                                                        class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                                                <#if message.type='info'><span
                                                        class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                                <span class="message-text">${message.summary}</span>
                                            </div>
                                        </#if>
                                    </div>

                                    <div class="container-password container-input">
                                        <small>Password</small>
                                        <div class="input-password">
                                            <input id="password" class="login-field" placeholder="" type="password"
                                                name="password" tabindex="2">
                                            <label class="visibility" id="v" onclick="togglePassword()"><img id="vi"
                                                    src="${url.resourcesPath}/img/eye-off.png"></label>
                                        </div>
                                    </div>
                                    <input class="submit" type="submit" value="${msg(" Sign in")}" tabindex="3">
                            </form>
                        </div>
                    </#if>
                    <#if social.providers??>
                        <p class="para">${msg("selectAlternative")}</p>
                        <div id="social-providers">
                            <#list social.providers as p>
                                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';"
                                    value="${p.displayName}" />
                            </#list>
                        </div>
                    </#if>
                    <div>
                        <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
                    </div>
        </#if>

    </@layout.registrationLayout>