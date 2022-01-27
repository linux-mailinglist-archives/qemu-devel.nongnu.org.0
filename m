Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA849DD9F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:16:38 +0100 (CET)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0tR-0002sZ-3B
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00j-0004kc-HM; Thu, 27 Jan 2022 03:20:05 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00g-0004Vb-47; Thu, 27 Jan 2022 03:20:04 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4A7F2580371;
 Thu, 27 Jan 2022 03:20:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 27 Jan 2022 03:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=SF6eTE/Jm14wJ8
 Gcx9/SjHNzoUJ54p1M/oeciy4hqXE=; b=jQA5tT1JyskeuX+nhLMf0+uYB4NBq2
 NJlaNq1YnURnhUOXWUgWHqSBBBnf3H6YksJ5dvmuaHG1UDgxJ4BjNnzVIA5CyQTi
 K5PC0uYvwT+Fa5s057sSH5GhUyhVD6Nx/lmJM7c8dzxcUUktbnIBfXQNXql5zpgK
 NMVKiAYT6oq7C8gBBohhm3jgPpEPghYvzMUAhlE3SPqHvvnuJx2+R/KQGuNM8Hmk
 xSfzGo6XPg5k/VdQBRHchjKWRt/RBRZMaXdqqRdmpyzVYtCcGXyJV4VpiYK5iS+y
 lVJVW7zWtGw0tef/Ojvi0vym/oiLxQ+6e6lFb1sHxripJywDWP6mvjmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SF6eTE
 /Jm14wJ8Gcx9/SjHNzoUJ54p1M/oeciy4hqXE=; b=RNnZgCanYwD+vtZ8U1zUrI
 qq+BTkBwSFtvAqA/z0y7gXovDW9ay1vy3j151RFqpMeCRUtfeXIFYz/4dSxEHiyr
 zoRoEAePmgyws2KAJwfC4ame4z5hZfBepJXEwZkJASeJllUyJPCz+UB49llT59if
 u6Ms+W2NhKnZToCDox7CbFC30iYohM/T9XIdl2W2bfLksDYVRsb2pyymSFCo+RrU
 6yFBoSXFUInhlWiTgoHwel6K7R0SrdUWVL09ba1E6UMdWYRVSvnEJkAaCYVbeUvZ
 OLVUbUOcuB0W8Sm52wxlI9uAbPpzZ9i5srjXhRpmM0x3bwokuQsPx6SbTbL2z+Cg
 ==
X-ME-Sender: <xms:sVXyYUHs1MNSR1Cial5QnL9ERJCEkFcstnpvSLYvujo64Xcxf1dd8g>
 <xme:sVXyYdUZzR-Uk_cFoBMhKFUMGtfTqO-N_UYaxRcsenmnLxbdXohyS_kIzPlFBWa56
 UVwx6RbT1Gfv9t13Lc>
X-ME-Received: <xmr:sVXyYeK1RU1V-YEGVXjQnKzeyUorVMSWUXxbqFE7hGevGybcBbxUM8MK8be-j4RS7Cpf-qAllof_SewAVX7aoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedvgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:sVXyYWHpUnUCHH7FpNijjdduf32_r2QIXJ8Lji30SBsf6Ki2QDQYng>
 <xmx:sVXyYaVIqvGbC3D-eqhvF9qliIOnSpr_Aezs6xwYn01VymPYzDkIOg>
 <xmx:sVXyYZPIx3H1XzAM1bWWBwShgyV8bcK0XXJ9SccPKXY2GLbncFitog>
 <xmx:sVXyYWQk6awuzqcNwDPB5W7a2SXMKDI1bxpAMqk_LFxlrrnpmdTYow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 03:19:59 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 3/3] hw/nvme: add support for zoned random write area
Date: Thu, 27 Jan 2022 09:19:50 +0100
Message-Id: <20220127081950.953572-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220127081950.953572-1-its@irrelevant.dk>
References: <20220127081950.953572-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for TP 4076 ("Zoned Random Write Area"), v2021.08.23
("Ratified").

This adds three new namespace parameters: "zoned.numzrwa" (number of
zrwa resources, i.e. number of zones that can have a zrwa),
"zoned.zrwas" (zrwa size in LBAs), "zoned.zrwafg" (granularity in LBAs
for flushes).

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 171 ++++++++++++++++++++++++++++++++++++++-----
 hw/nvme/ns.c         |  58 +++++++++++++++
 hw/nvme/nvme.h       |  10 +++
 hw/nvme/trace-events |   1 +
 include/block/nvme.h |  17 ++++-
 5 files changed, 237 insertions(+), 20 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 7cb4974c5e83..98aac98bef5f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -299,26 +299,37 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
     }
 }
 
-/*
- * Check if we can open a zone without exceeding open/active limits.
- * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
- */
-static int nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
+static uint16_t nvme_zns_check_resources(NvmeNamespace *ns, uint32_t act,
+                                         uint32_t opn, uint32_t zrwa)
 {
     if (ns->params.max_active_zones != 0 &&
         ns->nr_active_zones + act > ns->params.max_active_zones) {
         trace_pci_nvme_err_insuff_active_res(ns->params.max_active_zones);
         return NVME_ZONE_TOO_MANY_ACTIVE | NVME_DNR;
     }
+
     if (ns->params.max_open_zones != 0 &&
         ns->nr_open_zones + opn > ns->params.max_open_zones) {
         trace_pci_nvme_err_insuff_open_res(ns->params.max_open_zones);
         return NVME_ZONE_TOO_MANY_OPEN | NVME_DNR;
     }
 
+    if (zrwa > ns->zns.numzrwa) {
+        return NVME_NOZRWA | NVME_DNR;
+    }
+
     return NVME_SUCCESS;
 }
 
+/*
+ * Check if we can open a zone without exceeding open/active limits.
+ * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
+ */
+static uint16_t nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
+{
+    return nvme_zns_check_resources(ns, act, opn, 0);
+}
+
 static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
     hwaddr hi, lo;
@@ -1628,9 +1639,19 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
         return status;
     }
 
-    if (unlikely(slba != zone->w_ptr)) {
-        trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba, zone->w_ptr);
-        return NVME_ZONE_INVALID_WRITE;
+    if (zone->d.za & NVME_ZA_ZRWA_VALID) {
+        uint64_t ezrwa = zone->w_ptr + 2 * ns->zns.zrwas;
+
+        if (slba < zone->w_ptr || slba + nlb > ezrwa) {
+            trace_pci_nvme_err_zone_invalid_write(slba, zone->w_ptr);
+            return NVME_ZONE_INVALID_WRITE;
+        }
+    } else {
+        if (unlikely(slba != zone->w_ptr)) {
+            trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
+                                               zone->w_ptr);
+            return NVME_ZONE_INVALID_WRITE;
+        }
     }
 
     if (unlikely((slba + nlb) > zcap)) {
@@ -1710,6 +1731,14 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
         /* fallthrough */
     case NVME_ZONE_STATE_CLOSED:
         nvme_aor_dec_active(ns);
+
+        if (zone->d.za & NVME_ZA_ZRWA_VALID) {
+            zone->d.za &= ~NVME_ZA_ZRWA_VALID;
+            if (ns->params.numzrwa) {
+                ns->zns.numzrwa++;
+            }
+        }
+
         /* fallthrough */
     case NVME_ZONE_STATE_EMPTY:
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
@@ -1745,6 +1774,13 @@ static uint16_t nvme_zrm_reset(NvmeNamespace *ns, NvmeZone *zone)
         /* fallthrough */
     case NVME_ZONE_STATE_CLOSED:
         nvme_aor_dec_active(ns);
+
+        if (zone->d.za & NVME_ZA_ZRWA_VALID) {
+            if (ns->params.numzrwa) {
+                ns->zns.numzrwa++;
+            }
+        }
+
         /* fallthrough */
     case NVME_ZONE_STATE_FULL:
         zone->w_ptr = zone->d.zslba;
@@ -1778,6 +1814,7 @@ static void nvme_zrm_auto_transition_zone(NvmeNamespace *ns)
 
 enum {
     NVME_ZRM_AUTO = 1 << 0,
+    NVME_ZRM_ZRWA = 1 << 1,
 };
 
 static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
@@ -1796,7 +1833,8 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
         if (n->params.auto_transition_zones) {
             nvme_zrm_auto_transition_zone(ns);
         }
-        status = nvme_aor_check(ns, act, 1);
+        status = nvme_zns_check_resources(ns, act, 1,
+                                          (flags & NVME_ZRM_ZRWA) ? 1 : 0);
         if (status) {
             return status;
         }
@@ -1824,6 +1862,12 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
         /* fallthrough */
 
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+        if (flags & NVME_ZRM_ZRWA) {
+            ns->zns.numzrwa--;
+
+            zone->d.za |= NVME_ZA_ZRWA_VALID;
+        }
+
         return NVME_SUCCESS;
 
     default:
@@ -1837,12 +1881,6 @@ static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
     return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
 }
 
-static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
-                                     NvmeZone *zone)
-{
-    return nvme_zrm_open_flags(n, ns, zone, 0);
-}
-
 static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
                                  uint32_t nlb)
 {
@@ -1853,6 +1891,20 @@ static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
     }
 }
 
+static void nvme_zoned_zrwa_implicit_flush(NvmeNamespace *ns, NvmeZone *zone,
+                                           uint32_t nlbc)
+{
+    uint16_t nzrwafgs = DIV_ROUND_UP(nlbc, ns->zns.zrwafg);
+
+    nlbc = nzrwafgs * ns->zns.zrwafg;
+
+    trace_pci_nvme_zoned_zrwa_implicit_flush(zone->d.zslba, nlbc);
+
+    zone->w_ptr += nlbc;
+
+    nvme_advance_zone_wp(ns, zone, nlbc);
+}
+
 static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -1865,6 +1917,17 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     zone = nvme_get_zone_by_slba(ns, slba);
     assert(zone);
 
+    if (zone->d.za & NVME_ZA_ZRWA_VALID) {
+        uint64_t ezrwa = zone->w_ptr + ns->zns.zrwas - 1;
+        uint64_t elba = slba + nlb - 1;
+
+        if (elba > ezrwa) {
+            nvme_zoned_zrwa_implicit_flush(ns, zone, elba - ezrwa);
+        }
+
+        return;
+    }
+
     nvme_advance_zone_wp(ns, zone, nlb);
 }
 
@@ -2665,7 +2728,9 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
             goto invalid;
         }
 
-        iocb->zone->w_ptr += nlb;
+        if (!(iocb->zone->d.za & NVME_ZA_ZRWA_VALID)) {
+            iocb->zone->w_ptr += nlb;
+        }
     }
 
     qemu_iovec_reset(&iocb->iov);
@@ -3204,6 +3269,10 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         if (append) {
             bool piremap = !!(ctrl & NVME_RW_PIREMAP);
 
+            if (unlikely(zone->d.za & NVME_ZA_ZRWA_VALID)) {
+                return NVME_INVALID_ZONE_OP | NVME_DNR;
+            }
+
             if (unlikely(slba != zone->d.zslba)) {
                 trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
                 status = NVME_INVALID_FIELD;
@@ -3255,7 +3324,9 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             goto invalid;
         }
 
-        zone->w_ptr += nlb;
+        if (!(zone->d.za & NVME_ZA_ZRWA_VALID)) {
+            zone->w_ptr += nlb;
+        }
     }
 
     data_offset = nvme_l2b(ns, slba);
@@ -3339,7 +3410,24 @@ enum NvmeZoneProcessingMask {
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
                                NvmeZoneState state, NvmeRequest *req)
 {
-    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
+    NvmeZoneSendCmd *cmd = (NvmeZoneSendCmd *)&req->cmd;
+    int flags = 0;
+
+    if (cmd->zsflags & NVME_ZSFLAG_ZRWA_ALLOC) {
+        uint16_t ozcs = le16_to_cpu(ns->id_ns_zoned->ozcs);
+
+        if (!(ozcs & NVME_ID_NS_ZONED_OZCS_ZRWASUP)) {
+            return NVME_INVALID_ZONE_OP | NVME_DNR;
+        }
+
+        if (zone->w_ptr % ns->zns.zrwafg) {
+            return NVME_NOZRWA | NVME_DNR;
+        }
+
+        flags = NVME_ZRM_ZRWA;
+    }
+
+    return nvme_zrm_open_flags(nvme_ctrl(req), ns, zone, flags);
 }
 
 static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
@@ -3614,6 +3702,44 @@ done:
     }
 }
 
+static uint16_t nvme_zone_mgmt_send_zrwa_flush(NvmeCtrl *n, NvmeZone *zone,
+                                               uint64_t elba, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    uint16_t ozcs = le16_to_cpu(ns->id_ns_zoned->ozcs);
+    uint64_t wp = zone->d.wp;
+    uint32_t nlb = elba - wp + 1;
+    uint16_t status;
+
+
+    if (!(ozcs & NVME_ID_NS_ZONED_OZCS_ZRWASUP)) {
+        return NVME_INVALID_ZONE_OP | NVME_DNR;
+    }
+
+    if (!(zone->d.za & NVME_ZA_ZRWA_VALID)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (elba < wp || elba > wp + ns->zns.zrwas) {
+        return NVME_ZONE_BOUNDARY_ERROR | NVME_DNR;
+    }
+
+    if (nlb % ns->zns.zrwafg) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    status = nvme_zrm_auto(n, ns, zone);
+    if (status) {
+        return status;
+    }
+
+    zone->w_ptr += nlb;
+
+    nvme_advance_zone_wp(ns, zone, nlb);
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeZoneSendCmd *cmd = (NvmeZoneSendCmd *)&req->cmd;
@@ -3640,7 +3766,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     }
 
     zone = &ns->zone_array[zone_idx];
-    if (slba != zone->d.zslba) {
+    if (slba != zone->d.zslba && action != NVME_ZONE_ACTION_ZRWA_FLUSH) {
         trace_pci_nvme_err_unaligned_zone_cmd(action, slba, zone->d.zslba);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
@@ -3716,6 +3842,13 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
         }
         break;
 
+    case NVME_ZONE_ACTION_ZRWA_FLUSH:
+        if (all) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        return nvme_zone_mgmt_send_zrwa_flush(n, zone, slba, req);
+
     default:
         trace_pci_nvme_err_invalid_mgmt_action(action);
         status = NVME_INVALID_FIELD;
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 356b6c1c2f14..ee673f1a5bef 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -275,6 +275,23 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
             ns->params.zd_extension_size >> 6; /* Units of 64B */
     }
 
+    if (ns->params.zrwas) {
+        ns->zns.numzrwa = ns->params.numzrwa ?
+            ns->params.numzrwa : ns->num_zones;
+
+        ns->zns.zrwas = ns->params.zrwas >> ns->lbaf.ds;
+        ns->zns.zrwafg = ns->params.zrwafg >> ns->lbaf.ds;
+
+        id_ns_z->ozcs |= NVME_ID_NS_ZONED_OZCS_ZRWASUP;
+        id_ns_z->zrwacap = NVME_ID_NS_ZONED_ZRWACAP_EXPFLUSHSUP;
+
+        id_ns_z->numzrwa = cpu_to_le32(ns->params.numzrwa);
+        id_ns_z->zrwas = cpu_to_le16(ns->zns.zrwas);
+        id_ns_z->zrwafg = cpu_to_le16(ns->zns.zrwafg);
+    }
+
+    id_ns_z->ozcs = cpu_to_le16(id_ns_z->ozcs);
+
     ns->csi = NVME_CSI_ZONED;
     ns->id_ns.nsze = cpu_to_le64(ns->num_zones * ns->zone_size);
     ns->id_ns.ncap = ns->id_ns.nsze;
@@ -315,6 +332,10 @@ static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
         QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
     } else {
         trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
+        if (zone->d.za & NVME_ZA_ZRWA_VALID) {
+            zone->d.za &= ~NVME_ZA_ZRWA_VALID;
+            ns->zns.numzrwa++;
+        }
         nvme_set_zone_state(zone, NVME_ZONE_STATE_EMPTY);
     }
 }
@@ -392,6 +413,40 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
                 return -1;
             }
         }
+
+        if (ns->params.zrwas) {
+            if (ns->params.zrwas % ns->blkconf.logical_block_size) {
+                error_setg(errp, "zone random write area size (zoned.zrwas "
+                           "%"PRIu64") must be a multiple of the logical "
+                           "block size (logical_block_size %"PRIu32")",
+                           ns->params.zrwas, ns->blkconf.logical_block_size);
+                return -1;
+            }
+
+            if (ns->params.zrwafg == -1) {
+                ns->params.zrwafg = ns->blkconf.logical_block_size;
+            }
+
+            if (ns->params.zrwas % ns->params.zrwafg) {
+                error_setg(errp, "zone random write area size (zoned.zrwas "
+                           "%"PRIu64") must be a multiple of the zone random "
+                           "write area flush granularity (zoned.zrwafg, "
+                           "%"PRIu64")", ns->params.zrwas, ns->params.zrwafg);
+                return -1;
+            }
+
+            if (ns->params.max_active_zones) {
+                if (ns->params.numzrwa > ns->params.max_active_zones) {
+                    error_setg(errp, "number of zone random write area "
+                               "resources (zoned.numzrwa, %d) must be less "
+                               "than or equal to maximum active resources "
+                               "(zoned.max_active_zones, %d)",
+                               ns->params.numzrwa,
+                               ns->params.max_active_zones);
+                    return -1;
+                }
+            }
+        }
     }
 
     return 0;
@@ -551,6 +606,9 @@ static Property nvme_ns_props[] = {
                        params.max_open_zones, 0),
     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
                        params.zd_extension_size, 0),
+    DEFINE_PROP_UINT32("zoned.numzrwa", NvmeNamespace, params.numzrwa, 0),
+    DEFINE_PROP_SIZE("zoned.zrwas", NvmeNamespace, params.zrwas, 0),
+    DEFINE_PROP_SIZE("zoned.zrwafg", NvmeNamespace, params.zrwafg, -1),
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
                      true),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 38f3ebf7f6c0..90c0bb7ce236 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -114,6 +114,10 @@ typedef struct NvmeNamespaceParams {
     uint32_t max_active_zones;
     uint32_t max_open_zones;
     uint32_t zd_extension_size;
+
+    uint32_t numzrwa;
+    uint64_t zrwas;
+    uint64_t zrwafg;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -130,6 +134,12 @@ typedef struct NvmeNamespace {
     uint16_t     status;
     int          attached;
 
+    struct {
+        uint16_t zrwas;
+        uint16_t zrwafg;
+        uint32_t numzrwa;
+    } zns;
+
     QTAILQ_ENTRY(NvmeNamespace) entry;
 
     NvmeIdNsZoned   *id_ns_zoned;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ff6cafd520df..90730d802fe3 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -103,6 +103,7 @@ pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set zone de
 pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_idx=%"PRIu32""
 pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Closed state"
 pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
+pci_nvme_zoned_zrwa_implicit_flush(uint64_t zslba, uint32_t nlb) "zslba 0x%"PRIx64" nlb %"PRIu32""
 
 # error conditions
 pci_nvme_err_mdts(size_t len) "len %zu"
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e10ea6f0eb88..cd068ac89142 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -890,6 +890,8 @@ enum NvmeStatusCodes {
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
     NVME_CMD_SIZE_LIMIT         = 0x0183,
+    NVME_INVALID_ZONE_OP        = 0x01b6,
+    NVME_NOZRWA                 = 0x01b7,
     NVME_ZONE_BOUNDARY_ERROR    = 0x01b8,
     NVME_ZONE_FULL              = 0x01b9,
     NVME_ZONE_READ_ONLY         = 0x01ba,
@@ -1345,7 +1347,12 @@ typedef struct QEMU_PACKED NvmeIdNsZoned {
     uint32_t    mor;
     uint32_t    rrl;
     uint32_t    frl;
-    uint8_t     rsvd20[2796];
+    uint8_t     rsvd12[24];
+    uint32_t    numzrwa;
+    uint16_t    zrwafg;
+    uint16_t    zrwas;
+    uint8_t     zrwacap;
+    uint8_t     rsvd53[2763];
     NvmeLBAFE   lbafe[16];
     uint8_t     rsvd3072[768];
     uint8_t     vs[256];
@@ -1353,6 +1360,11 @@ typedef struct QEMU_PACKED NvmeIdNsZoned {
 
 enum NvmeIdNsZonedOzcs {
     NVME_ID_NS_ZONED_OZCS_RAZB    = 1 << 0,
+    NVME_ID_NS_ZONED_OZCS_ZRWASUP = 1 << 1,
+};
+
+enum NvmeIdNsZonedZrwacap {
+    NVME_ID_NS_ZONED_ZRWACAP_EXPFLUSHSUP = 1 << 0,
 };
 
 /*Deallocate Logical Block Features*/
@@ -1408,6 +1420,7 @@ enum NvmeZoneAttr {
     NVME_ZA_FINISHED_BY_CTLR         = 1 << 0,
     NVME_ZA_FINISH_RECOMMENDED       = 1 << 1,
     NVME_ZA_RESET_RECOMMENDED        = 1 << 2,
+    NVME_ZA_ZRWA_VALID               = 1 << 3,
     NVME_ZA_ZD_EXT_VALID             = 1 << 7,
 };
 
@@ -1460,10 +1473,12 @@ enum NvmeZoneSendAction {
     NVME_ZONE_ACTION_RESET           = 0x04,
     NVME_ZONE_ACTION_OFFLINE         = 0x05,
     NVME_ZONE_ACTION_SET_ZD_EXT      = 0x10,
+    NVME_ZONE_ACTION_ZRWA_FLUSH      = 0x11,
 };
 
 enum {
     NVME_ZSFLAG_SELECT_ALL = 1 << 0,
+    NVME_ZSFLAG_ZRWA_ALLOC = 1 << 1,
 };
 
 typedef struct QEMU_PACKED NvmeZoneDescr {
-- 
2.35.0


