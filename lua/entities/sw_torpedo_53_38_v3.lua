AddCSLuaFile()
DEFINE_BASECLASS( "sw_base_torpedo_v3" )

sound.Add( {
	name = "SW_TORP_ENG_LOOP",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = 70,
	sound = "sw/torpedoes/torpedo_run.wav"
} )

--Main info
ENT.Type = "anim"
ENT.Spawnable		            	 =	true
ENT.AdminSpawnable		             =	false
ENT.AdminOnly						 =	false
ENT.PrintName		                 =	"53-38"
ENT.Author			                 =	"Shermann Wolf"
ENT.Contact			                 =	"shermannwolf@gmail.com"
ENT.Category                         =	"SW Torpedoes V3 | RUS"
ENT.SWBombV3						 =	true
ENT.IsRocket						 =	true

--Visual
ENT.Model                            =	"models/sw/rus/torpedoes/53_39.mdl"

--Physics
ENT.ImpactSpeed                      =	500
ENT.Mass                             =	100
ENT.MaxVelocity        				 =	560
ENT.WaterThrustForce 				 =  250
ENT.RotationalForce     			 =	0
ENT.Buoyancy						 =  0.15
ENT.FuelBurnoutTime 				 =	25


--Explosion
ENT.DamageType						 =	DMG_BURN
ENT.ExplosionDamage                  =	15000
ENT.ExplosionRadius                  =	732.421875
ENT.BlastRadius                 	 =	1098.6328125