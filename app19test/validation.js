
function validation() {
    var msg = "";
    msg += checkname();
    msg += checkage();
    msg += checkcountry();
    msg += checkstate();
    msg += checkcity();


    if (msg == "") {
        return true;
    }
    else {
        alert(msg);
        return false;
    }
}
function checkname() {
    var tp = document.getElementById('txt_name');
    var exp = /^[A-Za-z\s]+$/;
    if (tp.value == "") {
        return 'Please enter your name!!!\n\n';
    }
    else if (exp.test(tp.value)) {
        return "";
    }
    else {
        return 'Only alphabates allowed!!!\n\n';
    }
}


function checkage() {
    var tp = document.getElementById('txt_age');
    var exp = /^[0-9]+$/;
    if (tp.value == "") {
        return 'Please enter your age!!!\n\n';
    }
    else if (exp.test(tp.value)) {
        if (tp.value >= 18) {
            return "";
        }
        else {
            return 'Age should be grather than 18!!!\n\n';
        }

    }
    else {
        return 'only interget allowed!!\n\n';
    }
}

function checkcountry() {
    var tt = document.getElementById('ddl_country');
    if (tt.value == "0") {
        return "Please select coutnry!!\n\n"
    }
    else {
        return "";
    }
}

function checkstate() {
    var tt = document.getElementById('ddl_state');
    if (tt.value == "0") {
        return "Please select state!!\n\n"
    }
    else {
        return "";
    }
}

function checkcity() {
    var tt = document.getElementById('ddl_city');
    if (tt.value == "0") {
        return "Please select city!!\n\n"
    }
    else {
        return "";
    }
}


