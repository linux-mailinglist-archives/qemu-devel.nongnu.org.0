Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EB39B378
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 08:58:29 +0200 (CEST)
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3mm-0000bf-Me
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 02:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hL-0005bZ-WF; Fri, 04 Jun 2021 02:52:52 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hJ-0007Lf-Ay; Fri, 04 Jun 2021 02:52:51 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FACA5C017E;
 Fri,  4 Jun 2021 02:52:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Jun 2021 02:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=9qLrmHBWj2SxF
 suoBRc2T5XgxaMTFU55suT7QXeGEl0=; b=bIT/i2YgZFJgmqQL5kEcK7fJbQ8tt
 IkbUu27154JKjWfZzTfZHX2GApkBh4B85CB3WyLzJdOQPQCTvOMNLOuRCSjzpjVK
 pEkB1845AgJrk5zgsHS/n+opq5YG4pLb46m0jdYib0l89WtWbfGCEyRTNOIyqxTc
 Emr01mQdGPQ+7m6ZAL0r+2NW+7nCzvrO42Icmgr4oKDYNznfphFaOeOGsnuYFwvO
 XYl0wFOK1FuV7vdhrgbIbvJJyu7dQtoZ4hzJqW0s+0N2PiQLokzpspyKgO56gilr
 kGs3q5pFqcNAANVOaWMKNHkI64lfC/faArwEw0BvvdFrG2fj7vR3k3PcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=9qLrmHBWj2SxFsuoBRc2T5XgxaMTFU55suT7QXeGEl0=; b=BPXaNQHc
 3QNLWxKKQ/f/zhJHAHNkrFuxNcD6zepRqJI8BXLAZ8SEWEfp0vLMMQTzJqAyi8ov
 +tE+gmCJwZPUygOw3Z7VdEWKaYrIsusaS2lzc5/+2Cn5KgOVAMm84CWqhtDbiCiV
 ake8HnAobeFlhOZi4IzSf/GsUQPjR/Sr9cpkkPJeEfuc9eC+GYKu9CZXIGWP3sCc
 rG5gbO8QNjb3g6NEi71yXDPtshKELSZZzZicPz5T8SeTjxxM4H7m0BfYeo82zJsf
 KEA09NX0mu7ZhSlvbQGErNjHL7muKSwotzxD6GmqwZnLGEcVpkJr1lIDFivkFWXS
 XXd/d8xzVZoWoA==
X-ME-Sender: <xms:wM25YGDlIw81Lm03u9RTuSUDcbqgdj2LnDIlROz-OOXN8Zr965P4Ug>
 <xme:wM25YAgG065no6f5c3yFJoE9o8TXPtqW6C_sM8pzp9ibQgUsqNT_eoCgOO-mW1mUt
 k5hDeGE2v_O5EcQx7w>
X-ME-Received: <xmr:wM25YJkZBX6yIDkXoEtbzlHobFt_TwwpIoySJK0ljrvTvJakwpmrce6jMAcpvzNBRncm5qhpiGZ2qJ8jzBo5AaclyEPd0gKbcQxKh36ACg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:wM25YEzIGsm84LqvhWFsH6L96C05gC1aHRGzbSiZO935ytpTUWipFA>
 <xmx:wM25YLRUr3oBEdaXA5VF3c1iMQUOrqgRnBlgM7-jXXG9ZskuKuA_DQ>
 <xmx:wM25YPZkl3Fw0Lf9bPn5-FvbWfMNuhuM0qpo3PSH9egtKO_FO27Hyw>
 <xmx:wM25YEQiqrdb_vKukdgzej7yVu8xPbJT4gTjkrz7HGSvJbddi6m60Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/11] hw/nvme: save reftag when generating pi
Date: Fri,  4 Jun 2021 08:52:30 +0200
Message-Id: <20210604065237.873228-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
References: <20210604065237.873228-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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
index 95730ff2bec5..bfa6632717dc 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -538,11 +538,11 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
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
index e9423df3a449..0dc86f7b603c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1953,7 +1953,7 @@ static void nvme_verify_cb(void *opaque, int ret)
 
         req->status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
                                      ctx->mdata.bounce, ctx->mdata.iov.size,
-                                     ctrl, slba, apptag, appmask, reftag);
+                                     ctrl, slba, apptag, appmask, &reftag);
     }
 
 out:
@@ -2189,7 +2189,7 @@ static void nvme_copy_in_complete(NvmeRequest *req)
             reftag = le32_to_cpu(range->reftag);
 
             status = nvme_dif_check(ns, buf, len, mbuf, mlen, prinfor, slba,
-                                    apptag, appmask, reftag);
+                                    apptag, appmask, &reftag);
             if (status) {
                 goto invalid;
             }
@@ -2212,10 +2212,10 @@ static void nvme_copy_in_complete(NvmeRequest *req)
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
@@ -2355,7 +2355,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
 
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
2.31.1


