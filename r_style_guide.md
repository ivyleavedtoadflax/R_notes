<html>

<head>
<title>Getting Started with R - R coding style</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>

<h1>R coding style</h1>

<p>Believe it or not, quite a lot of discussion (online discussion that is) goes into the question of what your R code should look like when you write it, i.e. where you should put spaces, how you should name files, etc. For example <a href=#footnote-1>[1]</a>:

<!--begin.rcode,eval=FALSE
# Good
`if (debug)`
`plot(x, y)`

# Bad
`if(debug)`
`plot (x, y)`
end.rcode-->



<p>In the above example, it makes no difference at all <em>how</em> the code is interpreted by R, but it can make the difference between code that is easy to read, and code that isn't. This is especially important if you are sharing your code with collaborators, as there is nothing worse than having to re-arrange someone else's code before you can even read it!</p>

<p>Throughout this document I have adhered (loosely in places) to <a href="https://github.com/hadley/devtools/wiki/Style">Hadley Wickham's style guide</a>, which is based on the Google style guide. If you want to explicitly know what this means - follow the link above and have a read - this is probably a good idea once you have had some practice with the language.</p>

<p>By all means, if you prefer, use a different style, it really doesn't matter so long as your code is clear and easy to read. Some important rules to follow, whichever style you decide to follow however are:</p>

<ol>
<li>Be consistent: use the same style throughout all your scripts.</li>
<li>Make file and object names meaningful: don't fall into the lazy practice of calling objects 'a' or 'b', or other unhelpful names.</li>
<li>Comment your code liberally: explain why you are doing what you are doing - it makes it so much easier when either you go back to code you wrote months earlier, or when sharing your code with other collaborators.</li>
</ol>

<p>Other style guides do exist, for example the google style guide (<a href="http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml">http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml</a>) or the 4D Pie charts guide (<a href="http://4dpiecharts.com/r-code-style-guide/">http://4dpiecharts.com/r-code-style-guide/</a>).</p>

<br><br><hr>

<p id="f
ootnote-1">[1] Hadley Wickam style guide <a href="https://github.com/hadley/devtools/wiki/Style">https://github.com/hadley/devtools/wiki/Style</a></p>

</body>
</html>