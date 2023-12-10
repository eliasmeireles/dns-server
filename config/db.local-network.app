;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	local-network.app. root.local-network.app. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	local-network.app.
@	IN	A	172.30.0.2
www	IN	A	172.31.0.2