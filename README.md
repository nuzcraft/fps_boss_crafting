# FPS BOSS CRAFTING PROJECT PLAN

Timeline: 1 month (real-time) | 30-40 hrs dev time
November 2022

Goals: Create a Boss-focused FPS with a crafting system ala Monster Hunter
Theme: Likely defined by GDFG Monthly Jam #22 as I have liked submitting for those

### Needs

- [x] First-person perspective
- [x] 1 raycast gun
- [ ] 3 boss enemies that drop loot
- [ ] loot can be used to upgrade the gun
- [x] basic arena to do combat in
- [x] sounds
- [ ] screenshake

- [ ] new player sprites
- [ ] new enemy sprites
- [ ] new arena textures
- [ ] interesting arena elements (like torches/traps)
- [ ] more sounds
- [ ] music
- [ ] vignette on player camera

### Wants - Tier 1

- [ ] 1 additional weapon w/ upgrade path
- [ ] diverging upgrade paths
- [ ] ability to repeat boss fight to get more materials

### Wants - Tier 2

- [ ] non-boss enemies/creatures/npcs
- [ ] more interesting arenas/areas to fight in
- [ ] gathering points for more materials
- [ ] upgrade paths updated to use new materials

### Wants - Tier 3

- [ ] 1 additional weapon w/ upgrade path
- [ ] items and ability to use them
- [ ] crafting recipes for items

### Wants - Tier 4

- [ ] roguelike randomization of bosses/arenas etc
- [ ] higher fidelity models/animations

# Devlog

## 2022.10.22

It's kinda too early to start development...but I'm going to try to get somethign basic up and running so I can futz with classes/structures/etc.

I'm going to start with the FPS controller from Garbaj that I used for Mildly Haunted.

Welp...some stuff happened and I need to stay up pretty much all night. Going to see what I can learn about 2D/3D FPS shenanigans. That will get me out of complex 3d modeling for a bit.

Miziziziz is amazing - https://www.youtube.com/watch?v=LbyyjmOji0M&t - will be combining this with Garbaj's FPS controller

Ha, after watching the Miziziziz video, I will be starting with their controller instead of Garbaj's. Nothing wrong with Garbaj's controller, but the limitation on jumping and camera movement are going to make it easier to design the rest of the game in a month.

Good news, I did NOT have to stay up all night, so I only spent a couple hours working on things.

Dev Time: 3 hours

## 2022.10.23

I'm starting out today with a baseline from Miziziziz and am going to start tweaking. I think I want to add a simple gunshot sound to start getting a feel for the impact. I may also look at freeing up/down camera movement; I'd pull some of that logic from Garbaj's controller. Regardless, I think the next thing I should look at setting up is a testing arena to mess around with.

I found a link to some firearm sounds here: https://opengameart.org/content/the-free-firearm-sound-library. It's under CC0, so I don't need to credit anyone + the source website is super dead.

Miziziziz to the rescue... https://www.youtube.com/watch?v=s35HcQ5xv6A - what looks to be an semi-easy way to tile maps in support of his doom clone. Will start with this.

Dev Time: 2 hours

## 2020.10.24

I spent maybe 20 mins putting together the bulk of Miziziziz's grid-map system and it's just a really simple way to set up a gridmap in Godot. I'm looking forward to doing some additional customization, potentionally using a scene from Godots own gridmap demo as a base for some (maybe) custom textures. https://docs.godotengine.org/en/stable/_downloads/517017c514e6f170e33c06253ef7b39f/gridmap_demo.zip

Scratch that idea from the godot demo - it just includes parts of a mini-golf course, not a standard set of walls/floors. But, it does kinda layout how to create the mesh libraries from other 3d object files. I _may_ try to use blender to create some basic dungeon/arena shapes in the future. Going to just start with cubes and see how it goes.

Dev Time: 30 mins (so far)
