Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FB314B09
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:06:15 +0100 (CET)
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OyM-0006zc-KT
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWN-0005ol-8O; Tue, 09 Feb 2021 02:33:15 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWL-000626-B2; Tue, 09 Feb 2021 02:33:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0A9F2B1E;
 Tue,  9 Feb 2021 02:32:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=gtLVuEY9UNddH
 LMwuCfry9zp8Fp5KcegpY+IOvuLRSo=; b=J/5V8JhpHcCv13yWMZUXg294LAxby
 LT5HVaaqGUjECn7cuLvNIle8cyEkUVp4AOgz26a/rFgTUnoG+EML7YDCCDvJ8kDS
 ZRQlM80lbljge3VSqkP3EQ1g5UR03oYofgnqZvS4zGiZEUwUy19J9UsvhsKHFSd7
 +z/nFK9POqoc23n7DZEYhCnW5gZ0d96U6YWWUvr9czOCiYRxVw/LPtpDA/kf8roH
 vmgctZ2MmDa5baRCQjpkz/tbM9FhHCX5N4Q8uS3CNXUetEHCY/ZybWkTCPjK8ecj
 4BLm/lGyXgbjxnKMmb5mnglEmrdqKz9Xf6QvT9P+5aGPyt7PGfSDw8pdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=gtLVuEY9UNddHLMwuCfry9zp8Fp5KcegpY+IOvuLRSo=; b=k/nv1fw/
 N35Kff1aGBjykTUjoR3QUNeoFF6thgldH2j+lY3auEi3pQwWvL0tYKhBRGBArxJM
 1XJx/AWuXniRpyRXCTPxNladNBGdzl5I9cG53kPellnEP74x44CH/UyJU98ZkuEE
 ynLXpcQ5/kYXniJAAWeuK/hGZC/lY/3yW9/avrjO51jv+NQt8UR4NuYv4sV+TdNO
 pW4U41DKC21/9vqnVJdUG38oF0uoMptKs5f8t+8ifOwT1E6MeU1S/vNIcxGZ1q67
 Im9AGTptrjhiijqfve11XkWM9POz+bSvycXHznDB0hKZFIrR2mLOICHC7jKd0v+g
 Osb3rvPtMKKRlg==
X-ME-Sender: <xms:ojoiYLGEHH4WtVLBV186mtlZW7dIzywIBL2QO9xD7rLkOh_MxmMSpg>
 <xme:ojoiYIWhfWpktKSbGd47RqZGIYKImmNsosXwqAVU6vxnom1pEma9YGI31e-hi-XC-
 ywusZcLU-wfL1D7opM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ojoiYNKbl2rwL2dOdlB3TB0lVwIEl_ifVqx5WBOPx5WlQ4dNhdMp3w>
 <xmx:ojoiYJFwB58F1d5mJx9PRWdQsvrCp8LVP5WpWtmsf_xt1IKvIz9vcQ>
 <xmx:ojoiYBX4PCXE6O7ViGK-HeydOUfp4qyb2Vou8zHbhRDDpVQAQVXvYw>
 <xmx:ojoiYJTXje5qRHsUi5lNIGt5AN5kr-3z3qrEkcQlI8D9PL1bVaTFOma_XA0>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17B4B1080057;
 Tue,  9 Feb 2021 02:32:48 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 56/56] hw/block/nvme: refactor the logic for zone write checks
Date: Tue,  9 Feb 2021 08:31:01 +0100
Message-Id: <20210209073101.548811-57-its@irrelevant.dk>
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

Refactor the zone write check logic such that the most "meaningful"
error is returned first. That is, first, if the zone is not writable,
return an appropriate status code for that. Then, make sure we are
actually writing at the write pointer and finally check that we do not
cross the zone write boundary. This aligns with the "priority" of status
codes for zone read checks.

Also add a couple of additional descriptive trace events and remove an
always true assert.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 49 ++++++++++++++++++++-----------------------
 hw/block/trace-events |  5 +++++
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cedb4ad9ffd3..5ce21b7100b3 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1161,56 +1161,53 @@ static inline NvmeZone *nvme_get_zone_by_slba(NvmeNamespace *ns, uint64_t slba)
 
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
 
-    return status;
+    return NVME_INTERNAL_DEV_ERROR;
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
-    }
-
+    status = nvme_check_zone_state_for_write(zone);
     if (status) {
-        trace_pci_nvme_err_zone_write_not_ok(slba, nlb, status);
-    } else {
-        assert(nvme_wp_is_valid(zone));
-
-        if (unlikely(slba != zone->w_ptr)) {
-            trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
-                                               zone->w_ptr);
-            status = NVME_ZONE_INVALID_WRITE;
-        }
+        return status;
     }
 
-    return status;
+    if (unlikely(slba != zone->w_ptr)) {
+        trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba, zone->w_ptr);
+        return NVME_ZONE_INVALID_WRITE;
+    }
+
+    if (unlikely((slba + nlb) > zcap)) {
+        trace_pci_nvme_err_zone_boundary(slba, nlb, zcap);
+        return NVME_ZONE_BOUNDARY_ERROR;
+    }
+
+    return NVME_SUCCESS;
 }
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 87ab6c509045..d32475c3989e 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -129,6 +129,11 @@ pci_nvme_err_unaligned_zone_cmd(uint8_t action, uint64_t slba, uint64_t zslba) "
 pci_nvme_err_invalid_zone_state_transition(uint8_t action, uint64_t slba, uint8_t attrs) "action=0x%"PRIx8", slba=%"PRIu64", attrs=0x%"PRIx32""
 pci_nvme_err_write_not_at_wp(uint64_t slba, uint64_t zone, uint64_t wp) "writing at slba=%"PRIu64", zone=%"PRIu64", but wp=%"PRIu64""
 pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appending at slba=%"PRIu64", but zone=%"PRIu64""
+pci_nvme_err_zone_is_full(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_read_only(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_offline(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_boundary(uint64_t slba, uint32_t nlb, uint64_t zcap) "lba 0x%"PRIx64" nlb %"PRIu32" zcap 0x%"PRIx64""
+pci_nvme_err_zone_invalid_write(uint64_t slba, uint64_t wp) "lba 0x%"PRIx64" wp 0x%"PRIx64""
 pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint16_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint16_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
-- 
2.30.0


