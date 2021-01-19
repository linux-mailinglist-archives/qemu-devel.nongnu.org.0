Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C330B2FB6BC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:08:08 +0100 (CET)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rfz-0003Ec-Or
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1rTU-0002du-Px; Tue, 19 Jan 2021 08:55:12 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1rTO-0005rg-E5; Tue, 19 Jan 2021 08:55:12 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A52AB5C0220;
 Tue, 19 Jan 2021 08:55:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 19 Jan 2021 08:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VUUkomAkTAeon
 hsDfMrLcPb6Q3UelBup5J04JGytanc=; b=T+nNInPTmZNx6PsNaChBrU/0Xe/cM
 xaLCN6j4XN/DEetVD3ynXqAoZRMhbg5ArGCxL4bu3OfSYB1BSVyNEzOFTh7Vgl8K
 Hb+l7JO7i57db7czRas5MNtob3mx3i5pJOVcJ2MTQeuvt7ayLZavQwwS9V0OAUyR
 /FA8EmKVvKmjRWJX2eDu4QuaRMv+WjQTYMWuDegGEj5ZumVnZRPbdHY48CNNfxPq
 tc7aklih+cSV+iLPgZLLAv4NDbYJ2UpcM46FeQTCmwCkW3Ud46KqIMyqSw6AcbnE
 70IEQ8aYapv1IhKTUMEkqknqPew+AlmXVHh0aFQglbmtgyD9KfDXDNzdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VUUkomAkTAeonhsDfMrLcPb6Q3UelBup5J04JGytanc=; b=pdOxW/Ei
 nyk4rGLyviKyRzprOJSX9Eofy8UrPIcVR6MTkRhp4/QIGDV+1W9YxDOF3bXsWojg
 tz5E7oQbZunsUDktmMN8e5T63PcP6Sm7uisJQypV9GVao2ZKbO/bvujpT0irtycX
 2CUEXnXMGa8L3FJ+XNXk+umGtuVTSzGwTUeQuj4Q4Wp/3dF2U9PCy7AI0KKYI+3W
 GMka3AcqScsq5at4HxD/uYKHHr31YISj4jCdtVWYhQfMup8CkytAb4QkrOUUWWyJ
 9YJesnsWkTAADF/GWrcYFC6XeZGRz0fJU4uaOGGc1SNxBITzoJGIvW2Fs/Tl/jib
 W4ZGVYz53GNh5w==
X-ME-Sender: <xms:ueQGYKROiRiZ19LjK1o6r_Lnyf4_IoU_YBeW_T2huTGCeStDAsrwpA>
 <xme:ueQGYAOK75ets-lEQuTE5bKziyTAno1TNNfMdmDj8-PNwGVSj9DEUL3jbx8jQ5hm2
 blNFZipXbLleLKy5gI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ueQGYIhxx4SJI8cpAPGtQSMInMwJA64UmXMpJ5V3CLqU2kbT9noXpQ>
 <xmx:ueQGYNltF8odxzpcGCPNS3oAg95NENT5ustDkS_21JuyWLTEHoxhVA>
 <xmx:ueQGYEj0XP6tC77B3z63Jx2S6ML2mYbWLOpvPvWratD3ZZ0QBey58w>
 <xmx:ueQGYJnYQJ2Y-J3pQH8MAXhpAb9YcPGGBcpDyWM3Ov8BUbJkco_jQg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7408D240057;
 Tue, 19 Jan 2021 08:55:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: fix zone boundary check for append
Date: Tue, 19 Jan 2021 14:54:59 +0100
Message-Id: <20210119135500.265403-2-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <Niklas.Cassel@wdc.com>,
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
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
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 309c26db8ff7..f05dea657b01 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1133,7 +1133,7 @@ static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
 
 static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
                                       NvmeZone *zone, uint64_t slba,
-                                      uint32_t nlb, bool append)
+                                      uint32_t nlb)
 {
     uint16_t status;
 
@@ -1147,16 +1147,8 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
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
@@ -1294,10 +1286,9 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
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
@@ -1313,8 +1304,6 @@ static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
         }
     }
-
-    return result;
 }
 
 static inline bool nvme_is_write(NvmeRequest *req)
@@ -1692,7 +1681,24 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
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
         if (status != NVME_SUCCESS) {
             goto invalid;
         }
@@ -1702,11 +1708,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
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


