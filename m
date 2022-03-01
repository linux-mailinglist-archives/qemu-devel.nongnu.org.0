Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37F4C8A4E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:09:22 +0100 (CET)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0Nd-0004tF-7Y
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzo-0006N2-CH; Tue, 01 Mar 2022 05:44:44 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzm-0005iY-O2; Tue, 01 Mar 2022 05:44:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4011E580344;
 Tue,  1 Mar 2022 05:44:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Mar 2022 05:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=Z0QWJwNS5ZWhQU
 PIirNMqWo9lXGmxqK9bvL0Ou+0CIM=; b=a4Hj6/seyspuyzsg2ifi5iDrg6ZL/q
 9tSaKVysSuHaP3soBJHmTKHwYvRhdVFfmaFVOFAEhTVeHYss2jvNpAySBgiW6K+g
 21rwKYLaflf7OdVSnluVbN62N/sko960Ii3MdQQqac4BFXbaZFBMd8FRMq7CBCxx
 7QPcRzRkQyOkyRBze6kDOk1s3ICRZEQieOfWa+WRybQbQWqbwAbaqiuPejvEZZHS
 5Eo58uvboM3GoWAPPPYj7Ka4/0DZgGaxlWPxFF2yXe+Q88i6NHTkZdwEN+cyQyRe
 gcBkSYg0ns9/dVsafq8GaC+MD7WkaaGXILw5pVbxG49Xbd1rOWn3n6mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Z0QWJw
 NS5ZWhQUPIirNMqWo9lXGmxqK9bvL0Ou+0CIM=; b=MZjfZp1/8UbE7YYiKCZNyN
 OUIJ4889qJNMpOvmX7SUh0b+M9PEf7UrgNuvNBI/fhJBw4XVseDcsDI7HqkFH2Aw
 /esTcXgHfj7KF5l9S5pk+yJFKcM833JpJE32zvqpYU9MvcbgDXgSPaoQLavIljtx
 70B0tmAB7G4TIPLdb3zzIe4MPn/imyXa9W1tMjX9+cAmfOowgYwXjkBPNE6K2MNn
 WkcE8AYpg4UMfPuIt7h0npTZVknB0J8z89KmDgQjFt0AYj8oOB8QBxgr7o5QpmFF
 /mrqVmv99x5Qwy5Uy6Ua17zQ693DZTdHZtLvZHTojw7gwswptsOjrjFxikVKML3w
 ==
X-ME-Sender: <xms:GfkdYuGO8u-kT_pWf8aWd3tUN4IS50tvpKUGMv9ZTs2P6HRLFJ2Kug>
 <xme:GfkdYvUXBzSlPdzKv0XZ1sT6aY8ajxpDy2ewdMg1efSWEvdOOKnjbb9yjlX1vIDac
 IokKZmrHt8uuDJAtY8>
X-ME-Received: <xmr:GfkdYoKpxwnpKK--wOsb1DmV65fMo2zJItBE4VxJcSC8EB0HWfAf1OR0lYQ-AnZ2eu9R9gWqVj-RTx7DEUhX9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:GfkdYoFkCdGXTSZFdug2sPohkpHXZopdSAVP-HmFqykDWNXvs6cinA>
 <xmx:GfkdYkV1ezJ88ywQZVOMwQA4Ai4LU7laGS4GTgkpQeAJH56yyyYXKA>
 <xmx:GfkdYrOIb9yXDaDVs_QKCH3WBQ6q5QnzjuiSooFKmHGYMpSduieI-g>
 <xmx:GfkdYoSntC15Ti3ljA8xDkWr7uKmIh_TsCLhYs4zwcF__OaUDVykeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 05:44:39 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 4/6] hw/nvme: add support for the lbafee hbs feature
Date: Tue,  1 Mar 2022 11:44:26 +0100
Message-Id: <20220301104428.160017-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301104428.160017-1-its@irrelevant.dk>
References: <20220301104428.160017-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

Add support for up to 64 LBA formats through the LBAFEE field of the
Host Behavior Support feature.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 34 +++++++++++++++++++++++++++++++---
 hw/nvme/ns.c         | 15 +++++++++------
 hw/nvme/nvme.h       |  1 +
 include/block/nvme.h |  7 +++++--
 4 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d8701ebf2fa8..52ab3450b975 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5165,6 +5165,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nsid = le32_to_cpu(cmd->nsid);
     uint8_t fid = NVME_GETSETFEAT_FID(dw10);
     uint8_t save = NVME_SETFEAT_SAVE(dw10);
+    uint16_t status;
     int i;
 
     trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
@@ -5287,8 +5288,26 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
     case NVME_TIMESTAMP:
         return nvme_set_feature_timestamp(n, req);
     case NVME_HOST_BEHAVIOR_SUPPORT:
-        return nvme_h2c(n, (uint8_t *)&n->features.hbs,
-                        sizeof(n->features.hbs), req);
+        status = nvme_h2c(n, (uint8_t *)&n->features.hbs,
+                          sizeof(n->features.hbs), req);
+        if (status) {
+            return status;
+        }
+
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+            ns = nvme_ns(n, i);
+
+            if (!ns) {
+                continue;
+            }
+
+            ns->id_ns.nlbaf = ns->nlbaf - 1;
+            if (!n->features.hbs.lbafee) {
+                ns->id_ns.nlbaf = MIN(ns->id_ns.nlbaf, 15);
+            }
+        }
+
+        return status;
     case NVME_COMMAND_SET_PROFILE:
         if (dw11 & 0x1ff) {
             trace_pci_nvme_err_invalid_iocsci(dw11 & 0x1ff);
@@ -5479,10 +5498,13 @@ static const AIOCBInfo nvme_format_aiocb_info = {
 static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
                             uint8_t pi, uint8_t pil)
 {
+    uint8_t lbafl = lbaf & 0xf;
+    uint8_t lbafu = lbaf >> 4;
+
     trace_pci_nvme_format_set(ns->params.nsid, lbaf, mset, pi, pil);
 
     ns->id_ns.dps = (pil << 3) | pi;
-    ns->id_ns.flbas = lbaf | (mset << 4);
+    ns->id_ns.flbas = (lbafu << 5) | (mset << 4) | lbafl;
 
     nvme_ns_init_format(ns);
 }
@@ -5596,6 +5618,7 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     uint8_t mset = (dw10 >> 4) & 0x1;
     uint8_t pi = (dw10 >> 5) & 0x7;
     uint8_t pil = (dw10 >> 8) & 0x1;
+    uint8_t lbafu = (dw10 >> 12) & 0x3;
     uint16_t status;
 
     iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
@@ -5612,6 +5635,10 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     iocb->broadcast = (nsid == NVME_NSID_BROADCAST);
     iocb->offset = 0;
 
+    if (n->features.hbs.lbafee) {
+        iocb->lbaf |= lbafu << 4;
+    }
+
     if (!iocb->broadcast) {
         if (!nvme_nsid_valid(n, nsid)) {
             status = NVME_INVALID_NSID | NVME_DNR;
@@ -6587,6 +6614,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cntlid = cpu_to_le16(n->cntlid);
 
     id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
+    id->ctratt |= cpu_to_le32(NVME_CTRATT_ELBAS);
 
     id->rab = 6;
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index ee673f1a5bef..8dfb55130beb 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -112,10 +112,11 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
         [7] = { .ds = 12, .ms = 64 },
     };
 
+    ns->nlbaf = 8;
+
     memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-    id_ns->nlbaf = 7;
 
-    for (i = 0; i <= id_ns->nlbaf; i++) {
+    for (i = 0; i < ns->nlbaf; i++) {
         NvmeLBAF *lbaf = &id_ns->lbaf[i];
         if (lbaf->ds == ds) {
             if (lbaf->ms == ms) {
@@ -126,12 +127,14 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     }
 
     /* add non-standard lba format */
-    id_ns->nlbaf++;
-    id_ns->lbaf[id_ns->nlbaf].ds = ds;
-    id_ns->lbaf[id_ns->nlbaf].ms = ms;
-    id_ns->flbas |= id_ns->nlbaf;
+    id_ns->lbaf[ns->nlbaf].ds = ds;
+    id_ns->lbaf[ns->nlbaf].ms = ms;
+    ns->nlbaf++;
+
+    id_ns->flbas |= i;
 
 lbaf_found:
+    id_ns->nlbaf = ns->nlbaf - 1;
     nvme_ns_init_format(ns);
 
     return 0;
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 103407038e74..e715c3255a29 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -128,6 +128,7 @@ typedef struct NvmeNamespace {
     int64_t      moff;
     NvmeIdNs     id_ns;
     NvmeLBAF     lbaf;
+    unsigned int nlbaf;
     size_t       lbasz;
     const uint32_t *iocs;
     uint8_t      csi;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e527c728f975..37afc9be9b18 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1111,6 +1111,10 @@ enum NvmeIdCtrlOaes {
     NVME_OAES_NS_ATTR   = 1 << 8,
 };
 
+enum NvmeIdCtrlCtratt {
+    NVME_CTRATT_ELBAS   = 1 << 15,
+};
+
 enum NvmeIdCtrlOacs {
     NVME_OACS_SECURITY  = 1 << 0,
     NVME_OACS_FORMAT    = 1 << 1,
@@ -1312,8 +1316,7 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint8_t     rsvd81[23];
     uint8_t     nguid[16];
     uint64_t    eui64;
-    NvmeLBAF    lbaf[16];
-    uint8_t     rsvd192[192];
+    NvmeLBAF    lbaf[64];
     uint8_t     vs[3712];
 } NvmeIdNs;
 
-- 
2.35.1


