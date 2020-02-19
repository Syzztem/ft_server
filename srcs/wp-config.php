<?php
define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'root' );

define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST', 'localhost' );

define( 'DB_CHARSET', 'utf8mb4' );
define('DB_COLLATE', '');
define( 'AUTH_KEY',         'g0YexJmdfSb@njTY]B<2xwMI8?vhu{ ~J)f(zGO82ZL{xk|^_*8;PtgAaQl& +8J' );
define( 'SECURE_AUTH_KEY',  '-nhB(J&=E`q=RmSp2m/.CU~KZ]^0<rJ:;XiugslefTIGaPS|-F >Z&$CczMY]S|e' );
define( 'LOGGED_IN_KEY',    '#sXlbUo2|%)Z[f@qakH6#}E!=ByS-KR|kTdaQu<kbR3m*`.E)A<5I**<D) nM[:>' );
define( 'NONCE_KEY',        'fgg&FlXAUn<eu}}$&2-/vujmGE2Hp:>z30:#|/,kuVt?INphzm[|PBWn<v`N+;EV' );
define( 'AUTH_SALT',        'Q0_[jy@hMaj*$BM9=A=K;>dZ.qLnAs6Al}88as>]u(oJvjqfT!fM,%RYI54p+Q{)' );
define( 'SECURE_AUTH_SALT', 'J9{Q;pNIZIJNZbQ0kc-.J0ocsUMc{Ij&(GErSUGH<R7k=:NzRx3)gRp[(QB;e!+h' );
define( 'LOGGED_IN_SALT',   'Y4t`v9=XP+ h|rNyhd>)v,qI0CNJn+V;r@2L/2u/I|UhI1a{]gjvLOFf(NO:)W>=' );
define( 'NONCE_SALT',       'Ye@AwKg@$@wfno5Yiuzd!H4K}qV!iurIp-^5_fML%oR5-}&MNk}!i7:ljd|3VS[9' );
$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');

