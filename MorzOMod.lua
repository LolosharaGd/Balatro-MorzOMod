---- TODO
--- Joker: Counterpart to Copper Pile
--- Bronze Pile

-- FUNCTIONS
-- I don't know if they exist already but who cares
sum_list = function(list)
    local total = 0

    for i,v in ipairs(list) do
        total = total + v
    end

    return total
end

pseudorandom_element_weighed = function(list, weights, seed)
    if #list == #weights then
        local total = sum_list(weights)
        local total_index = pseudorandom(seed) * total

        for i,v in ipairs(weights) do
            if total_index <= v then
                return list[i]
            else
                total_index = total_index - v
            end
        end
    else
        return list[1]
    end
end

-- GLOBAL VARIABLES
-- I'm sure this is not the way to do it, but I don't know better :>
pile_jokers = {
    "j_mrzmd_gold_pile",
    "j_mrzmd_silver_pile",
    "j_mrzmd_copper_pile",
    "j_mrzmd_hydrogen_pile",
    "j_mrzmd_titanium_pile",
    "j_mrzmd_no_pile",
    "j_mrzmd_gallium_pile"
}
pile_jokers_weights = {
    1,
    1.2,
    1,
    0.1,
    0.9,
    1,
    1.15
}

pile_jokers_nopile = {
    "j_mrzmd_gold_pile",
    "j_mrzmd_silver_pile",
    "j_mrzmd_copper_pile",
    "j_mrzmd_hydrogen_pile",
    "j_mrzmd_titanium_pile",
    "j_mrzmd_gallium_pile"
}
pile_jokers_weights_nopile = {
    0.75,
    0.9,
    0.75,
    0.15,
    0.8,
    0.85
}
pile_color = HEX("714AB5")

-- OPTIONAL FEATURES
-- Because of course you need to enable them
SMODS.optional_features = { cardareas = {}, post_trigger = true, quantum_enhancements = true, retrigger_joker = true }

-- MAIN ATLAS
SMODS.Atlas {
    key = "MorzOMod",
    path = "MorzOMod.png",
    px = 71,
    py = 95
}

-- PILES ATLAS
SMODS.Atlas {
    key = "Piles",
    path = "Piles.png",
    px = 71,
    py = 95
}

-- BOOSTERS ATLAS
SMODS.Atlas {
    key = "Boosters",
    path = "Boosters.png",
    px = 71,
    py = 95
}

-- PILE RARITY
SMODS.Rarity {
    key = "pile",
    loc_txt = {
        name = "Pile"
    },
    pools = {
        ["Joker"] = true,
        ["Joker"] = { rate = 0 }
    },
    badge_colour = pile_color,
    default_weight = 0
}

-- NORMAL BOOSTER 1
SMODS.Booster {
    key = "pile_pack_1",
    loc_txt = {
        name = "Pile Pack",
        text = { "Select {C:attention}#1#{} out of {C:attention}#2#{}", "{V:1,E:2}Pile{} jokers" },
        group_name = "Pile pack"
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                1,
                2,
                colours = {
                    pile_color
                }
            }
        }
    end,

    atlas = "Boosters",
    pos = { x = 0, y = 0 },
    config = {
        extra = 2,
        choose = 1
    },

    discovered = true,
    kind = "Pile",

    cost = 8,
    weight = 0.75 / 2,

    create_card = function(self, card, i)
        local viable_jokers = {}
        local viable_joker_weights = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
                viable_joker_weights[#viable_joker_weights + 1] = pile_jokers_weights[i]
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element_weighed(viable_jokers, viable_joker_weights, "pilebooster1"..G.GAME.round_resets.ante),
            nil
        )

        return new_card
    end
}

-- NORMAL BOOSTER 2
SMODS.Booster {
    key = "pile_pack_2",
    loc_txt = {
        name = "Pile Pack",
        text = { "Select {C:attention}#1#{} out of {C:attention}#2#{}", "{V:1,E:2}Pile{} jokers" },
        group_name = "Pile pack"
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                1,
                2,
                colours = {
                    pile_color
                }
            }
        }
    end,

    atlas = "Boosters",
    pos = { x = 1, y = 0 },
    config = {
        extra = 2,
        choose = 1
    },

    discovered = true,
    kind = "Pile",

    cost = 8,
    weight = 0.75 / 2,

    create_card = function(self, card, i)
        local viable_jokers = {}
        local viable_joker_weights = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
                viable_joker_weights[#viable_joker_weights + 1] = pile_jokers_weights[i]
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element_weighed(viable_jokers, viable_joker_weights, "pilebooster1"..G.GAME.round_resets.ante),
            nil
        )

        return new_card
    end
}

-- JUMBO BOOSTER
SMODS.Booster {
    key = "pile_pack_jumbo",
    loc_txt = {
        name = "Jumbo Pile Pack",
        text = { "Select {C:attention}#1#{} out of {C:attention}#2#{}", "{V:1,E:2}Pile{} jokers" },
        group_name = "Pile pack"
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                1,
                4,
                colours = {
                    pile_color
                }
            }
        }
    end,

    atlas = "Boosters",
    pos = { x = 2, y = 0 },
    config = {
        extra = 4,
        choose = 1
    },

    discovered = true,
    kind = "Pile",

    cost = 12,
    weight = 0.5,

    create_card = function(self, card, i)
        local viable_jokers = {}
        local viable_joker_weights = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
                viable_joker_weights[#viable_joker_weights + 1] = pile_jokers_weights[i]
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element_weighed(viable_jokers, viable_joker_weights, "pilebooster1"..G.GAME.round_resets.ante),
            nil
        )

        return new_card
    end
}

-- MEGA BOOSTER
SMODS.Booster {
    key = "pile_pack_mega",
    loc_txt = {
        name = "Mega Pile Pack",
        text = { "Select {C:attention}#1#{} out of {C:attention}#2#{}", "{V:1,E:2}Pile{} jokers" },
        group_name = "Pile pack"
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                2,
                4,
                colours = {
                    pile_color
                }
            }
        }
    end,

    atlas = "Boosters",
    pos = { x = 3, y = 0 },
    config = {
        extra = 4,
        choose = 2
    },

    discovered = true,
    kind = "Pile",

    cost = 16,
    weight = 0.4,

    create_card = function(self, card, i)
        local viable_jokers = {}
        local viable_joker_weights = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
                viable_joker_weights[#viable_joker_weights + 1] = pile_jokers_weights[i]
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element_weighed(viable_jokers, viable_joker_weights, "pilebooster1"..G.GAME.round_resets.ante),
            nil
        )

        return new_card
    end
}

-- JOKER - GOLD PILE
SMODS.Joker {
    key = "gold_pile",
    loc_txt = {
        name = "Gold Pile",
        text = {
            "{C:money}$#1#{} for every card scored",
            "Increase by {C:money}$#2#{} after the boss blind",
            "{C:red}Decrease{} by {C:money}$#2#{} after shop reroll",
            "{C:inactive,s:0.7}Minimum {C:money,s:0.7}$#3#"
        }
    },

    config = {
        extra = {
            start_dollars = 1,
            dollars = 1,
            dollars_gain = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.dollars_gain, card.ability.extra.start_dollars } }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1 },
    cost = 6,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            return {
                dollars = card.ability.extra.dollars
            }
        end

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            if G.GAME.blind.boss then
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain

                return {
                    message = "+" .. card.ability.extra.dollars_gain,
                    colour = G.C.MONEY
                }
            end
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.dollars = math.max(card.ability.extra.start_dollars, card.ability.extra.dollars - card.ability.extra.dollars_gain)

            return {
                message = "-" .. card.ability.extra.dollars_gain,
                colour = G.C.MONEY
            }
        end
    end
}

-- JOKER - SILVER PILE
SMODS.Joker {
    key = "silver_pile",
    loc_txt = {
        name = "Silver Pile",
        text = {
            "{C:chips}+#1#{} chips for every card scored",
            "Increase by {C:chips}#2#{} after round",
            "{C:red}Decrease{} by {C:chips}#2#{} after shop reroll",
            "{C:inactive,s:0.7}Minimum {C:chips,s:0.7}#3#"
        }
    },

    config = {
        extra = {
            start_chips = 7,
            chips = 7,
            chips_gain = 7
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain, card.ability.extra.start_chips } }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    cost = 8,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain

            return {
                message = "+" .. card.ability.extra.chips_gain,
                colour = G.C.CHIPS
            }
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.chips = math.max(card.ability.extra.start_chips, card.ability.extra.chips - card.ability.extra.chips_gain)

            return {
                message = "-" .. card.ability.extra.chips_gain,
                colour = G.C.CHIPS
            }
        end
    end
}

-- JOKER - COPPER PILE
SMODS.Joker {
    key = "copper_pile",
    loc_txt = {
        name = "Copper Pile",
        text = {
            "{C:mult}+#1#{} mult for every card scored",
            "Increase by {C:mult}#2#{} after hand played",
            "{C:red}Decrease{} by {C:mult}#2#{} after shop reroll",
            "{C:inactive,s:0.7}Minimum {C:mult,s:0.7}#3#"
        }
    },

    config = {
        extra = {
            start_mult = 3,
            mult = 3,
            mult_gain = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.start_mult } }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    cost = 10,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.after and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain

            return {
                message = "+" .. card.ability.extra.mult_gain,
                colour = G.C.MULT
            }
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.mult = math.max(card.ability.extra.start_mult, card.ability.extra.mult - card.ability.extra.mult_gain)

            return {
                message = "-" .. card.ability.extra.mult_gain,
                colour = G.C.MULT
            }
        end
    end
}

-- JOKER - HYDROGEN PILE
SMODS.Joker {
    key = "hydrogen_pile",
    loc_txt = {
        name = "Hydrogen Pile",
        text = {
            "{V:1,E:1}Retrigger{} everything {V:1,E:1}#1#{} time(s)",
            "{C:green,s:0.9}#2# in #3#{} chance to {C:red,s:0.9}degrade{s:0.9} into",
            "{V:1,E:2,s:0.9}Helium{s:0.9} or {V:1,E:2,s:0.9}Oxygen Pile{s:0.9} at the end of round",
            "{C:inactive,s:0.7}Doesn't retrigger other {V:1,s:0.7,E:2}Retriggering Piles"
        }
    },

    config = {
        extra = {
            retriggers = 1,
            odds = 4,
        },

        immutable = {
            max_retriggers = 50,
            pile_not_retrigerrable = true
        },
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.odds,
                colours = {
                    pile_color
                }
            }
        }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    cost = 20,
    eternal_compat = false,

    discovered = true,

    calculate = function(self, card, context)
        if context.repetition and not context.blueprint then
            return {
                repetitions = math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
                message = "Again!",
                card = card,
                colour = pile_color
            }
        end

        if context.retrigger_joker_check
            and not context.retrigger_joker
            and not (context.other_card.ability.immutable and context.other_card.ability.immutable.pile_not_retrigerrable)
            and not context.blueprint
        then
            return {
                repetitions = math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
                message = "Again!",
                colour = pile_color
            }
        end

        if context.end_of_round and context.cardarea == G.jokers then
            if pseudorandom("hydrogendestroy"..G.GAME.round_resets.ante) < G.GAME.probabilities.normal / card.ability.extra.odds then
                local viable_jokers = { "j_mrzmd_helium_pile", "j_mrzmd_oxygen_pile" }
                local viable_joker_weights = { 1, 1 }

                card_eval_status_text(card, "extra", nil, nil, nil, { message = "Degrade!" })

                local new_card = create_card(
                    "Joker",
                    G.jokers,
                    nil,
                    nil,
                    true,
                    false,
                    pseudorandom_element_weighed(viable_jokers, viable_joker_weights, "hydrogendegrade"..G.GAME.round_resets.ante),
                    nil
                )
                new_card:add_to_deck()
				G.jokers:emplace(new_card)
				new_card:start_materialize()

                -- Literally copied from example mod gross michael 2 :>
                G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
            else
                card_eval_status_text(card, "extra", nil, nil, nil, { message = "Safe!" })
            end
        end
    end
}

-- JOKER - HELIUM PILE
SMODS.Joker {
    key = "helium_pile",
    loc_txt = {
        name = "Helium Pile",
        text = {
            "{V:1,E:1}Retrigger{} every {C:attention}joker {V:1,E:1}#1#{} time(s)",
            "{C:inactive,s:0.7}Doesn't retrigger other {V:1,s:0.7,E:2}Retriggering Piles"
        }
    },

    config = {
        extra = {
            retriggers = 1
        },

        immutable = {
            max_retriggers = 50,
            pile_not_retrigerrable = true
        },
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
                colours = {
                    pile_color
                }
            }
        }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 1, y = 2 },
    soul_pos = { x = 1, y = 3 },
    cost = 18,

    discovered = true,

    calculate = function(self, card, context)
        if context.retrigger_joker_check
            and not context.retrigger_joker
            and not (context.other_card.ability.immutable and context.other_card.ability.immutable.pile_not_retrigerrable)
            and not context.blueprint
        then
            return {
                repetitions = math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
                message = "Again!",
                colour = pile_color
            }
        end
    end
}

-- JOKER - OXYGEN PILE
SMODS.Joker {
    key = "oxygen_pile",
    loc_txt = {
        name = "Oxygen Pile",
        text = {
            "{V:1,E:1}Retrigger{} every {C:attention}playing card {V:1,E:1}#1#{} time(s)"
        },
        unlock = {
            "Obtain it through {C:attention}Hydrogen Pile"
        }
    },

    config = {
        extra = {
            retriggers = 1
        },

        immutable = {
            max_retriggers = 50,
            pile_not_retrigerrable = true
        },
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
                colours = {
                    pile_color
                }
            }
        }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 2, y = 2 },
    soul_pos = { x = 2, y = 3 },
    cost = 18,

    discovered = true,

    calculate = function(self, card, context)
        if context.repetition and not context.blueprint then
            return {
                repetitions = math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
                message = "Again!",
                card = card,
                colour = pile_color
            }
        end
    end
}

-- JOKER - TITANIUM PILE
SMODS.Joker {
    key = "titanium_pile",
    loc_txt = {
        name = "Titanium Pile",
        text = {
            "{C:chips}+#1#{} chips for every card scored",
            "{C:red}Decrease{} by {C:chips}#2#{} after hand played",
            "for each {C:attention}card scored",
            "Increase by {C:chips}#3#{} after round",
            "{C:inactive,s:0.7}Minimum {C:chips,s:0.7}#4#"
        }
    },

    config = {
        extra = {
            start_chips = 10,
            chips = 10,
            chips_gain = 10,
            chips_decrease = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chips_decrease,
                card.ability.extra.chips_gain,
                card.ability.extra.start_chips
            }
        }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    cost = 6,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.after and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips - (card.ability.extra.chips_decrease * #context.scoring_hand)
            card.ability.extra.chips = math.max(card.ability.extra.chips, card.ability.extra.start_chips)

            if #context.scoring_hand > 0 then
                return {
                    message = "-" .. (card.ability.extra.chips_decrease * #context.scoring_hand),
                    colour = G.C.CHIPS
                }
            end
        end

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain

            return {
                message = "+" .. card.ability.extra.chips_gain,
                colour = G.C.CHIPS
            }
        end
    end
}

-- JOKER - BRASS PILE
SMODS.Joker {
    key = "brass_pile",
    loc_txt = {
        name = "Brass Pile",
        text = {
            "{C:money}$#1#{} for every card scored",
            "{C:red}Decrease{} by {C:money}$#2#{} after hand played",
            "if {C:attention}scored hand{} contains {C:attention}#3#{} or more cards",
            "Increase by {C:money}$#2#{} after boss blind",
            "{C:inactive,s:0.7}Minimum {C:chips,s:0.7}#4#"
        }
    },

    config = {
        extra = {
            start_dollars = 1,
            dollars = 1,
            dollars_gain = 2,
            card_threshold = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.dollars_gain,
                card.ability.extra.card_threshold,
                card.ability.extra.start_dollars
            }
        }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 3, y = 2 },
    soul_pos = { x = 3, y = 3 },
    cost = 8,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            return {
                dollars = card.ability.extra.dollars
            }
        end

        if context.after and context.cardarea == G.jokers and not context.blueprint then
            if #context.scoring_hand >= card.ability.extra.card_threshold then
                card.ability.extra.dollars = card.ability.extra.dollars - card.ability.extra.dollars_gain
                card.ability.extra.dollars = math.max(card.ability.extra.dollars, card.ability.extra.start_dollars)

                if #context.scoring_hand > 0 then
                    return {
                        message = "-$" .. card.ability.extra.dollars_gain,
                        colour = G.C.MONEY
                    }
                end
            end
        end

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            if G.GAME.blind.boss then
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain

                return {
                    message = "+$" .. card.ability.extra.dollars_gain,
                    colour = G.C.MONEY
                }
            end
        end
    end
}

-- JOKER - NO PILE
SMODS.Joker {
    key = "no_pile",
    loc_txt = {
        name = "No Pile",
        text = {
            "Create a random {V:1,E:2}Pile joker{} after {C:attention}5 {C:inactive}(#1#){} rounds",
            "{C:inactive}Created joker is more likely to be more rare"
        }
    },

    config = {
        extra = {
            rounds_left = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds_left,
                colours = {
                    pile_color
                }
            },

            immutable = {
                pile_not_retrigerrable = true
            }
        }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    cost = 10,
    blueprint_compat = false,

    discovered = true,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1
            local message = card.ability.extra.rounds_left .. ""

            if card.ability.extra.rounds_left <= 0 then
                message = "Yes Pile!"

                local viable_jokers = {}
                local viable_joker_weights = {}

                for i,j in ipairs(pile_jokers_nopile) do
                    if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                        viable_jokers[#viable_jokers + 1] = j
                        viable_joker_weights[#viable_joker_weights + 1] = pile_jokers_weights_nopile[i]
                    end
                end

                card_eval_status_text(card, "extra", nil, nil, nil, { message = message })

                local new_card = create_card(
                    "Joker",
                    G.jokers,
                    nil,
                    nil,
                    true,
                    false,
                    pseudorandom_element_weighed(viable_jokers, viable_joker_weights, "nopile"..G.GAME.round_resets.ante),
                    nil
                )
                new_card:add_to_deck()
				G.jokers:emplace(new_card)
				new_card:start_materialize()

                -- Literally copied from example mod gross michael 2 :>
                G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
            else
                card_eval_status_text(card, "extra", nil, nil, nil, { message = message })
            end
        end
    end
}

-- JOKER - GALLIUM PILE
SMODS.Joker {
    key = "gallium_pile",
    loc_txt = {
        name = "Gallium Pile",
        text = {
            "{X:mult,C:white}X#1#{} mult for every card scored",
            "Decrease by {X:mult,C:white}X#2#{} after hand played",
            "{C:inactive,s:0.7}Destroy when {X:mult,C:white,s:0.7}Xmult {C:inactive,s:0.7} reaches {X:mult,C:white,s:0.7}X1"
        }
    },

    config = {
        extra = {
            xmult = 3,
            xmult_decrease = 0.25
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_decrease } }
    end,

    rarity = "mrzmd_pile",
    atlas = "Piles",
    pos = { x = 0, y = 2 },
    soul_pos = { x = 0, y = 3 },
    cost = 8,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.after and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_decrease

            if card.ability.extra.xmult <= 1 then
                card_eval_status_text(card, "extra", nil, nil, nil, { message = "Melted!" })

                G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
            else
                return {
                    message = "-X" .. card.ability.extra.xmult_decrease,
                    colour = G.C.MULT
                }
            end
        end
    end
}

-- JOKER - ANARCHIST
SMODS.Joker {
    key = "anarchist",
    loc_txt = {
        name = "Anarchist",
        text = {
            "Each scored {C:attention}2{}, {C:attention}3{}, {C:attention}4{}",
            "or {C:attention}5{} gives {X:mult,C:white}X#1#{} Mult.",
            "{C:mult}Destroy{} all scored {C:attention}Face{} cards",
            "{C:spectral,s:0.7}Idea and {C:inactive,s:0.4}(kinda) {C:spectral,s:0.7}art by u/malonkey1"
        }
    },

    config = {
        extra = {
            x_mult = 1.5
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end,

    rarity = 3,
    atlas = "MorzOMod",
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    cost = 7,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play then
            if context.individual then
                local card_id = context.other_card:get_id()
                if card_id == 2 or card_id == 3 or card_id == 4 or card_id == 5 then
                    return {
                        xmult = card.ability.extra.x_mult
                    }
                end
            end

            if context.destroying_card and not context.blueprint then
                return { remove = context.destroying_card:is_face() and not context.destroying_card.ability.eternal }
            end
        end
    end
}

-- JOKER - WILD JOKER
SMODS.Joker {
    key = "wild_joker",
    loc_txt = {
        name = "Wild Joker",
        text = {
            "Retrigger all played {V:1}#1#{} {C:attention}#2#{} time(s).",
            "{s:0.8}Suit changes at the end of round",
            "{C:inactive,s:0.6}Yes, this is synced with the Ancient Joker :>",
            "{C:spectral,s:0.7}Idea and art by u/Cuddly_Corvid"
        }
    },

    config = {
        extra = {
            retriggers = 1
        },

        immutable = {
            max_retriggers = 50
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {G.C.SUITS[G.GAME.current_round.ancient_card.suit]},
                G.GAME.current_round.ancient_card.suit,
                math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers)
            }
        }
    end,

    rarity = 2,
    atlas = "MorzOMod",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    cost = 5,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if context.other_card:is_suit(G.GAME.current_round.ancient_card.suit) then
				return {
					message = 'Again!',
					repetitions = math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers),
					card = card,
                    colour = G.C.SUITS[G.GAME.current_round.ancient_card.suit]
				}
			end
        end
    end
}

-- JOKER - GOLDEN STRING
SMODS.Joker {
    key = "golden_string",
    loc_txt = {
        name = "Golden String",
        text = {
            "{C:money}Gold{} cards give {C:money}$#1#{} on {C:mult}discard"
        }
    },

    config = {
        extra = {
            dollars = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    rarity = 1,
    atlas = "MorzOMod",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1 },
    cost = 4,
    blueprint_compat = true,

    discovered = true,

    calculate = function(self, card, context)
        if context.discard then
            if SMODS.has_enhancement(context.other_card, "m_gold") then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}