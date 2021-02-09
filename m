Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD31314AD0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:51:37 +0100 (CET)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OkC-00036I-EY
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWM-0005nW-9Z; Tue, 09 Feb 2021 02:33:14 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWK-00061o-Cb; Tue, 09 Feb 2021 02:33:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5F25FD1E;
 Tue,  9 Feb 2021 02:32:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yJrmTzSHaWcfi
 Xdflz5R1LKeX6uMDXwWGMU4vq51SRg=; b=Ug3v8WTLZwHEFHt96XQACix7h7kQ4
 vsUlEpaXE2geKc+wIGv5raZKTJ6whB0PV87x5UDGtbNpvGqY0C168M3thufJ19Yy
 43PHiD1A6jtcS11qXnzzNB42pBrz+9bgMPBkZNFI14w1lVCER88CpMrvk7eEGF1j
 cDarfl8X3Y/mtWUD6DxOjehnSdeBk/VbJrhi45cjvdyoLU0eDQc5rf8DNP/TnFpx
 2fKrwMAXEjJtKGQy3wA2e645cTofu/PEQxE6wE3p8Mpr6A1ft1ds2Mo2ue6trro0
 Nz+rWjdpqyZYt9X88SNsvnswgI8I4mcqPzSqvKXO//fFKx8/GJcZog0gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yJrmTzSHaWcfiXdflz5R1LKeX6uMDXwWGMU4vq51SRg=; b=GPUeMTIE
 GGEREvRyABAc7VzDIcuo1E18QcEToXPj3m8tSB5Y8uLU4z4qT9Mij2NSuTws4o/j
 xKDDQUZnaSNkKR1DWIiYjNirWghsDta6IA2Z0zlzkt08XMmgTu14TW1ShQLuu/QX
 MhN7vfkMS3jrhZ5+OgnJMI/FxG1c6jxm5C3JXFxrOzodvj4/L5B55Nq1iOGZJQ3o
 uByzIKaIPeEUzENKv4BQ4Ls/pUDbd5YN8+xzwPtHSghnbRhxub0yERGjE78k4zn2
 24Sg6juyNApB/ZB92Tv+QW/VGIMr9r1vNBEQyri/76ROkyvL3DZpp5wXfonOxLnS
 txLMINQmo/avdQ==
X-ME-Sender: <xms:oDoiYJqQq-_Zizx_e1UO8GGgdtnyxHEi4yGbNkmbFz-RNounIQVqXQ>
 <xme:oDoiYLoJ5VFVtWTpscntlCipzxA3gCKGgjcebCOhfCbw_qbFhZuyt888bN6GhYmuR
 VvB1fXV7_xi6KMGvxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:oDoiYGOYGuA0P7o3xusOTDw5mznD8mVXRwD9_M1lwVRl1UAejm3cQQ>
 <xmx:oDoiYE5AY-rY8HrduplBzyfFRwhGRBGR3Ji1Liewuu_YhhzkkUNOgg>
 <xmx:oDoiYI45NCCT6ysVGMkoRhXFTG0Z97mU-HCEgelyYFNVUaVQjhZyVg>
 <xmx:oToiYJEQIcoO6MXrXPQTQpUWkTePXkJFp0kmuaW9Zqpe2fC5kev0EgTX3S0>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 51C63108005F;
 Tue,  9 Feb 2021 02:32:47 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 55/56] hw/block/nvme: fix zone boundary check for append
Date: Tue,  9 Feb 2021 08:31:00 +0100
Message-Id: <20210209073101.548811-56-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Niklas Cassel <niklas.cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

When a zone append is processed the controller checks that validity of
the write before assigning the LBA to the append command. This causes
the boundary check to be wrong.

Fix this by checking the write *after* assigning the LBA. Remove the
append special case from the nvme_check_zone_write and open code it in
nvme_do_write, assigning the slba when basic sanity checks have been
performed. Then check the validity of the resulting write like any other
write command.

In the process, also fix a missing endianness conversion for the zone
append ALBA.

Reported-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e562d7467b3b..cedb4ad9ffd3 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1188,7 +1188,7 @@ static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
 
 static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
                                       NvmeZone *zone, uint64_t slba,
-                                      uint32_t nlb, bool append)
+                                      uint32_t nlb)
 {
     uint16_t status;
 
@@ -1202,16 +1202,8 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
         trace_pci_nvme_err_zone_write_not_ok(slba, nlb, status);
     } else {
         assert(nvme_wp_is_valid(zone));
-        if (append) {
-            if (unlikely(slba != zone->d.zslba)) {
-                trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
-                status = NVME_INVALID_FIELD;
-            }
-            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
-                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
-                status = NVME_INVALID_FIELD;
-            }
-        } else if (unlikely(slba != zone->w_ptr)) {
+
+        if (unlikely(slba != zone->w_ptr)) {
             trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
                                                zone->w_ptr);
             status = NVME_ZONE_INVALID_WRITE;
@@ -1349,10 +1341,9 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
     }
 }
 
-static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
-                                     uint32_t nlb)
+static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
+                                 uint32_t nlb)
 {
-    uint64_t result = zone->w_ptr;
     uint8_t zs;
 
     zone->w_ptr += nlb;
@@ -1368,8 +1359,6 @@ static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
         }
     }
-
-    return result;
 }
 
 static inline bool nvme_is_write(NvmeRequest *req)
@@ -1747,7 +1736,24 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     if (ns->params.zoned) {
         zone = nvme_get_zone_by_slba(ns, slba);
 
-        status = nvme_check_zone_write(n, ns, zone, slba, nlb, append);
+        if (append) {
+            if (unlikely(slba != zone->d.zslba)) {
+                trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
+                status = NVME_INVALID_FIELD;
+                goto invalid;
+            }
+
+            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
+                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
+                status = NVME_INVALID_FIELD;
+                goto invalid;
+            }
+
+            slba = zone->w_ptr;
+            res->slba = cpu_to_le64(slba);
+        }
+
+        status = nvme_check_zone_write(n, ns, zone, slba, nlb);
         if (status) {
             goto invalid;
         }
@@ -1757,11 +1763,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             goto invalid;
         }
 
-        if (append) {
-            slba = zone->w_ptr;
-        }
-
-        res->slba = nvme_advance_zone_wp(ns, zone, nlb);
+        nvme_advance_zone_wp(ns, zone, nlb);
     }
 
     data_offset = nvme_l2b(ns, slba);
-- 
2.30.0


