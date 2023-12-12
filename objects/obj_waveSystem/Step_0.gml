// Initialization
if (!instance_exists(obj_enemy_parent)) {
    spawnNumber = 0;
}

if (spawnNumber == 0) {
    wave++;
    spawnNumber = irandom_range(wave * 1, wave * 3);

    var safeSpawnDistance = 60; // Adjust this value as needed

    blockChance = irandom(1);
	if (blockChance == 1){
		instance_create_depth(
			clamp(random(room_width - safeSpawnDistance * 2) + safeSpawnDistance, safeSpawnDistance, room_width - safeSpawnDistance),
			clamp(random(room_height - safeSpawnDistance * 2) + safeSpawnDistance, safeSpawnDistance, room_height - safeSpawnDistance),
			self.depth + 1, obj_block
		);
	}

    for (var i = 0; i < spawnNumber; i++) {
		var enemyType = irandom(1);

		var spawnX = clamp(random(room_width - safeSpawnDistance * 2) + safeSpawnDistance, safeSpawnDistance, room_width - safeSpawnDistance);
		var spawnY = clamp(random(room_height - safeSpawnDistance * 2) + safeSpawnDistance, safeSpawnDistance, room_height - safeSpawnDistance);
		
		if (enemyType == 0) {
			instance_create_depth(spawnX, spawnY, self.depth + 1, obj_enemie1);
		}
		else {
			instance_create_depth(spawnX, spawnY, self.depth + 1, obj_enemie2);
		}
	}

}












 