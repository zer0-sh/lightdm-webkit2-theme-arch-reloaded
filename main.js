var selectedSessionKey;

// Load the wallpaper, the selected user and the session options
window.onload = function() {
    getImg();
    input.focus();
    input.select();
    input.value = lightdm.select_user_hint;
    if(input.value) {
        authenticate(input.value);
    }

    // get the sessions installed
    var sessions = lightdm.sessions;
    var sessionOptions = document.getElementById("session-options");
    var sessionSelectedMessage = document.getElementById("session-selected-message");
    sessionOptions.innerHTML = "";

    // Add each session
    sessions.forEach(function(session) {
        var option = document.createElement("a");
        option.href = "#";
        option.textContent = session.name;
        option.addEventListener("click", function() {
            sessionOptions.querySelectorAll('a').forEach(function(opt) {
                opt.classList.remove("selected");
            });
            this.classList.add("selected");
            sessionSelectedMessage.textContent = "Session changed to " + session.name + ":P";
            // Storage the selected session key
            selectedSessionKey = session.key;
        });
        sessionOptions.appendChild(option);
    });
}

// Listen for the enter key
var input = document.getElementById("input");
input.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {
        authenticate(e.target.value);
    }
});

// Authenticate the user
window.authentication_complete = function() {
    if (lightdm.is_authenticated) {
        console.log("Authenticated!");
        $( 'body' ).fadeOut( 1000, () => {
            // Uses the selected session key
            lightdm.login(lightdm.authentication_user, selectedSessionKey);
        } );
    } else {
        getImg();
        input.value = "";
        input.placeholder = "user";
        input.type = "text";
        input.disabled = false;
        input.focus();
        input.select();
    }
}

function pad(a, b) {
    return (1e15 + a + "").slice(-b);
}
// Add a random wallpaper
function getImg() {
    index = Math.ceil(Math.random() * 32);
    console.log(pad(index,2));
    document.getElementsByTagName('body')[0].style.backgroundImage = 
        "url(wallpapers/" + pad(index, 2) + ".png)";
}

// Authenticate the user
function authenticate(input_text) {
    if(!lightdm.in_authentication || !lightdm.authentication_user) {
        lightdm.authenticate(input_text);
        input.value = "";
        input.type = "password";
        input.placeholder = "password";
        input.disabled = false;
    } else {
        input.disabled = true;
        lightdm.respond(input_text);
    }
}