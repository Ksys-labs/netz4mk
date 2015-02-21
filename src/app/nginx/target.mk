TARGET=nginx

NGINX_DIR = $(call select_from_ports,nginx)/src/app/nginx

SRC_C +=      nginx.c \
     ngx_log.c \
     ngx_palloc.c \
     ngx_array.c \
     ngx_list.c \
     ngx_hash.c \
     ngx_buf.c \
     ngx_queue.c \
     ngx_output_chain.c \
     ngx_string.c \
     ngx_parse.c \
     ngx_inet.c \
     ngx_file.c \
     ngx_crc32.c \
     ngx_murmurhash.c \
     ngx_md5.c \
     ngx_rbtree.c \
     ngx_radix_tree.c \
     ngx_slab.c \
     ngx_times.c \
     ngx_shmtx.c \
     ngx_connection.c \
     ngx_cycle.c \
     ngx_spinlock.c \
     ngx_cpuinfo.c \
     ngx_conf_file.c \
     ngx_resolver.c \
     ngx_open_file_cache.c \
     ngx_crypt.c \
     ngx_event.c \
     ngx_event_timer.c \
     ngx_event_posted.c \
     ngx_event_busy_lock.c \
     ngx_event_accept.c \
     ngx_event_connect.c \
     ngx_event_pipe.c \
     ngx_time.c \
     ngx_errno.c \
     ngx_alloc.c \
     ngx_files.c \
     ngx_socket.c \
     ngx_recv.c \
     ngx_readv_chain.c \
     ngx_udp_recv.c \
     ngx_send.c \
     ngx_writev_chain.c \
     ngx_channel.c \
     ngx_shmem.c \
     ngx_process.c \
     ngx_daemon.c \
     ngx_setaffinity.c \
     ngx_setproctitle.c \
     ngx_posix_init.c \
     ngx_user.c \
     ngx_process_cycle.c \
     ngx_http.c \
     ngx_http_core_module.c \
     ngx_http_special_response.c \
     ngx_http_request.c \
     ngx_http_parse.c \
     ngx_http_header_filter_module.c \
     ngx_http_write_filter_module.c \
     ngx_http_copy_filter_module.c \
     ngx_http_request_body.c \
     ngx_http_variables.c \
     ngx_http_script.c \
     ngx_http_upstream.c \
     ngx_http_upstream_round_robin.c \
     ngx_http_parse_time.c \
     ngx_http_busy_lock.c \
     ngx_modules.c\
     ngx_posix_init.c \
     modules/ngx_select_module.c \
     modules/ngx_http_static_module.c \
     modules/ngx_http_range_filter_module.c\
     modules/ngx_http_chunked_filter_module.c\
     modules/ngx_http_headers_filter_module.c \
     modules/ngx_http_index_module.c \
     modules/ngx_http_log_module.c \
     modules/ngx_http_not_modified_filter_module.c \
     ngx_http_file_cache.c\
     ngx_event_openssl_stapling.c\
     ngx_http_spdy.c\
     ngx_http_spdy_filter_module.c\
     ngx_http_spdy_module.c\
     ngx_regex.c\
     ngx_event_openssl.c\
     ngx_http_gzip_static_module.c\
     ngx_http_dav_module.c\
     ngx_http_autoindex_module.c\
     ngx_http_random_index_module.c\
     ngx_http_auth_basic_module.c\
     ngx_http_access_module.c\
     ngx_http_limit_conn_module.c\
     ngx_http_limit_req_module.c\
     ngx_http_realip_module.c\
     ngx_http_geo_module.c\
     ngx_http_map_module.c\
     ngx_http_split_clients_module.c\
     ngx_http_referer_module.c\
     ngx_http_rewrite_module.c\
     ngx_http_proxy_module.c\
     ngx_http_fastcgi_module.c\
     ngx_http_uwsgi_module.c\
     ngx_http_scgi_module.c\
     ngx_http_memcached_module.c\
     ngx_http_empty_gif_module.c\
     ngx_http_browser_module.c\
     ngx_http_secure_link_module.c\
     ngx_http_degradation_module.c\
     ngx_http_flv_module.c\
     ngx_http_mp4_module.c\
     ngx_http_upstream_ip_hash_module.c\
     ngx_http_upstream_least_conn_module.c\
     ngx_http_upstream_keepalive_module.c\
     ngx_http_stub_status_module.c\
     ngx_http_gzip_filter_module.c\
     ngx_http_postpone_filter_module.c\
     ngx_http_ssi_filter_module.c\
     ngx_http_charset_filter_module.c\
     ngx_http_sub_filter_module.c\
     ngx_http_addition_filter_module.c\
     ngx_http_gunzip_filter_module.c\
     ngx_http_userid_filter_module.c\
     ngx_mail.c\
     ngx_mail_core_module.c\
     ngx_mail_ssl_module.c\
     ngx_mail_pop3_module.c\
     ngx_mail_imap_module.c\
     ngx_mail_smtp_module.c\
     ngx_mail_auth_http_module.c\
     ngx_mail_proxy_module.c\
     modules/ngx_http_ssl_module.c

#     ngx_http_geoip_module.c\ no GeoIP
#     ngx_http_image_filter_module.c\ no gd 
#     ngx_http_xslt_filter_module.c\ no libxml
#     modules/perl/ngx_http_perl_module.c no perl
#     misc/ngx_google_perftools_module.c no profiler

vpath %.c $(PRG_DIR)
vpath %.c $(NGINX_DIR)/src
vpath %.c $(NGINX_DIR)/src/core
vpath %.c $(NGINX_DIR)/src/event
vpath %.c $(NGINX_DIR)/src/event/modules
vpath %.c $(NGINX_DIR)/src/os/unix
vpath %.c $(NGINX_DIR)/src/http
vpath %.c $(NGINX_DIR)/src/http/modules
vpath %.c $(NGINX_DIR)/src/mail

CC_OPT += -O

CC_WARN = -Wall -Wno-unused-variable -Wno-unused-function

INC_DIR += $(NGINX_DIR)/src/core
INC_DIR += $(PRG_DIR)
INC_DIR += $(NGINX_DIR)/src/event
INC_DIR += $(NGINX_DIR)/src/event/modules
INC_DIR += $(NGINX_DIR)/src/os/unix
INC_DIR += $(NGINX_DIR)/src/http
INC_DIR += $(NGINX_DIR)/src/http/modules
INC_DIR += $(NGINX_DIR)/src/http/modules/perl
INC_DIR += $(NGINX_DIR)/src/mail

LIBS   += base libc libc-net libc-nameser libm pthread  pcre libcrypto zlib libssl
LIBS   += config_args
# plug-in to libc
LIBS	+= libc_lxip libc-resolv
#LIBS	+= libc_lwip_nic_dhcp

#ahci
#LIBS   += libc_fuse_ext2
#tar/ram
