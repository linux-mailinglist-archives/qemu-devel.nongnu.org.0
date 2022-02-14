Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C24B50A2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:51:36 +0100 (CET)
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJapK-0006t0-Dp
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:51:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVY-0005x3-Hl; Mon, 14 Feb 2022 07:31:08 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVS-0003cD-N8; Mon, 14 Feb 2022 07:31:08 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9DC4B2B001F7;
 Mon, 14 Feb 2022 07:30:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 14 Feb 2022 07:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=ve2SfB3UkUezGa
 hVn/I7IICi2La7Cy9FjBuUTdUOUbM=; b=ql0SvqkSFthOATQGiCvd16P2Riq7Tc
 yuQtm54D75iJ0ABT7eHiBOcrA5oYVcTrhR698JaVVfJVec/Q6PiSZYHEvgoXCvcY
 dA2BjF7BKuEHwE6FobNyucbkbs8+OnX3ntg+/ldkHzVYCnGABJ/LbORtxZx9ovjU
 BPFAGCTAX7S9sJIXC+Uwn3gK8F5KtXF608al7OY/mCRA2GTQPzmOaFm1JZr6aof2
 d8/6XrwWAfvMEW9mA4JkXhyHSzp0Vw6hq25jTqIMhvXS1OOBKuNiYx1p4hREdQj5
 rcYD1AjJdCP8Vyetex9k3nVu53RJlIYJAT9TrpYxBcLyTR7pHR7Qvjeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ve2SfB
 3UkUezGahVn/I7IICi2La7Cy9FjBuUTdUOUbM=; b=dp2BxOlli+cS/GzOwQD5xe
 MiVPOiDwfKsycTOXR0r0S8cDpJYJmODHKoBjJBQcTbTB1ykzysBrq1eATqSq7ZB5
 3kBiTRoiLtcudnkwnzFxdJxtKxuPOmeECBTnK4y39TsQe4Vz+3ISC8yynrwq4KHL
 J1pKMukfUZA7MkzuaD/phC7hdWc0bKmL66+LiV5mIeQojMtu/aotY15lcbfsHfkG
 Gzmg3RFgphGzXfPCTFn34sNMh57ck0jqVBMVgF2D2G2VCmIlmOoh//a060PKjgcO
 NAaHXwj8Ou6b40p4dfI6jYP/tWJILGx0AePsbXNz8Ci8V6jS6mdgju7iRyQI+5gw
 ==
X-ME-Sender: <xms:e0sKYs9rsw6dvKQoyMX1JtcEGsqGviEMdVJFdtFAhY8N8lfB6PUjqw>
 <xme:e0sKYkv9CqKDuhrliI_8sOuORFZo7pVY-pltxUVfy9QB9ySFuDRxU-xQngbJPANSo
 ZyBTbSCch4B6G2FkVk>
X-ME-Received: <xmr:e0sKYiCTw2Aj0YFuQeZ2x5IJkSY-jGhHTqJxUfKgMNlkbqRnlyw1L7KHA9Ozrb_g7mi2sMkhSwalzQRpoyrSaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:fEsKYsfQ14-mVQlbe8bcaem0DmmcNqJR93jlCmyUqciOTSjDY38Obg>
 <xmx:fEsKYhNzLmo6qfPZfTmW_qpLZn3qQV1PlkQ1LMlKU3dUg6mt6Z7ukg>
 <xmx:fEsKYmmtlAHXe_gPO_QnaSUX9ri_gYw56MpBZmVcKGd6_BDdZDSi6Q>
 <xmx:fEsKYkqxrozHrBKdrELwY4WuJUcVjIAtAkgpOKIJWN-O_L51MqIOBdpcKUQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 07:30:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/nvme: add pi tuple size helper
Date: Mon, 14 Feb 2022 13:30:28 +0100
Message-Id: <20220214123029.106404-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214123029.106404-1-its@irrelevant.dk>
References: <20220214123029.106404-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
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


