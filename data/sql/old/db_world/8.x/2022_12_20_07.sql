-- DB update 2022_12_20_06 -> 2022_12_20_07
-- 
SET @GUID := 100861;

DELETE FROM `pool_creature` WHERE `guid` IN (151903, 151919, 151920) AND `pool_entry` IN (1076, 1081);

-- Crippler (18689)
-- Remove DISABLE_MOVE flag
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4 WHERE (`entry` = 18689);

DELETE FROM `creature` WHERE `id1`=18689;
INSERT INTO `creature` (`guid`, `id1`, `map`, `spawnMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `MovementType`) VALUES
(@GUID+0, 18689, 530, 1, 0, -2993.69, 5490.54, -12.2903, 0.313398, 75600, 0, 0, 2),
(@GUID+1, 18689, 530, 1, 0, -2955.27, 4754.82, -20.8703, 2.52744, 86400, 0, 0, 2),
(@GUID+2, 18689, 530, 1, 0, -3323.31, 4275.22, -19.0502, 2.89265, 100800, 0, 0, 2),
(@GUID+3, 18689, 530, 1, 0, -3505.23, 4994.63, -101.396, 0.011024, 115200, 0, 0, 2),
(@GUID+4, 18689, 530, 1, 0, -3740.6, 4473.93, -8.56473, 1.76946, 43200, 0, 0, 2);

DELETE FROM `creature_addon` WHERE (`guid` IN (@GUID+0, @GUID+1, @GUID+2, @GUID+3, @GUID+4));
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@GUID+0, (@GUID+0)*10, 0, 0, 0, 0, 0, NULL),
(@GUID+1, (@GUID+1)*10, 0, 0, 0, 0, 0, NULL),
(@GUID+2, (@GUID+2)*10, 0, 0, 0, 0, 0, NULL),
(@GUID+3, (@GUID+3)*10, 0, 0, 0, 0, 0, NULL),
(@GUID+4, (@GUID+4)*10, 0, 0, 0, 0, 0, NULL);

DELETE FROM `waypoint_data` WHERE `id` IN ((@GUID+0)*10,(@GUID+1)*10,(@GUID+2)*10,(@GUID+3)*10,(@GUID+4)*10);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
((@GUID+0)*10, 1, -2993.69, 5490.54, -12.2903),
((@GUID+0)*10, 2, -2960.15, 5518.58, -5.7264),
((@GUID+0)*10, 3, -2932.3, 5516.94, -4.81505),
((@GUID+0)*10, 4, -2939.14, 5457.83, -9.06399),
((@GUID+0)*10, 5, -2991.6, 5386.54, -14.587),
((@GUID+0)*10, 6, -3035.04, 5312.15, -19.842),
((@GUID+0)*10, 7, -3029.83, 5244.07, -20.9786),
((@GUID+0)*10, 8, -2993.17, 5235.6, -18.7276),
((@GUID+0)*10, 9, -2949.53, 5274.16, -14.9218),
((@GUID+0)*10, 10, -2870.52, 5341.72, -9.88747),
((@GUID+0)*10, 11, -2835.22, 5384.21, -4.93172),
((@GUID+1)*10, 1, -2955.27, 4754.82, -20.8703),
((@GUID+1)*10, 2, -2979.31, 4764.42, -21.5558),
((@GUID+1)*10, 3, -2963.59, 4818.29, -21.716),
((@GUID+1)*10, 4, -2932.23, 4852.12, -21.6981),
((@GUID+1)*10, 5, -2890.22, 4922.97, -21.3442),
((@GUID+1)*10, 6, -2852.18, 4982.29, -20.1091),
((@GUID+1)*10, 7, -2841, 5016.43, -17.8675),
((@GUID+2)*10, 1, -3323.31, 4275.22, -19.0502),
((@GUID+2)*10, 2, -3423.24, 4295.54, -17.3294),
((@GUID+2)*10, 3, -3482.26, 4349.71, -17.5507),
((@GUID+2)*10, 4, -3540.89, 4448.93, -20.1783),
((@GUID+2)*10, 5, -3566.63, 4508, -18.9195),
((@GUID+2)*10, 6, -3536.7, 4567.91, -20.9977),
((@GUID+2)*10, 7, -3481.07, 4552.3, -19.7845),
((@GUID+2)*10, 8, -3464.79, 4516.98, -20.1464),
((@GUID+2)*10, 9, -3372.75, 4539.43, -21.95),
((@GUID+2)*10, 10, -3345.69, 4545.06, -22.0396),
((@GUID+2)*10, 11, -3288.71, 4447.84, -21.4994),
((@GUID+2)*10, 12, -3305.55, 4419.48, -21.8538),
((@GUID+2)*10, 13, -3425.33, 4337.3, -20.3393),
((@GUID+2)*10, 14, -3507.56, 4261.32, -8.66706),
((@GUID+2)*10, 15, -3572.33, 4277.64, -5.87435),
((@GUID+2)*10, 16, -3638.5, 4299.3, -0.716573),
((@GUID+2)*10, 17, -3749.48, 4370.51, 0.542307),
((@GUID+2)*10, 18, -3794.95, 4410.04, -2.39524),
((@GUID+2)*10, 19, -3853.63, 4463.9, -14.8232),
((@GUID+3)*10, 1, -3505.23, 4994.63, -101.396),
((@GUID+3)*10, 2, -3471.42, 5036.86, -101.137),
((@GUID+3)*10, 3, -3448.35, 5059.2, -100.81),
((@GUID+3)*10, 4, -3426.81, 5060.32, -101.125),
((@GUID+3)*10, 5, -3337.12, 4989.37, -101.396),
((@GUID+3)*10, 6, -3313.04, 4968.17, -101.323),
((@GUID+3)*10, 7, -3262.83, 4941.35, -101.193),
((@GUID+3)*10, 8, -3241.77, 4893.49, -101.396),
((@GUID+3)*10, 9, -3249.34, 4849.34, -101.396),
((@GUID+3)*10, 10, -3319.31, 4828.23, -101.396),
((@GUID+3)*10, 11, -3421.22, 4913.47, -101.395),
((@GUID+3)*10, 12, -3495.91, 4983.82, -101.395),
((@GUID+4)*10, 1, -3745.47, 4496.63, -9.39174),
((@GUID+4)*10, 2, -3740.55, 4515.75, -12.6168),
((@GUID+4)*10, 3, -3714.52, 4561.42, -15.5949),
((@GUID+4)*10, 4, -3691.07, 4629.86, -18.0632),
((@GUID+4)*10, 5, -3671.98, 4668.61, -17.5237),
((@GUID+4)*10, 6, -3659.5, 4691.22, -20.1589),
((@GUID+4)*10, 7, -3663.01, 4731.42, -21.011),
((@GUID+4)*10, 8, -3670.96, 4811.81, -21.3235),
((@GUID+4)*10, 9, -3692.4, 4832.97, -21.3243),
((@GUID+4)*10, 10, -3737.69, 4842.88, -19.617),
((@GUID+4)*10, 11, -3771.48, 4845.87, -19.3476),
((@GUID+4)*10, 12, -3784.54, 4789.69, -20.5939),
((@GUID+4)*10, 13, -3805.7, 4756.83, -25.7269),
((@GUID+4)*10, 14, -3796.46, 4716.94, -24.3906),
((@GUID+4)*10, 15, -3815.91, 4670.04, -27.4691),
((@GUID+4)*10, 16, -3821.61, 4608.38, -21.6523),
((@GUID+4)*10, 17, -3807.01, 4574.98, -17.8086),
((@GUID+4)*10, 18, -3800.57, 4549.48, -18.1872),
((@GUID+4)*10, 19, -3796.15, 4512.84, -19.2235),
((@GUID+4)*10, 20, -3801.02, 4470.16, -13.1805),
((@GUID+4)*10, 21, -3771.69, 4449.77, -7.30134),
((@GUID+4)*10, 22, -3707.55, 4428.35, -7.42426),
((@GUID+4)*10, 23, -3670.43, 4428.79, -11.5316),
((@GUID+4)*10, 24, -3630.64, 4456.85, -16.9659),
((@GUID+4)*10, 25, -3555.26, 4510.33, -18.66),
((@GUID+4)*10, 26, -3571.25, 4577.81, -21.0895),
((@GUID+4)*10, 27, -3597.28, 4595.12, -20.5279);

UPDATE `pool_template` SET `description`='Crippler (18689)' WHERE `entry`=1076;

DELETE FROM `pool_creature` WHERE `pool_entry`=1076 AND `description`='Crippler (18689)';
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@GUID+0, 1076, 0, 'Crippler (18689)'),
(@GUID+1, 1076, 0, 'Crippler (18689)'),
(@GUID+2, 1076, 0, 'Crippler (18689)'),
(@GUID+3, 1076, 0, 'Crippler (18689)'),
(@GUID+4, 1076, 0, 'Crippler (18689)');

-- Bro'Gaz the Clanless (18684)
-- Remove DISABLE_MOVE flag
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4 WHERE (`entry` = 18684);

DELETE FROM `creature` WHERE `id1`=18684;
INSERT INTO `creature` (`guid`, `id1`, `map`, `spawnMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `MovementType`) VALUES
(@GUID+5, 18684, 530, 1, 0, -1136.1, 8670.83, 45.0333, 3.60894, 75600, 2),
(@GUID+6, 18684, 530, 1, 0, -2791.89, 6553.52, 37.0286, 1.23389, 115200, 2),
(@GUID+7, 18684, 530, 1, 0, -1656.84, 8747.51, 30.8561, 6.20546, 43200, 2);

DELETE FROM `creature_addon` WHERE (`guid` IN (@GUID+5, @GUID+6, @GUID+7));
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@GUID+5, (@GUID+5)*10, 0, 0, 1, 0, 0, NULL),
(@GUID+6, (@GUID+6)*10, 0, 0, 1, 0, 0, NULL),
(@GUID+7, (@GUID+7)*10, 0, 0, 1, 0, 0, NULL);

DELETE FROM `waypoint_data` WHERE `id` IN ((@GUID+5)*10,(@GUID+6)*10,(@GUID+7)*10);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
((@GUID+5)*10, 1, -1153.4, 8650.08, 37.2051),
((@GUID+5)*10, 2, -1173.21, 8632.92, 36.6652),
((@GUID+5)*10, 3, -1227.01, 8607.18, 27.0261),
((@GUID+5)*10, 4, -1271.02, 8604.13, 24.8882),
((@GUID+5)*10, 5, -1316.03, 8615.14, 25.3435),
((@GUID+5)*10, 6, -1337.51, 8644.42, 23.7964),
((@GUID+5)*10, 7, -1345.32, 8680.62, 28.4094),
((@GUID+5)*10, 8, -1356.39, 8700.27, 28.5239),
((@GUID+5)*10, 9, -1375.98, 8722.26, 24.125),
((@GUID+5)*10, 10, -1411.15, 8731.79, 21.4807),
((@GUID+5)*10, 11, -1445.6, 8750.9, 28.0136),
((@GUID+5)*10, 12, -1472.65, 8787.18, 29.5464),
((@GUID+5)*10, 13, -1502.47, 8794.64, 30.6681),
((@GUID+5)*10, 14, -1523.75, 8808.42, 35.8454),
((@GUID+5)*10, 15, -1567.27, 8807.88, 32.5204),
((@GUID+5)*10, 16, -1612.86, 8807.3, 34.0422),
((@GUID+5)*10, 17, -1660.61, 8806.7, 38.807),
((@GUID+5)*10, 18, -1710.91, 8806.07, 30.7289),
((@GUID+5)*10, 19, -1739.43, 8815.27, 36.1499),
((@GUID+5)*10, 20, -1796.56, 8834.68, 30.3202),
((@GUID+5)*10, 21, -1831.27, 8867.12, 31.3868),
((@GUID+5)*10, 22, -1868.34, 8876.12, 35.3925),
((@GUID+5)*10, 23, -1889.36, 8910.44, 37.8667),
((@GUID+5)*10, 24, -1902.38, 8918.87, 36.5093),
((@GUID+5)*10, 25, -1850, 8910.74, 36.7844),
((@GUID+5)*10, 26, -1796.37, 8871.78, 32.4311),
((@GUID+5)*10, 27, -1766.35, 8854.41, 28.1974),
((@GUID+5)*10, 28, -1731.35, 8834.15, 35.8627),
((@GUID+5)*10, 29, -1702.75, 8808.3, 32.3093),
((@GUID+5)*10, 30, -1673.06, 8807.7, 38.2999),
((@GUID+5)*10, 31, -1622.03, 8794.79, 35.6594),
((@GUID+5)*10, 32, -1598.25, 8796.01, 31.5502),
((@GUID+5)*10, 33, -1550.83, 8798.43, 34.5343),
((@GUID+5)*10, 34, -1515.33, 8806.05, 34.8541),
((@GUID+5)*10, 35, -1487.17, 8788.58, 30.2122),
((@GUID+5)*10, 36, -1454.07, 8754.32, 28.7642),
((@GUID+5)*10, 37, -1415.5, 8742.22, 23.6564),
((@GUID+5)*10, 38, -1390.37, 8746.55, 25.5528),
((@GUID+5)*10, 39, -1374.32, 8744.18, 28.0885),
((@GUID+5)*10, 40, -1352.62, 8729.92, 27.7678),
((@GUID+5)*10, 41, -1322.89, 8734.36, 30.9611),
((@GUID+5)*10, 42, -1267.26, 8752.43, 36.6239),
((@GUID+5)*10, 43, -1228.74, 8709.63, 37.2785),
((@GUID+5)*10, 44, -1201.66, 8685.47, 39.1488),
((@GUID+5)*10, 45, -1189.4, 8650.46, 32.8064),
((@GUID+5)*10, 46, -1158.6, 8633.82, 39.1495),
((@GUID+5)*10, 47, -1140.29, 8659.66, 41.2302),
((@GUID+5)*10, 48, -1127.37, 8680.82, 50.1478),
((@GUID+6)*10, 1, -2774.95, 6601.87, 30.7438),
((@GUID+6)*10, 2, -2748.98, 6676.02, 15.5031),
((@GUID+6)*10, 3, -2730.93, 6749.95, -0.845251),
((@GUID+6)*10, 4, -2711.67, 6795.93, -4.3082),
((@GUID+6)*10, 5, -2678.55, 6830.27, -5.53566),
((@GUID+6)*10, 6, -2651.32, 6895.3, -2.83228),
((@GUID+6)*10, 7, -2622.68, 6929.26, -0.571877),
((@GUID+6)*10, 8, -2590.64, 6968.93, -0.855486),
((@GUID+6)*10, 9, -2509.89, 7037.06, -6.73834),
((@GUID+6)*10, 10, -2589.04, 7012.13, -3.12094),
((@GUID+6)*10, 11, -2633.03, 6950.42, -0.357443),
((@GUID+6)*10, 12, -2667.38, 6885.67, -4.91678),
((@GUID+6)*10, 13, -2703.6, 6850.62, -3.53362),
((@GUID+6)*10, 14, -2726.43, 6826.19, -0.519317),
((@GUID+6)*10, 15, -2729.5, 6766.1, -1.54172),
((@GUID+6)*10, 16, -2776.37, 6710.96, 12.0384),
((@GUID+6)*10, 17, -2788.17, 6674.34, 20.5757),
((@GUID+6)*10, 18, -2791.9, 6588.22, 34.1142),
((@GUID+6)*10, 19, -2786.89, 6544.15, 36.7267),
((@GUID+6)*10, 20, -2794.25, 6525.21, 38.6326),
((@GUID+6)*10, 21, -2790.58, 6546.94, 36.6907),
((@GUID+7)*10, 1, -1595.58, 8743.12, 32.8909),
((@GUID+7)*10, 2, -1552.01, 8736.9, 31.5443),
((@GUID+7)*10, 3, -1471.7, 8686.72, 22.0652),
((@GUID+7)*10, 4, -1379.82, 8538.92, 11.15),
((@GUID+7)*10, 5, -1250.93, 8446.48, 18.2325),
((@GUID+7)*10, 6, -1049.93, 8389.46, 20.4694),
((@GUID+7)*10, 7, -968.256, 8345.41, 21.3638),
((@GUID+7)*10, 8, -951.008, 8285.09, 20.2325),
((@GUID+7)*10, 9, -898.222, 8341.75, 24.8691),
((@GUID+7)*10, 10, -968.256, 8345.41, 21.3638),
((@GUID+7)*10, 11, -1049.93, 8389.46, 20.4694),
((@GUID+7)*10, 12, -1250.93, 8446.48, 18.2325),
((@GUID+7)*10, 13, -1379.82, 8538.92, 11.15),
((@GUID+7)*10, 14, -1471.7, 8686.72, 22.0652),
((@GUID+7)*10, 15, -1552.01, 8736.9, 31.5443),
((@GUID+7)*10, 16, -1595.58, 8743.12, 32.8909),
((@GUID+7)*10, 17, -1656.84, 8747.51, 30.8561);

DELETE FROM `pool_template` WHERE `entry`=1109 AND `description`='Bro\'Gaz the Clanless (18684)';
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (1109, 1, 'Bro\'Gaz the Clanless (18684)');

DELETE FROM `pool_creature` WHERE `pool_entry`=1109 AND `description`='Bro\'Gaz the Clanless (18684)';
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@GUID+5, 1109, 0, 'Bro\'Gaz the Clanless (18684)'),
(@GUID+6, 1109, 0, 'Bro\'Gaz the Clanless (18684)'),
(@GUID+7, 1109, 0, 'Bro\'Gaz the Clanless (18684)');

-- Hemathion (18692)
DELETE FROM `creature` WHERE `id1`=18692;
INSERT INTO `creature` (`guid`, `id1`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `MovementType`) VALUES
(@GUID+8, 18692, 530, 1, 2807.9, 7239.05, 365.242, 4.89664, 43200, 2),
(@GUID+9, 18692, 530, 1, 1837.67, 7158.53, 364.398, 2.69354, 43200, 2);

DELETE FROM `creature_addon` WHERE (`guid` IN (@GUID+8, @GUID+9));
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(@GUID+8, (@GUID+8)*10, 0, 0, 0, 0, 0, NULL),
(@GUID+9, (@GUID+9)*10, 0, 0, 0, 0, 0, NULL);

DELETE FROM `waypoint_data` WHERE `id` IN ((@GUID+8)*10,(@GUID+9)*10);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
((@GUID+8)*10, 1, 2808.94, 7233.49, 365.128),
((@GUID+8)*10, 2, 2779.21, 7215.7, 365.214),
((@GUID+8)*10, 3, 2743.24, 7205.85, 366.074),
((@GUID+8)*10, 4, 2716.31, 7203.94, 366.735),
((@GUID+8)*10, 5, 2682.06, 7222.73, 365.634),
((@GUID+8)*10, 6, 2650.47, 7236.35, 365.005),
((@GUID+8)*10, 7, 2616.39, 7251.05, 364.581),
((@GUID+8)*10, 8, 2582.67, 7240.97, 364.749),
((@GUID+8)*10, 9, 2555.35, 7214.8, 366.146),
((@GUID+8)*10, 10, 2539.97, 7186.03, 364.595),
((@GUID+8)*10, 11, 2522.82, 7155.45, 366.411),
((@GUID+8)*10, 12, 2494.83, 7120.39, 364.493),
((@GUID+8)*10, 13, 2464.07, 7095.25, 364.702),
((@GUID+8)*10, 14, 2422.04, 7101.15, 365.745),
((@GUID+8)*10, 15, 2378.71, 7121.38, 365.629),
((@GUID+8)*10, 16, 2422.04, 7101.15, 365.745),
((@GUID+8)*10, 17, 2464.07, 7095.25, 364.702),
((@GUID+8)*10, 18, 2494.83, 7120.39, 364.493),
((@GUID+8)*10, 19, 2522.82, 7155.45, 366.411),
((@GUID+8)*10, 20, 2539.97, 7186.03, 364.595),
((@GUID+8)*10, 21, 2555.35, 7214.8, 366.146),
((@GUID+8)*10, 22, 2582.67, 7240.97, 364.749),
((@GUID+8)*10, 23, 2616.39, 7251.05, 364.581),
((@GUID+8)*10, 24, 2650.47, 7236.35, 365.005),
((@GUID+8)*10, 25, 2682.06, 7222.73, 365.634),
((@GUID+8)*10, 26, 2716.31, 7203.94, 366.735),
((@GUID+8)*10, 27, 2743.24, 7205.85, 366.074),
((@GUID+8)*10, 28, 2779.21, 7215.7, 365.214),
((@GUID+8)*10, 29, 2808.94, 7233.49, 365.128),
((@GUID+8)*10, 30, 2837.03, 7252.18, 364.441),
((@GUID+9)*10, 1, 1809.32, 7172.16, 364.569),
((@GUID+9)*10, 2, 1815.44, 7204.85, 364.661),
((@GUID+9)*10, 3, 1842.55, 7242.15, 364.581),
((@GUID+9)*10, 4, 1879.16, 7258.35, 363.861),
((@GUID+9)*10, 5, 1915.92, 7275.4, 364.088),
((@GUID+9)*10, 6, 1943.62, 7285.08, 364.204),
((@GUID+9)*10, 7, 1976.63, 7309.15, 364.544),
((@GUID+9)*10, 8, 2014.21, 7319.44, 364.414),
((@GUID+9)*10, 9, 2045.85, 7317.11, 364.715),
((@GUID+9)*10, 10, 2081.96, 7308.12, 363.934),
((@GUID+9)*10, 11, 2098.48, 7283.07, 364.555),
((@GUID+9)*10, 12, 2110.94, 7263.13, 364.382),
((@GUID+9)*10, 13, 2088.67, 7240.71, 364.611),
((@GUID+9)*10, 14, 2083.66, 7218.63, 364.079),
((@GUID+9)*10, 15, 2051.24, 7208.45, 363.979),
((@GUID+9)*10, 16, 2021.54, 7208.53, 364.381),
((@GUID+9)*10, 17, 1995.11, 7195.22, 364.133),
((@GUID+9)*10, 18, 1970.71, 7173.65, 364.284),
((@GUID+9)*10, 19, 1943.43, 7162.6, 364.565),
((@GUID+9)*10, 20, 1918.51, 7157.14, 364.285),
((@GUID+9)*10, 21, 1883.81, 7154.67, 364.475),
((@GUID+9)*10, 22, 1850.35, 7146.59, 364.084),
((@GUID+9)*10, 23, 1835.89, 7151.59, 364.627);

UPDATE `pool_template` SET `description`='Hemathion (18692)' WHERE `entry`=1081;

DELETE FROM `pool_creature` WHERE `pool_entry`=1081 AND `description`='Hemathion (18692)';
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@GUID+8, 1081, 0, 'Hemathion (18692)'),
(@GUID+9, 1081, 0, 'Hemathion (18692)');