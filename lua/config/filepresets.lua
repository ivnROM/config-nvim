local M = {}

-- html
M.html_template = {
    '<!DOCTYPE html>',
    '<html lang="en">',
    '<head>',
    '    <meta charset="UTF-8">',
    '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    '    <title>Document</title>',
    '</head>',
    '<body>',
    '',
    '</body>',
    '</html>'
}

-- css
M.css_template = {
    'body {',
    '    margin: 0;',
    '    padding: 0;',
    '    font-family: Arial, sans-serif;',
    '}',
    '',
    'h1 {',
    '    color: #333;',
    '}'
}

-- javascript
M.js_template = {
    'document.addEventListener("DOMContentLoaded", function() {',
    '    console.log("Document loaded!");',
    '});'
}

return M

