$(function() {
  Under = {
    extraInput: function(link, container, inputClass) {
      var input = $(link).closest(container).find(inputClass).last().clone();
      var count = input.html().match(/attributes\]\[(\d+)\]/)[1];
      count++;
      input.html(
        input.html()
        .replace(/attributes\]\[\d+\]/mg, 'attributes]['+count+']')
        .replace(/attributes_\d+/mg, 'attributes_'+count)
      );
      return input;
    }
  }

  $('.lessons form').on('click', '.add-file', function(ev) {
    ev.preventDefault(); ev.stopPropagation();
    input = Under.extraInput(this, 'form', '.file-upload');
    input.insertBefore($(this));
  });
  $('.lessons .modal').on('click', '.add-answer', function(ev) {
    ev.preventDefault(); ev.stopPropagation();
    input = Under.extraInput(this, 'form', '.answer');
    $('.modal table').append(input);
  });
  $('.lessons .modal').on('click', '.delete-answer.only-html', function(ev) {
    ev.preventDefault(); ev.stopPropagation();
    if ($(this).closest('table').find('tr').size() > 1) {
      $(this).closest('tr').remove();
    }
  });
});