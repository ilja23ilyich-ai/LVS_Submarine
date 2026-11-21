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
ENT.PrintName		                 =	"УМГТ-1"
ENT.Author			                 =	"Shermann Wolf"
ENT.Contact			                 =	"shermannwolf@gmail.com"
ENT.Category                         =	"SW Torpedoes V3 | RUS"
ENT.SWBombV3						 =	true
ENT.IsRocket						 =	true

--Visual
ENT.Model                            =	"models/sw/rus/torpedoes/umgt1.mdl"

--Physics
ENT.ImpactSpeed                      =	500
ENT.Mass                             =	100
ENT.MaxVelocity        				 =	750
ENT.WaterThrustForce 				 =  250
ENT.RotationalForce     			 =	0
ENT.Buoyancy						 =  0.25
ENT.FuelBurnoutTime 				 =	20


--Explosion
ENT.DamageType						 =	DMG_BURN
ENT.ExplosionDamage                  =	15000
ENT.ExplosionRadius                  =	468.75
ENT.BlastRadius                 	 =	703.125