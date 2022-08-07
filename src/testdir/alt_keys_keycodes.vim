function! AnsAltKey()
  echomsg "Started @ " . strftime("%Y-%m-%d %H:%M:%S")

  ene

	let lst=[
				\   [ "LIST", ["LEFT", "UP", "DOWN", "RIGHT"]]
        \ , [ "LIST", ["Insert", "Del", "Home", "End", "PageUp", "PageDown" ]]
        \ , [ "LIST", ["kHome", "kEnd", "kPageUp", "kPageDown", "kPlus", "kMinus", "kMultiply", "kDivide", "kEnter", "kPoint"]]
				\ , [ "k","0123456789" ]
				\ , [ "ES","C", "F","123456789", "F1","0", "F1","1", "F1","2" ]
				\ , [ "", "`1234567890-=", "B","S" ]
				\ , [ "", "qwertyuiop[]"    ]
				\ , [ "", "asdfghjkl;'\\" ]
				\ , [ "", "zxcvbnm,./" ]
				\ ]

	let lnr=1
	for prefix_n_str0 in lst
		for shifted in ["A-", "A-S-", "C-", "C-S-", "A-C-", "A-C-S-"]
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
          if prefix == "LIST"
            " in this case everything is in list, every item is single and
            " complete button name, and not as individual chars inside one long string
            let button0 = get(str, i)
            let prefix4button = ""
          else
            " in this case we have one long string which consist of individual
            " chars every of it designates one button
            let button0=strcharpart(str,i,1)
            let prefix4button = prefix
          endif
					let button=shifted.prefix4button.button0
					"echomsg "i=".i.",".button
					exec 'call feedkeys("\<'.button.'>","t")'
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

  w! AnsAltKey_out.txt

  echomsg "Done @ " . strftime("%Y-%m-%d %H:%M:%S")
endfunc
