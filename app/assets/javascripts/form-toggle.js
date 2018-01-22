$(document).ready(function() {

  $('.review-form').hide(); //Initially form wil be hidden.

  $('#review-btn').on('click', function() {
    $('.review-form').toggle(); //Form shows on button click

  });
});
