Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0613022D3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 09:34:47 +0100 (CET)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xKf-0001Dd-Lf
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 03:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3x8v-00047S-2M; Mon, 25 Jan 2021 03:22:37 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:51545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3x8t-0006aK-D8; Mon, 25 Jan 2021 03:22:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 97C125C00AC;
 Mon, 25 Jan 2021 03:22:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 03:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fo3koSlmVlqv/
 A87F7qz07Odfmyb5lVAErjyj34k2PY=; b=V0hVxbAWkDBh4l28RGJJsi4Fx6W/c
 BHdLI/aA1OggMO4eBOzhEdb3kxcVk1Pz90epTPviwwjH2dUoNVnt/mWuCU2y4WcS
 t+Bbckf52mvLsT5BW09VU6ZWindwtCaJNY1Cx3SAQoVpbkLgqfNS24fOh8ha67fK
 PxZ7Kp+QxvHzW4+qMtOdVWDe3PisZiT0HpL5dNpN/nYSHnFgunzVMEKDu4LbzQRn
 61DdSL/nyO0hc8kOmDSV9x3dNe5H0o7fMu7I/ic9rXoPWbAN7gm3hvE3gQXdwpza
 qCzBNhilIuWsRrV8lzqpsuYC0wG8Va8U+HL5nIKTPLcj1H787uB7TlYFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fo3koSlmVlqv/A87F7qz07Odfmyb5lVAErjyj34k2PY=; b=KLsqqQVv
 BCciaJ7/1FBSWMQSnFbusapVEy7OEGDV1Xq6VltNJr5ihxJT0/BvyFOZK7+lnq/Q
 mZ6W6vS7Bs91vqXQlFigW7a6IJpvwsDFH8T1Fcr7ukPhMZLLNAWim2NlDHPwPmHu
 ZaEMu/Jg4oDJjCwu5LiPayy7+r8AMde6tlrrA0oDPfAYn2XeQZ9pKwep7PwolcY0
 DIeeWc+gQ7mAj/58fbZTBeeBnw+fWaZz2Y+FN4DRu6ETp44FjwyG0uOJbHqFU0dG
 /adrSB+Q4kezFYJXNKMrXHn4Csznl2USbf7y8sgtPY61oL0ofVTLhNFZMn2iHSJl
 ZNRY1ZEYYEFHcQ==
X-ME-Sender: <xms:yn8OYFqdMfLlmhNq6AFh7kIcIKhWgEpt04QiU56g8YNHyrfhBcNTSA>
 <xme:yn8OYHr3bBWx-tdi478FyA5hPeXhJtFN7rMCKjdMpph6dOSYndLDupk6IZ_TT_IxO
 pZ_IDAhLQZNd9fBi1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:yn8OYCNTle3eqJ56n-vIFsziniL-3WXUhIeqnEsdAqZGS9rzbyGA8A>
 <xmx:yn8OYA5EbZQxLjQsnql7H3uixu6J0xYrsYLf6NaCKTKsPyjPE37rkw>
 <xmx:yn8OYE5S1nra_tnpT481QPL1pOCuI0X-7LwcvgGMaVWVIOohuoIeAg>
 <xmx:yn8OYBsNCZotCZ7uF5lEscbJTapVWv_Fuaw18poio9HdhExD8w8rPg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4DA261080059;
 Mon, 25 Jan 2021 03:22:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: align with existing style
Date: Mon, 25 Jan 2021 09:22:27 +0100
Message-Id: <20210125082227.20160-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125082227.20160-1-its@irrelevant.dk>
References: <20210125082227.20160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Change status checks to align with the existing style and remove the
explicit check against NVME_SUCCESS.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1be5b54e0fed..98d84fe26644 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1198,7 +1198,7 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
         status = nvme_check_zone_state_for_write(zone);
     }
 
-    if (status != NVME_SUCCESS) {
+    if (status) {
         trace_pci_nvme_err_zone_write_not_ok(slba, nlb, status);
     } else {
         assert(nvme_wp_is_valid(zone));
@@ -1253,7 +1253,7 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
     uint16_t status;
 
     status = nvme_check_zone_state_for_read(zone);
-    if (status != NVME_SUCCESS) {
+    if (status) {
         ;
     } else if (unlikely(end > bndry)) {
         if (!ns->params.cross_zone_read) {
@@ -1266,7 +1266,7 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
             do {
                 zone++;
                 status = nvme_check_zone_state_for_read(zone);
-                if (status != NVME_SUCCESS) {
+                if (status) {
                     break;
                 }
             } while (end > nvme_zone_rd_boundary(ns, zone));
@@ -1677,7 +1677,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     if (ns->params.zoned) {
         status = nvme_check_zone_read(ns, slba, nlb);
-        if (status != NVME_SUCCESS) {
+        if (status) {
             trace_pci_nvme_err_zone_read_not_ok(slba, nlb, status);
             goto invalid;
         }
@@ -1748,12 +1748,12 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         zone = nvme_get_zone_by_slba(ns, slba);
 
         status = nvme_check_zone_write(n, ns, zone, slba, nlb, append);
-        if (status != NVME_SUCCESS) {
+        if (status) {
             goto invalid;
         }
 
         status = nvme_auto_open_zone(ns, zone);
-        if (status != NVME_SUCCESS) {
+        if (status) {
             goto invalid;
         }
 
@@ -1852,14 +1852,14 @@ static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EMPTY:
         status = nvme_aor_check(ns, 1, 0);
-        if (status != NVME_SUCCESS) {
+        if (status) {
             return status;
         }
         nvme_aor_inc_active(ns);
         /* fall through */
     case NVME_ZONE_STATE_CLOSED:
         status = nvme_aor_check(ns, 0, 1);
-        if (status != NVME_SUCCESS) {
+        if (status) {
             if (state == NVME_ZONE_STATE_EMPTY) {
                 nvme_aor_dec_active(ns);
             }
@@ -1972,7 +1972,7 @@ static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
 
     if (state == NVME_ZONE_STATE_EMPTY) {
         status = nvme_aor_check(ns, 1, 0);
-        if (status != NVME_SUCCESS) {
+        if (status) {
             return status;
         }
         nvme_aor_inc_active(ns);
@@ -3301,7 +3301,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
 
     ret = nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
                    DMA_DIRECTION_TO_DEVICE, req);
-    if (ret != NVME_SUCCESS) {
+    if (ret) {
         return ret;
     }
 
-- 
2.30.0


