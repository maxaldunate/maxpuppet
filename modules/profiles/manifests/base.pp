class profiles::base {
	include base
	include base::params
	include base::ssh
	include base::variable
	include localuser
	include localuser::groups::finance
	include localuser::groups::wheel
	class {'ntp': package => 'ntp',}
}