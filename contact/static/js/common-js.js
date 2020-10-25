// $(document).on('keyup',function(evt) 
// {
//     if (evt.keyCode == 27)
//      {
//         if(confirm('Do you want to close this screen.'))
//         {
//         $('#close-btn').click();
//         }
//         }
//     });



    

$(document).ready(function () {

    $('.hasdate').dateEntry({dateFormat:'dmy/',});
    // enter navigation code
    $('html').bind('keypress', function (e) 
    {
      //  if (e.keyCode == 13) 
     //   {
       //     return false;
      //  }
        
    });
    
    $('input label span').draggable('disable')
         

//    $('input,a,select,button,textarea,ui-autocomplete-input').keydown(function (e) {
    $(document).delegate('input,a,select,button,textarea,.ui-autocomplete-input','keydown',function (e) {
        
         /* on keypress tab
          *  on last element
          *   by priyanka :) 
          * on 30/1/2016
          * */
        if(((e.keyCode ==9 && !e.shiftKey )) && $(this)[0]==$(':input:visible:enabled').last()[0])
        {
            e.preventDefault();
          $(':input:visible:enabled', document).eq(1).focus(); // save button
          return false;
        }
        //added by kashish: not to navigate on entering backspace
        if((e.keyCode==8) && ($(this).attr('readonly')))
        {
            event.preventDefault();
            return false;
        }
        
        if ($('.progressbar').css('display') == 'none') {

            var self = $(this)
                    , form = self.parents('form:eq(0)')
                    , focusable
                    , next
                    ;

            var parent = self.parents('div.ui-dialog:eq(0),.popupbox3'); // if parent other than form

            if (e.keyCode == 13) { // || e.keyCode ==9

                /* to check if 'this' is a
                 button
                 */
                if ($(this).is(':button') || $(this).is(':submit')) {

                    var id = $(this).attr('id');
                    var fireClick;

                    if ($(".rel" + id).length) { // to check for relative controls to fire button click { in grid interface }
                        $(".rel" + id).each(function () {
//                            if ($(this).val().trim()=="" || $(this).val().trim()) {
                                fireClick = 1;
                                return false;
//                            }
                        });
                    }
                    else {
                        $(this).click();
                        return false;
                    }
                    if (fireClick || id == "btnsave") {
                        $(this).click();
                        return false;
                    }
                }
                if (form.length) { // if parent is form
                    if($(this).is('a'))
                         focusable = form.find('input,a,select,button,textarea,ui-autocomplete-input, hasDateEntry').filter(':visible');
                     else
                    focusable = form.find('input,a,select,button,textarea,ui-autocomplete-input, hasDateEntry').filter(':visible:enabled');
//                     focusable = form.find('input,a,select,button,textarea,ui-autocomplete-input, hasDateEntry').filter(':visible:enabled');
                }
                else { // if parent is not form // to resolve navigation issue in case of dialog
                    if($(this).is('a'))
                         focusable = parent.find('input,a,select,button,textarea,ui-autocomplete-input, hasDateEntry').filter(':visible');
                     else
                    focusable = parent.find('input,a,select,button,textarea,ui-autocomplete-input, hasDateEntry').filter(':visible:enabled');
                    
                }

                next = focusable.eq(focusable.index(this) + 1);
                if (next.is(":disabled")) { // if next control is disabled then finding next enabled control to focus on...
                    next = focusable.find('input,select,a,button,textarea,ui-autocomplete-input:gt(' + focusable.index(this) + '):enabled:first');
                    
                }
                
                if (next.length) {
                    next.focus();
                }
                else {

                    if ($("#current").length > 0) {
                        var a = $("#current").nextAll(':visible:first').find('a').click(); //  next tab link

                        if (a.length > 0) { ////  next tab link exists or not
                            var tab = a.attr("title");

                            focusable = $('#' + tab + ":first").find('input,a,select,button,textarea,ui-autocomplete-input, hasDateEntry').filter(':visible:enabled');
                            next = focusable.eq(focusable.index(this) + 1);

                            if (next.length) { // whether tab has any input control
                                next.focus();
                                return false;
                            }
                            else {  // if no input control then focus on save 

                                $('#btnsave').focus();
                                return false;
                            }
                        }
                        else {

                            if (form.parent().length > 0) {

                                $("#btnsave").focus();
                            }
                            else {
                                if (parent.hasClass('ui-dialog')) { // to check if no next control in current tab  the focus on Done button
                                    parent.find(".diaDone").focus();
                                }
                                else {
                                    $("#btnsave").focus();
                                }
                            }
                        }
                    }
                    else if ($("#tabs-nav .active").length > 0) {
                        var a = $("#tabs-nav .active").nextAll(':visible:first').find('a').click();

                        if (a.length > 0) {
                            var tab = a.attr("href");

                            focusable = $(tab + ":first").find('input,a,select,button,textarea,ui-autocomplete-input, hasDate').filter(':visible:enabled');
                            next = focusable.eq(focusable.index(this) + 1);
                            next.focus();
                        }
                        else {
                            if (form.parent().length > 0) {
                                $("#btnsave").focus();
                            }
                            else {
                                $("#btnsave").focus();
                            }
                        }
                    }
                    else {
                        if (form.parent().length > 0) {
                            $("#btnsave").focus();
                        }
                        else {
                            $("#btnsave").focus();
                        }
                    }

                }

                return false;
            }
        //}
    });
    // added by priyanka
    $('.numeric').keypress(function (event){
       return AllowOnlyDecimal(event, this); 
    });
    // added by kashish
    $('.onlynumeric').keypress(function (event){
       return AcceptOnlyNumeric(event, this); 
    });
    
    // added by Sahil Sehgal
    $('.onlyalphabetic').keypress(function (event){
       return AcceptOnlyAlphabetic(event, this); 
    });
    
    function AcceptOnlyAlphabetic(eventObj, obj) {
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

    if ((keyCode >=97 && keyCode <=122) || (keyCode >=65 && keyCode <=90))
    {
        return true;
    }
    return false;
   }
    
    
    // added by kashish for tabindex to remain in popup only
$(".divpopup").delegate('input,a,select,button,textarea,ui-autocomplete-input','keydown',function (e) {
if(((e.keyCode ==9 && !e.shiftKey )) && $(this)[0]==$(':input:visible:enabled').last()[0])
{
    e.preventDefault();
  $(':input:visible:enabled', $(".divpopup")).eq(0).focus(); 
  return false;
}
});

});
$(document).keydown(function(e)
            {
                if(e.keyCode==8 && !$(e.target).is("input,textarea"))
                    return false;
            })
//function resizeDiv() {
//    var vph = $(window).height() - ($('footer').height() + $('.navbar').height() + $('.heading-button').height());
//    $('.main-border').css({'height': vph + 'px'});
//}
function datecheck(firstdate, seconddate)
{
    var smaller = firstdate.trim().split('/');
    var larger = seconddate.trim().split('/');
    var smallerdate = Date.parse(smaller.reverse());
    var largerdate = Date.parse(larger.reverse());
    if (smallerdate > largerdate)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}

function datechecks(firstdate, seconddate)
{
    var smaller = firstdate.trim().split('/');
    var larger = seconddate.trim().split('/');
    var smallerdate = Date.parse(smaller.reverse());
    var largerdate = Date.parse(larger.reverse());
    if (smallerdate >= largerdate)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}
function getHtml(hiddenId,tableid)
{
//    var hiddenval=$(hiddenId).val();
    $(hiddenId).val($(tableid).html().trim());
//   $(hiddenval).val($(tableid).html());
//$("'#" + hiddenId + "'").val($("'#" + tableid + " tbody'").html());    
}
function getSplitVal(ctrl,splitter){
  
   if(ctrl!=null && ctrl!="" )
   {    
 var splitvalue=$(ctrl).val().trim().split(splitter);
   }
    if(splitvalue.length>=1)
    {
        return splitvalue;
    }    
    else
    {
         return "";   
    }
}
function getSplitValOfData(data,splitter){
 
   
 var splitvalue=(data).split(splitter);
 
    if(splitvalue.length>=1)
    {
        return splitvalue;
    }    
    else
    {
         return "";   
    }
}
function dateConvertDmy(ctrl){
    
    $(ctrl).dateEntry({dateFormat: 'dmy/'}); 
}
function getLength(ctrl){
 
   
  if(ctrl.length>=1)
    {
        return ctrl;
    }    
    else{
        
        return "";
        
    }
}
function setHtml(hiddenId,tableid)
{
    var hiddenval=$(hiddenId).val();
    
$(tableid).html($(hiddenval));    
}

function lessdatecheck(firstdate, seconddate)
{
    var smaller = firstdate.trim().split('/');
//    var larger = seconddate.trim().split('/');
    var smallerdate = Date.parse(smaller.reverse());
    var largerdate = Date.parse(seconddate.split('-')); // second control is y-m-d
    if (smallerdate < largerdate)
    {
        return 1;
    }
    else
        return 0;
}
function ClearRelativeControls(controlid, RelativeControlid,globalvar,valorhtml) 
{
    
   $(controlid).on('input propertychange paste', function () 
   {
       if(typeof globalvar!=typeof undefined)
       {
           globalvar="";
       }
       
       // added by kashish to clear multiple controls
       if($.isArray(RelativeControlid))
       {
            for(var i=0;i<RelativeControlid.length;i++)
            {
                if(RelativeControlid[i].indexOf("tbody")>=0 )
                    $(RelativeControlid[i]).html("");
                else
                {
                    if(typeof valorhtml!=typeof undefined)
                    {
                        if(valorhtml=='val')
                            $(RelativeControlid[i]).val('');
                        else if(valorhtml=='html')
                            $(RelativeControlid[i]).html('');
                        else
                        $(RelativeControlid[i]).val('');
                        
                    }
                    else
                        $(RelativeControlid[i]).val('');
                }
            
                
            }
       }
        else
        {
            if(RelativeControlid.indexOf("tbody")>=0 )
                $(RelativeControlid).html("");
            else
            {
                if(typeof valorhtml!=typeof undefined)
                {
                    if(valorhtml=='val')
                        $(RelativeControlid).val('');
                    else if(valorhtml=='html')
                        $(RelativeControlid).html('');
                    else
                        $(RelativeControlid).val('');
                        
                }
                else
                    $(RelativeControlid).val('');
            }
        }
    
   });
   }
   function ClearRelativeControlUnit(controlid, RelativeControlid) 
{
   $(controlid).on('input propertychange paste', function () 
   {
       if($.isArray(RelativeControlid))
       {
            for(var i=0;i<RelativeControlid.length;i++)
            {
                if(RelativeControlid[i].indexOf("tbody")>=0 )
                    $(RelativeControlid[i]).html("");
                else
                    $(RelativeControlid[i]).val('');
            
                
            }
       }
      else     
        $(RelativeControlid).val('');
        globalitem="";
   });
   }
   function datatablefn(tableidorclass,displaylength)
   {
       if(tableidorclass!="")
       {
           $(tableidorclass).dataTable
           ({
                "oLanguage": 
                {
                    "sLengthMenu": 'Display <select>' +
                            '<option value="20">20</option>' +
                            '<option value="30">30</option>' +
                            '<option value="40">40</option>' +
                            '<option value="50">50</option>' +
                            '<option value="-1">All</option>' +
                            '</select> records'
                },
                "iDisplayLength": displaylength,
                'bSort': false,
                "bPaginate": true,
                "sPaginationType": "full_numbers",
                // "dom": 'T<"clear">lfrtip',


            });
       }
   }
function converttofloatno(no,precision)
{
    var formatno=0;
    if(no!="")
    {
        if(!isNaN(no))
        {
            formatno=parseFloat(no);
        }
    }
    return formatno.toFixed(precision);
}
 function getValue(valueid,globalvariable,table){
        
        
        var a=confirm("Asset detail will be empty from grid,Do you want to continue?");
                if(a==true)
                {
                    $(table).html("");
                    $(valueid).val("");
                    $('#totalnetamt').val('0.00');
                }
                else{
//                    alert(globalvariable);
                    $(valueid).val(globalvariable);
                    }
        
    }
function converttofloatnocal(no)
{
    var formatno=0;
    if(no!="")
    {
        if(!isNaN(no))
        {
            formatno=parseFloat(no);
        }
    }
    return formatno;
}
function converttointcal(no)
{
    var formatno=0;
    if(no!="")
    {
        if(!isNaN(no))
        {
            formatno=parseInt(no);
        }
    }
    return formatno;
}
function checkajaxcall()
{
    if($.active!=0)
    {
        alert("Please wait while processing your request.");
        return false;
    }
    return true;
}
// added by kashish to clear autocompletes
function destroyautocomplete(Controlidorclass)
{
    if ($(Controlidorclass).data('autocomplete')) 
    { 
        $(Controlidorclass).autocomplete("destroy"); 
        $(Controlidorclass).removeData('autocomplete'); 
    }
}
function ClearRelControlsfordate(controlid,RelativeControlid,valorhtml)
{
    $(controlid ).dateEntry({
                dateFormat: 'dmy/'

            }).on("change", function (e) {
               
               if($.isArray(RelativeControlid))
       {
            for(var i=0;i<RelativeControlid.length;i++)
            {
                if(RelativeControlid[i].indexOf("tbody")>=0 )
                    $(RelativeControlid[i]).html("");
                else
                {
                    if(typeof valorhtml!=typeof undefined)
                    {
                        if(valorhtml=='val')
                            $(RelativeControlid[i]).val('');
                        else if(valorhtml=='html')
                            $(RelativeControlid[i]).html('');
                        else
                        $(RelativeControlid[i]).val('');
                        
                    }
                    else
                        $(RelativeControlid[i]).val('');
                }
            
                
            }
       }
        else
        {
            if(RelativeControlid.indexOf("tbody")>=0 )
                $(RelativeControlid).html("");
            else
            {
                if(typeof valorhtml!=typeof undefined)
                {
                    if(valorhtml=='val')
                        $(RelativeControlid).val('');
                    else if(valorhtml=='html')
                        $(RelativeControlid).html('');
                    else
                        $(RelativeControlid).val('');
                        
                }
                else
                    $(RelativeControlid).val('');
            }
        }
             
               
            });
            
}
function getlastindexfromstring(inputstring,seperator)
{
    var lastindex="";
   if(inputstring!="")
   {
       if(inputstring.indexOf(seperator)!="-1")
       {
           var stringarray=inputstring.split(seperator);
           lastindex=stringarray[stringarray.length-1];
       }
   }
   return lastindex;
}
function getstringfrominput(inputstring,seperator)
{
    var str="";
   if(inputstring!="")
   {
       if(inputstring.indexOf(seperator)!="-1")
       {
           var stringarray=inputstring.split(seperator);
           for(var i=0;i<stringarray.length-1;i++)
           {
               if(str=="")
               {
                   str=stringarray[i];
               }
               else
                   str+="-"+stringarray[i];
           }
          
       }
   }
   return str;
}

function MathRound(Number,DecimalPoint) 
{
   Number=converttofloatnocal(Number);
   Number=Number *(Math.pow(10, DecimalPoint));
   Number=Math.round(Number,DecimalPoint);
   Number=Number/Math.pow(10, DecimalPoint);
   return Number;
}
function exactuptotwodecimal(Number)
{
   return  Number.toString().match(/^-?\d+(?:\.\d{0,2})?/)[0];
}
function updateSrNo(tableidorclass,indextdclass)
{
    var Srno=1;
    $(tableidorclass).each(function () {
    var row = $(this);
    row.find(indextdclass).html(parseInt(Srno));
    Srno = parseInt(Srno) + 1;
});
}
