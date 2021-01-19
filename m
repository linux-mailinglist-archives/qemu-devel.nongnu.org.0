Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A863B2FB6C5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:14:30 +0100 (CET)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rm9-0007Y2-Ik
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1rTZ-0002gC-2r; Tue, 19 Jan 2021 08:55:18 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1rTP-0005rr-MI; Tue, 19 Jan 2021 08:55:16 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E5FE05C0248;
 Tue, 19 Jan 2021 08:55:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 Jan 2021 08:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RVx2IZTVsCD2+
 w7Ha7I9nGi/JJdqmChp6GbNEOlZTOc=; b=3CnvDHsSE7HM0GD3Ag8/QI1AG+DAj
 omipaJeWIpbQOKH5zZqy3u7+cULZikP+ahMQb0z+/jYQ77ZdKw03KJCmNAaW/hjV
 OzT4GFjdcGNOxVA3uChueW++Y823jlKWMOA00+V98HWtcQE+Jfb/Y7GjfQNwQLRN
 JkOlpvoJFg0gkomwNqIEXxBnTD7M//sVi6n9+g1+rkGzgvew6kvcm+r88Bpn9ipW
 CFtYkobp/Akq+LQAQLMjHHNN4jY6UjcM/8XiQXUMJzk3KjOO4akVG0zmvgIWdA5v
 6z940yGquAh9o78/TMKGkhvG7PMKDIaUQHruGpcaG5VDSQDlOuns6UOgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RVx2IZTVsCD2+w7Ha7I9nGi/JJdqmChp6GbNEOlZTOc=; b=PpqmmMS2
 zL6+B4rGhsqpHPXE/S7hKNTuQuhgrRnNgAAOkDGAlmVZMuyMs4tS2cpRRsJ8QGub
 AiWq6FtOJMylPQKkNufavSRChj7ZYZGaFB6SelPcmabR9rKe0zxCXYTzVOrMjwiD
 AtOFKTPHYZGOX+4ySIFjHrOhfdkQfv3XhsKd0dL3widt2k9vxtKIoL9VYlgM25l+
 LR7sIfrQT9oTLQZpOT+3MXU1cGuxXp2QvmIoG6KzFUwyF5kcJiXdyWdiFixmo3Ju
 uxSRIs5kRFE3dlsVUBpeT4tuWHxUqylioJu4frFwA5fRhJzQbU2t9w9uQP9re8oY
 sZSlpYyMauc1vQ==
X-ME-Sender: <xms:uuQGYIPnfE1gXQnk-ByfwSKuoX9jy9h4AyLcc0seZLCG_FTjnqs5NQ>
 <xme:uuQGYKaSiIuV0rgC1u3QHFOmSJxnx7QmEtIfunw6jYX1Y3J3fMvu0m6QrmYG7I9xj
 sAoPYnhE5f015M-Ct4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:uuQGYCyo2slgj6Kq69y7eRmE8Vjcr018Q8_-YACN4tk_SE3hQ-O80g>
 <xmx:uuQGYFIJ7rCFA0eeGgk1eqOXOsNWinl6znyhEhnl9fCrx6EKurYT5A>
 <xmx:uuQGYMo2ZIg9CmULaBbsWvu_7PCezB2h-uV5ubcccpKfpzrNh1GmFw>
 <xmx:uuQGYM5kVrNDjRFVXzQ_MeZgbGWPBY6TTvTGMOLUZMBa6B83U3Hr8g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB01C240057;
 Tue, 19 Jan 2021 08:55:05 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: refactor the logic for zone write checks
Date: Tue, 19 Jan 2021 14:55:00 +0100
Message-Id: <20210119135500.265403-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119135500.265403-1-its@irrelevant.dk>
References: <20210119135500.265403-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Refactor the zone write check logic such that the most "meaningful"
error is returned first. That is, first, if the zone is not writable,
return an appropriate status code for that. Then, make sure we are
actually writing at the write pointer and finally check that we do not
cross the zone write boundary. This aligns with the "priority" of status
codes for zone read checks.

Also add a couple of additional descriptive trace events and remove an
always true assert.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 47 +++++++++++++++++++------------------------
 hw/block/trace-events |  5 +++++
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f05dea657b01..193a27259dda 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1106,56 +1106,51 @@ static inline NvmeZone *nvme_get_zone_by_slba(NvmeNamespace *ns, uint64_t slba)
 
 static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
 {
-    uint16_t status;
+    uint64_t zslba = zone->d.zslba;
 
     switch (nvme_get_zone_state(zone)) {
     case NVME_ZONE_STATE_EMPTY:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_CLOSED:
-        status = NVME_SUCCESS;
-        break;
+        return NVME_SUCCESS;
     case NVME_ZONE_STATE_FULL:
-        status = NVME_ZONE_FULL;
-        break;
+        trace_pci_nvme_err_zone_is_full(zslba);
+        return NVME_ZONE_FULL;
     case NVME_ZONE_STATE_OFFLINE:
-        status = NVME_ZONE_OFFLINE;
-        break;
+        trace_pci_nvme_err_zone_is_offline(zslba);
+        return NVME_ZONE_OFFLINE;
     case NVME_ZONE_STATE_READ_ONLY:
-        status = NVME_ZONE_READ_ONLY;
-        break;
+        trace_pci_nvme_err_zone_is_read_only(zslba);
+        return NVME_ZONE_READ_ONLY;
     default:
         assert(false);
     }
-
-    return status;
 }
 
 static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
                                       NvmeZone *zone, uint64_t slba,
                                       uint32_t nlb)
 {
+    uint64_t zcap = nvme_zone_wr_boundary(zone);
     uint16_t status;
 
-    if (unlikely((slba + nlb) > nvme_zone_wr_boundary(zone))) {
-        status = NVME_ZONE_BOUNDARY_ERROR;
-    } else {
-        status = nvme_check_zone_state_for_write(zone);
+    status = nvme_check_zone_state_for_write(zone);
+    if (status) {
+        return status;
     }
 
-    if (status != NVME_SUCCESS) {
-        trace_pci_nvme_err_zone_write_not_ok(slba, nlb, status);
-    } else {
-        assert(nvme_wp_is_valid(zone));
-
-        if (unlikely(slba != zone->w_ptr)) {
-            trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
-                                               zone->w_ptr);
-            status = NVME_ZONE_INVALID_WRITE;
-        }
+    if (unlikely(slba != zone->w_ptr)) {
+        trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba, zone->w_ptr);
+        return NVME_ZONE_INVALID_WRITE;
     }
 
-    return status;
+    if (unlikely((slba + nlb) > zcap)) {
+        trace_pci_nvme_err_zone_boundary(slba, nlb, zcap);
+        return NVME_ZONE_BOUNDARY_ERROR;
+    }
+
+    return NVME_SUCCESS;
 }
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 78d76b0a71c1..c80b02b85ac9 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -127,6 +127,11 @@ pci_nvme_err_unaligned_zone_cmd(uint8_t action, uint64_t slba, uint64_t zslba) "
 pci_nvme_err_invalid_zone_state_transition(uint8_t action, uint64_t slba, uint8_t attrs) "action=0x%"PRIx8", slba=%"PRIu64", attrs=0x%"PRIx32""
 pci_nvme_err_write_not_at_wp(uint64_t slba, uint64_t zone, uint64_t wp) "writing at slba=%"PRIu64", zone=%"PRIu64", but wp=%"PRIu64""
 pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appending at slba=%"PRIu64", but zone=%"PRIu64""
+pci_nvme_err_zone_is_full(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_read_only(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_offline(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_boundary(uint64_t slba, uint32_t nlb, uint64_t zcap) "lba 0x%"PRIx64" nlb %"PRIu32" zcap 0x%"PRIx64""
+pci_nvme_err_zone_invalid_write(uint64_t slba, uint64_t wp) "lba 0x%"PRIx64" wp 0x%"PRIx64""
 pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
-- 
2.30.0


