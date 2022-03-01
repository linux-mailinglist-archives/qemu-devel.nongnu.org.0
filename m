Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F534C89A9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:51:21 +0100 (CET)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP06C-0000mu-2Q
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzp-0006PP-L9; Tue, 01 Mar 2022 05:44:46 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:50411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzn-0005iy-Su; Tue, 01 Mar 2022 05:44:45 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2AC13580451;
 Tue,  1 Mar 2022 05:44:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 01 Mar 2022 05:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=4AA32y54uNZchm
 WjOECMzjCyl+oCGXhFvOR088gMWEQ=; b=RxIfutqFEnWHhH1wiYMdnyIXOpw4E/
 Zz5w/GVdK39eWjEqaU74aGdtN80EI4PIhPk2SLgTwJ3NvdE707ZxzRkcsAgCzCS6
 YptSOq+/ohtQ67mlTlODuzlaLgCcNGIqjx05gbjZxBkB+QTbQV7ZhyGMnzYp/QAo
 gLACSMVbyjgYiSOrGe5rfdwWE6WXxP0++FP8WYCvNF99ac3xH+nC8yxJ5mghZLIy
 AHoeJ6rKZHSDj/ya5jPuQyn2AMBlIjsxMGUL3MH8e0LXeEpNy+FPMfop604U0QqZ
 1RJwsmQ/jB5ySNBNLy2+dndUNls80xy+PH925YLC3slBs8uDbeY2uIwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4AA32y
 54uNZchmWjOECMzjCyl+oCGXhFvOR088gMWEQ=; b=HctYbIr1oUhQ/7KOV1MfFO
 O4/4eUYWPgHrCBwST4h7/zUK5U9qaojTbG6YAVOxo3ELkXid23IiTY4BvymVRRix
 o2YhXHLIOZ1cid0CGCpITi9ArSqQ3pZcTb/uPNiyG+rrOUVKMQdXdIT4ywIKBIf3
 1b5805u7GsSns/KKoSqztS8sPlRF4s8LFRTKMvGEaFe3Z3RjvVYWl+e+jXprB652
 ONA8MDk4ICtBg5dt8XSpTfM9Nj0OlagR2Sckl4SKDbNAOJL3vIkv7P2WwAESUwkE
 Zz2Fepa4xu8HiPB5HZuJtEYyXbcaoeIeOuoH7j0RZyqfbslZPlx91A6vUTjBoNXQ
 ==
X-ME-Sender: <xms:GvkdYuXsfZn-grM8tD3FomL-WcOMpOKU6U5wvGsxZ69-GxsRVOBPkg>
 <xme:GvkdYqm3hb6a2LLHGtGtWA2bkFYOWW5qyB5raWPQEouic_4cMd_Fou-qm4hQ9rL8S
 0GG4eXpW8Mk4DSjDj8>
X-ME-Received: <xmr:GvkdYiZhHRe_nS9vuPsXoKHfaG1RtWW-L9QD4ekZgyN0kdC5ScjKogpQ7652xtOBvgazkFdC20nbHSZnUEwojg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:G_kdYlXttQRPlwHwmW_nquLoOJW1WQcAeUe9bRjlwA5-fO1IqdOGTQ>
 <xmx:G_kdYokvUDF5geGigIzAlqDwqOYrRR5iFfMO1G2UevpUcp93VgaZkA>
 <xmx:G_kdYqfvCyujw7wPcNaLsAOpNTDWpS77uw30Dmt4Viifjg_hci-2lA>
 <xmx:G_kdYlgNpSWjcbxw6hQVeWvDaohtTcCAnqyTFLn8IAWQV8F6zrbj5Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 05:44:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 5/6] hw/nvme: add pi tuple size helper
Date: Tue,  1 Mar 2022 11:44:27 +0100
Message-Id: <20220301104428.160017-6-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

A subsequent patch will introduce a new tuple size; so add a helper and
use that instead of sizeof() and magic numbers.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 14 ++++++++------
 hw/nvme/dif.c  | 16 ++++++++--------
 hw/nvme/dif.h  |  5 +++++
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 52ab3450b975..f1683960b87e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1068,7 +1068,8 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
     size_t len = nvme_l2b(ns, nlb);
     uint16_t status;
 
-    if (nvme_ns_ext(ns) && !(pi && pract && ns->lbaf.ms == 8)) {
+    if (nvme_ns_ext(ns) &&
+        !(pi && pract && ns->lbaf.ms == nvme_pi_tuple_size(ns))) {
         NvmeSg sg;
 
         len += nvme_m2b(ns, nlb);
@@ -1247,7 +1248,8 @@ uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
     bool pi = !!NVME_ID_NS_DPS_TYPE(ns->id_ns.dps);
     bool pract = !!(le16_to_cpu(rw->control) & NVME_RW_PRINFO_PRACT);
 
-    if (nvme_ns_ext(ns) && !(pi && pract && ns->lbaf.ms == 8)) {
+    if (nvme_ns_ext(ns) &&
+        !(pi && pract && ns->lbaf.ms == nvme_pi_tuple_size(ns))) {
         return nvme_tx_interleaved(n, &req->sg, ptr, len, ns->lbasz,
                                    ns->lbaf.ms, 0, dir);
     }
@@ -2184,7 +2186,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
          * tuple.
          */
         if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-            pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+            pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
         }
 
         for (bufp = buf; mbufp < end; bufp += ns->lbaf.ms, mbufp += ns->lbaf.ms) {
@@ -3167,7 +3169,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
             bool pract = prinfo & NVME_PRINFO_PRACT;
 
-            if (pract && ns->lbaf.ms == 8) {
+            if (pract && ns->lbaf.ms == nvme_pi_tuple_size(ns)) {
                 mapped_size = data_size;
             }
         }
@@ -3244,7 +3246,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
             bool pract = prinfo & NVME_PRINFO_PRACT;
 
-            if (pract && ns->lbaf.ms == 8) {
+            if (pract && ns->lbaf.ms == nvme_pi_tuple_size(ns)) {
                 mapped_size -= nvme_m2b(ns, nlb);
             }
         }
@@ -5553,7 +5555,7 @@ static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
-    if (pi && (ns->id_ns.lbaf[lbaf].ms < sizeof(NvmeDifTuple))) {
+    if (pi && (ns->id_ns.lbaf[lbaf].ms < nvme_pi_tuple_size(ns))) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index cd0cea2b5ebd..891385f33f20 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -48,7 +48,7 @@ void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
     int16_t pil = 0;
 
     if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+        pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
     }
 
     trace_pci_nvme_dif_pract_generate_dif(len, ns->lbasz, ns->lbasz + pil,
@@ -145,7 +145,7 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
     }
 
     if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+        pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
     }
 
     trace_pci_nvme_dif_check(prinfo, ns->lbasz + pil);
@@ -184,7 +184,7 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
 
 
     if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+        pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
     }
 
     do {
@@ -210,7 +210,7 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
             end = mbufp + mlen;
 
             for (; mbufp < end; mbufp += ns->lbaf.ms) {
-                memset(mbufp + pil, 0xff, sizeof(NvmeDifTuple));
+                memset(mbufp + pil, 0xff, nvme_pi_tuple_size(ns));
             }
         }
 
@@ -284,7 +284,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (prinfo & NVME_PRINFO_PRACT && ns->lbaf.ms == 8) {
+    if (prinfo & NVME_PRINFO_PRACT && ns->lbaf.ms == nvme_pi_tuple_size(ns)) {
         goto out;
     }
 
@@ -388,7 +388,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
 
         if (pract) {
             uint8_t *mbuf, *end;
-            int16_t pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+            int16_t pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
 
             status = nvme_check_prinfo(ns, prinfo, slba, reftag);
             if (status) {
@@ -428,7 +428,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
         return NVME_NO_COMPLETE;
     }
 
-    if (nvme_ns_ext(ns) && !(pract && ns->lbaf.ms == 8)) {
+    if (nvme_ns_ext(ns) && !(pract && ns->lbaf.ms == nvme_pi_tuple_size(ns))) {
         mapped_len += mlen;
     }
 
@@ -462,7 +462,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     qemu_iovec_init(&ctx->mdata.iov, 1);
     qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
 
-    if (!(pract && ns->lbaf.ms == 8)) {
+    if (!(pract && ns->lbaf.ms == nvme_pi_tuple_size(ns))) {
         status = nvme_bounce_mdata(n, ctx->mdata.bounce, ctx->mdata.iov.size,
                                    NVME_TX_DIRECTION_TO_DEVICE, req);
         if (status) {
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index e36fea30e71e..ab6dbb09463e 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -37,6 +37,11 @@ static const uint16_t t10_dif_crc_table[256] = {
     0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
 };
 
+static inline size_t nvme_pi_tuple_size(NvmeNamespace *ns)
+{
+    return sizeof(NvmeDifTuple);
+}
+
 uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
                            uint32_t reftag);
 uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
-- 
2.35.1


