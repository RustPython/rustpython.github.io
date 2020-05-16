(function () {

    var filter = function () {
        // simply blast through the list and update the display
        criteria = this.dataset.filter;
        document.querySelector(".active").classList.remove("active");

        this.classList.add("active");
        el = document.querySelectorAll('div[data-status]');
        for (var i = 0; i < el.length; i++) {
            if (el[i].dataset.status == criteria || criteria == "all") {
                el[i].style.display = "flex"
            } else {
                el[i].style.display = "none"
            }
        }
    };

    // attach a click event to each filter and call the filter function
    var elements = document.getElementsByClassName("filter");
    for (var i = 0; i < elements.length; i++) {
        elements[i].addEventListener('click', filter, false);
    }

})();