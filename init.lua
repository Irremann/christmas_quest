--local modpath = minetest.get_modpath(minetest.get_current_modname())

--dofile(modpath.."/mobs.lua")
--dofile(modpath.."/evil_snowman.lua")

mobs:register_mob("christmas_quest:evil_snowman", {
	description = "Evil Snowman",
	type = "monster",
	passive = false,
	attack_type = "shoot",
--	attack_animals = true;
	attack_players = true;
    shoot_interval = 3,
	arrow = "christmas_quest:snowball",
	shoot_offset = 1,
	damage = 2.5,
	hp_min = 50,
	hp_max = 50,
	armor = 100,
	blood_texture = "default_snowball.png",
	visual = "mesh",
	mesh = "christmas_decor_snowman.obj",
	visual_size = {x=12, y=12},
	collisionbox = {-0.5, -0.6, -0.5, 0.5, 1.2, 0.5},
    rotate = 180,
	textures = {
		{"evil_snowman.png"},
	},
	use_texture_alpha = "blend",
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "snowball",
		death = "snowball",
	},
	walk_velocity = 1,
	run_velocity = 1.5,
	jump = true,
	view_range = 20,
	drops = {
		{name = "christmas_quest:snowflake", chance = 1, min = 1, max = 1,},
		{name = "christmas_quest:snow_head", chance = 5, min = 1, max = 1},
	},
	water_damage = 10,
    fear_height = 6,
	lava_damage = 20,
	light_damage = 0,
	glow = 6;
	animation = {
		speed_normal = 25,		speed_run = 30,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 0,
		run_start = 0,		run_end = 0,
	},

})

mobs:register_arrow("christmas_quest:snowball", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"default_snowball.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 6},
		}, nil)
	end,

	hit_mob = function(self, player)
--		player:punch(self.object, 1.0, {
--			full_punch_interval = 1.0,
--			damage_groups = {fleshy = 2},
--		}, nil)
	end,

	hit_node = function(self, pos, node)
	end
})

mobs:register_egg("christmas_quest:evil_snowman", "evil_snowman", "christmas_decor_snowman_inv.png", 0)

mobs:spawn({
	name = "christmas_quest:evil_snowman",
	nodes = {"default:ice", "default:snowblock"},
	interval = 20,
	chance = 3000,
	active_object_count = 4,
	min_height = 0,
	max_height = 50,
})

minetest.register_node("christmas_quest:snowman", {
	description = "Snowman",
	drawtype = "mesh",
	mesh = "christmas_decor_snowman.obj",
	tiles = {"christmas_decor_snowman.png"},
	use_texture_alpha = "blend",
	inventory_image = "christmas_decor_snowman_inv.png",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 1.2, 0.5},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 1.2, 0.5},
	},
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	groups = {snappy = 3},
--	sounds = default_sounds("node_sound_leaves_defaults"),
})

minetest.register_craft({
	output = "christmas_quest:snowman",
	recipe = {
		{"default:coal_lump", "default:snowblock", "farming:carrot"},
		{"default:coal_lump", "default:snowblock", ""},
		{"", "default:snowblock", ""},
	},
})

minetest.register_node("christmas_quest:snowflake", {
    description = "Magic Snowflake - bring it to Santa Claus",
    inventory_image = "snowflake.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = false,
	light_source = 10,
	drawtype = "signlike",
	groups = {snappy = 3, attached_node = 1},
	selection_box = {type="wallmounted"},
	tiles = {"snowflake.png"},
	wield_image = "snowflake.png",
})

minetest.register_node("christmas_quest:giftbox", {
	description = "Giftbox",
	tiles = {
		"giftbox.png", --top
		"giftbox.png", --bottom
		"giftbox_side.png",
		"giftbox_side.png",
		"giftbox_side.png",
		"giftbox_side.png",
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_wood_defaults(),
	drop = {
		max_items = 1,
		min_items = 1,
		items = {
			{items = {'christmas_quest:frozen_helmet'}, rarity = 25},
			{items = {'christmas_quest:frozen_chestplate'}, rarity = 25},
			{items = {'christmas_quest:frozen_boots'}, rarity = 25},
			{items = {'christmas_quest:frozen_leggings'}, rarity = 25},
			{items = {'christmas_quest:frozen_shield'}, rarity = 25},
			{items = {'ethereal:banana 33'},rarity = 5},
			{items = {'ethereal:orange 33'},rarity = 5},
			{items = {'ethereal:strawberry 33'},rarity = 5},
			{items = {'farming:blackberry 33'},rarity = 5},
			{items = {'farming:chocolate_dark 33'},rarity = 5},
			{items = {'farming:turkish_delight 33'},rarity = 5},
			{items = {'christmas_decor:candycane_edible 33'},rarity = 5},
			{items = {'christmas_decor:gingerbread_man 33'},rarity = 5},
			{items = {'christmas_decor:helmet_santa_hat'},rarity = 10},
			{items = {'christmas_decor:stocking'},rarity = 10},
			{items = {'christmas_quest:hat_elf'},rarity = 10},
			{items = {'christmas_quest:sweater_with_snowman'},rarity = 10},
			{items = {'christmas_quest:sweater_with_reindeer'},rarity = 10},
			{items = {'currency:minegeld_50'},rarity = 25},
			{items = {'default:coal_lump 99'},rarity = 25},
		}
	},
})

mobs:register_mob("christmas_quest:santa_claus", {
	description = "Santa Claus",
	type = "npc",
	passive = true,
	pathfinding = false,
	nametag = tag,
	hp_min = 1000,
	hp_max = 1000,
	armor = 1000,
	collisionbox = {-0.35, 0.0, -0.35, 0.35, 1.8, 0.35},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {"christmas_decor_santa.png"},
	makes_footstep_sound = false,
	sounds = {},
	walk_velocity = 0,
	run_velocity = 0,
	jump = false,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	view_range = 15,
	owner = "",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
	},
	immune_to = {
		{"all"},
	},
	on_rightclick = function(self, clicker)
		
		minetest.sound_play("ho-ho-ho",{pos = clicker:get_pos(), gain = 1.0, max_hear_distance = 5,})
		
		if clicker:get_wielded_item():get_name() == "christmas_quest:snowflake" then
			clicker:get_inventory():remove_item("main", "christmas_quest:snowflake")
			
			if clicker:get_inventory():room_for_item("main", {name = "christmas_quest:giftbox"}) then
				clicker:get_inventory():add_item("main", "christmas_quest:giftbox 1")
			else
				local pos = self.object:get_pos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "christmas_quest:giftbox"})
			end

			--return
		end
	end
})

mobs:register_egg("christmas_quest:santa_claus", "santa_claus", "christmas_decor_gumdrop.png^[multiply:red", 0)




armor:register_armor("christmas_quest:frozen_helmet", {
	description = "Frozen Helmet",
	inventory_image = "christmas_quest_frozen_inv_helmet.png",
	groups = {armor_head=1, armor_heal=1, armor_use=500, physics_speed=0.05, physics_gravity=0.0},
	armor_groups = {fleshy=10},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("christmas_quest:frozen_chestplate", {
	description = "Frozen Chestplate",
	inventory_image = "christmas_quest_frozen_chestplate_inv.png",
  	groups = {armor_torso=1, armor_heal=1, armor_use=500, physics_speed=0.05, physics_gravity=0.0},
	armor_groups = {fleshy=15},
  	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("christmas_quest:frozen_boots", {
	description = "Frozen Boots",
	inventory_image = "christmas_quest_frozen_inv_boots.png",
	groups = {armor_feet=1, armor_heal=1, armor_use=500, physics_speed=0.05, physics_gravity=0.0},
	armor_groups = {fleshy=10},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("christmas_quest:frozen_leggings", {
	description = "Frozen Poleyn",
	inventory_image = "christmas_quest_frozen_inv_leggings.png",
	groups = {armor_legs=1, armor_heal=1, armor_use=500, physics_speed=0.05, physics_gravity=0.0},
	armor_groups = {fleshy=5},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})

armor:register_armor("christmas_quest:frozen_shield", {
	description = "Frozen Shield",
	inventory_image = "christmas_quest_frozen_inv_shield.png",
	groups = {armor_shield=1, armor_heal=1, armor_use=500, physics_speed=0.05, physics_gravity=0.0},
	armor_groups = {fleshy=10},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	reciprocate_damage = true
})

armor:register_armor("christmas_quest:hat_elf", {
	description = "Elf Hat",
	inventory_image = "christmas_decor_hat_elf_inv.png",
	groups = {armor_head=1, armor_heal=1, armor_use=1},
	armor_groups = {fleshy=1},
	damage_groups = {cracky=1, snappy=1, choppy=1, crumbly=1, level=1},
})

armor:register_armor("christmas_quest:sweater_with_snowman", {
	description = "Sweater with Snowman",
	inventory_image = "christmas_quest_sweater_with_snowman_inv.png",
	groups = {armor_torso=1, armor_heal=1, armor_use=1},
	armor_groups = {fleshy=1},
	damage_groups = {cracky=1, snappy=1, choppy=1, crumbly=1, level=1},
})

armor:register_armor("christmas_quest:sweater_with_reindeer", {
	description = "Sweater with Reindeer",
	inventory_image = "christmas_quest_sweater_with_reindeer_inv.png",
	groups = {armor_torso=1, armor_heal=1, armor_use=1},
	armor_groups = {fleshy=1},
	damage_groups = {cracky=1, snappy=1, choppy=1, crumbly=1, level=1},
})

armor:register_armor("christmas_quest:snow_head", {
	description = "Snow Head Helmet",
	inventory_image = "christmas_decor_snow_head_inv.png",
	groups = {armor_head=1, armor_heal=1, armor_use=50, physics_speed=0.05, physics_gravity=0.0},
	armor_groups = {fleshy=5},
	damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
})
