import os

os.system('mcrl22lps -v game_of_goose_stochastic.mcrl2 game_of_goose_stochastic.lps')
os.system('lps2lts -vrjittyc --cached game_of_goose_stochastic.lps game_of_goose_stochastic.lts')
os.system('rm -rf jitty*')

