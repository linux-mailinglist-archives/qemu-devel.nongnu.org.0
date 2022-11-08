Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F3562201A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:09:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbu-00059j-0Z; Tue, 08 Nov 2022 18:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbj-00050G-EK
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXba-0003kh-Jv
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:15 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8MtoKL007245
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=D4s7z0SePnebV5twdltD3t6rHaG87RT22pIgvX0+wCQ=;
 b=Ljr24CyI3v+eNzuwAjMvKYnE9NOfxc6FdNgqMVCBYR5+ED3ow4V3BOl0b0IMjY5AquZQ
 WXAgCXGdIl026g0TxHA51tR9QhN973D6RVXkiqdXRJLodZXuquJwBnMh9qbZWgE8Djic
 g/kDS2swEuuyxE/rNKA2Z4+fhmReCr6GfUmxGzkbPbz9gHFs/SPwf5hcPMLRTSvp42+N
 NXpBwDJzjlFxdAZqtEjHZ2fwsGfQQWwnTyHZ2YxBZu49acMGENgk3uKF/2+XWXRrAQEy
 2UiIlw5qXbxbajvBrU/jZK/6eFnFYJcdCB3aJoP3cjNRzNma7P9vCFGBKhyiZB6rGRDu Mw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqyy1846g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:54 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6d004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:52 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-25
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:52 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 24/24] vfio-user: add trace points
Date: Tue,  8 Nov 2022 15:13:46 -0800
Message-Id: <a91ec93b532f7951e7dd1c1e66aa9c304774584f.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: sSU_izQUyRGB-rn6BsjsFW8daYqfE3b-
X-Proofpoint-ORIG-GUID: sSU_izQUyRGB-rn6BsjsFW8daYqfE3b-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/trace-events | 15 +++++++++++++++
 hw/vfio/user.c       | 26 ++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 73dffe9..c27cec7 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -166,3 +166,18 @@ vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t dat
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
+
+# user.c
+vfio_user_recv_hdr(const char *name, uint16_t id, uint16_t cmd, uint32_t size, uint32_t flags) " (%s) id 0x%x cmd 0x%x size 0x%x flags 0x%x"
+vfio_user_recv_read(uint16_t id, int read) " id 0x%x read 0x%x"
+vfio_user_recv_request(uint16_t cmd) " command 0x%x"
+vfio_user_send_write(uint16_t id, int wrote) " id 0x%x wrote 0x%x"
+vfio_user_version(uint16_t major, uint16_t minor, const char *caps) " major %d minor %d caps: %s"
+vfio_user_dma_map(uint64_t iova, uint64_t size, uint64_t off, uint32_t flags, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" off 0x%"PRIx64" flags 0x%x will_commit %d"
+vfio_user_dma_unmap(uint64_t iova, uint64_t size, uint32_t flags, bool dirty, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" flags 0x%x dirty %d will_commit %d"
+vfio_user_get_info(uint32_t nregions, uint32_t nirqs) " #regions %d #irqs %d"
+vfio_user_get_region_info(uint32_t index, uint32_t flags, uint64_t size) " index %d flags 0x%x size 0x%"PRIx64
+vfio_user_get_irq_info(uint32_t index, uint32_t flags, uint32_t count) " index %d flags 0x%x count %d"
+vfio_user_set_irqs(uint32_t index, uint32_t start, uint32_t count, uint32_t flags) " index %d start %d count %d flags 0x%x"
+vfio_user_region_rw(uint32_t region, uint64_t off, uint32_t count) " region %d offset 0x%"PRIx64" count %d"
+vfio_user_wrmulti(const char *s, uint64_t wr_cnt) " %s count 0x%"PRIx64
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 4ed305b..74e1714 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -30,6 +30,8 @@
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qbool.h"
 #include "user.h"
+#include "trace.h"
+
 
 
 /*
@@ -108,6 +110,8 @@ static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg)
         vfio_user_shutdown(proxy);
         error_report_err(local_err);
     }
+    trace_vfio_user_send_write(msg->hdr->id, ret);
+
     return ret;
 }
 
@@ -225,6 +229,7 @@ static int vfio_user_complete(VFIOProxy *proxy, Error **errp)
             }
             return ret;
         }
+        trace_vfio_user_recv_read(msg->hdr->id, ret);
 
         msgleft -= ret;
         data += ret;
@@ -332,6 +337,8 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
         error_setg(&local_err, "unknown message type");
         goto fatal;
     }
+    trace_vfio_user_recv_hdr(proxy->sockname, hdr.id, hdr.command, hdr.size,
+                             hdr.flags);
 
     /*
      * For replies, find the matching pending request.
@@ -408,6 +415,7 @@ static int vfio_user_recv_one(VFIOProxy *proxy)
         if (ret <= 0) {
             goto fatal;
         }
+        trace_vfio_user_recv_read(hdr.id, ret);
 
         msgleft -= ret;
         data += ret;
@@ -546,6 +554,7 @@ static void vfio_user_request(void *opaque)
     QTAILQ_INIT(&free);
     QTAILQ_FOREACH_SAFE(msg, &new, next, m1) {
         QTAILQ_REMOVE(&new, msg, next);
+        trace_vfio_user_recv_request(msg->hdr->command);
         proxy->request(proxy->req_arg, msg);
         QTAILQ_INSERT_HEAD(&free, msg, next);
     }
@@ -1265,6 +1274,7 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
     msgp->minor = VFIO_USER_MINOR_VER;
     memcpy(&msgp->capabilities, caps->str, caplen);
     g_string_free(caps, true);
+    trace_vfio_user_version(msgp->major, msgp->minor, msgp->capabilities);
 
     vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
     if (msgp->hdr.flags & VFIO_USER_ERROR) {
@@ -1288,6 +1298,7 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
         return -1;
     }
 
+    trace_vfio_user_version(msgp->major, msgp->minor, msgp->capabilities);
     return 0;
 }
 
@@ -1305,6 +1316,8 @@ static int vfio_user_dma_map(VFIOProxy *proxy,
     msgp->offset = map->vaddr;
     msgp->iova = map->iova;
     msgp->size = map->size;
+    trace_vfio_user_dma_map(msgp->iova, msgp->size, msgp->offset, msgp->flags,
+                        will_commit);
 
     /*
      * The will_commit case sends without blocking or dropping BQL.
@@ -1371,6 +1384,8 @@ static int vfio_user_dma_unmap(VFIOProxy *proxy,
     msgp->msg.flags = unmap->flags;
     msgp->msg.iova = unmap->iova;
     msgp->msg.size = unmap->size;
+    trace_vfio_user_dma_unmap(msgp->msg.iova, msgp->msg.size, msgp->msg.flags,
+                         bitmap != NULL, will_commit);
 
     if (blocking) {
         vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
@@ -1400,6 +1415,7 @@ static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
     if (msg.hdr.flags & VFIO_USER_ERROR) {
         return -msg.hdr.error_reply;
     }
+    trace_vfio_user_get_info(msg.num_regions, msg.num_irqs);
 
     memcpy(info, &msg.argsz, sizeof(*info));
     return 0;
@@ -1434,6 +1450,7 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     if (msgp->hdr.flags & VFIO_USER_ERROR) {
         return -msgp->hdr.error_reply;
     }
+    trace_vfio_user_get_region_info(msgp->index, msgp->flags, msgp->size);
 
     memcpy(info, &msgp->argsz, info->argsz);
     return 0;
@@ -1454,6 +1471,7 @@ static int vfio_user_get_irq_info(VFIOProxy *proxy,
     if (msg.hdr.flags & VFIO_USER_ERROR) {
         return -msg.hdr.error_reply;
     }
+    trace_vfio_user_get_irq_info(msg.index, msg.flags, msg.count);
 
     memcpy(info, &msg.argsz, sizeof(*info));
     return 0;
@@ -1499,6 +1517,8 @@ static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
         msgp->index = irq->index;
         msgp->start = irq->start;
         msgp->count = irq->count;
+        trace_vfio_user_set_irqs(msgp->index, msgp->start, msgp->count,
+                                 msgp->flags);
 
         vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
         if (msgp->hdr.flags & VFIO_USER_ERROR) {
@@ -1535,6 +1555,8 @@ static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
         msgp->index = irq->index;
         msgp->start = irq->start + sent_fds;
         msgp->count = send_fds;
+        trace_vfio_user_set_irqs(msgp->index, msgp->start, msgp->count,
+                                 msgp->flags);
 
         loop_fds.send_fds = send_fds;
         loop_fds.recv_fds = 0;
@@ -1565,6 +1587,7 @@ static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
     msgp->offset = offset;
     msgp->region = index;
     msgp->count = count;
+    trace_vfio_user_region_rw(msgp->region, msgp->offset, msgp->count);
 
     vfio_user_send_wait(proxy, &msgp->hdr, NULL, size, false);
     if (msgp->hdr.flags & VFIO_USER_ERROR) {
@@ -1593,6 +1616,7 @@ static void vfio_user_flush_multi(VFIOProxy *proxy)
     msg->id = wm->hdr.id;
     msg->rsize = 0;
     msg->type = VFIO_MSG_ASYNC;
+    trace_vfio_user_wrmulti("flush", wm->wr_cnt);
 
     ret = vfio_user_send_queued(proxy, msg);
     if (ret < 0) {
@@ -1622,6 +1646,7 @@ static void vfio_user_add_multi(VFIOProxy *proxy, uint8_t index, off_t offset,
     memcpy(&w1->data, data, count);
 
     wm->wr_cnt++;
+    trace_vfio_user_wrmulti("add", wm->wr_cnt);
     if (wm->wr_cnt == VFIO_USER_MULTI_MAX ||
         proxy->num_outgoing < VFIO_USER_OUT_LOW) {
         vfio_user_flush_multi(proxy);
@@ -1689,6 +1714,7 @@ static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
     msgp->region = index;
     msgp->count = count;
     memcpy(&msgp->data, data, count);
+    trace_vfio_user_region_rw(msgp->region, msgp->offset, msgp->count);
 
     /* async send will free msg after it's sent */
     if (post) {
-- 
1.8.3.1


