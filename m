Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB166382996
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:13:47 +0200 (CEST)
Received: from localhost ([::1]:57780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaFu-0003WU-Ij
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOa-0003sb-2s; Mon, 17 May 2021 05:18:40 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:54281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOY-000644-25; Mon, 17 May 2021 05:18:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CE952449;
 Mon, 17 May 2021 05:18:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=bg18m2zTO6VxZ
 CJ/ARowZZJBuuvfwZfQVBU9Ic7Twss=; b=Nfc7u2KI5QhozhXDYXKbeAi9JTJ/U
 1rZ8qlVFzKRM4sZh2utd/b7heDN8kBAfXfy7OofBEazW0ixcP5kPuo/Tu+IOuE8O
 BjOmaCiA545p4Go0zYE0ori4JZ7VQdg1pMhgTvljcP0UXvrYqB7nJ4yxvsMEX32N
 JZCzXB9JfhDRiIf7Ryc7hCbcn5gzP4pImbayxavscHqTj701lVcKQgSsvLuWvq54
 rgIoz21Qtne1f+azlTypTEdae9w3ZBUWbB6p3QDZmhf/1Y3b0iX9YIa9RNu48lHU
 zYtx2HcUCGSY5onVLF+vvZQTyWXfqJlC92TPnbi3scl96/NneInljbBIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bg18m2zTO6VxZCJ/ARowZZJBuuvfwZfQVBU9Ic7Twss=; b=NNe+ru2c
 WjoCHnawTCVX+ZmX7H2o/yLxA6GIKMB9yAHkof6OACanBZJL3gZMRqHDHMbM1zrm
 beP0Gtjh972ATiA9A6ak4QltKFs1jQJWquhMNlR14PS4WBtdIGo/jjd0yusDjGSq
 cv+63Wc+X9BUe8g0bIqDD+3NI+ymrKfwleu3rWg9gCRGAsdr2GJBEOjhGUoOWIk5
 Z/77vZju03mqdR6Gtk2qIl0gu7rtMtMrvSX5UrvLqzKLXk8E+K/DUC5A37a9Rncp
 KXqDwagbE/TFQUG8rbBpkI5/S8JT8A3i9FJXYxvJWyjYl90ReqwziI3koLK9aPtI
 d5atRKFCo05Uww==
X-ME-Sender: <xms:6zSiYLrp7F60Zu3afc_3-iFP33oGSSLbPca5K-r0GzuiRAYeyI7RWg>
 <xme:6zSiYFq8SlC3eTgIJRBqyL7ngD9cnhHyqUNDR0JKRezSxfpPog78gfXCWizSlWV6z
 mHNsB__Ea3cW7BBjC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6zSiYINmY_vuurSvo6wHS899DuTCmIEK6Nw5JWrkiho8TV8LEncnuw>
 <xmx:6zSiYO7DE7eCk1fLfmQQ5S34KgL6I-XWoN0dKS78_WKHmEyzekReFg>
 <xmx:6zSiYK4EHvUj70e6DxHX5vdGvhB0_Jyhmu60cU87dDtNauWYbCvI2w>
 <xmx:6zSiYBYRpAMrP3jNmeUEGym2xIqtU_MIrPBzvzaf6Y4Heo8CS_ViIw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:33 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 17/20] hw/block/nvme: remove num_namespaces member
Date: Mon, 17 May 2021 11:17:34 +0200
Message-Id: <20210517091737.841787-18-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The NvmeCtrl num_namespaces member is just an indirection for the
NVME_MAX_NAMESPACES constant.

Remove the indirection.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
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
index baf7b6714544..0bcaf7192f99 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -393,7 +393,8 @@ static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 
 static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
 {
-    return nsid && (nsid == NVME_NSID_BROADCAST || nsid <= n->num_namespaces);
+    return nsid &&
+        (nsid == NVME_NSID_BROADCAST || nsid <= NVME_MAX_NAMESPACES);
 }
 
 static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
@@ -2882,7 +2883,7 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     /* 1-initialize; see comment in nvme_dsm */
     *num_flushes = 1;
 
-    for (int i = 1; i <= n->num_namespaces; i++) {
+    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -3850,7 +3851,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     } else {
         int i;
 
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -4347,7 +4348,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             if (!active) {
@@ -4395,7 +4396,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             if (!active) {
@@ -4661,7 +4662,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
         result = 0;
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -4808,7 +4809,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         break;
     case NVME_ERROR_RECOVERY:
         if (nsid == NVME_NSID_BROADCAST) {
-            for (i = 1; i <= n->num_namespaces; i++) {
+            for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
                 ns = nvme_ns(n, i);
 
                 if (!ns) {
@@ -4829,7 +4830,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         }
         break;
     case NVME_VOLATILE_WRITE_CACHE:
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -5122,7 +5123,7 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
             req->status = status;
         }
     } else {
-        for (i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
@@ -5233,7 +5234,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -5275,7 +5276,7 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
         memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
     }
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -5290,7 +5291,7 @@ static void nvme_select_iocs(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
@@ -5917,7 +5918,6 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 
 static void nvme_init_state(NvmeCtrl *n)
 {
-    n->num_namespaces = NVME_MAX_NAMESPACES;
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
                            2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
@@ -6098,7 +6098,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->sqes = (0x6 << 4) | 0x6;
     id->cqes = (0x4 << 4) | 0x4;
-    id->nn = cpu_to_le32(n->num_namespaces);
+    id->nn = cpu_to_le32(NVME_MAX_NAMESPACES);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
                            NVME_ONCS_COMPARE | NVME_ONCS_COPY);
@@ -6217,7 +6217,7 @@ static void nvme_exit(PCIDevice *pci_dev)
 
     nvme_ctrl_reset(n);
 
-    for (i = 1; i <= n->num_namespaces; i++) {
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
             continue;
-- 
2.31.1


