Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D820675483
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:31:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUT-0003ga-5X; Fri, 20 Jan 2023 07:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUQ-0003dI-WC
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUN-0000Xm-Vj
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMuecZZZxBumBemESkJbQCx5vFIOtjvcaFvKBBdQ/R8=;
 b=IWZIPJ93isN51IUZ3V7c3H6VTnW3qsIy8cwfx6efnAipcC2bgjDxR7izDt9hlJ1/VZiEZ0
 PobT0kpgVVv5PMOW+Nz84gDxowLDXjDzVj5HfWN0iYcAnDZX/B/hqLvw0XLtaKIApOQfnX
 0WIXPvVUsxar0hko4CaqahY/Za+Ea2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-_aVVphawNqeHkqy45OsgZQ-1; Fri, 20 Jan 2023 07:27:18 -0500
X-MC-Unique: _aVVphawNqeHkqy45OsgZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF93F185A794;
 Fri, 20 Jan 2023 12:27:17 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0044840C6EC4;
 Fri, 20 Jan 2023 12:27:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 38/38] qemu-img: Change info key names for protocol nodes
Date: Fri, 20 Jan 2023 13:26:33 +0100
Message-Id: <20230120122633.84983-39-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Currently, when querying a qcow2 image, qemu-img info reports something
like this:

image: test.qcow2
file format: qcow2
virtual size: 64 MiB (67108864 bytes)
disk size: 196 KiB
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
Child node '/file':
    image: test.qcow2
    file format: file
    virtual size: 192 KiB (197120 bytes)
    disk size: 196 KiB
    Format specific information:
        extent size hint: 1048576

Notably, the way the keys are named is specific for image files: The
filename is shown under "image", the BDS driver under "file format", and
the BDS length under "virtual size".  This does not make much sense for
nodes that are not actually supposed to be guest images, like the /file
child node shown above.

Give bdrv_node_info_dump() a @protocol parameter that gives a hint that
the respective node is probably just used for data storage and does not
necessarily present the data for a VM guest disk.  This renames the keys
so that with this patch, the output becomes:

image: test.qcow2
[...]
Child node '/file':
    filename: test.qcow2
    protocol type: file
    file length: 192 KiB (197120 bytes)
    disk size: 196 KiB
    Format specific information:
        extent size hint: 1048576

(Perhaps we should also rename "Format specific information", but I
could not come up with anything better that will not become problematic
if we guess wrong with the protocol "heuristic".)

This change affects iotest 302, which has protocol node information in
its reference output.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-13-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/qapi.h           |  2 +-
 block/monitor/block-hmp-cmds.c |  2 +-
 block/qapi.c                   | 39 ++++++++++++++++++++++++++++------
 qemu-img.c                     |  3 ++-
 tests/qemu-iotests/302.out     |  6 +++---
 5 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/include/block/qapi.h b/include/block/qapi.h
index 38855f2ae9..26113da21a 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -51,5 +51,5 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
 void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
                                    const char *prefix,
                                    int indentation);
-void bdrv_node_info_dump(BlockNodeInfo *info, int indentation);
+void bdrv_node_info_dump(BlockNodeInfo *info, int indentation, bool protocol);
 #endif
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 4b441ac468..4dc07f71d4 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -725,7 +725,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
         monitor_printf(mon, "\nImages:\n");
         image_info = inserted->image;
         while (1) {
-            bdrv_node_info_dump(qapi_ImageInfo_base(image_info), 0);
+            bdrv_node_info_dump(qapi_ImageInfo_base(image_info), 0, false);
             if (image_info->backing_image) {
                 image_info = image_info->backing_image;
             } else {
diff --git a/block/qapi.c b/block/qapi.c
index ae61d2c856..a2c3030118 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -916,24 +916,49 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
     visit_free(v);
 }
 
-void bdrv_node_info_dump(BlockNodeInfo *info, int indentation)
+/**
+ * Print the given @info object in human-readable form.  Every field is indented
+ * using the given @indentation (four spaces per indentation level).
+ *
+ * When using this to print a whole block graph, @protocol can be set to true to
+ * signify that the given information is associated with a protocol node, i.e.
+ * just data storage for an image, such that the data it presents is not really
+ * a full VM disk.  If so, several fields change name: For example, "virtual
+ * size" is printed as "file length".
+ * (Consider a qcow2 image, which is represented by a qcow2 node and a file
+ * node.  Printing a "virtual size" for the file node does not make sense,
+ * because without the qcow2 node, it is not really a guest disk, so it does not
+ * have a "virtual size".  Therefore, we call it "file length" instead.)
+ *
+ * @protocol is ignored when @indentation is 0, because we take that to mean
+ * that the associated node is the root node in the queried block graph, and
+ * thus is always to be interpreted as a standalone guest disk.
+ */
+void bdrv_node_info_dump(BlockNodeInfo *info, int indentation, bool protocol)
 {
     char *size_buf, *dsize_buf;
     g_autofree char *ind_s = g_strdup_printf("%*s", indentation * 4, "");
 
+    if (indentation == 0) {
+        /* Top level, consider this a normal image */
+        protocol = false;
+    }
+
     if (!info->has_actual_size) {
         dsize_buf = g_strdup("unavailable");
     } else {
         dsize_buf = size_to_str(info->actual_size);
     }
     size_buf = size_to_str(info->virtual_size);
-    qemu_printf("%simage: %s\n"
-                "%sfile format: %s\n"
-                "%svirtual size: %s (%" PRId64 " bytes)\n"
+    qemu_printf("%s%s: %s\n"
+                "%s%s: %s\n"
+                "%s%s: %s (%" PRId64 " bytes)\n"
                 "%sdisk size: %s\n",
-                ind_s, info->filename,
-                ind_s, info->format,
-                ind_s, size_buf, info->virtual_size,
+                ind_s, protocol ? "filename" : "image", info->filename,
+                ind_s, protocol ? "protocol type" : "file format",
+                info->format,
+                ind_s, protocol ? "file length" : "virtual size",
+                size_buf, info->virtual_size,
                 ind_s, dsize_buf);
     g_free(size_buf);
     g_free(dsize_buf);
diff --git a/qemu-img.c b/qemu-img.c
index 919b9dfcc4..13b1f33e8a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2853,7 +2853,8 @@ static void dump_human_image_info(BlockGraphInfo *info, int indentation,
 {
     BlockChildInfoList *children_list;
 
-    bdrv_node_info_dump(qapi_BlockGraphInfo_base(info), indentation);
+    bdrv_node_info_dump(qapi_BlockGraphInfo_base(info), indentation,
+                        info->children == NULL);
 
     for (children_list = info->children; children_list;
          children_list = children_list->next)
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
index edfa1c4f05..7b5014cdd8 100644
--- a/tests/qemu-iotests/302.out
+++ b/tests/qemu-iotests/302.out
@@ -5,9 +5,9 @@ file format: raw
 virtual size: 448 KiB (458752 bytes)
 disk size: unavailable
 Child node '/file':
-    image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
-    file format: nbd
-    virtual size: 448 KiB (458752 bytes)
+    filename: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
+    protocol type: nbd
+    file length: 448 KiB (458752 bytes)
     disk size: unavailable
 
 === Converted image info ===
-- 
2.38.1


