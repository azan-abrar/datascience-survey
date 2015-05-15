$(document).ready(function() {
    $("#tags").tagit({
    	allowSpaces: true, 
    	fieldName: "survey[tag_list]", 
    	singleField: true, 
    	tagLimit: 10
    });
});


// $(document).ready(function(){

// 	$('#survey_next').on("click",function(){
// 		if ($('#survey_name').val() != '' || $('#survey_email').val() != '')
// 		{
// 			alert("are you sure");
// 		};
// 	});
// });
// $(document).ready(function(){
// 	function Confirmation() {
// 	    $("#dialog-confirm").html("Confirm Dialog Box");

// 	    // Define the Dialog and its properties.
// 	    $("#dialog-confirm").dialog({
// 	        resizable: false,
// 	        modal: true,
// 	        title: "Confirmation!",
// 	        height: 250,
// 	        width: 400,
// 	        buttons: {
// 	            "Yes": function () {
// 	                $(this).dialog('close');
// 	                //callback(true);
// 	                submit = true
// 	            },
// 	                "No": function () {
// 	                $(this).dialog('close');
// 	                //callback(false);
// 	            }
// 	        }
// 	    });
// 	    $('form').submit(function() {
//         if (!submit) {
//             $("#dialog-confirm").dialog('open');
//             return false;
//         }
//     });
// 	}

// 	$('#survey_next').click(Confirmation);

// 	function callback(value) {
// 	    if (value) {
// 	        alert("Confirmed");
// 	    } else {
// 	        alert("Rejected");
// 	    }
// 	}
// })
