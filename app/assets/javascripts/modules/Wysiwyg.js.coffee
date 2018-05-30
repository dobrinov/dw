window.DevWanted.Wysiwyg =
  initialize: (element) ->
    $(element).find('.js-wysiwyg').
      summernote {
                   height: 200,
                   callbacks: {
                                onPaste: ((e) ->
                                  bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text')
                                  e.preventDefault()
                                  document.execCommand('insertText', false, bufferText)
                                ),
                              },
                   toolbar: [
                              ['style', ['bold', 'italic', 'underline', 'clear']],
                              ['para', ['ul', 'ol']],
                              ['ext', ['link', 'video']],
                              ['edit', ['undo', 'redo']]
                           ]
                  }
