Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEC3B7821
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:59:45 +0200 (CEST)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIxU-0003K1-DS
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImf-0001X3-Eb; Tue, 29 Jun 2021 14:48:35 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:40363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImc-0005TP-Cq; Tue, 29 Jun 2021 14:48:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 290972B00AB5;
 Tue, 29 Jun 2021 14:48:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 29 Jun 2021 14:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M74CacSlzOt7w
 PhJHXCl6c/ToHTEqKkIjkC4ZW1G3dU=; b=WR9YKkmpWBF/yR3djSkG/NId/hQvf
 0iJZ1xJt7J7pABWAYTgK+3W68ewj0dVTXYc/jqX+HbJFobnlesTJspBE3XIasyzx
 bunDNOeGh5ZiTbLcYpWz0yp426MZ9IghECOs0XpHSIn0bheBZgrqkfXvhzE355zy
 LEsMt7wJhIrcT6XbwuKAKvHpsGDjoEBCLQe0O0UPzm+n63rSb2SOxZAuj9l8OAC9
 wGUvYACX705RZj/S1SSuRKC1dJJJezPQtqv41qrFJ+lm7YlsB8vNIlJaKMRzihcl
 j78emyH0d95OGX3HbnfUfYMHCgaF1Ki7boJ8LFYWVAjtibwbKjgYRLTNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=M74CacSlzOt7wPhJHXCl6c/ToHTEqKkIjkC4ZW1G3dU=; b=MF28gYAu
 WQuqFFuSDpohqKMjtESKMwvqrsSpB3OhKnWNCSy7ObnLC2ZhVG2YeeaWUFwtZbjD
 /w6E64xjcmaAIaD/NAayvnUOctgGTdpJPjiu4AuCdZr2jIgQvMexCb0wukPKu/SY
 aTwt8x56RfNy1psiq8hD9sO9qAhNhZkJwKuX3u8Ij42eoN4XVuO4cqhnAGXpYdNh
 r5MDLvYdEjCtUAjMNOcRayxjdO2f9BZGMQx8QGrUCK3bS9QiJjoTb3BAhEO4b0E1
 9akUffK+Tj5LBgGhQMrY8mdPBpCVU9502N2ANZlJ1nTy/L71bVqnlCKch6N9LCs4
 jvdrr2uml3yJDQ==
X-ME-Sender: <xms:-2rbYNtoBpUf9n89crKdVYZSxbYhLJiFQbNZXLAgn7gvbW82N8I10g>
 <xme:-2rbYGeDyRE1e8Eef45URIgV25pF8qsMC2wi-fqsjWDAAqRX-6lfvEnQlyZi2mStl
 z2zRwUcaWdgLjY5A-k>
X-ME-Received: <xmr:-2rbYAzVLwubqjJb2QAQkxNQTsMtQSbni505JexRvpBlF-LQo51hDkjic6KLwONJV0zcjhwWU_afgo3pi_lg1WQSpLTaXI_j-BnHLraRiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-2rbYEPqudBWr4NmslzIJcTM4IEdPF6tv_IW3zdQDpHfViB0EYf1uQ>
 <xmx:-2rbYN-0qDOYTMyMe14rNeKJpszC3DN9MlWOSTXbaPDs5spQwD33pA>
 <xmx:-2rbYEX5zzG6tNyZvWymmhtkFJOKBzkqpDUVdmKbmzhPeFKdsb_FSg>
 <xmx:-2rbYO08spSerByo0N1LC2ErXySAPB469tZQnxkH7hjQaOTiKLq6fCYtFxI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:26 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 11/23] hw/nvme: save reftag when generating pi
Date: Tue, 29 Jun 2021 20:47:31 +0200
Message-Id: <20210629184743.230173-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/nvme.h |  4 ++--
 hw/nvme/ctrl.c | 10 +++++-----
 hw/nvme/dif.c  | 22 +++++++++++-----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 7f3d0a181d1d..98a7d1c7014e 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -542,11 +542,11 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
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
index bb9ee9361554..699919ad1ab1 100644
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


