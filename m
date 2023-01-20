Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A48675460
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUJ-0003ID-Et; Fri, 20 Jan 2023 07:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUH-0003Gy-QJ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUF-0000Tm-VN
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/44+L9/A3XEtrguQpphUSZG+ZF8dAmH3j0ug29IoWU=;
 b=DpkylvIzCxPe2fERVNAoBNAGc9iVhVTXUp+QWDHOy+qdkrTNgGjEoNDuiJIyLsaVHeVP8j
 y1x86ITT353iH9XAXsYH9uYOBZdgMccJp2ORPHL1TpZyefM8Mw2Xb5N2+QnKSthX9YeC5T
 5FLIs2Ok6bIWMyLJdrDIvNBjspaCXgs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-Yd4v4JhxNcevjKHPW6s03w-1; Fri, 20 Jan 2023 07:27:13 -0500
X-MC-Unique: Yd4v4JhxNcevjKHPW6s03w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80B1E858F09;
 Fri, 20 Jan 2023 12:27:13 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5AC940C6EC4;
 Fri, 20 Jan 2023 12:27:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 34/38] block/qapi: Add indentation to bdrv_node_info_dump()
Date: Fri, 20 Jan 2023 13:26:29 +0100
Message-Id: <20230120122633.84983-35-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hanna Reitz <hreitz@redhat.com>

In order to let qemu-img info present a block graph, add a parameter to
bdrv_node_info_dump() and bdrv_image_info_specific_dump() so that the
information of nodes below the root level can be given an indentation.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-9-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
index d6eaacdb12..4b441ac468 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -725,7 +725,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
         monitor_printf(mon, "\nImages:\n");
         image_info = inserted->image;
         while (1) {
-            bdrv_node_info_dump(qapi_ImageInfo_base(image_info));
+            bdrv_node_info_dump(qapi_ImageInfo_base(image_info), 0);
             if (image_info->backing_image) {
                 image_info = image_info->backing_image;
             } else {
diff --git a/block/qapi.c b/block/qapi.c
index 7335c9728d..ae61d2c856 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -897,7 +897,8 @@ static bool qobject_is_empty_dump(const QObject *obj)
  * prepending an optional prefix if the dump is not empty.
  */
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
-                                   const char *prefix)
+                                   const char *prefix,
+                                   int indentation)
 {
     QObject *obj, *data;
     Visitor *v = qobject_output_visitor_new(&obj);
@@ -907,48 +908,51 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
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
 
     if (info->backing_filename) {
-        qemu_printf("backing file: %s", info->backing_filename);
+        qemu_printf("%sbacking file: %s", ind_s, info->backing_filename);
         if (!info->full_backing_filename) {
             qemu_printf(" (cannot determine actual path)");
         } else if (strcmp(info->backing_filename,
@@ -957,15 +961,16 @@ void bdrv_node_info_dump(BlockNodeInfo *info)
         }
         qemu_printf("\n");
         if (info->backing_filename_format) {
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
 
@@ -985,6 +990,7 @@ void bdrv_node_info_dump(BlockNodeInfo *info)
 
             pstrcpy(sn.id_str, sizeof(sn.id_str), elem->value->id);
             pstrcpy(sn.name, sizeof(sn.name), elem->value->name);
+            qemu_printf("%s", ind_s);
             bdrv_snapshot_dump(&sn);
             qemu_printf("\n");
         }
@@ -992,6 +998,7 @@ void bdrv_node_info_dump(BlockNodeInfo *info)
 
     if (info->format_specific) {
         bdrv_image_info_specific_dump(info->format_specific,
-                                      "Format specific information:\n");
+                                      "Format specific information:\n",
+                                      indentation);
     }
 }
diff --git a/qemu-img.c b/qemu-img.c
index 0cad524267..04937bad11 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2859,7 +2859,7 @@ static void dump_human_image_info_list(BlockNodeInfoList *list)
         }
         delim = true;
 
-        bdrv_node_info_dump(elem->value);
+        bdrv_node_info_dump(elem->value, 0);
     }
 }
 
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index d7e562dda6..a061031615 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1789,7 +1789,8 @@ static int info_f(BlockBackend *blk, int argc, char **argv)
     }
     if (spec_info) {
         bdrv_image_info_specific_dump(spec_info,
-                                      "Format specific information:\n");
+                                      "Format specific information:\n",
+                                      0);
         qapi_free_ImageInfoSpecific(spec_info);
     }
 
-- 
2.38.1


