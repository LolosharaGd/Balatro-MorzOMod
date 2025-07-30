pile_jokers = {
    "j_mrzmd_gold_pile",
    "j_mrzmd_silver_pile",
    "j_mrzmd_copper_pile"
}
pile_color = HEX("714AB5")

SMODS.Atlas {
    key = "MorzOMod",
    path = "MorzOMod.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Piles",
    path = "Piles.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Boosters",
    path = "Boosters.png",
    px = 71,
    py = 95
}

SMODS.Rarity {
    key = "pile",
    loc_txt = {
        name = "Pile"
    },
    pools = {
        ["Joker"] = true,
        ["Joker"] = { rate = 0.01 },
        ["Pile"] = true
    },
    badge_colour = pile_color,
    default_weight = 0.01
}

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
    weight = 0.5 / 2,

    create_card = function(self, card, i)
        local viable_jokers = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element(viable_jokers, pseudoseed("pilebooster"..G.GAME.round_resets.ante)),
            nil
        )

        return new_card
    end
}

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
    weight = 0.5 / 2,

    create_card = function(self, card, i)
        local viable_jokers = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element(viable_jokers, pseudoseed("pilebooster"..G.GAME.round_resets.ante)),
            nil
        )

        return new_card
    end
}

SMODS.Booster {
    key = "pile_pack_jumbo",
    loc_txt = {
        name = "Pile Pack",
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
    weight = 0.4,

    create_card = function(self, card, i)
        local viable_jokers = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element(viable_jokers, pseudoseed("pilebooster"..G.GAME.round_resets.ante)),
            nil
        )

        return new_card
    end
}

SMODS.Booster {
    key = "pile_pack_mega",
    loc_txt = {
        name = "Pile Pack",
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
    weight = 0.3,

    create_card = function(self, card, i)
        local viable_jokers = {}

        for i,j in ipairs(pile_jokers) do
            if next(find_joker("Showman")) or not G.GAME.used_jokers[j] then
                viable_jokers[#viable_jokers + 1] = j
            end
        end

        local new_card = create_card(
            "Joker",
            G.pack_cards,
            nil,
            nil,
            true,
            false,
            pseudorandom_element(viable_jokers, pseudoseed("pilebooster"..G.GAME.round_resets.ante)),
            nil
        )

        return new_card
    end
}

SMODS.Joker {
    key = "gold_pile",
    loc_txt = {
        name = "Gold Pile",
        text = {
            "{C:money}$#1#{} for every card scored",
            "Increase by {C:money}$#2#{} after the boss blind",
            "{C:mult}Reset{} to {C:money}$#3#{} after shop reroll"
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
    cost = 4,
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
                    message = "Upgrade!",
                    colour = G.C.MONEY
                }
            end
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.dollars = card.ability.extra.start_dollars

            return {
                message = "Restart!",
                colour = G.C.MONEY
            }
        end
    end
}

SMODS.Joker {
    key = "silver_pile",
    loc_txt = {
        name = "Silver Pile",
        text = {
            "{C:chips}+#1#{} chips for every card scored",
            "Increase by {C:chips}#2#{} after the blind",
            "{C:mult}Reset{} to {C:chips}+#3#{} after shop reroll"
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
    cost = 5,
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
                message = "Upgrade!",
                colour = G.C.CHIPS
            }
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.start_chips

            return {
                message = "Restart!",
                colour = G.C.CHIPS
            }
        end
    end
}

SMODS.Joker {
    key = "copper_pile",
    loc_txt = {
        name = "Copper Pile",
        text = {
            "{C:mult}+#1#{} mult for every card scored",
            "Increase by {C:mult}#2#{} after hand played",
            "{C:mult}Reset{} to {C:mult}+#3#{} after shop reroll"
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
    cost = 6,
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
                message = "Upgrade!",
                colour = G.C.MULT
            }
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.start_mult

            return {
                message = "Restart!",
                colour = G.C.MULT
            }
        end
    end
}

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