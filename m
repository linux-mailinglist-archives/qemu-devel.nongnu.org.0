Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556153AC902
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:41:54 +0200 (CEST)
Received: from localhost ([::1]:48896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBwf-0005ny-By
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1luBnI-0006HU-JE
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:12 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:43663
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1luBnG-0004Lz-67
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:32:12 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3APq3z06tcgnMUHIKDZIz09Xx87skCyIMji2hC?=
 =?us-ascii?q?6mlwRA09TyXGra+TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPaftXrdyR?=
 =?us-ascii?q?eVxeZZnMvfKlzbamPDH4tmu5uIHJIOceEYYWIK7voSpTPIaerIo+P3s5xA592u?=
 =?us-ascii?q?t0uFJDsCA8oLjmdE40SgYzZLrWF9dMcE/fGnl656Tk+bCBIqh7OAdx44tob41r?=
 =?us-ascii?q?/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8EDe+jaJpJmLgrWe8Fvx?=
 =?us-ascii?q?xmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF5d1HqWxa1OUkkS1Qef?=
 =?us-ascii?q?ib2EmhJ11dZiGdgzUI5QxerEMKD2Xo2kcL7/aJHg7SQPAx+r6xOiGplXbI+usM?=
 =?us-ascii?q?jJ6jlljpx6Z/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh57D2bCtuYe?=
 =?us-ascii?q?Y99Q/Bmcga+dNVfYrhDTdtACSnRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi?=
 =?us-ascii?q?1UMXyMEWg39FrfsGOtV5zvWBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLV?=
 =?us-ascii?q?nuCalCMXPQrJz85qkz+YiRCdE1JVsJ6d38uXZjxCEPkm7VeLizNaxwg2bwqT+G?=
 =?us-ascii?q?LEbQI+llluxEU5PHNcnWDRE=3D?=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="109833671"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Jun 2021 18:32:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 702904C36A17;
 Fri, 18 Jun 2021 18:32:07 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Jun 2021 18:32:08 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 18 Jun 2021 18:31:46 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 2/2] migration/rdma: rename cq and comp_channel with recv
 prefix
Date: Fri, 18 Jun 2021 18:36:12 +0800
Message-ID: <20210618103612.152817-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210618103612.152817-1-lizhijian@cn.fujitsu.com>
References: <20210618103612.152817-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 702904C36A17.A94A6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

make the code more clear

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 50 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 16fe0688858..527972d4970 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -358,10 +358,10 @@ typedef struct RDMAContext {
     struct ibv_context          *verbs;
     struct rdma_event_channel   *channel;
     struct ibv_qp *qp;                      /* queue pair */
-    struct ibv_comp_channel *comp_channel;  /* completion channel */
+    struct ibv_comp_channel *recv_comp_channel;  /* recv completion channel */
     struct ibv_comp_channel *send_comp_channel;  /* send completion channel */
     struct ibv_pd *pd;                      /* protection domain */
-    struct ibv_cq *cq;                      /* completion queue */
+    struct ibv_cq *recv_cq;                 /* recv completion queue */
     struct ibv_cq *send_cq;                 /* send completion queue */
 
     /*
@@ -1062,8 +1062,8 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
     }
 
     /* create completion channel */
-    rdma->comp_channel = ibv_create_comp_channel(rdma->verbs);
-    if (!rdma->comp_channel) {
+    rdma->recv_comp_channel = ibv_create_comp_channel(rdma->verbs);
+    if (!rdma->recv_comp_channel) {
         error_report("failed to allocate completion channel");
         goto err_alloc_pd_cq;
     }
@@ -1071,9 +1071,9 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
     /*
      * Completion queue can be filled by read work requests.
      */
-    rdma->cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
-            NULL, rdma->comp_channel, 0);
-    if (!rdma->cq) {
+    rdma->recv_cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
+                                  NULL, rdma->recv_comp_channel, 0);
+    if (!rdma->recv_cq) {
         error_report("failed to allocate completion queue");
         goto err_alloc_pd_cq;
     }
@@ -1098,18 +1098,18 @@ err_alloc_pd_cq:
     if (rdma->pd) {
         ibv_dealloc_pd(rdma->pd);
     }
-    if (rdma->comp_channel) {
-        ibv_destroy_comp_channel(rdma->comp_channel);
+    if (rdma->recv_comp_channel) {
+        ibv_destroy_comp_channel(rdma->recv_comp_channel);
     }
     if (rdma->send_comp_channel) {
         ibv_destroy_comp_channel(rdma->send_comp_channel);
     }
-    if (rdma->cq) {
-        ibv_destroy_cq(rdma->cq);
-        rdma->cq = NULL;
+    if (rdma->recv_cq) {
+        ibv_destroy_cq(rdma->recv_cq);
+        rdma->recv_cq = NULL;
     }
     rdma->pd = NULL;
-    rdma->comp_channel = NULL;
+    rdma->recv_comp_channel = NULL;
     rdma->send_comp_channel = NULL;
     return -1;
 
@@ -1128,7 +1128,7 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
     attr.cap.max_send_sge = 1;
     attr.cap.max_recv_sge = 1;
     attr.send_cq = rdma->send_cq;
-    attr.recv_cq = rdma->cq;
+    attr.recv_cq = rdma->recv_cq;
     attr.qp_type = IBV_QPT_RC;
 
     ret = rdma_create_qp(rdma->cm_id, rdma->pd, &attr);
@@ -1606,12 +1606,12 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma,
 static struct ibv_comp_channel *to_channel(RDMAContext *rdma, int wrid)
 {
     return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_comp_channel :
-           rdma->comp_channel;
+           rdma->recv_comp_channel;
 }
 
 static struct ibv_cq *to_cq(RDMAContext *rdma, int wrid)
 {
-    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_cq : rdma->cq;
+    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_cq : rdma->recv_cq;
 }
 
 /*
@@ -2398,17 +2398,17 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma_destroy_qp(rdma->cm_id);
         rdma->qp = NULL;
     }
-    if (rdma->cq) {
-        ibv_destroy_cq(rdma->cq);
-        rdma->cq = NULL;
+    if (rdma->recv_cq) {
+        ibv_destroy_cq(rdma->recv_cq);
+        rdma->recv_cq = NULL;
     }
     if (rdma->send_cq) {
         ibv_destroy_cq(rdma->send_cq);
         rdma->send_cq = NULL;
     }
-    if (rdma->comp_channel) {
-        ibv_destroy_comp_channel(rdma->comp_channel);
-        rdma->comp_channel = NULL;
+    if (rdma->recv_comp_channel) {
+        ibv_destroy_comp_channel(rdma->recv_comp_channel);
+        rdma->recv_comp_channel = NULL;
     }
     if (rdma->send_comp_channel) {
         ibv_destroy_comp_channel(rdma->send_comp_channel);
@@ -3084,12 +3084,12 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
     if (io_read) {
-        aio_set_fd_handler(ctx, rioc->rdmain->comp_channel->fd,
+        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
         aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
     } else {
-        aio_set_fd_handler(ctx, rioc->rdmaout->comp_channel->fd,
+        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
         aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
@@ -3305,7 +3305,7 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
      */
     while (1) {
         uint64_t wr_id, wr_id_in;
-        int ret = qemu_rdma_poll(rdma, rdma->cq, &wr_id_in, NULL);
+        int ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
         if (ret < 0) {
             error_report("rdma migration: polling error! %d", ret);
             goto err;
-- 
2.31.1




