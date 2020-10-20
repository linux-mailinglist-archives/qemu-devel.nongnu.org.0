Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C37292834
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 15:31:34 +0200 (CEST)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUVG9-0001NN-Dx
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 09:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUVF7-0000fu-3p; Mon, 19 Oct 2020 09:30:30 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5254 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUVF4-0005Ne-5T; Mon, 19 Oct 2020 09:30:28 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AE89A655261698A4E6F3;
 Mon, 19 Oct 2020 21:30:08 +0800 (CST)
Received: from DESKTOP-80C7KIU.china.huawei.com (10.174.187.210) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 21:29:59 +0800
From: Zhengui li <lizhengui@huawei.com>
To: <pbonzini@redhat.com>, <stefanha@redhat.com>, <mreitz@redhat.com>,
 <kwolf@redhat.com>
Subject: [PATCH] vhost-user-gpu: incorrect print type
Date: Mon, 19 Oct 2020 13:29:56 +0000
Message-ID: <1603114196-22776-1-git-send-email-lizhengui@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=lizhengui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 09:30:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, lizhengui@huawei.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fix incorrect print type.
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 34 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index a019d0a..ee2bf59 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -299,7 +299,7 @@ vg_resource_create_2d(VuGpu *g,
 
     res = virtio_gpu_find_resource(g, c2d.resource_id);
     if (res) {
-        g_critical("%s: resource already exists %d", __func__, c2d.resource_id);
+        g_critical("%s: resource already exists %u", __func__, c2d.resource_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
     }
@@ -312,7 +312,7 @@ vg_resource_create_2d(VuGpu *g,
 
     pformat = virtio_gpu_get_pixman_format(c2d.format);
     if (!pformat) {
-        g_critical("%s: host couldn't handle guest format %d",
+        g_critical("%s: host couldn't handle guest format %u",
                    __func__, c2d.format);
         g_free(res);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
@@ -325,7 +325,7 @@ vg_resource_create_2d(VuGpu *g,
                                           (uint32_t *)res->buffer.mmap,
                                           res->buffer.stride);
     if (!res->image) {
-        g_critical("%s: resource creation failed %d %d %d",
+        g_critical("%s: resource creation failed %u %u %u",
                    __func__, c2d.resource_id, c2d.width, c2d.height);
         g_free(res);
         cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
@@ -395,7 +395,7 @@ vg_resource_unref(VuGpu *g,
 
     res = virtio_gpu_find_resource(g, unref.resource_id);
     if (!res) {
-        g_critical("%s: illegal resource specified %d",
+        g_critical("%s: illegal resource specified %u",
                    __func__, unref.resource_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
@@ -414,7 +414,7 @@ vg_create_mapping_iov(VuGpu *g,
     int i;
 
     if (ab->nr_entries > 16384) {
-        g_critical("%s: nr_entries is too big (%d > 16384)",
+        g_critical("%s: nr_entries is too big (%u > 16384)",
                    __func__, ab->nr_entries);
         return -1;
     }
@@ -436,7 +436,7 @@ vg_create_mapping_iov(VuGpu *g,
         (*iov)[i].iov_len = ents[i].length;
         (*iov)[i].iov_base = vu_gpa_to_va(&g->dev.parent, &len, ents[i].addr);
         if (!(*iov)[i].iov_base || len != ents[i].length) {
-            g_critical("%s: resource %d element %d",
+            g_critical("%s: resource %u element %d",
                        __func__, ab->resource_id, i);
             g_free(*iov);
             g_free(ents);
@@ -461,7 +461,7 @@ vg_resource_attach_backing(VuGpu *g,
 
     res = virtio_gpu_find_resource(g, ab.resource_id);
     if (!res) {
-        g_critical("%s: illegal resource specified %d",
+        g_critical("%s: illegal resource specified %u",
                    __func__, ab.resource_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
@@ -488,7 +488,7 @@ vg_resource_detach_backing(VuGpu *g,
 
     res = virtio_gpu_find_resource(g, detach.resource_id);
     if (!res || !res->iov) {
-        g_critical("%s: illegal resource specified %d",
+        g_critical("%s: illegal resource specified %u",
                    __func__, detach.resource_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
@@ -515,7 +515,7 @@ vg_transfer_to_host_2d(VuGpu *g,
 
     res = virtio_gpu_find_resource(g, t2d.resource_id);
     if (!res || !res->iov) {
-        g_critical("%s: illegal resource specified %d",
+        g_critical("%s: illegal resource specified %u",
                    __func__, t2d.resource_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
@@ -528,7 +528,7 @@ vg_transfer_to_host_2d(VuGpu *g,
         t2d.r.x + t2d.r.width > res->width ||
         t2d.r.y + t2d.r.height > res->height) {
         g_critical("%s: transfer bounds outside resource"
-                   " bounds for resource %d: %d %d %d %d vs %d %d",
+                   " bounds for resource %u: %u %u %u %u vs %u %u",
                    __func__, t2d.resource_id, t2d.r.x, t2d.r.y,
                    t2d.r.width, t2d.r.height, res->width, res->height);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
@@ -571,7 +571,7 @@ vg_set_scanout(VuGpu *g,
     virtio_gpu_bswap_32(&ss, sizeof(ss));
 
     if (ss.scanout_id >= VIRTIO_GPU_MAX_SCANOUTS) {
-        g_critical("%s: illegal scanout id specified %d",
+        g_critical("%s: illegal scanout id specified %u",
                    __func__, ss.scanout_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
         return;
@@ -585,7 +585,7 @@ vg_set_scanout(VuGpu *g,
     /* create a surface for this scanout */
     res = virtio_gpu_find_resource(g, ss.resource_id);
     if (!res) {
-        g_critical("%s: illegal resource specified %d",
+        g_critical("%s: illegal resource specified %u",
                       __func__, ss.resource_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
@@ -597,8 +597,8 @@ vg_set_scanout(VuGpu *g,
         ss.r.height > res->height ||
         ss.r.x + ss.r.width > res->width ||
         ss.r.y + ss.r.height > res->height) {
-        g_critical("%s: illegal scanout %d bounds for"
-                   " resource %d, (%d,%d)+%d,%d vs %d %d",
+        g_critical("%s: illegal scanout %u bounds for"
+                   " resource %u, (%u,%u)+%u,%u vs %u %u",
                    __func__, ss.scanout_id, ss.resource_id, ss.r.x, ss.r.y,
                    ss.r.width, ss.r.height, res->width, res->height);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
@@ -670,7 +670,7 @@ vg_resource_flush(VuGpu *g,
 
     res = virtio_gpu_find_resource(g, rf.resource_id);
     if (!res) {
-        g_critical("%s: illegal resource specified %d\n",
+        g_critical("%s: illegal resource specified %u\n",
                    __func__, rf.resource_id);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
@@ -683,7 +683,7 @@ vg_resource_flush(VuGpu *g,
         rf.r.x + rf.r.width > res->width ||
         rf.r.y + rf.r.height > res->height) {
         g_critical("%s: flush bounds outside resource"
-                   " bounds for resource %d: %d %d %d %d vs %d %d\n",
+                   " bounds for resource %u: %u %u %u %u vs %u %u\n",
                    __func__, rf.resource_id, rf.r.x, rf.r.y,
                    rf.r.width, rf.r.height, res->width, res->height);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
@@ -835,7 +835,7 @@ vg_handle_ctrl(VuDev *dev, int qidx)
         }
 
         virtio_gpu_ctrl_hdr_bswap(&cmd->cmd_hdr);
-        g_debug("%d %s\n", cmd->cmd_hdr.type,
+        g_debug("%u %s\n", cmd->cmd_hdr.type,
                 vg_cmd_to_string(cmd->cmd_hdr.type));
 
         if (vg->virgl) {
-- 
1.8.3.1


