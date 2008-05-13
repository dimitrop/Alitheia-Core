<%@ page import="java.util.*" %>
<%@ page import="eu.sqooss.webui.*" %>
<%@ page session="true" %>
<%!
ResourceBundle configProperties = null;
String initError = null;


public void jspInit() {
    try {
        configProperties = ResourceBundle.getBundle("/config");
    }
    catch (MissingResourceException ex) {
        configProperties = null;
        initError = ex.toString();
    }
}
%>
<%@ include file="/inc/functions.jsp" %>
<%


//Project selectedProject = null;

Long projectId = null;
if (request.getParameter("pid") != null) {
    projectId = getId(request.getParameter("pid"));
}
/*
    This file instaniates shared objects and defines shared variables
    commonly used by the majority of the WebUI JSP pages. Therefore, it
    should be included at the top of every JSP page.
*/

String title    = "Alitheia";
String msg      = "";

%>


<jsp:useBean id="terrier"
    class="eu.sqooss.webui.Terrier"
    scope="session">
    <%
        // Initialise the Terrier's configuration properties
        terrier.initConfig(configProperties);
    %>
    <jsp:setProperty name="terrier" property="*"/>
</jsp:useBean>

<%
if (terrier == null) {
    out.println("Terrier is NOT there");
} else {
    out.println("Terrier is there");
}
%>

<jsp:useBean
    id="user"
    class="eu.sqooss.webui.User"
    scope="session">
    <jsp:setProperty name="user" property="loggedIn" value="false"/>
</jsp:useBean>

<jsp:useBean
    id="selectedProject"
    class="eu.sqooss.webui.Project"
    scope="session">
    <jsp:setProperty name="selectedProject" property="terrier" value="<%= terrier %>"/>
    <jsp:setProperty name="selectedProject" property="id" value="<%= projectId %>"/>
</jsp:useBean>


<jsp:useBean id="validator"
    class="eu.sqooss.webui.InputValidator"
    scope="session"/>
<jsp:setProperty name="validator" property="*"/>

<%


// TODO: Move into a separate Java class file
final String ACT_REQ_LOGIN = "Sign in";
final String ACT_REQ_REGISTER = "Register";

// Action parameter sent by various input forms
String postAction = request.getParameter("action");
if (postAction == null) {
    postAction = new String("");
}

// TODO: Move into a separate Java class file
final String RES_REG_SUCCESS = "RegistrationSuccessful";
final String RES_LOGIN_SUCCESS = "LoginSuccessful";

// Final result from the action execution
String actionResult = null;

// Login form parameters
String username = request.getParameter("username");
String password = request.getParameter("password");

// Registration form parameters
String regPassword = request.getParameter("confirm");
String regEmail = request.getParameter("email");

// Flag for failed authentication or registration
boolean loginFailure = false;


String errorMsg = "";

if (user.getLoggedIn()) {
    msg = "Signed in as " + user.getName() + ".";
    msg = msg + " <a href=\"/logout.jsp\">sign out</a>";
}
// Check for registration request
else if (postAction.compareToIgnoreCase(ACT_REQ_REGISTER) == 0) {
    if (validator.isEmpty(username)) {
        errorMsg += "Invalid username!<br />";
        loginFailure = true;
    }
    if (validator.isEmpty(password)) {
        errorMsg += "Invalid password!<br />";
        loginFailure = true;
    }
    if (validator.isEmpty(regPassword)) {
        errorMsg += "Invalid password!<br />";
        loginFailure = true;
    }
    if (validator.isEmpty(regEmail)) {
        errorMsg += "Invalid email address!<br />";
        loginFailure = true;
    }
    // Check if both password match
    if (password.compareTo(regPassword) != 0) {
        errorMsg += "Passwords do not match!<br />";
        loginFailure = true;
    }
    // Try to register the new user for the SQO-OSS framework
    if (!loginFailure) {
        if (terrier.registerUser(username, password, regEmail)) {
            actionResult = RES_REG_SUCCESS;
        }
        else {
            errorMsg += "An user with the same name already exists!";
        }
    }
}
// Check for login request
else if (postAction.compareToIgnoreCase(ACT_REQ_LOGIN) == 0) {
    if (validator.isEmpty(username)) {
        errorMsg += "Invalid username!<br />";
        loginFailure = true;
    }
    // Try to login with the provided account into the SQO-OSS framework
    if (!loginFailure) {
        if (terrier.loginUser(username, password)) {
            User userInfo = terrier.getUserByName(username);
            if (userInfo != null) {
                actionResult = RES_LOGIN_SUCCESS;
                user.copy(userInfo);
                user.setLoggedIn(true);
            }
        }
        else {
            errorMsg = "Wrong username or password!";
        }
    }
}


%>