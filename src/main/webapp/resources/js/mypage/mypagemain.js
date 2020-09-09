$(document).ready(()=>{
	activateMenu()

    $(document).on('click', '.reserve-list', function (event) {
        const reserveId = $(this).data('reserveId')
        const url = `/mypage/myperformanceDetail.do?reserveId=${reserveId}`
        const sendvalue = {'reserveId': reserveId}

        $(location).attr('href', url)

    })
})

const activateMenu = ()=>{
    $("#mypagemenu li").click(function(){
        const req = $(this).data('href')
        $(location).attr('href', req)
    })
}
