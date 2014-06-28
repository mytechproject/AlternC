
ALTER TABLE variable DROP PRIMARY KEY;
# Quick-fix to make setup work again
# ALTER TABLE variable ADD id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE variable ADD strata enum('DEFAULT','GLOBAL','FQDN', 'FQDN_CREATOR', 'CREATOR', 'MEMBER', 'DOMAIN') NOT NULL DEFAULT 'DEFAULT';
ALTER TABLE variable ADD strata_id bigint DEFAULT NULL;
ALTER TABLE variable ADD type text DEFAULT '';
ALTER TABLE variable ADD UNIQUE (name, strata, strata_id);

ALTER TABLE actions MODIFY COLUMN type enum('CREATE_FILE','FIX_USER','CREATE_DIR','DELETE','MOVE','FIX_DIR','FIX_FILE');

