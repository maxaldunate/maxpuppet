class base::if {
	#if $::hostname =~ /^ansible(\d+)/ {
	if $::hostname =~ /^pupp/ {
		notice("you have arrived at server $0")
	}
}