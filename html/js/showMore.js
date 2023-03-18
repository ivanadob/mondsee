function onClick(docId) {
    var dots = document.getElementById(docId+"Dots");
    var moreText = document.getElementById(docId+"More");
    var btnText = document.getElementById(docId+"MyBtn");

    if (dots.style.display === "none") {
        dots.style.display = "inline";
        btnText.innerHTML = "Read more";
        moreText.style.display = "none";
    } else {
        dots.style.display = "none";
        btnText.innerHTML = "Read less";
        moreText.style.display = "inline";
    }
}