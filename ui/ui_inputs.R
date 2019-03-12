list(

h4("Parameters from the game")

# Input number of AS
,numericInput(       "in_as"
                     ,h5(    "Ancient Souls")
                     ,value = 0
                     ,min   = 0
                     ,step  = 1 )

# Input Highest Zone Ever
,numericInput(       "in_hze"
                     ,h5(    "Highest Zone Ever")
                     ,value = 0
                     ,min   = 0
                     ,step  = 1 )


,h4("Parameters controlling optimization")

# Input Chronos Level
,numericInput(       "chrono_l"
                     ,h5(    "Achievable level of chronos")
                     ,value = 2000
                     ,min   = 0
                     ,step  = 1 )

# Input time
,numericInput(        "ti"
                      ,h5(    "Acceptable minimal boss timer")
                      ,value = 3
                      ,min   = 2
                      ,step  = 1 )

# Input Kumawakamaru level
,numericInput(       "kuma_l"
                     ,h5(    "Achievable level of Kumawakamaru")
                     ,value = 15000
                     ,min   = 0
                     ,step  = 1 )

# Input number of monsters
,numericInput(       "mo"
                     ,h5(    "Maximum number of monsters at end zone")
                     ,value = 2
                     ,min   = 2
                     ,step  = 1 )

# Input Atman level
,numericInput(        "atman_l"
                      ,h5(    "Achievable level of Atman")
                      ,value = 3000
                      ,min   = 0
                      ,step  = 1 )

# Input primal boss chance
,numericInput(        "pch"
                      ,h5(    "Acceptable minimal primal boss chance")
                      ,value = 1
                      ,min   = 0.0525
                      ,step  = 0.0025 )

# Input Dora level
,numericInput(        "dora_l"
                      ,h5(    "Achievable level of Dora")
                      ,value = 19000
                      ,min   = 0
                      ,step  = 1 )

# Input treasure chest chance
,numericInput(         "cch"
                       ,h5(     "Acceptable minimal treasure chest chance")
                       ,value = 1
                       ,min   = 0.011
                       ,step  = 0.001 )

# Factor limiting effects of converging Ancients: Chronos, Atman and Dora
,numericInput(         "limit"
                       ,h5(     "Limiting factor for Chronos, Atman and Dora effects")
                       ,value = 1
                       ,min   = 0
                       ,max   = 1
                       ,step  = 0.001 )

# End of list
)