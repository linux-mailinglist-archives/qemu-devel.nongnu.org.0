Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB84B50A1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:51:34 +0100 (CET)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJapJ-0006z6-H9
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:51:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVc-000672-Mr; Mon, 14 Feb 2022 07:31:15 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:53659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVT-0003bE-JE; Mon, 14 Feb 2022 07:31:12 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 225732B001F2;
 Mon, 14 Feb 2022 07:30:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 14 Feb 2022 07:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=VxMiYsfPWsgxMv
 EkO7Ibd929qSyPxI3BIBe84yYh+vg=; b=BwEYnNSVFZyXxOQzvy6+qyho0IjRh+
 uhiYVtmArHnR2Iw5l+db73Y6vXKC/FQbi7F4lGoeYPs5om8M9lL8ajTZp+X23nOv
 59FHQ5kbGW1EnWojxf0SSKJ7HOxbXCQ9SfvucruzQ6/fClKwkGP0rlIzRZj70OIl
 aZFQpUP/Ijro1ITE8ZpBpes4NHVKDDK78mhmUsVEXyBRjNy3HjfTMFz0KCkPAp6u
 k7Pr1S34Gos2IJY/81ApVfT1rZteTV6CO3Om0ajXYn/+B6Cr/lzhDqk/U7wRBhYf
 akCmVQsrPZcwGYIO2LjyYXkTEQiWT3DoS1c/G5jiwLi/6ZKlctnablFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VxMiYs
 fPWsgxMvEkO7Ibd929qSyPxI3BIBe84yYh+vg=; b=dMUJ3vOCwS5r63jRboxP+Y
 8nsyCwD/rt9MLnsJCVFz9Cz45lnSZXH1NY59Xoj6wDG0D60uQY9na0kIVGnWCJlF
 W3SlsKNQnPPGqaQuhqcGeM/QlqTVnnEII1S+hhCTMopvFLk2Pka/2hIC7bRaQvfu
 ajUOoV6tmlGyG0mtcLaeTyRpfFD1KoSv6c1DNZvHFeiS48cfM98dThlP1uz5Zyr/
 ZTEo9jiVNZsoW4XbcX/Lpoi91aWaH7k9DnQIO03G4xzKxY0PIEjB4Zh6wGJ2+txy
 OtSZV0i2egE/wwILkFN/h0odMuNOfP4u+e7mSJRLOH5XpDX42fWdqbCOxb2ifIow
 ==
X-ME-Sender: <xms:dEsKYpbC0yChHCrTynOOaVnfU6YScrLyKLYisnZoXRu-q3OcS07oDw>
 <xme:dEsKYga6OvnZGm3Qhg2RcguSeZVQ1397fxOOSPNj6HxTTNUmty6TNp26CpNzTkw_0
 HkfHhFPQxmUdo8EI-c>
X-ME-Received: <xmr:dEsKYr_wCopzWE5x4t2CF24nwvdHa-fot9-gHB_WKwRCPv5GmbWNmBIW_MdjhUxNz11_vRgRJqNQy-jzqE6E-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:dEsKYnqH63Gaa89fGa8ziswh3QZJMTJmfEYzmHDbBOGCC9IcJnoSMA>
 <xmx:dEsKYkoPvAn4rbwSj51Fkb9BfvdR-I86H9B_W2WQFhbkk65yrIQ7AQ>
 <xmx:dEsKYtSa7d8dty-zRaLXd1Ii8xUdFnZk_QkHDGhK3WNF384Xcbq07g>
 <xmx:dEsKYr16OQSI_MW6Q2qz1X6J6o0wv0H-HkSZ6kNBchAGqi75Yco9SmcEHcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 07:30:42 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/nvme: move format parameter parsing
Date: Mon, 14 Feb 2022 13:30:26 +0100
Message-Id: <20220214123029.106404-4-its@irrelevant.dk>
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

There is no need to extract the format command parameters for each
namespace. Move it to the entry point.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 71c60482c75f..d8701ebf2fa8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5452,6 +5452,11 @@ typedef struct NvmeFormatAIOCB {
     uint32_t nsid;
     bool broadcast;
     int64_t offset;
+
+    uint8_t lbaf;
+    uint8_t mset;
+    uint8_t pi;
+    uint8_t pil;
 } NvmeFormatAIOCB;
 
 static void nvme_format_bh(void *opaque);
@@ -5471,14 +5476,9 @@ static const AIOCBInfo nvme_format_aiocb_info = {
     .get_aio_context = nvme_get_aio_context,
 };
 
-static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
+static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
+                            uint8_t pi, uint8_t pil)
 {
-    uint32_t dw10 = le32_to_cpu(cmd->cdw10);
-    uint8_t lbaf = dw10 & 0xf;
-    uint8_t pi = (dw10 >> 5) & 0x7;
-    uint8_t mset = (dw10 >> 4) & 0x1;
-    uint8_t pil = (dw10 >> 8) & 0x1;
-
     trace_pci_nvme_format_set(ns->params.nsid, lbaf, mset, pi, pil);
 
     ns->id_ns.dps = (pil << 3) | pi;
@@ -5490,7 +5490,6 @@ static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
 static void nvme_format_ns_cb(void *opaque, int ret)
 {
     NvmeFormatAIOCB *iocb = opaque;
-    NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = iocb->ns;
     int bytes;
 
@@ -5512,7 +5511,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
         return;
     }
 
-    nvme_format_set(ns, &req->cmd);
+    nvme_format_set(ns, iocb->lbaf, iocb->mset, iocb->pi, iocb->pil);
     ns->status = 0x0;
     iocb->ns = NULL;
     iocb->offset = 0;
@@ -5548,9 +5547,6 @@ static void nvme_format_bh(void *opaque)
     NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
-    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
-    uint8_t lbaf = dw10 & 0xf;
-    uint8_t pi = (dw10 >> 5) & 0x7;
     uint16_t status;
     int i;
 
@@ -5572,7 +5568,7 @@ static void nvme_format_bh(void *opaque)
         goto done;
     }
 
-    status = nvme_format_check(iocb->ns, lbaf, pi);
+    status = nvme_format_check(iocb->ns, iocb->lbaf, iocb->pi);
     if (status) {
         req->status = status;
         goto done;
@@ -5595,6 +5591,11 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeFormatAIOCB *iocb;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint8_t lbaf = dw10 & 0xf;
+    uint8_t mset = (dw10 >> 4) & 0x1;
+    uint8_t pi = (dw10 >> 5) & 0x7;
+    uint8_t pil = (dw10 >> 8) & 0x1;
     uint16_t status;
 
     iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
@@ -5604,6 +5605,10 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     iocb->ret = 0;
     iocb->ns = NULL;
     iocb->nsid = 0;
+    iocb->lbaf = lbaf;
+    iocb->mset = mset;
+    iocb->pi = pi;
+    iocb->pil = pil;
     iocb->broadcast = (nsid == NVME_NSID_BROADCAST);
     iocb->offset = 0;
 
-- 
2.35.1


