$(document).ready(function () {
    $('.login-info-box').fadeOut();
    $('#show-dactif').show();
    $('#show-notfound').hide();
    $('#show-actif').hide();
    $('#show-load').hide();

    $('.login-show').addClass('show-log-panel');
    $('.login-reg-panel input[type="radio"]').on('change', function () {
        if ($('#log-login-show').is(':checked')) {
            $('.register-info-box').fadeOut();
            $('.login-info-box').fadeIn();

            $('.white-panel').addClass('right-log');
            $('.register-show').addClass('show-log-panel');
            $('.login-show').removeClass('show-log-panel');

        }
        else if ($('#log-reg-show').is(':checked')) {
            $('.register-info-box').fadeIn();
            $('.login-info-box').fadeOut();

            $('.white-panel').removeClass('right-log');

            $('.login-show').addClass('show-log-panel');
            $('.register-show').removeClass('show-log-panel');
        }
    });
});

var urlTot = "";

function checkContrat() {
    var timbre = $("input[name='timbre']").val().trim();
    $('#show-dactif').hide();
    $('#show-notfound').hide();
    $('#show-actif').hide();
    $('#show-load').show();
    $.ajax({
        url: "https://contrat-architecte-backend.herokuapp.com/contrats/timbre/" + timbre,
        success: function (data, status) {
            console.log(status);
            setContrat(data);
            urlTot = "https://contrat-architecte-backend.herokuapp.com/documents/download/" + data["uuidSignedDocument"];
            $('#show-dactif').hide();
            $('#show-notfound').hide();
            $('#show-actif').show();
            $('#show-load').hide();
        },
        error: function () {
            $('#show-dactif').hide();
            $('#show-notfound').show();
            $('#show-actif').hide();
            $('#show-load').hide();
        }
    });
}

function setContrat(res) {
    $("#nomComplet").html(res["architecte"]["nomComplet"]);
    $("#createDateTime").html(res["createDateTime"]);
    $("#commune").html(res["donneesProjets"]["commune"]["valeur"]);
    console.log(res["isSigned"]);
    if (res["isSigned"] == true) {
        $("#isSigned").show();
        $("#isSignedn").hide();
    } else {
        $("#isSigned").hide();
        $("#isSignedn").show();
    }
}

function openDoc() {
    window.open(
        urlTot, "_blank");
}

function ignore() {
    $('#show-dactif').show();
    $('#show-notfound').hide();
    $('#show-actif').hide();
    $('#show-load').hide();
}

function goToStep2(){
    $("#dp").hide();
    $("#da").show();
    $("#btnda").removeClass("inactive").addClass("active");
    $("#btndp").removeClass("active").addClass("inactive");
}

function backToStep1(){
    $("#da").hide();
    $("#dp").show();  
    $("#btndp").removeClass("inactive").addClass("active");
    $("#btnda").removeClass("active").addClass("inactive");
}