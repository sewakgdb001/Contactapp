 // allow decimal
    function AllowOnlyDecimal(eventObj, obj) {
        var keyCode
        // Check For Browser Type
        if (document.all) {
            keyCode = eventObj.keyCode
        }
        else {
            keyCode = eventObj.which
        }
        var str = obj.value

        var count = 0;
        for (var j = 0; j <= str.length; j++)
        {
            if (str.indexOf(".") != -1) {

                count = parseInt(count) + 1;
            }
            str.toString().substr(1);
        }
        if (count > 1)
        {
            if (keyCode == 46) {
                return false
            }
        }
        if (keyCode == 46) {
            if (str.indexOf(".") > 0) {
                return false
            }
        }
        if (String.fromCharCode(keyCode) >= "!" && String.fromCharCode(keyCode) <= "-" || String.fromCharCode(keyCode) >= ":" && String.fromCharCode(keyCode) <= "@" || String.fromCharCode(keyCode) >= "[" && String.fromCharCode(keyCode) <= "`" || String.fromCharCode(keyCode) >= "{" && String.fromCharCode(keyCode) <= "~" || String.fromCharCode(keyCode) >= "a" && String.fromCharCode(keyCode) <= "z" || String.fromCharCode(keyCode) >= "A" && String.fromCharCode(keyCode) <= "Z" || String.fromCharCode(keyCode) == "/") {
            return false
        }
        var count2 = 0;
        var dotindex = str.indexOf(".");
        if (dotindex >= 0) {
            for (var k = dotindex; k < str.length; k++) {
                count2 = count2 + 1;
                if (count2 > 2 && keyCode != 8) {

                    return false;
                }
            }
        }
        return true
    }









 
 function AllowOnlyDecimalforthree(eventObj, obj) {
        var keyCode
        // Check For Browser Type
        if (document.all) {
            keyCode = eventObj.keyCode
        }
        else {
            keyCode = eventObj.which
        }
        var str = obj.value

        var count = 0;
        for (var j = 0; j <= str.length; j++)
        {
            if (str.indexOf(".") != -1) {

                count = parseInt(count) + 1;
            }
            str.toString().substr(1);
        }
        if (count > 1)
        {
            if (keyCode == 46) {
                return false
            }
        }
        if (keyCode == 46) {
            if (str.indexOf(".") > 0) {
                return false
            }
        }
        if (String.fromCharCode(keyCode) >= "!" && String.fromCharCode(keyCode) <= "-" || String.fromCharCode(keyCode) >= ":" && String.fromCharCode(keyCode) <= "@" || String.fromCharCode(keyCode) >= "[" && String.fromCharCode(keyCode) <= "`" || String.fromCharCode(keyCode) >= "{" && String.fromCharCode(keyCode) <= "~" || String.fromCharCode(keyCode) >= "a" && String.fromCharCode(keyCode) <= "z" || String.fromCharCode(keyCode) >= "A" && String.fromCharCode(keyCode) <= "Z" || String.fromCharCode(keyCode) == "/") {
            return false
        }
        var count2 = 0;
        var dotindex = str.indexOf(".");
        if (dotindex >= 0) {
            for (var k = dotindex; k < str.length; k++) {
                count2 = count2 + 1;
                if (count2 > 3 && keyCode != 8) {

                    return false;
                }
            }
        }
        return true
    }

// allow only integer


function AcceptOnlyNumeric(eventObj, obj) {
    var keyCode
    // Check For Browser Type
    if (document.all) {
        keyCode = eventObj.keyCode
    }
    else {
        keyCode = eventObj.which
    }
    //ends here
    var str = obj.value

    if (keyCode > 31 && (keyCode < 48 || keyCode > 57))
        return false;

    return true;
}
function AllowOnlyDecimalWithNegSign(eventObj, obj) {
        var keyCode
        // Check For Browser Type
        if (document.all) {
            keyCode = eventObj.keyCode
        }
        else {
            keyCode = eventObj.which
        }
        var str = obj.value

        var count = 0;
        for (var j = 0; j <= str.length; j++)
        {
            if (str.indexOf(".") != -1) {

                count = parseInt(count) + 1;
            }
            str.toString().substr(1);
        }
        if (count > 1)
        {
            if (keyCode == 46) {
                return false
            }
        }
        if (keyCode == 46) {
            if (str.indexOf(".") > 0) {
                return false
            }
        }
        if (String.fromCharCode(keyCode) >= "!" && String.fromCharCode(keyCode) <= "*" || String.fromCharCode(keyCode) >= ":" && String.fromCharCode(keyCode) <= "@" || String.fromCharCode(keyCode) >= "[" && String.fromCharCode(keyCode) <= "`" || String.fromCharCode(keyCode) >= "{" && String.fromCharCode(keyCode) <= "~" || String.fromCharCode(keyCode) >= "a" && String.fromCharCode(keyCode) <= "z" || String.fromCharCode(keyCode) >= "A" && String.fromCharCode(keyCode) <= "Z" || String.fromCharCode(keyCode) == "/") {
            return false
        }
        var count2 = 0;
        var dotindex = str.indexOf(".");
        if (dotindex >= 0) {
            for (var k = dotindex; k < str.length; k++) {
                count2 = count2 + 1;
                if (count2 > 2 && keyCode != 8) {

                    return false;
                }
            }
        }
        return true
    }