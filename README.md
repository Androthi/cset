# C3 Character Set module

This module suports bit tested character sets up to 512 characters in length
starting from any point in the unicode utf32 standard.

Character sets are created at compile time. A number of compile time functions
are included in the utf_utils module that assist in converting utf8 strings
to arrays of Char32 which can then be used by the macro to create a character
set bitmap.

The limitation of creating character sets at compile time can be overcome by
writing a small program to print a character set which can then be hard coded as a const.
The module comes with a custom print formatting that makes it easy to
print out, copy and paste the result into source code.

Some Ascii character sets are included by defualt.

const CSet LC_ALPHA = { .index = 0, .data = {10633823807823001954701781295154855936, 0, 0, 0} };  
const CSet UC_ALPHA = { .index = 0, .data = {2475880041677272402379145216, 0, 0, 0} };  
const CSet ALPHA = { .index = 0, .data = {10633823810298881996379053697534001152, 0, 0, 0} };  
const CSet NUMERIC = { .index = 0, .data = {287948901175001088, 0, 0, 0} };  
const CSet ALPHA_NUMERIC = { .index = 0, .data = {10633823810298881996667002598709002240, 0, 0, 0} };  




## Example

```
module main
import cset;
import utf_utils;
	
fn void main()
{
	String str = "This IS a string 3234";
	foreach (c : str )
	{
		io::printfn ("Is %c an upper case ascii character? %s",
			c,
			cset::UC_ALPHA.char_is_in_set (c)
		);
	}
}
```
