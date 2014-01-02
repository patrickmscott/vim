function fish_prompt --description 'Write out the prompt'
	
	set -l last_status $status

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end
	
	if not set -q -g __fish_classic_git_functions_defined
		set -g __fish_classic_git_functions_defined

		function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
			if status --is-interactive
				set -e __fish_prompt_status
				commandline -f repaint ^/dev/null
			end
		end
	end

	set -l delim '>'

	switch $USER

	case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

	case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end

	end

	if not set -q __fish_prompt_user
		set -g __fish_prompt_user (set_color $fish_color_user)
	end

	echo -n -s (set_color yellow) "[" (date "+%H:%M") "] " "$__fish_prompt_cwd" (prompt_pwd) (set_color purple) (__fish_git_prompt) "$__fish_prompt_normal" "$delim" ' '
end
