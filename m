Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5ED55225E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:36:57 +0200 (CEST)
Received: from localhost ([::1]:59936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KOW-0006B6-G8
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFK-0005jy-8d
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFH-0005Li-Hf
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EA7ONpO+2HIMdqqzStXL4UXUjmQpxaOF0OuP5bUaEhM=;
 b=fS9IidYJVF+wGHdPwwKDkmvDh/xH7CRlFdkEljzeaCzxk0l/NFp2D1ClnZDskKuccq+TXo
 dNOL3hyvJ6rv0bBA/iRQy1FivvU78pMOZYdqDx+Vb+eohwiZf9k0eTZo/2No7LUSYQazPk
 TVwgsNRNl231+7wwumoEzwp7tW3Dzr8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-hoQ9ENP1NN2TtW2e6kEMww-1; Mon, 20 Jun 2022 12:27:19 -0400
X-MC-Unique: hoQ9ENP1NN2TtW2e6kEMww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E829801756;
 Mon, 20 Jun 2022 16:27:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDA502166B26;
 Mon, 20 Jun 2022 16:27:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 08/12] block/qapi: Add indentation to bdrv_node_info_dump()
Date: Mon, 20 Jun 2022 18:27:00 +0200
Message-Id: <20220620162704.80987-9-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

In order to let qemu-img info present a block graph, add a parameter to
bdrv_node_info_dump() and bdrv_image_info_specific_dump() so that the
information of nodes below the root level can be given an indentation.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/qapi.h           |  5 ++--
 block/monitor/block-hmp-cmds.c |  2 +-
 block/qapi.c                   | 47 +++++++++++++++++++---------------
 qemu-img.c                     |  2 +-
 qemu-io-cmds.c                 |  3 ++-
 5 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/include/block/qapi.h b/include/block/qapi.h
index 196436020e..38855f2ae9 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -49,6 +49,7 @@ void bdrv_query_block_graph_info(BlockDriverState *bs,
 
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
-                                   const char *prefix);
-void bdrv_node_info_dump(BlockNodeInfo *info);
+                                   const char *prefix,
+                                   int indentation);
+void bdrv_node_info_dump(BlockNodeInfo *info, int indentation);
 #endif
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index d286f2d1c5..a63c25c208 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -734,7 +734,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
         monitor_printf(mon, "\nImages:\n");
         image_info = inserted->image;
         while (1) {
-            bdrv_node_info_dump(qapi_ImageInfo_base(image_info));
+            bdrv_node_info_dump(qapi_ImageInfo_base(image_info), 0);
             if (image_info->has_backing_image) {
                 image_info = image_info->backing_image;
             } else {
diff --git a/block/qapi.c b/block/qapi.c
index f208c21ccf..3e35603f0c 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -915,7 +915,8 @@ static bool qobject_is_empty_dump(const QObject *obj)
  * prepending an optional prefix if the dump is not empty.
  */
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
-                                   const char *prefix)
+                                   const char *prefix,
+                                   int indentation)
 {
     QObject *obj, *data;
     Visitor *v = qobject_output_visitor_new(&obj);
@@ -925,48 +926,51 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
     data = qdict_get(qobject_to(QDict, obj), "data");
     if (!qobject_is_empty_dump(data)) {
         if (prefix) {
-            qemu_printf("%s", prefix);
+            qemu_printf("%*s%s", indentation * 4, "", prefix);
         }
-        dump_qobject(1, data);
+        dump_qobject(indentation + 1, data);
     }
     qobject_unref(obj);
     visit_free(v);
 }
 
-void bdrv_node_info_dump(BlockNodeInfo *info)
+void bdrv_node_info_dump(BlockNodeInfo *info, int indentation)
 {
     char *size_buf, *dsize_buf;
+    g_autofree char *ind_s = g_strdup_printf("%*s", indentation * 4, "");
+
     if (!info->has_actual_size) {
         dsize_buf = g_strdup("unavailable");
     } else {
         dsize_buf = size_to_str(info->actual_size);
     }
     size_buf = size_to_str(info->virtual_size);
-    qemu_printf("image: %s\n"
-                "file format: %s\n"
-                "virtual size: %s (%" PRId64 " bytes)\n"
-                "disk size: %s\n",
-                info->filename, info->format, size_buf,
-                info->virtual_size,
-                dsize_buf);
+    qemu_printf("%simage: %s\n"
+                "%sfile format: %s\n"
+                "%svirtual size: %s (%" PRId64 " bytes)\n"
+                "%sdisk size: %s\n",
+                ind_s, info->filename,
+                ind_s, info->format,
+                ind_s, size_buf, info->virtual_size,
+                ind_s, dsize_buf);
     g_free(size_buf);
     g_free(dsize_buf);
 
     if (info->has_encrypted && info->encrypted) {
-        qemu_printf("encrypted: yes\n");
+        qemu_printf("%sencrypted: yes\n", ind_s);
     }
 
     if (info->has_cluster_size) {
-        qemu_printf("cluster_size: %" PRId64 "\n",
-                    info->cluster_size);
+        qemu_printf("%scluster_size: %" PRId64 "\n",
+                    ind_s, info->cluster_size);
     }
 
     if (info->has_dirty_flag && info->dirty_flag) {
-        qemu_printf("cleanly shut down: no\n");
+        qemu_printf("%scleanly shut down: no\n", ind_s);
     }
 
     if (info->has_backing_filename) {
-        qemu_printf("backing file: %s", info->backing_filename);
+        qemu_printf("%sbacking file: %s", ind_s, info->backing_filename);
         if (!info->has_full_backing_filename) {
             qemu_printf(" (cannot determine actual path)");
         } else if (strcmp(info->backing_filename,
@@ -975,15 +979,16 @@ void bdrv_node_info_dump(BlockNodeInfo *info)
         }
         qemu_printf("\n");
         if (info->has_backing_filename_format) {
-            qemu_printf("backing file format: %s\n",
-                        info->backing_filename_format);
+            qemu_printf("%sbacking file format: %s\n",
+                        ind_s, info->backing_filename_format);
         }
     }
 
     if (info->has_snapshots) {
         SnapshotInfoList *elem;
 
-        qemu_printf("Snapshot list:\n");
+        qemu_printf("%sSnapshot list:\n", ind_s);
+        qemu_printf("%s", ind_s);
         bdrv_snapshot_dump(NULL);
         qemu_printf("\n");
 
@@ -1003,6 +1008,7 @@ void bdrv_node_info_dump(BlockNodeInfo *info)
 
             pstrcpy(sn.id_str, sizeof(sn.id_str), elem->value->id);
             pstrcpy(sn.name, sizeof(sn.name), elem->value->name);
+            qemu_printf("%s", ind_s);
             bdrv_snapshot_dump(&sn);
             qemu_printf("\n");
         }
@@ -1010,6 +1016,7 @@ void bdrv_node_info_dump(BlockNodeInfo *info)
 
     if (info->has_format_specific) {
         bdrv_image_info_specific_dump(info->format_specific,
-                                      "Format specific information:\n");
+                                      "Format specific information:\n",
+                                      indentation);
     }
 }
diff --git a/qemu-img.c b/qemu-img.c
index 3b1f950c85..f835ce6feb 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2843,7 +2843,7 @@ static void dump_human_image_info_list(BlockNodeInfoList *list)
         }
         delim = true;
 
-        bdrv_node_info_dump(elem->value);
+        bdrv_node_info_dump(elem->value, 0);
     }
 }
 
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 084ec44d3b..00f1f78cdd 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1820,7 +1820,8 @@ static int info_f(BlockBackend *blk, int argc, char **argv)
     }
     if (spec_info) {
         bdrv_image_info_specific_dump(spec_info,
-                                      "Format specific information:\n");
+                                      "Format specific information:\n",
+                                      0);
         qapi_free_ImageInfoSpecific(spec_info);
     }
 
-- 
2.35.3


