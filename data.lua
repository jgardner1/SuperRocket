data:extend({
  {
    type = "ammo-category",
    name = "super-rocket"
  },
    {
      type = "technology",
      name = "super-rocket",
      icon = "__base__/graphics/icons/rocket-launcher.png",
      effects = {
        {
          type = "unlock-recipe",
          recipe = "super-rocket-launcher"
        },
        {
          type = "unlock-recipe",
          recipe = "super-rocket"
        }
      },
      
      prerequisites = {"rocketry"},
      unit = {
        count = 2000,
        ingredients = {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
          {"science-pack-3", 1},
        },
        time = 60
      },
      upgrade = true,
      order = "e-a-d",
    },
  {
    type = "recipe",
    name = "super-rocket-launcher",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {"steel-plate", 5},
      {"processing-unit", 8},
      {"speed-module-3", 5},
      {"productivity-module-3", 5},
    },
    result = "rocket-launcher"
  },
  {
    type = "gun",
    name = "super-rocket-launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "gun",
    order = "d[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "super-rocket",
      movement_slow_down_factor = 0.8,
      cooldown = 60,
      projectile_creation_distance = 0.6,
      range = 1000,
      projectile_center = {-0.17, 0},
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 5
  },
  {
    type = "recipe",
    name = "super-rocket",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"processing-unit", 1},
      {"explosives", 100},
      {"steel-plate", 100}
    },
    result = "rocket"
  },
  {
    type = "ammo",
    name = "super-rocket",
    icon = "__base__/graphics/icons/explosive-rocket.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "super-rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "super-rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-b[super]",
    stack_size = 100
  },
  {
    type = "projectile",
    name = "super-rocket",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              perimeter = 50,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 10000, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            },
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = {0, 0},
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, -1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
})
