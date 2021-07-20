In programming languages with C-like syntax you often encounter blocks
`{...}` with one or more lines above: if statements, while loops, function
definitions, class definitions, namespace definitions, and more. This Vim
plugin provides text objects to select them. It depends on the
[textobj-user](https://github.com/kana/vim-textobj-user) plugin.

The *a* object includes the empty line *above* the headed block. If first an
opening `{` or closing `}` brace is encountered before an empty line is found,
the object includes the line *after* the headed block, if it is empty. Out of
simplicity, the plugin assumes the cursor to be on or inside the braces and
not on the *head*.

The standard mappings `ik` and `ak` can be remapped by setting the following
variables before the plugin is loaded:
```
    let g:inner_headed_block_key = 'ik'
    let g:a_headed_block_key = 'ak'
```

Lastly, marvel at this specious headed block zoo:
```
class Foo
{
    ...
}
```

```
while (kAndRStyle) {
    ...
}
```

```
// comment part of head: no empty line follows it
if (foo)
{
    ...
}
```

```
void function(
    int wrapped_args,
    int dont_matter)
{
    ...
}
```

```
[CSharpAttribute]
int Property
{
    get => field;
    set => field = value;
}
```
