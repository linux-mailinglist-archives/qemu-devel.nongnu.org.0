Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C503F3B7830
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:03:07 +0200 (CEST)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJ0k-00075e-En
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImk-0001a9-Hn; Tue, 29 Jun 2021 14:48:38 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:55049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImf-0005V8-EN; Tue, 29 Jun 2021 14:48:38 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 4F81F2B00ABA;
 Tue, 29 Jun 2021 14:48:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 29 Jun 2021 14:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=MylpJSh73wqh1
 cjVde67Zcbkls/RvHDrEf0/fJVbtxY=; b=dkgfkolOwk2oqRLQjTnUQpUpM7C3L
 J4z6QgTHRbUvn9k7JgWrEpY0kNYw9HE7GZA0EkHR1TDGa4oGt+T8XcujhokRK0xK
 Barno2U06n4fP0DRHGUplwZIJd/Z+iXfvrgXAHWBzd0GOBl1oPXIpfabKGiQ4+iM
 /nEm4+FiWmOtdoPDIIlYrHqZDinLdla4fCjMa+kGMlOJjBiWJxxZaEl4a8aMm08x
 73gjEK4WSz6KMCxbEyj0cyv9ir7Mro2KYnAfb7PaunDhJHL3AZsX2Iz1Heq4u/mz
 xLhZzInVud/PgcJ71iLkLr9nc4jYc9cHKROSmav6iAJ7IZQp4oDJoCkfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=MylpJSh73wqh1cjVde67Zcbkls/RvHDrEf0/fJVbtxY=; b=ZF1WrPYt
 /YbCWbNpVhZq1xKzL0WrJDVHyOKQOocntM3KiApgFCkU6SkMyvxQsnnEBkzzUGmJ
 OI4fphTHM2GF1t2fyMaIXT+k3ntvaY1oDSCvXZiT5VcwqI+BffNc3YkEeOOtuzsp
 YCCEr33yE0c6sNAB5rpIBa4HQngu31Wu03OpDw55BK59gpKuy9ZejtCDP8Gk6oCV
 WrDnoJ+XaaV9Ev8z7KFMOYfFHFIMIpLcmj996FRa878GO8pRRZMC6y4vzY0Q7Hx1
 +FYzTFJoAGjndLm6k3xniLRuHpGMat1a67Cw6mjkpULzk/hlcadD57iIFx0iyNOq
 RslhwcXdu3spWQ==
X-ME-Sender: <xms:_mrbYLkSLll1Q-FT742Etl55Ld3oEUpuSlcKe2VApsvZF6c--SFkiw>
 <xme:_mrbYO1K8lVZwyRBunNFZByh0WgeELrbis_lKmpRBVT9HoIwSZUVZ3NdbI45Gtb6h
 Meg82xm19l6ry2dmgo>
X-ME-Received: <xmr:_mrbYBotV9f_1ibGrglI8zSsHbgGcj7etHrf5Ax7KMWsq1z0vu4rMC_1EGbvswGEDHS_wlrznH2kRY2xkf5DQgOT-IjwCpsppomvipXIew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:_mrbYDn8fmehEstnfPqKNJUtm5JBuqj-9x_X2ck-v-QkIRUXu5b2_w>
 <xmx:_mrbYJ1efFYvuj75X0vAzxYOe9gTOPZcXd7YbKv1Y1EoM_3Vt8PnQw>
 <xmx:_mrbYCvzl2907Xie8gtl-8xMRENsXwv8MLpmuxd-HpbjC8qUyPSr3Q>
 <xmx:_mrbYCvS2z3gPBhGS7L5nNtMgnu7QYGoeHM5MvZ-r1xWAMaiPV7TU6ZaZDw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:29 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/23] hw/nvme: remove assert from nvme_get_zone_by_slba
Date: Tue, 29 Jun 2021 20:47:32 +0200
Message-Id: <20210629184743.230173-13-its@irrelevant.dk>
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

Make nvme_get_zone_by_slba() return NULL if the slba is out of range.
This allows the function to be used without guarding the call with a
call to nvme_check_bounds(), in preparation for the next patch.

Add asserts after calling nvme_get_zone_by_slba() instead.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 699919ad1ab1..a984b80a18f3 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1542,7 +1542,10 @@ static inline NvmeZone *nvme_get_zone_by_slba(NvmeNamespace *ns, uint64_t slba)
 {
     uint32_t zone_idx = nvme_zone_idx(ns, slba);
 
-    assert(zone_idx < ns->num_zones);
+    if (zone_idx >= ns->num_zones) {
+        return NULL;
+    }
+
     return &ns->zone_array[zone_idx];
 }
 
@@ -1619,11 +1622,16 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
                                      uint32_t nlb)
 {
-    NvmeZone *zone = nvme_get_zone_by_slba(ns, slba);
-    uint64_t bndry = nvme_zone_rd_boundary(ns, zone);
-    uint64_t end = slba + nlb;
+    NvmeZone *zone;
+    uint64_t bndry, end;
     uint16_t status;
 
+    zone = nvme_get_zone_by_slba(ns, slba);
+    assert(zone);
+
+    bndry = nvme_zone_rd_boundary(ns, zone);
+    end = slba + nlb;
+
     status = nvme_check_zone_state_for_read(zone);
     if (status) {
         ;
@@ -1790,6 +1798,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     slba = le64_to_cpu(rw->slba);
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
+    assert(zone);
 
     nvme_advance_zone_wp(ns, zone, nlb);
 }
@@ -3186,6 +3195,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     if (ns->params.zoned) {
         zone = nvme_get_zone_by_slba(ns, slba);
+        assert(zone);
 
         if (append) {
             bool piremap = !!(ctrl & NVME_RW_PIREMAP);
-- 
2.32.0


