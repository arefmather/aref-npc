local relationshipTypes = {
	'GANG_1',
	'GANG_2',
	'GANG_9',
	'GANG_10',
	'AMBIENT_GANG_LOST',
	'AMBIENT_GANG_MEXICAN',
	'AMBIENT_GANG_FAMILY',
	'AMBIENT_GANG_BALLAS',
	'AMBIENT_GANG_MARABUNTE',
	'AMBIENT_GANG_CULT',
	'AMBIENT_GANG_SALVA',
	'AMBIENT_GANG_WEICHENG',
	'AMBIENT_GANG_HILLBILLY',
	'DEALER',
	'COP',
	'PRIVATE_SECURITY',
	'SECURITY_GUARD',
	'ARMY',
	'MEDIC',
	'FIREMAN',
	'HATES_PLAYER',
	'NO_RELATIONSHIP',
	'SPECIAL',
	'MISSION2',
	'MISSION3',
	'MISSION4',
	'MISSION5',
	'MISSION6',
	'MISSION7',
	'MISSION8'
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		SetVehicleDensityMultiplierThisFrame(0.2)
		SetPedDensityMultiplierThisFrame(0.3)
		SetRandomVehicleDensityMultiplierThisFrame(0.2)
		SetParkedVehicleDensityMultiplierThisFrame(0.4)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		SetGarbageTrucks(false)
		SetRandomBoats(false)
		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end) 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)

		for _, group in ipairs(relationshipTypes) do
			SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), GetHashKey(group))
			SetRelationshipBetweenGroups(1, GetHashKey(group), GetHashKey('PLAYER'))
		end
	end
end)

Citizen.CreateThread(function()
   while true do
     Citizen.Wait(1)
     RemoveAllPickupsOfType(0xDF711959)
     RemoveAllPickupsOfType(0xF9AFB48F)
     RemoveAllPickupsOfType(0xA9355DCD)
   end
end)
