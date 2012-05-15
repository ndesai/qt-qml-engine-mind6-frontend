.pragma library
function getParams(p,v) {
    if(!p || !v) return "";
    if(v.indexOf(".") > 0) {
        var valArry = v.split(".");
        var temp = p[valArry[0]];
        for(var i = 1; i < valArry.length; i++)
            temp = temp[valArry[i]];
        return temp;
    }
    return p[v];
}
