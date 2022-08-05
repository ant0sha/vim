function! AnsAltKey()
	"	nmap \cc <a-d>
	"normal \cc
	"let lst=[
	"			\   [ "", "d'\\"    ]
	"			\ ]
	let lst=[
				\   [ "F", "123456789", "F1", "0" ]
				\ , [ "", "`1234567890-=", "B","S" ]
				\ , [ "", "qwertyuiop[]"    ]
				\ , [ "", "asdfghjkl;'\\" ]
				\ , [ "", "zxcvbnm,./" ]
				\ ]
	let lnr=1
	for prefix_n_str0 in lst
		for shifted in ["", "S-"]
			let prefix_n_str=prefix_n_str0
			let allchar=""
			let allmod=""
			while 1
				"for [prefix, str] in prefix_n_str
				if len(prefix_n_str) == 0
					break
				endif
				let [prefix,str; rest_here] = prefix_n_str
				let prefix_n_str = rest_here
				"let str="qwertyuiop"
				"let str="D"
				for i in range(len(str))
					let button0=strcharpart(str,i,1)
					let button=shifted.prefix.button0
					echomsg "i=".i.",".button
					exec 'call feedkeys("\<A-'.button.'>","t")'
					"call feedkeys("\<A-D>","t")
					let ch = getcharstr()
					let mod = getcharmod()
					let allchar.=button."=".ch.";"
					let allmod.=button."=".mod.";"
				endfor
				"endfor
			endwhile
			call setline(lnr, allchar) | let lnr+=1
			call setline(lnr, allmod)  | let lnr+=1
		endfor
	endfor
endfunc
