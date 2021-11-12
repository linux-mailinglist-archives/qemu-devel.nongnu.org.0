Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A4444E1AF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:46:40 +0100 (CET)
Received: from localhost ([::1]:57316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPOZ-0006da-0E
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:46:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHe-0006E9-Fk
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHc-0005Op-9L
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636695567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LG3JdECCuVaZ09IG/1lMKWaqDfT+2PUZn7zNymST8yQ=;
 b=Rgl7hrJ5vfNaIkepTvw1/YpXGyVhUEzAfEqPtDGHjj8HIuQR72jI8GFM9pBaScZIuc/s3o
 ZMIqy7KWTYPldxFYuXyxyABLprTDAwT4r1iEsJwnfbRR6CjMmC56+Ttf57qnbH/Nrkg0gT
 nfqR3QE9KPvQxqOGBoBNHJzod5kyS0Q=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-5VkFuBclOiWAJOzAicuqvw-1; Fri, 12 Nov 2021 00:39:26 -0500
X-MC-Unique: 5VkFuBclOiWAJOzAicuqvw-1
Received: by mail-ua1-f70.google.com with SMTP id
 j29-20020ab0185d000000b002cbb3c4660bso4138633uag.23
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 21:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LG3JdECCuVaZ09IG/1lMKWaqDfT+2PUZn7zNymST8yQ=;
 b=OmT+wsp2DtV93VFRO5+WJMDAmFvBvX6YzizuczxMj5x7Da1hExAwMDqscyp7HmtrPj
 /Q3JUOsMqelhDr6AStu6bSsLqCuhigGvujtCajRndadfonEAdyXkfCuMH3Di+pvkHrIz
 KWZP/Ejp1i0w23wzU4Bw2I8zG5uN4qtMr1LUAUZcVD5cqcVyAUCrkGYP3bHnbsIGwoOh
 zWkqXLMgtbWwHM99CaDJGMuqm69Y4XdhfX+W81sPMg//qmUcoJiZyC4ckuqAjyUG5l1d
 XuJWc9bo0QQ/pdNWXsLYHGSatjOa2VKWjUws/k6QoB0gE+bQstxthkLfyHdrk8hIgLy/
 k1DQ==
X-Gm-Message-State: AOAM532IBW2eLwE923HdpkCxZMBszRJCEJWR+3kf5Em7gYdpgjiOuPaE
 fTwAUEqepcD5cBFbzAoFgP6bRoEXsKxDUdCL2Z+4C5yBl9Y7q9IXqR4wiGzn+Gn80H+RretRCU6
 ITx1rgFdYAZCF+0g=
X-Received: by 2002:a05:6102:f12:: with SMTP id
 v18mr6425522vss.0.1636695565880; 
 Thu, 11 Nov 2021 21:39:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaAq6e5l/xjF6oQ1B820l0EvQtVfDnqAneMrRAV4xJnQuJPMMxmoVYqmx+oZd0uEhGAU0rGQ==
X-Received: by 2002:a05:6102:f12:: with SMTP id
 v18mr6425485vss.0.1636695565631; 
 Thu, 11 Nov 2021 21:39:25 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:7e14:3b94:fb27:f0ad:a824])
 by smtp.gmail.com with ESMTPSA id r2sm1465280vsk.28.2021.11.11.21.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:25 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP for Linux
Date: Fri, 12 Nov 2021 02:10:39 -0300
Message-Id: <20211112051040.923746-5-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112051040.923746-1-leobras@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add property that allows zerocopy migration of memory pages,
and also includes a helper function migrate_use_zerocopy() to check
if it's enabled.

No code is introduced to actually do the migration, but it allow
future implementations to enable/disable this feature.

On non-Linux builds this parameter is compiled-out.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 qapi/migration.json   | 18 ++++++++++++++++++
 migration/migration.h |  5 +++++
 migration/migration.c | 32 ++++++++++++++++++++++++++++++++
 migration/multifd.c   | 17 +++++++++--------
 migration/socket.c    |  5 +++++
 monitor/hmp-cmds.c    |  6 ++++++
 6 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..9534c299d7 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -730,6 +730,11 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zerocopy: Controls behavior on sending memory pages on migration.
+#            When true, enables a zerocopy mechanism for sending memory
+#            pages, if host supports it.
+#            Defaults to false. (Since 6.2)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -769,6 +774,7 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
+           { 'name': 'zerocopy', 'if' : 'CONFIG_LINUX'},
            'block-bitmap-mapping' ] }
 
 ##
@@ -895,6 +901,11 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zerocopy: Controls behavior on sending memory pages on migration.
+#            When true, enables a zerocopy mechanism for sending memory
+#            pages, if host supports it.
+#            Defaults to false. (Since 6.2)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -949,6 +960,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zerocopy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
@@ -1095,6 +1107,11 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zerocopy: Controls behavior on sending memory pages on migration.
+#            When true, enables a zerocopy mechanism for sending memory
+#            pages, if host supports it.
+#            Defaults to false. (Since 6.2)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -1147,6 +1164,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zerocopy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
diff --git a/migration/migration.h b/migration/migration.h
index 8130b703eb..e61ef81f26 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -339,6 +339,11 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
+#ifdef CONFIG_LINUX
+int migrate_use_zerocopy(void);
+#else
+#define migrate_use_zerocopy() (0)
+#endif
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/migration.c b/migration/migration.c
index abaf6f9e3d..add3dabc56 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -886,6 +886,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->multifd_zlib_level = s->parameters.multifd_zlib_level;
     params->has_multifd_zstd_level = true;
     params->multifd_zstd_level = s->parameters.multifd_zstd_level;
+#ifdef CONFIG_LINUX
+    params->has_zerocopy = true;
+    params->zerocopy = s->parameters.zerocopy;
+#endif
     params->has_xbzrle_cache_size = true;
     params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth = true;
@@ -1538,6 +1542,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_multifd_compression) {
         dest->multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zerocopy) {
+        dest->zerocopy = params->zerocopy;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         dest->xbzrle_cache_size = params->xbzrle_cache_size;
     }
@@ -1650,6 +1659,11 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_multifd_compression) {
         s->parameters.multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zerocopy) {
+        s->parameters.zerocopy = params->zerocopy;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
         xbzrle_cache_resize(params->xbzrle_cache_size, errp);
@@ -2540,6 +2554,17 @@ int migrate_multifd_zstd_level(void)
     return s->parameters.multifd_zstd_level;
 }
 
+#ifdef CONFIG_LINUX
+int migrate_use_zerocopy(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.zerocopy;
+}
+#endif
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
@@ -4190,6 +4215,10 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
                       parameters.multifd_zstd_level,
                       DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
+#ifdef CONFIG_LINUX
+    DEFINE_PROP_BOOL("zerocopy", MigrationState,
+                      parameters.zerocopy, false),
+#endif
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -4287,6 +4316,9 @@ static void migration_instance_init(Object *obj)
     params->has_multifd_compression = true;
     params->has_multifd_zlib_level = true;
     params->has_multifd_zstd_level = true;
+#ifdef CONFIG_LINUX
+    params->has_zerocopy = true;
+#endif
     params->has_xbzrle_cache_size = true;
     params->has_max_postcopy_bandwidth = true;
     params->has_max_cpu_throttle = true;
diff --git a/migration/multifd.c b/migration/multifd.c
index 7c9deb1921..ab8f0f97be 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -854,16 +854,17 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
     trace_multifd_new_send_channel_async(p->id);
     if (qio_task_propagate_error(task, &local_err)) {
         goto cleanup;
-    } else {
-        p->c = QIO_CHANNEL(sioc);
-        qio_channel_set_delay(p->c, false);
-        p->running = true;
-        if (!multifd_channel_connect(p, sioc, local_err)) {
-            goto cleanup;
-        }
-        return;
     }
 
+    p->c = QIO_CHANNEL(sioc);
+    qio_channel_set_delay(p->c, false);
+    p->running = true;
+    if (!multifd_channel_connect(p, sioc, local_err)) {
+        goto cleanup;
+    }
+
+    return;
+
 cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
diff --git a/migration/socket.c b/migration/socket.c
index 05705a32d8..e26e94aa0c 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -77,6 +77,11 @@ static void socket_outgoing_migration(QIOTask *task,
     } else {
         trace_migration_socket_outgoing_connected(data->hostname);
     }
+
+    if (migrate_use_zerocopy()) {
+        error_setg(&err, "Zerocopy not available in migration");
+    }
+
     migration_channel_connect(data->s, sioc, data->hostname, err);
     object_unref(OBJECT(sioc));
 }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c91bf93e9..442679dcfa 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1297,6 +1297,12 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_multifd_zstd_level = true;
         visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
         break;
+#ifdef CONFIG_LINUX
+    case MIGRATION_PARAMETER_ZEROCOPY:
+        p->has_zerocopy = true;
+        visit_type_bool(v, param, &p->zerocopy, &err);
+        break;
+#endif
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size = true;
         if (!visit_type_size(v, param, &cache_size, &err)) {
-- 
2.33.1


