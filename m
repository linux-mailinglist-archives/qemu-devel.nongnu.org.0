Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818483ABC6D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:12:44 +0200 (CEST)
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxRS-0005gB-W9
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxM7-0002US-MR; Thu, 17 Jun 2021 15:07:11 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxM5-0002z3-Qz; Thu, 17 Jun 2021 15:07:11 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 16F525C0068;
 Thu, 17 Jun 2021 15:07:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 17 Jun 2021 15:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=aDPLd5TEatCw9
 8zj81ftVJGBolGT3X2yh8jIBw6I3GQ=; b=ZAKestVkpOsw+t9/nNMcXHRa6Sd73
 5oTF8B38vK/nx9TTP7vWKO9cq3HoNvuG0sdE5wA0zLjth2eShiN7FwGP9Ko9jRc0
 7MDtFQBI3v2I8JhwmpTvZ0Wl1I8hIk5dzc7XfNPnqqUsISQL3KcnubDZOsj5EPj/
 p6Mkzkti+nxX/J2FVKcoTylv2YNCMnQ6bFVf+iFN0/uGHdG4Cg6+1DwyR/RbpBhw
 ctK1B1OpA1e6HZUTWXggRum3UZHVFmN2Dwh4tWqnGnPj5p3k8L+tBY6ma5G6lgZs
 9yBBcpfkRO3yjvkZ2b2BWYKDMY7UbWr+ihPm1gILGGia2Hh3ePVYMVVNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=aDPLd5TEatCw98zj81ftVJGBolGT3X2yh8jIBw6I3GQ=; b=YVRWbHGL
 7DaUUxGI1rdzqhy/DWmb7MSKkqC2ovqUzsoOL/85DbCX42JWKduKKk7k/qbhXZb3
 w68+/nxm5dSrhpLTQQIbjRxTIt5i4nQJ9+TTMFtT+9OiK5iL9u5DZFFy8gYyRrl7
 YVcLB9MNy9NTE5VaLpBsxSdrJF7jgf+FbD4t74Mn8sTrXO/m7mg7qdMt5afpOfCU
 16nTaOlAFeUt4il3UiAg3u6t6m9C43ohUqRIMZmuhk9evZB3XP6BgF42ibsRe6+t
 FFSBl7l2Gu95l5Tv1ipFZegRZ0G3Xl9wI447wxEiG7/gfMFFPft3JlRPP/em07aZ
 A3+W1UjkaiphxQ==
X-ME-Sender: <xms:XJ3LYHSlkZdXHbXPds4mu5I-hFjTH5CuRlDK5S7NLRfA81mSkd8EXg>
 <xme:XJ3LYIzGj8ooixmuTVs4E5-mTKFu5F1LWVQvI16qyF-baiFA64n23I9Ra9CzL4-4z
 MVvUv2h41s_EYbRQYk>
X-ME-Received: <xmr:XJ3LYM2pCdT7iaSBCxRWB9EcIn7v79ERwsMa42irNxuZ84riQH26MtgKA4TXLMErzEEi1BrSz7IUffS4j-hib_YxfQ3eIwvjw-3a8BuRUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XJ3LYHDmioq2sRsKg64-wSPOJJuiplUmf47LKbZZOdpJ0pt_kyQpNw>
 <xmx:XJ3LYAiCsJN8vAelZlgwW-3MpTrIs_pdVRW1cgeYLMO5oTAwozboWw>
 <xmx:XJ3LYLopQcepi1CKGiRfymvsmmSUiucioWiH2jTkOJqOO6_88XR2Xg>
 <xmx:XZ3LYJWfWvKjmbOkxuQ-c4AagVvdFP679cX52h3SEBcPK9BIdmG7QA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:07:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] hw/nvme: save reftag when generating pi
Date: Thu, 17 Jun 2021 21:06:50 +0200
Message-Id: <20210617190657.110823-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prepare nvme_dif_pract_generate_dif() and nvme_dif_check() to be
callable in smaller increments by making the reftag a pointer parameter
updated by the function.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h |  4 ++--
 hw/nvme/ctrl.c | 10 +++++-----
 hw/nvme/dif.c  | 22 +++++++++++-----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 19376570c91e..6e43f3f3d128 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -539,11 +539,11 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
                                uint64_t slba);
 void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
                                  uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t reftag);
+                                 uint32_t *reftag);
 uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint16_t ctrl,
                         uint64_t slba, uint16_t apptag,
-                        uint16_t appmask, uint32_t reftag);
+                        uint16_t appmask, uint32_t *reftag);
 uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
 
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1626ed29c76b..07e40107e86b 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1968,7 +1968,7 @@ static void nvme_verify_cb(void *opaque, int ret)
 
         req->status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
                                      ctx->mdata.bounce, ctx->mdata.iov.size,
-                                     ctrl, slba, apptag, appmask, reftag);
+                                     ctrl, slba, apptag, appmask, &reftag);
     }
 
 out:
@@ -2204,7 +2204,7 @@ static void nvme_copy_in_complete(NvmeRequest *req)
             reftag = le32_to_cpu(range->reftag);
 
             status = nvme_dif_check(ns, buf, len, mbuf, mlen, prinfor, slba,
-                                    apptag, appmask, reftag);
+                                    apptag, appmask, &reftag);
             if (status) {
                 goto invalid;
             }
@@ -2227,10 +2227,10 @@ static void nvme_copy_in_complete(NvmeRequest *req)
             }
 
             nvme_dif_pract_generate_dif(ns, ctx->bounce, len, ctx->mbounce,
-                                        mlen, apptag, reftag);
+                                        mlen, apptag, &reftag);
         } else {
             status = nvme_dif_check(ns, ctx->bounce, len, ctx->mbounce, mlen,
-                                    prinfow, sdlba, apptag, appmask, reftag);
+                                    prinfow, sdlba, apptag, appmask, &reftag);
             if (status) {
                 goto invalid;
             }
@@ -2370,7 +2370,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
 
         status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
                                 ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
-                                slba, apptag, appmask, reftag);
+                                slba, apptag, appmask, &reftag);
         if (status) {
             req->status = status;
             goto out;
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 88efcbe9bd60..f5f86f1c26ad 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -41,7 +41,7 @@ static uint16_t crc_t10dif(uint16_t crc, const unsigned char *buffer,
 
 void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
                                  uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t reftag)
+                                 uint32_t *reftag)
 {
     uint8_t *end = buf + len;
     int16_t pil = 0;
@@ -51,7 +51,7 @@ void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
     }
 
     trace_pci_nvme_dif_pract_generate_dif(len, ns->lbasz, ns->lbasz + pil,
-                                          apptag, reftag);
+                                          apptag, *reftag);
 
     for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
@@ -63,10 +63,10 @@ void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
 
         dif->guard = cpu_to_be16(crc);
         dif->apptag = cpu_to_be16(apptag);
-        dif->reftag = cpu_to_be32(reftag);
+        dif->reftag = cpu_to_be32(*reftag);
 
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
-            reftag++;
+            (*reftag)++;
         }
     }
 }
@@ -132,13 +132,13 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
 uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint16_t ctrl,
                         uint64_t slba, uint16_t apptag,
-                        uint16_t appmask, uint32_t reftag)
+                        uint16_t appmask, uint32_t *reftag)
 {
     uint8_t *end = buf + len;
     int16_t pil = 0;
     uint16_t status;
 
-    status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+    status = nvme_check_prinfo(ns, ctrl, slba, *reftag);
     if (status) {
         return status;
     }
@@ -153,13 +153,13 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
 
         status = nvme_dif_prchk(ns, dif, buf, mbuf, pil, ctrl, apptag,
-                                appmask, reftag);
+                                appmask, *reftag);
         if (status) {
             return status;
         }
 
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
-            reftag++;
+            (*reftag)++;
         }
     }
 
@@ -270,7 +270,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
 
     status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
                             ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
-                            slba, apptag, appmask, reftag);
+                            slba, apptag, appmask, &reftag);
     if (status) {
         req->status = status;
         goto out;
@@ -478,11 +478,11 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
         /* splice generated protection information into the buffer */
         nvme_dif_pract_generate_dif(ns, ctx->data.bounce, ctx->data.iov.size,
                                     ctx->mdata.bounce, ctx->mdata.iov.size,
-                                    apptag, reftag);
+                                    apptag, &reftag);
     } else {
         status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
                                 ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
-                                slba, apptag, appmask, reftag);
+                                slba, apptag, appmask, &reftag);
         if (status) {
             goto err;
         }
-- 
2.32.0


