Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F140314AF5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:00:00 +0100 (CET)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OsJ-0002FV-9F
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWL-0005mA-3b; Tue, 09 Feb 2021 02:33:13 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWJ-00060q-7R; Tue, 09 Feb 2021 02:33:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EB250CCB;
 Tue,  9 Feb 2021 02:32:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=GRHAgtYF+OuPg
 t1vzaDi3gDgCfTt/KuTQlFSyyDK3fk=; b=tJsexsKDMeVpppCW0cXK+WfR353C/
 UGpuBBL4M+Q45rk453JtSXYhh2hsDcyhJtgQj0nwuNlxuw5vb3LPOVIGiK2i93Nr
 3dmDtN3ZsSMxFPcQi/zOTphIEWLiKARIhxA1m7OOiT6jJFBvcoE6ERo7UgXBOVRL
 GF5vLXVG7c2q/XM07t+IK45ziQLNwHpr73OpRjdk2VugGz+5gx+Z7t2thUDq9GwO
 awGRbXCFQGcD85BwRP+m5V8NgV12FgEdAymM+/slsXB45/DUS4YL16LcMTwjfTnt
 h+rcRcrNwaZJ5nTxlegS4T5BiDVtr6gcL7fJq/Lca9N5yQx/wiCuwkoEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GRHAgtYF+OuPgt1vzaDi3gDgCfTt/KuTQlFSyyDK3fk=; b=mNl1VrUn
 D1pm33dfrfRakUu/ZFxwuZGwCBj8qiMYWzn6YCYNDkp2SdTByFDO4V3g+wxnSamB
 3ldEsxPTIFQK+BkzOHt+yobLjZdUtc+ZUAEq4NQUjBOqCwwuNQEfUr7wdEhOsy9x
 bauXXTd1DUuMgJV2Q8r8qBe/aH7UrQXNCdXbQf9Xg0NV6JpnCYkuv6LOx7Z5bbwW
 0EOw2HGsAMbblTNcsQi1B8HzkQHALO/qd1t3bAwIU6KlNQAEwdFlv9uoGTycs3WZ
 txblJHrRYPhjqosY6iy78gBaqFVWOMPIbSmn3ASLoAb97zbIiYvCyOAcYY37g9pc
 g8nINY3p8QaVcQ==
X-ME-Sender: <xms:nToiYPGPPJjEu4J8TtiQtpvZzjsqPre8g5Isbl8zAd9QK4SXYJPmsg>
 <xme:nToiYGYvlT2z4fm0GiuL2TPGIzYjrpOMfPE9fnzg7yHBMp7Iw20PfwZmQ815M0_FW
 3CyawNrF1vR_lSf09s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:nToiYBAu_dpM93ietMaLSsDxKsq0C7rKO9ukHRaTaZjoZslNFiE3zQ>
 <xmx:nToiYOn3V5rxFDf-_-kQy2zJRvNTOxWpSivTWCExxrPx9Kdmg2luOg>
 <xmx:nToiYCyiiOz7ddPIbGINAz330wk1jpOA-jh7WMBh0xZISbZHgLYhbQ>
 <xmx:nToiYMo5GTLWleltylSw3M_-RcDtu_sScyLcrBZDIT97R6scRMPoCPJca4s>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B97C1080067;
 Tue,  9 Feb 2021 02:32:44 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 53/56] hw/block/nvme: align with existing style
Date: Tue,  9 Feb 2021 08:30:58 +0100
Message-Id: <20210209073101.548811-54-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Change status checks to align with the existing style and remove the
explicit check against NVME_SUCCESS.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c99a3fbf3461..2335739bdb17 100644
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


