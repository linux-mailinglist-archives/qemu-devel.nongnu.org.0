Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C4E364BE6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:46:59 +0200 (CEST)
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYanJ-0004wM-RI
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZf-000104-Ip; Mon, 19 Apr 2021 15:28:50 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:54445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZb-0005J5-3x; Mon, 19 Apr 2021 15:28:47 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4559A21DD;
 Mon, 19 Apr 2021 15:28:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 19 Apr 2021 15:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mvqUgeg/XfHZQ
 G07x034masACDqpUR9bp1eNIgWqhqA=; b=3NmfPu04Xo252kHxBAGBOVqb9SNHr
 zRXxycKl2NMwtqA6Y+S07gbt4/NOYUoxwbEHblT01Owk0DjhTHyyu520HbdX6hai
 ubIShoBuuWEm4GdA3n2Uu5lLfAmMJjMS4AVAN1ZozEeAR2IAkYyUvXBr/M3ulr7n
 h3bGQE+qbtqZhwbACDlAsSMOQmGiCUPUbjthOCnK9BoCb7CQWmNbhtFJ/AN/Mgmb
 00/A642UOa5X2xyZlsAgbfJkK0AUeBpfNBeZ8yjt2wiqHOtm92HhVQnt1NJ9y6wZ
 fnAvFjYuHJtmOZ/dua5PTeXRG3xjJ1lhAW8z7SYOWjnwL5XhLHZjhxUnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mvqUgeg/XfHZQG07x034masACDqpUR9bp1eNIgWqhqA=; b=XUyIyBkP
 ZzXtQ5EdqPPiLIKHa5+lvIZE5R/WawRECsNVh4hjKPgLHnxUh4DFx5bQcGJeOvvz
 pXs8NzMSnl4JxRR371We0wnjFlZEp3L4BnEfPw87gk+YgaeBEJtTUN+Lh8U3ahKb
 CYXx//JmJJfyv4oMLV3YCxzsGcx15beq+Kov3O9dlg5PMS+ohPbyxwU4/jsj2O0w
 hCNqLTGLTXVGf+b0+1ECRUGDOiA344KwnxWzp7jHBdLjr/Sar3yoZen4nTXLksRa
 IelcIh4ShRb2x1vHTEUKZg/Kn158Zz0iIh0n3D+7AMdw16VzAO8ptqlAkZZ+fpUq
 PkNkRbtSCJlHqw==
X-ME-Sender: <xms:0dl9YDFiU0ml95PPjNAPIyfv8Wa7RNrTkjt3nvATgbBjje700x7fJQ>
 <xme:0dl9YJ-HeQFV6m5PHIOFzNUhVaSfqFwVn4pO1fWqai1sLnpqfOq6qqPoxmXNUDhbx
 H-fonXaRiGc5SjnsXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0dl9YFKQ_WoufTniEx3JcWDX81_ClyS0CIq1JlBW9uMQ0V_o2Qvdgg>
 <xmx:0dl9YEYntrnACVCbSraMb2dEwLOcuiKHFuyHsWjiQMdVSKQ610VuiA>
 <xmx:0dl9YHIgKot5iwb3CXXJ9Ghs73IKD_Ms8fm-uGRo1fWEgsXjE3uZYw>
 <xmx:0dl9YPASZZMRZRZ42uNRD0TgKMeGNaj4ZY8EicGyxxgy6Yqn2hTlVA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E964E1080064;
 Mon, 19 Apr 2021 15:28:16 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/14] hw/block/nvme: remove num_namespaces member
Date: Mon, 19 Apr 2021 21:27:58 +0200
Message-Id: <20210419192801.62255-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The NvmeCtrl num_namespaces member is just an indirection for the
NVME_MAX_NAMESPACES constant.

Remove the indirection.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |  1 -
 hw/block/nvme.c | 30 +++++++++++++++---------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index ac3f0a886735..fb028d81d16f 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -401,7 +401,6 @@ typedef struct NvmeCtrl {
     uint16_t    cqe_size;
     uint16_t    sqe_size;
     uint32_t    reg_size;
-    uint32_t    num_namespaces;
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0b96936129d6..60424d9b19ea 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -382,7 +382,8 @@ static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 
 static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
 {
-    return nsid && (nsid == NVME_NSID_BROADCAST || nsid <= n->num_namespaces);
+    return nsid &&
+        (nsid == NVME_NSID_BROADCAST || nsid <= NVME_MAX_NAMESPACES);
 }
 
 static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
@@ -2865,7 +2866,7 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     /* 1-initialize; see comment in nvme_dsm */
     *num_flushes = 1;
 
-    for (int i = 1; i <= n->num_namespaces; i++) {
+    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -3835,7 +3836,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     } else {
         int i;
 
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -4332,7 +4333,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             if (!active) {
@@ -4380,7 +4381,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             if (!active) {
@@ -4646,7 +4647,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
         result = 0;
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -4796,7 +4797,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         break;
     case NVME_ERROR_RECOVERY:
         if (nsid == NVME_NSID_BROADCAST) {
-            for (i = 1; i <= n->num_namespaces; i++) {
+            for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
                 ns = nvme_ns(n, i);
 
                 if (!ns) {
@@ -4817,7 +4818,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         }
         break;
     case NVME_VOLATILE_WRITE_CACHE:
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -5110,7 +5111,7 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
             req->status = status;
         }
     } else {
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -5221,7 +5222,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -5263,7 +5264,7 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
         memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
     }
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -5278,7 +5279,7 @@ static void nvme_select_iocs(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -5905,7 +5906,6 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 
 static void nvme_init_state(NvmeCtrl *n)
 {
-    n->num_namespaces = NVME_MAX_NAMESPACES;
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
                            2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
@@ -6086,7 +6086,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->sqes = (0x6 << 4) | 0x6;
     id->cqes = (0x4 << 4) | 0x4;
-    id->nn = cpu_to_le32(n->num_namespaces);
+    id->nn = cpu_to_le32(NVME_MAX_NAMESPACES);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
                            NVME_ONCS_COMPARE | NVME_ONCS_COPY);
@@ -6205,7 +6205,7 @@ static void nvme_exit(PCIDevice *pci_dev)
 
     nvme_ctrl_reset(n);
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
-- 
2.31.1


