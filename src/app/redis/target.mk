TARGET=redis

REDIS_DIR = $(call select_from_ports,redis)/src/app/redis

#FILTER_OUT = ae_epoll.c ae_evport.c
#SRC_C = $(filter-out $(FILTER_OUT),$(notdir $(wildcard $(REDIS_DIR)/src/*.c)))

SRC_C = adlist.c ae.c anet.c dict.c redis.c sds.c zmalloc.c lzf_c.c lzf_d.c pqsort.c zipmap.c sha1.c ziplist.c release.c networking.c util.c object.c db.c replication.c rdb.c t_string.c t_list.c t_set.c t_zset.c t_hash.c config.c aof.c pubsub.c multi.c debug.c sort.c intset.c syncio.c cluster.c crc16.c endianconv.c slowlog.c scripting.c bio.c rio.c rand.c memtest.c crc64.c bitops.c sentinel.c notify.c setproctitle.c blocked.c latency.h sparkline.c hyperloglog.c
SRC_C +=net.c hiredis.c sds.c async.c
SRC_C +=lapi.c lcode.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c \
	lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c  \
	lundump.c lvm.c lzio.c strbuf.c

SRC_C +=lauxlib.c lbaselib.c ldblib.c liolib.c lmathlib.c loslib.c ltablib.c \
	lstrlib.c loadlib.c linit.c lua_cjson.c lua_struct.c lua_cmsgpack.c


vpath %.c $(REDIS_DIR)/src
vpath %.c $(REDIS_DIR)/deps/hiredis
vpath %.c $(REDIS_DIR)/deps/lua/src

#CC_OPT += -DHAVE_SOCKLEN_T -DHAVE_SYSLOG_H -DHAVE_STDINT_H -DUSE_POLL

CC_WARN = -Wall -Wno-unused-variable -Wno-unused-function

INC_DIR += $(PRG_DIR)
INC_DIR += $(REDIS_DIR)/src
INC_DIR += $(REDIS_DIR)/deps/lua/
INC_DIR += $(REDIS_DIR)/deps/hiredis
INC_DIR += $(REDIS_DIR)/deps/jemalloc
INC_DIR += $(REDIS_DIR)/deps/linenoise
INC_DIR += $(REDIS_DIR)/deps/lua/src/


LIBS   += base libc libc-net libc-nameser libm pthread
# plug-in to libc
LIBS   += config_args libc-isc
#LIBS	+= libc_lxip libc-resolv
LIBS	+= libc_lwip_nic_dhcp
