module main;
import std::io;
import cset;
import utf_utils;


const CSet GREEK_ALPHA = cset::make_unicode_cset ('Ͱ', "θωερτψυιοπ");

fn int main(String[] args)
{

	String str = "This IS a string 3234";
	foreach (c : str )
	{
		io::printfn ("Is %c an upper case ascii character? %s",
			c,
			cset::UC_ALPHA.char_is_in_set (c)
		);
	}
	
	io::printn ("GREEK cset ");
	io::printn ( GREEK_ALPHA);
	
	// test items that are in set, output true
	Char32[] chars = utf_utils::conv_utf8_to_char32("θωερτψυιοπ");
	foreach (inx, c : chars )
	{
		io::printfn ( "Inexe :%d, Inset:%s", inx, GREEK_ALPHA.unicode_is_in_set(c));
	}

	// test items that are not in set, output false
	chars = utf_utils::conv_utf8_to_char32("ασδφγηςκλ");
	foreach (inx, c : chars )
	{
		io::printfn ( "Inexe :%d, Inset:%s", inx, GREEK_ALPHA.unicode_is_in_set(c));
	}

	// test mix of items that are in set and not in set
	// output true, false, false, repeat x3.
	chars = utf_utils::conv_utf8_to_char32("θαζωσχεδξ");
	foreach (inx, c : chars )
	{
		io::printfn ( "Inexe :%d, Inset:%s", inx, GREEK_ALPHA.unicode_is_in_set(c));
	}

	// test lower case ascii set, output false, true, true, true, false, false
	io::printn ( cset::LC_ALPHA.char_is_in_set ('B'));
	io::printn ( cset::LC_ALPHA.char_is_in_set ('b'));
	io::printn ( cset::LC_ALPHA.char_is_in_set ('c'));
	io::printn ( cset::LC_ALPHA.char_is_in_set ('z'));
	io::printn ( cset::LC_ALPHA.char_is_in_set ('Z'));
	io::printn ( cset::LC_ALPHA.char_is_in_set ('1'));

	// print the sets in a form that can be copied and pasted into source.
	io::printn ( cset::LC_ALPHA );
	io::printn ( GREEK_ALPHA );

	return 0;
}
