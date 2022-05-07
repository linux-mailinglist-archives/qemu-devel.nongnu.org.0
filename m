Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C679B51E365
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:01:18 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn9kz-0000Nm-S2
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iX-0005IM-4q
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iV-0006ij-8e
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651888722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoiANFaZUsR+19YSs80XA8m23UAw8e0kNwzw/ub0qn0=;
 b=ivYz73DUUUiAgOMMqSIXJz0dN50TeyR18jLREIVqPy/9olIVpcSWa1XbXmkUM1xTKk1hX0
 hE97fmDqPVmCtqdSwnADG55jQ8qeWvr9ZFHB0REsLyzcbasFFs3Dg0/CD7WVJ2J0JvqxtL
 Daot/NDmPdVSejCM5HNC3pBZvtH/7UI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-9UFCCbbsMKeMcRYMKnodeQ-1; Fri, 06 May 2022 21:58:38 -0400
X-MC-Unique: 9UFCCbbsMKeMcRYMKnodeQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 n26-20020a4abd1a000000b0035eb0243b06so4562268oop.22
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 18:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoiANFaZUsR+19YSs80XA8m23UAw8e0kNwzw/ub0qn0=;
 b=Dd5lNBtBjMRCLZC7nPNikZmBaDJenSZybWyXUsOVxlzIjsODzbT+aRyBtMQgImvndF
 BZ5HuWqX+ZTFR+B1iPQfFWCUMUMG3YNazXa+jMNunl5kJbR6LEugOF4ha/Ei6e8verbY
 ZhmNuvbXVM2+ciTpNc4L4KTTlnZqkzrU84/A6zoqllwGZYAqqAJWHYkem7UNuDHyzPHk
 H2g5c81MjmMCgbQJ4FS/42PK0hi8leD6mbebTdP3n0Q/rJGBX2muqJ55+VIz2BNyhfXL
 gZ/MVZ/hIStmZOIDkdXuT2WhH0KqIzN7dgKIUMcoWA8wYgnbfrdGE1gTWN99TgMvuIOP
 0gfA==
X-Gm-Message-State: AOAM530nUhutrx5LB/1DOKNbPrs0niCFdetQedYI/XWEPpqItdt+QWV9
 zDiB7x9zsM1U8l8TTHqVRzkTNSXHJuLWiFkvKb8wNqpSFs0N5n+hacxQSJrV85PhoFE0G+8/kDc
 MEimqEwdvdftVR2Q=
X-Received: by 2002:a9d:7392:0:b0:606:4524:ada7 with SMTP id
 j18-20020a9d7392000000b006064524ada7mr2036257otk.281.1651888717314; 
 Fri, 06 May 2022 18:58:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq9xI5hzNfg3sGk0tIqQKmKo2N3fh4weeVHTZdTg5EXnyKFGUWcW/sHrZeWSBF58MtKE1BcA==
X-Received: by 2002:a9d:7392:0:b0:606:4524:ada7 with SMTP id
 j18-20020a9d7392000000b006064524ada7mr2036249otk.281.1651888717061; 
 Fri, 06 May 2022 18:58:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a056830141200b0060603221281sm2218124otp.81.2022.05.06.18.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:58:36 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v12 3/7] migration: Add zero-copy-send parameter for QMP/HMP
 for Linux
Date: Fri,  6 May 2022 22:57:55 -0300
Message-Id: <20220507015759.840466-4-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220507015759.840466-1-leobras@redhat.com>
References: <20220507015759.840466-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add property that allows zero-copy migration of memory pages
on the sending side, and also includes a helper function
migrate_use_zero_copy_send() to check if it's enabled.

No code is introduced to actually do the migration, but it allow
future implementations to enable/disable this feature.

On non-Linux builds this parameter is compiled-out.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/migration.json   | 24 ++++++++++++++++++++++++
 migration/migration.h |  5 +++++
 migration/migration.c | 32 ++++++++++++++++++++++++++++++++
 migration/socket.c    | 11 +++++++++--
 monitor/hmp-cmds.c    |  6 ++++++
 roms/skiboot          |  2 +-
 6 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 409eb086a2..2222f44250 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -741,6 +741,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending
+#                  memory pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory
+#                  for guest RAM pages.
+#                  Defaults to false. (Since 7.1)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -780,6 +787,7 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
+           { 'name': 'zero-copy-send', 'if' : 'CONFIG_LINUX'},
            'block-bitmap-mapping' ] }
 
 ##
@@ -906,6 +914,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending
+#                  memory pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory
+#                  for guest RAM pages.
+#                  Defaults to false. (Since 7.1)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -960,6 +975,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
@@ -1106,6 +1122,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending
+#                  memory pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory
+#                  for guest RAM pages.
+#                  Defaults to false. (Since 7.1)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -1158,6 +1181,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
diff --git a/migration/migration.h b/migration/migration.h
index a863032b71..e8f2941a55 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -375,6 +375,11 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
+#ifdef CONFIG_LINUX
+bool migrate_use_zero_copy_send(void);
+#else
+#define migrate_use_zero_copy_send() (false)
+#endif
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/migration.c b/migration/migration.c
index 5a31b23bd6..3e91f4b5e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -910,6 +910,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->multifd_zlib_level = s->parameters.multifd_zlib_level;
     params->has_multifd_zstd_level = true;
     params->multifd_zstd_level = s->parameters.multifd_zstd_level;
+#ifdef CONFIG_LINUX
+    params->has_zero_copy_send = true;
+    params->zero_copy_send = s->parameters.zero_copy_send;
+#endif
     params->has_xbzrle_cache_size = true;
     params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth = true;
@@ -1567,6 +1571,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_multifd_compression) {
         dest->multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zero_copy_send) {
+        dest->zero_copy_send = params->zero_copy_send;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         dest->xbzrle_cache_size = params->xbzrle_cache_size;
     }
@@ -1679,6 +1688,11 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_multifd_compression) {
         s->parameters.multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zero_copy_send) {
+        s->parameters.zero_copy_send = params->zero_copy_send;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
         xbzrle_cache_resize(params->xbzrle_cache_size, errp);
@@ -2563,6 +2577,17 @@ int migrate_multifd_zstd_level(void)
     return s->parameters.multifd_zstd_level;
 }
 
+#ifdef CONFIG_LINUX
+bool migrate_use_zero_copy_send(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.zero_copy_send;
+}
+#endif
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
@@ -4206,6 +4231,10 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
                       parameters.multifd_zstd_level,
                       DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
+#ifdef CONFIG_LINUX
+    DEFINE_PROP_BOOL("zero_copy_send", MigrationState,
+                      parameters.zero_copy_send, false),
+#endif
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -4303,6 +4332,9 @@ static void migration_instance_init(Object *obj)
     params->has_multifd_compression = true;
     params->has_multifd_zlib_level = true;
     params->has_multifd_zstd_level = true;
+#ifdef CONFIG_LINUX
+    params->has_zero_copy_send = true;
+#endif
     params->has_xbzrle_cache_size = true;
     params->has_max_postcopy_bandwidth = true;
     params->has_max_cpu_throttle = true;
diff --git a/migration/socket.c b/migration/socket.c
index 05705a32d8..3754d8f72c 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -74,9 +74,16 @@ static void socket_outgoing_migration(QIOTask *task,
 
     if (qio_task_propagate_error(task, &err)) {
         trace_migration_socket_outgoing_error(error_get_pretty(err));
-    } else {
-        trace_migration_socket_outgoing_connected(data->hostname);
+           goto out;
     }
+
+    trace_migration_socket_outgoing_connected(data->hostname);
+
+    if (migrate_use_zero_copy_send()) {
+        error_setg(&err, "Zero copy send not available in migration");
+    }
+
+out:
     migration_channel_connect(data->s, sioc, data->hostname, err);
     object_unref(OBJECT(sioc));
 }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 93061a11af..622c783c32 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1309,6 +1309,12 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_multifd_zstd_level = true;
         visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
         break;
+#ifdef CONFIG_LINUX
+    case MIGRATION_PARAMETER_ZERO_COPY_SEND:
+        p->has_zero_copy_send = true;
+        visit_type_bool(v, param, &p->zero_copy_send, &err);
+        break;
+#endif
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size = true;
         if (!visit_type_size(v, param, &cache_size, &err)) {
diff --git a/roms/skiboot b/roms/skiboot
index 24a7eb3596..820d43c0a7 160000
--- a/roms/skiboot
+++ b/roms/skiboot
@@ -1 +1 @@
-Subproject commit 24a7eb35966d93455520bc2debdd7954314b638b
+Subproject commit 820d43c0a7751e75a8830561f35535dfffd522bd
-- 
2.36.0


