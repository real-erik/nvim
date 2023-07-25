test: test_

test_:
	nvim --headless -c "PlenaryBustedFile lua/utils/git.test.lua"

watch:
	watchexec -w lua just test_
