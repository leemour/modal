$(function() {
  Under = {
    addFileInput: function(link, container) {
      var upload = $(link).closest(container).find('.file-upload').last().clone();
      var count = upload.html().match(/attributes\]\[(\d+)\]/)[1];
      count++;
      upload.html(
        upload.html()
        .replace(/attributes\]\[\d+\]/mg, 'attributes]['+count+']')
        .replace(/attributes_\d+/mg, 'attributes_'+count)
      );
      upload.insertBefore($(link));
    }
  }

  $('.lessons form').on('click', '.add-file', function(ev) {
    ev.preventDefault(); ev.stopPropagation();
    Under.addFileInput(this, 'form')
  });
});