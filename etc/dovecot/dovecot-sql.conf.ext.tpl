driver = mysql
connect = "host={dbHost} dbname={dbName} user={dbUser} password={dbPass}"
default_pass_scheme = CRYPT
user_query = SELECT CONCAT('/var/mail/vhosts/',homedir) AS home, CONCAT('maildir:/var/mail/vhosts/',maildir) AS mail, 150 AS uid, 8 AS gid, CONCAT('*:storage=', quota) AS quota_rule FROM pa_mailboxes WHERE username = '%u' AND active = '1'
password_query = SELECT username AS user, password, CONCAT('/var/mail/vhosts/',homedir) AS userdb_home, CONCAT('maildir:/var/mail/vhosts/', maildir) AS userdb_mail, 150 AS userdb_uid, 8 AS userdb_gid FROM pa_mailboxes WHERE username = '%u' AND active = '1'

# START use queries below instead of the above to put index files in /var/indexes/%u
#
# mkdir /var/indexes
# chown vmail:mail /var/indexes
#
# User dirs are created automatically.
#
#user_query = SELECT CONCAT('/var/mail/vhosts/',homedir) AS home, CONCAT('maildir:/var/mail/vhosts/',maildir, ':INDEX=/var/indexes/%u') AS mail, 150 AS uid, 8 AS gid, CONCAT('*:storage=', quota) AS quota_rule FROM pa_mailboxes WHERE username = '%u' AND active = '1'
#password_query = SELECT username AS user, password, CONCAT('/var/mail/vhosts/',homedir, ':INDEX=/var/indexes/%u') AS userdb_home, CONCAT('maildir:/var/mail/vhosts/', maildir) AS userdb_mail, 150 AS userdb_uid, 8 AS userdb_gid FROM pa_mailboxes WHERE username = '%u

# END



# For using doveadm -A:
iterate_query = SELECT username AS user FROM pa_mailboxes
