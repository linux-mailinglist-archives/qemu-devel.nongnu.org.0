Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F54B50E6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:02:27 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJazq-0005jb-7f
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVk-0006Jf-Qa; Mon, 14 Feb 2022 07:31:21 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:55927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVT-0003bO-J7; Mon, 14 Feb 2022 07:31:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 10D842B001F6;
 Mon, 14 Feb 2022 07:30:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 14 Feb 2022 07:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=PpvfhjQwCN3c22
 qs3OyicbCjZEEJYBcSu/jgMIr7uL4=; b=mbTHRsBu0v5+TtnGOu7ZtAEm5ZO4cq
 m58nxMe9nbyTiwTLCzrQYPex42X92kLCnUPldPjKjwSSnT+rZSIhA/3sUnVeyiKN
 61cjPJ4itAOY4B4ZfyuI3L7M+M3Uvk2FfQBvQG3apCf8GMy2LdpAVHAhZfu9evaH
 XK+hFEuHUJs9HkfmsQXvuds+vZBzO74Tn7k7Prl/SyiaSq90oGRWKyuhr4dw3Dzo
 w2Isoh3EGV9r06PgRw1VQx6isP7/jXT6K7WeJLdriRSdT7yw4p1bF0XGTYpmN/+E
 IiibKLQt8bQ8ffS4L2sW7JPnFzritIwLk+E+smAaEeHT/Ene2W+gT05w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ppvfhj
 QwCN3c22qs3OyicbCjZEEJYBcSu/jgMIr7uL4=; b=XnUERU9y1nRnX1Mu6ZHNgI
 MXpXRvYTp8udHyj1pThBGuVL02qumar9Je4bbROuBVVk/EBKVely9tIQvXjhbnwI
 OxjePdoD6hfSVkhWbaJhmPEcQy79SabMK6RGcCiH4QwkpXQdQi1/qtYP1szl+c44
 prolbCiJ2xVxslOCDwv2tpPPQQw4vIyjQ3SC1T7+nXsqMp+I03f7S45l+ScasCix
 d4oaPAVopKlyoHzyylBSQg0Oi0S36pOIcdzbW1/+hgY4/k2MWkTMtKw9f/JVHmuG
 lcmoCuJxUWfpRlz42PJPSfRUAmt2kRlYm6HImUyvBLrnGTsGp0wloEJpFAfz++zA
 ==
X-ME-Sender: <xms:eEsKYubk6DC3-BVi2h43BbmPrXs3aHdrI8qPOHK4dEYMS0nVXVKsDw>
 <xme:eEsKYhY2ztDCT65zD2o_bg-n4FRv4fFqzVYJR_c2oxgoYRlL9vBV2EmwrSq4ReCul
 jeNjshC2511nXi-w1w>
X-ME-Received: <xmr:eEsKYo8jDRTE84Tehskn1qsQI0AaQBLz5kCfj8XVBMZNASkg36AWqpnkTdp_F7z5lH8pG0XB6Xk4LtBpjSu_-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:eEsKYgoKQmbi9WNXWeQOQeFbN74nolAOBULGw9vgMm3dYLTiNg0FLg>
 <xmx:eEsKYpoGnwiRczAP65yMArPlRIQ_A1VsTWwwZm7GHiwZQUNFXDA2pw>
 <xmx:eEsKYuTHgq4QY06AFviWfH-UQFAfmM1jW83HHhug_24CJojvk32Kww>
 <xmx:eEsKYk3BdeQ7skd2XAWIakeiKVa0FyMjScbYxHcZvMxBRE0nn_vcgPhYSWs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 07:30:46 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/nvme: add support for the lbafee hbs feature
Date: Mon, 14 Feb 2022 13:30:27 +0100
Message-Id: <20220214123029.106404-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214123029.106404-1-its@irrelevant.dk>
References: <20220214123029.106404-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Naveen Nagar <naveen.n1@samsung.com>

Add support for up to 64 LBA formats through the LBAFEE field of the
Host Behavior Support feature.

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


