$(document).ready(function () {
    $(document).on("change", "[data-behavior*=\"switch-non-\"]", function () {
        let checkbox = $(this);
        let targetElement = $(checkbox.data("target"));
        targetElement.removeClass("d-none");
        if (checkbox.is(":checked")) {
            targetElement.addClass("d-none");
        }
        checkPalindrome();
    });
    $(document).on("click", "[data-behavior~=\"check-palindrome\"]", function () {
        checkPalindrome();
    });
    $(document).on("keyup", "[data-behavior~=\"palindrome-input\"]", function (e) {
        if (e.key === "Enter" || e.which === 13) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
        checkPalindrome();
    });
    startRotatingImages(0);
});

function checkPalindrome() {
    let inputElement = $("[data-behavior~=\"palindrome-input\"]");
    let resultElement = $("[data-behavior~=\"display-result\"]");
    let text = inputElement.val();
    if (text.length === 0) {
        return;
    }

    let ignoreNonNumeric = $("[data-behavior~=\"switch-non-numeric\"]").is(":checked");
    let hasAlphaChars = /[^0-9]/.test(text);

    if (ignoreNonNumeric && hasAlphaChars) {
        resultElement.html("<p class=\"text-danger fw-bold\">Input contains non-numeric characters. Please enter only numbers or uncheck the 'Ignore Non-Numeric Characters' option.</p>");
        return;
    }

    let ignoreNonAlpha = $("[data-behavior~=\"switch-non-alpha\"]").is(":checked");
    let hasNonAlphaChars = /[^a-zA-Z0-9]/.test(text);

    if( ignoreNonAlpha && hasNonAlphaChars) {
        text = text.replace(/[^a-zA-Z0-9]/g, '');
    }

    let palindromeOutputText = "";
    let isPalindrome = true;
    for (var i = 0; i < text.length; i++) {
        let currentCharacter = text[i].toLowerCase();
        let correspondingCharacter = text[text.length - 1 - i].toLowerCase();
        let areTheyDiferent = (currentCharacter !== correspondingCharacter);
        palindromeOutputText += `Is \"${currentCharacter}\" equal to \"${correspondingCharacter}\"? ${areTheyDiferent ? "<span class=\"text-danger\">Nope</span>" : "Yeah!"}<br/>\n`;
        if (areTheyDiferent) {
            isPalindrome = false;
        }
    }
    resultElement.html(`<h3>The subject ${isPalindrome ? "is" : "is not"} a palindrome!</h3>${palindromeOutputText}`);
}
function startRotatingImages(currentIndex) {
    const images = $("[data-behavior~=\"rotate-images\"]");
    $(images).removeClass("d-none");
    $(images[currentIndex]).addClass("d-none");
    currentIndex = (currentIndex + 1) % images.length;
    let imgChange = window.setTimeout(function () {
        startRotatingImages(currentIndex);
    }, 3000); 
}