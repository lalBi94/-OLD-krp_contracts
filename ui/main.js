let tamere

$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var zod = event.data;

        tamere = zod.jobl
        
        const pl1 = document.getElementById("player1")
        const pl2 = document.getElementById("player2")
        const pst = document.getElementById("poste")
        const entreprise = document.getElementById("entname")
        const miss = document.getElementById("mission")
        const prim = document.getElementById("prime")
        const matos = document.getElementById("matostamaman")
        const d = document.getElementById("date")
        const t = document.getElementById("time")
        const sp1 = document.getElementById("pp1")
        const sp2 = document.getElementById("pp2")
        let date = new Date()

        if (zod.type === "ui") {
            if (zod.status == true) {
                entreprise.innerText = zod.job_label
                pl1.innerText = zod.p1 
                pl2.innerText = zod.p2
                pst.innerText = zod.poste
                prim.innerText = zod.prime + " $"
                miss.innerText = zod.mission
                matos.innerText = zod.furniture
                d.innerText = date.getDate() + "/" + date.getMonth()+1 + "/" + date.getFullYear()
                t.innerText = date.getHours() + "h" + date.getMinutes()
                sp1.innerText = zod.p2
                sp2.innerText = zod.p1

                display(true)
            } else {
                display(false)
            }
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://krp_contracts/exit', JSON.stringify({}));
            return
        }
    };

    $(".thebtn2").click(function () {
        $.post('http://krp_contracts/exit', JSON.stringify({}));
        return
    })
    
    $(".thebtn").click(function () {
        $.post('http://krp_contracts/main', JSON.stringify({
            text: "ok",
            job: tamere
        }));
        return;
    })
})