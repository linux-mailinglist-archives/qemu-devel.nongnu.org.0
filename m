Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A240B981
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:52:13 +0200 (CEST)
Received: from localhost ([::1]:40470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFPY-0007Bi-G9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBi-0005aq-Jw; Tue, 14 Sep 2021 16:37:58 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:42553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBf-0004f0-PB; Tue, 14 Sep 2021 16:37:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7841332009FF;
 Tue, 14 Sep 2021 16:37:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 16:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vCZFRCB4DWYpc
 3gKxY6hWrxsyDcFN8gQDpTEuaiDAmE=; b=kh/k/XeIVZpmEZci/+iuFwiSVQAJY
 mFOMf+trrEmBmMusr4h5V1qWMJbmUCbRQubmcqQ3dys3jL4rFe2A+nHczrk1e3bD
 rHvSo6UgzVU3igDzk2HBXkdZ9i1ke10VhoIUlb4evxlV07OblJ76cO0EorSWBBFV
 ux9OqNnQH8+EfmyzwODjmgbU+6ImDQ7fsqybwAJei0wXTxTVBoFgmZ2l893TC04C
 cjM+mbHxJYNjx/O+zobtz8tFnrgJoPKgEsTK2thNs7Rp7gxWEbe8raIqKRCujmfH
 iYFxgS0IxEpcBvLhYy3QTCb6KIhYLTIha7SdjueZnVAT9wPkXOGAdw6Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vCZFRCB4DWYpc3gKxY6hWrxsyDcFN8gQDpTEuaiDAmE=; b=qI9p/AOG
 JxTQNqBjCv81AUAk/m8vWY9IlJWuId0DUGbCFiPgnA2F6MP5CzkZpwC8AlvaWL3C
 8uUqZZ3bMuBJ/jA/qbyX0fg6STCk4NvUX14fXRtk0129nigYE3E6iQ9FYA95qviR
 Z2go2pSefXKqLXlnH1VOJ0rTlKoHv2NO8awcArNg1y0oP9YWg+a4vcXVGhvtnFdt
 ru+r1HydOnJZapq2kp0pqA8seqID6EmeA38QBgkol55SbvgOYYo+xyJMgxin2bR9
 3ghZyHjnzPtR+hSkVfEciMZe0SVf5smffz5x0YrSRkuDPeOuNefceuE/4qLjvViq
 ljscFF4zLTjXbg==
X-ME-Sender: <xms:HQhBYSdFQq_K4ROyA54oTH2HthGVOZyclVCFyYoq1E56uId76hwOhA>
 <xme:HQhBYcOXQgPTg4Kc8FFIml07JmPSNW5i8RcXkEDwLcBsncBYCr7UgUEOfLof-5llT
 -pbQkkeg2tviEe6A9w>
X-ME-Received: <xmr:HQhBYTgo2DAvmp-eTggfMOzXGJnG5si3kJNbg4FhiP3BT7bUlnF-5yN8vvBBw3ptu1VZ_AB1fy3qiosNyvIyOpHkeSq3m72zHIjNBWz0Sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HQhBYf_brugjXRbc1B0AxfcTYPfIrVyuBJR6kaPtnDV8TrofYvxnfQ>
 <xmx:HQhBYeuJclmh35yxVM0A7_fOW0t5BF4SrlvLRbXF8NhqXGVKWEuJTg>
 <xmx:HQhBYWF3OG1ez1gr-ppoH5b_55TjiIkay_XhoZLUp2mNTs3efipANA>
 <xmx:HQhBYcCOQYh-wdUcoW2NixlUfcmLjddrlTmX7RmYbApKTXH75Rm3KQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:37:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 02/13] hw/nvme: move zns helpers and types into zoned.h
Date: Tue, 14 Sep 2021 22:37:26 +0200
Message-Id: <20210914203737.182571-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Move ZNS related helpers and types into zoned.h. Use a common prefix
(nvme_zoned or nvme_ns_zoned) for zns related functions.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c  | 92 ++++++++++++++++++++--------------------------
 hw/nvme/ns.c    | 39 ++++++++++----------
 hw/nvme/nvme.h  | 72 ------------------------------------
 hw/nvme/zoned.h | 97 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+), 144 deletions(-)
 create mode 100644 hw/nvme/zoned.h

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 65970b81d5fb..778a2689481d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -164,6 +164,8 @@
 
 #include "nvme.h"
 #include "dif.h"
+#include "zoned.h"
+
 #include "trace.h"
 
 #define NVME_MAX_IOQPAIRS 0xffff
@@ -262,7 +264,7 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
                                    NvmeZoneState state)
 {
     if (QTAILQ_IN_USE(zone, entry)) {
-        switch (nvme_get_zone_state(zone)) {
+        switch (nvme_zoned_zs(zone)) {
         case NVME_ZONE_STATE_EXPLICITLY_OPEN:
             QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
             break;
@@ -279,7 +281,7 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
         }
     }
 
-    nvme_set_zone_state(zone, state);
+    nvme_zoned_set_zs(zone, state);
 
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -304,7 +306,8 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
  * Check if we can open a zone without exceeding open/active limits.
  * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
  */
-static int nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
+static int nvme_ns_zoned_aor_check(NvmeNamespace *ns, uint32_t act,
+                                   uint32_t opn)
 {
     if (ns->params.max_active_zones != 0 &&
         ns->nr_active_zones + act > ns->params.max_active_zones) {
@@ -1552,28 +1555,11 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
     req->status = status;
 }
 
-static inline uint32_t nvme_zone_idx(NvmeNamespace *ns, uint64_t slba)
-{
-    return ns->zone_size_log2 > 0 ? slba >> ns->zone_size_log2 :
-                                    slba / ns->zone_size;
-}
-
-static inline NvmeZone *nvme_get_zone_by_slba(NvmeNamespace *ns, uint64_t slba)
-{
-    uint32_t zone_idx = nvme_zone_idx(ns, slba);
-
-    if (zone_idx >= ns->num_zones) {
-        return NULL;
-    }
-
-    return &ns->zone_array[zone_idx];
-}
-
 static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
 {
     uint64_t zslba = zone->d.zslba;
 
-    switch (nvme_get_zone_state(zone)) {
+    switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_EMPTY:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1598,7 +1584,7 @@ static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
 static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
                                       uint64_t slba, uint32_t nlb)
 {
-    uint64_t zcap = nvme_zone_wr_boundary(zone);
+    uint64_t zcap = nvme_zoned_zone_wr_boundary(zone);
     uint16_t status;
 
     status = nvme_check_zone_state_for_write(zone);
@@ -1621,7 +1607,7 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 {
-    switch (nvme_get_zone_state(zone)) {
+    switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_EMPTY:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1646,10 +1632,10 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
     uint64_t bndry, end;
     uint16_t status;
 
-    zone = nvme_get_zone_by_slba(ns, slba);
+    zone = nvme_ns_zoned_get_by_slba(ns, slba);
     assert(zone);
 
-    bndry = nvme_zone_rd_boundary(ns, zone);
+    bndry = nvme_zoned_zone_rd_boundary(ns, zone);
     end = slba + nlb;
 
     status = nvme_check_zone_state_for_read(zone);
@@ -1669,7 +1655,7 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
                 if (status) {
                     break;
                 }
-            } while (end > nvme_zone_rd_boundary(ns, zone));
+            } while (end > nvme_zoned_zone_rd_boundary(ns, zone));
         }
     }
 
@@ -1678,16 +1664,16 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
 
 static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 {
-    switch (nvme_get_zone_state(zone)) {
+    switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_FULL:
         return NVME_SUCCESS;
 
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-        nvme_aor_dec_open(ns);
+        nvme_ns_zoned_aor_dec_open(ns);
         /* fallthrough */
     case NVME_ZONE_STATE_CLOSED:
-        nvme_aor_dec_active(ns);
+        nvme_ns_zoned_aor_dec_active(ns);
         /* fallthrough */
     case NVME_ZONE_STATE_EMPTY:
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
@@ -1700,10 +1686,10 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 
 static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
 {
-    switch (nvme_get_zone_state(zone)) {
+    switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_aor_dec_open(ns);
+        nvme_ns_zoned_aor_dec_open(ns);
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
     case NVME_ZONE_STATE_CLOSED:
@@ -1716,13 +1702,13 @@ static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
 
 static uint16_t nvme_zrm_reset(NvmeNamespace *ns, NvmeZone *zone)
 {
-    switch (nvme_get_zone_state(zone)) {
+    switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        nvme_aor_dec_open(ns);
+        nvme_ns_zoned_aor_dec_open(ns);
         /* fallthrough */
     case NVME_ZONE_STATE_CLOSED:
-        nvme_aor_dec_active(ns);
+        nvme_ns_zoned_aor_dec_active(ns);
         /* fallthrough */
     case NVME_ZONE_STATE_FULL:
         zone->w_ptr = zone->d.zslba;
@@ -1764,7 +1750,7 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
     int act = 0;
     uint16_t status;
 
-    switch (nvme_get_zone_state(zone)) {
+    switch (nvme_zoned_zs(zone)) {
     case NVME_ZONE_STATE_EMPTY:
         act = 1;
 
@@ -1774,16 +1760,16 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
         if (n->params.auto_transition_zones) {
             nvme_zrm_auto_transition_zone(ns);
         }
-        status = nvme_aor_check(ns, act, 1);
+        status = nvme_ns_zoned_aor_check(ns, act, 1);
         if (status) {
             return status;
         }
 
         if (act) {
-            nvme_aor_inc_active(ns);
+            nvme_ns_zoned_aor_inc_active(ns);
         }
 
-        nvme_aor_inc_open(ns);
+        nvme_ns_zoned_aor_inc_open(ns);
 
         if (flags & NVME_ZRM_AUTO) {
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
@@ -1826,7 +1812,7 @@ static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
 {
     zone->d.wp += nlb;
 
-    if (zone->d.wp == nvme_zone_wr_boundary(zone)) {
+    if (zone->d.wp == nvme_zoned_zone_wr_boundary(zone)) {
         nvme_zrm_finish(ns, zone);
     }
 }
@@ -1840,7 +1826,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
 
     slba = le64_to_cpu(rw->slba);
     nlb = le16_to_cpu(rw->nlb) + 1;
-    zone = nvme_get_zone_by_slba(ns, slba);
+    zone = nvme_ns_zoned_get_by_slba(ns, slba);
     assert(zone);
 
     nvme_advance_zone_wp(ns, zone, nlb);
@@ -2821,7 +2807,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     iocb->slba = le64_to_cpu(copy->sdlba);
 
     if (ns->params.zoned) {
-        iocb->zone = nvme_get_zone_by_slba(ns, iocb->slba);
+        iocb->zone = nvme_ns_zoned_get_by_slba(ns, iocb->slba);
         if (!iocb->zone) {
             status = NVME_LBA_RANGE | NVME_DNR;
             goto invalid;
@@ -3176,7 +3162,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     }
 
     if (ns->params.zoned) {
-        zone = nvme_get_zone_by_slba(ns, slba);
+        zone = nvme_ns_zoned_get_by_slba(ns, slba);
         assert(zone);
 
         if (append) {
@@ -3297,7 +3283,7 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
         return NVME_LBA_RANGE | NVME_DNR;
     }
 
-    *zone_idx = nvme_zone_idx(ns, *slba);
+    *zone_idx = nvme_ns_zoned_zidx(ns, *slba);
     assert(*zone_idx < ns->num_zones);
 
     return NVME_SUCCESS;
@@ -3349,14 +3335,14 @@ static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
 static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
 {
     uint16_t status;
-    uint8_t state = nvme_get_zone_state(zone);
+    uint8_t state = nvme_zoned_zs(zone);
 
     if (state == NVME_ZONE_STATE_EMPTY) {
-        status = nvme_aor_check(ns, 1, 0);
+        status = nvme_ns_zoned_aor_check(ns, 1, 0);
         if (status) {
             return status;
         }
-        nvme_aor_inc_active(ns);
+        nvme_ns_zoned_aor_inc_active(ns);
         zone->d.za |= NVME_ZA_ZD_EXT_VALID;
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         return NVME_SUCCESS;
@@ -3370,7 +3356,7 @@ static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
                                     op_handler_t op_hndlr, NvmeRequest *req)
 {
     uint16_t status = NVME_SUCCESS;
-    NvmeZoneState zs = nvme_get_zone_state(zone);
+    NvmeZoneState zs = nvme_zoned_zs(zone);
     bool proc_zone;
 
     switch (zs) {
@@ -3407,7 +3393,7 @@ static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
     int i;
 
     if (!proc_mask) {
-        status = op_hndlr(ns, zone, nvme_get_zone_state(zone), req);
+        status = op_hndlr(ns, zone, nvme_zoned_zs(zone), req);
     } else {
         if (proc_mask & NVME_PROC_CLOSED_ZONES) {
             QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
@@ -3555,7 +3541,7 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     while (iocb->idx < ns->num_zones) {
         NvmeZone *zone = &ns->zone_array[iocb->idx++];
 
-        switch (nvme_get_zone_state(zone)) {
+        switch (nvme_zoned_zs(zone)) {
         case NVME_ZONE_STATE_EMPTY:
             if (!iocb->all) {
                 goto done;
@@ -3682,7 +3668,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
         if (all || !ns->params.zd_extension_size) {
             return NVME_INVALID_FIELD | NVME_DNR;
         }
-        zd_ext = nvme_get_zd_extension(ns, zone_idx);
+        zd_ext = nvme_ns_zoned_zde(ns, zone_idx);
         status = nvme_h2c(n, zd_ext, ns->params.zd_extension_size, req);
         if (status) {
             trace_pci_nvme_err_zd_extension_map_error(zone_idx);
@@ -3714,7 +3700,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 
 static bool nvme_zone_matches_filter(uint32_t zafs, NvmeZone *zl)
 {
-    NvmeZoneState zs = nvme_get_zone_state(zl);
+    NvmeZoneState zs = nvme_zoned_zs(zl);
 
     switch (zafs) {
     case NVME_ZONE_REPORT_ALL:
@@ -3820,7 +3806,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
             z->zslba = cpu_to_le64(zone->d.zslba);
             z->za = zone->d.za;
 
-            if (nvme_wp_is_valid(zone)) {
+            if (nvme_zoned_wp_valid(zone)) {
                 z->wp = cpu_to_le64(zone->d.wp);
             } else {
                 z->wp = cpu_to_le64(~0ULL);
@@ -3828,7 +3814,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 
             if (zra == NVME_ZONE_REPORT_EXTENDED) {
                 if (zone->d.za & NVME_ZA_ZD_EXT_VALID) {
-                    memcpy(buf_p, nvme_get_zd_extension(ns, zone_idx),
+                    memcpy(buf_p, nvme_ns_zoned_zde(ns, zone_idx),
                            ns->params.zd_extension_size);
                 }
                 buf_p += ns->params.zd_extension_size;
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index b7cf1494e75b..8cdcaec99880 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -20,10 +20,11 @@
 #include "sysemu/block-backend.h"
 
 #include "nvme.h"
+#include "zoned.h"
+
 #include "trace.h"
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
-#define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 
 void nvme_ns_init_format(NvmeNamespace *ns)
 {
@@ -238,7 +239,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
             zone_size = capacity - start;
         }
         zone->d.zt = NVME_ZONE_TYPE_SEQ_WRITE;
-        nvme_set_zone_state(zone, NVME_ZONE_STATE_EMPTY);
+        nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
         zone->d.za = 0;
         zone->d.zcap = ns->zone_capacity;
         zone->d.zslba = start;
@@ -253,7 +254,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     }
 }
 
-static void nvme_ns_init_zoned(NvmeNamespace *ns)
+static void nvme_ns_zoned_init(NvmeNamespace *ns)
 {
     NvmeIdNsZoned *id_ns_z;
     int i;
@@ -298,49 +299,49 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
     ns->id_ns_zoned = id_ns_z;
 }
 
-static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
+static void nvme_ns_zoned_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
 {
     uint8_t state;
 
     zone->w_ptr = zone->d.wp;
-    state = nvme_get_zone_state(zone);
+    state = nvme_zoned_zs(zone);
     if (zone->d.wp != zone->d.zslba ||
         (zone->d.za & NVME_ZA_ZD_EXT_VALID)) {
         if (state != NVME_ZONE_STATE_CLOSED) {
             trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
-            nvme_set_zone_state(zone, NVME_ZONE_STATE_CLOSED);
+            nvme_zoned_set_zs(zone, NVME_ZONE_STATE_CLOSED);
         }
-        nvme_aor_inc_active(ns);
+        nvme_ns_zoned_aor_inc_active(ns);
         QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
     } else {
         trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
-        nvme_set_zone_state(zone, NVME_ZONE_STATE_EMPTY);
+        nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
     }
 }
 
 /*
  * Close all the zones that are currently open.
  */
-static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
+static void nvme_ns_zoned_shutdown(NvmeNamespace *ns)
 {
     NvmeZone *zone, *next;
 
     QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
         QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
-        nvme_aor_dec_active(ns);
-        nvme_clear_zone(ns, zone);
+        nvme_ns_zoned_aor_dec_active(ns);
+        nvme_ns_zoned_clear_zone(ns, zone);
     }
     QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
         QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
-        nvme_aor_dec_open(ns);
-        nvme_aor_dec_active(ns);
-        nvme_clear_zone(ns, zone);
+        nvme_ns_zoned_aor_dec_open(ns);
+        nvme_ns_zoned_aor_dec_active(ns);
+        nvme_ns_zoned_clear_zone(ns, zone);
     }
     QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
         QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
-        nvme_aor_dec_open(ns);
-        nvme_aor_dec_active(ns);
-        nvme_clear_zone(ns, zone);
+        nvme_ns_zoned_aor_dec_open(ns);
+        nvme_ns_zoned_aor_dec_active(ns);
+        nvme_ns_zoned_clear_zone(ns, zone);
     }
 
     assert(ns->nr_open_zones == 0);
@@ -413,7 +414,7 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         if (nvme_ns_zoned_check_calc_geometry(ns, errp) != 0) {
             return -1;
         }
-        nvme_ns_init_zoned(ns);
+        nvme_ns_zoned_init(ns);
     }
 
     return 0;
@@ -428,7 +429,7 @@ void nvme_ns_shutdown(NvmeNamespace *ns)
 {
     blk_flush(ns->blkconf.blk);
     if (ns->params.zoned) {
-        nvme_zoned_ns_shutdown(ns);
+        nvme_ns_zoned_shutdown(ns);
     }
 }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 45bf96d65321..99d8b9066cc9 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -182,78 +182,6 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
     return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
 }
 
-static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
-{
-    return zone->d.zs >> 4;
-}
-
-static inline void nvme_set_zone_state(NvmeZone *zone, NvmeZoneState state)
-{
-    zone->d.zs = state << 4;
-}
-
-static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
-{
-    return zone->d.zslba + ns->zone_size;
-}
-
-static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
-{
-    return zone->d.zslba + zone->d.zcap;
-}
-
-static inline bool nvme_wp_is_valid(NvmeZone *zone)
-{
-    uint8_t st = nvme_get_zone_state(zone);
-
-    return st != NVME_ZONE_STATE_FULL &&
-           st != NVME_ZONE_STATE_READ_ONLY &&
-           st != NVME_ZONE_STATE_OFFLINE;
-}
-
-static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
-                                             uint32_t zone_idx)
-{
-    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
-}
-
-static inline void nvme_aor_inc_open(NvmeNamespace *ns)
-{
-    assert(ns->nr_open_zones >= 0);
-    if (ns->params.max_open_zones) {
-        ns->nr_open_zones++;
-        assert(ns->nr_open_zones <= ns->params.max_open_zones);
-    }
-}
-
-static inline void nvme_aor_dec_open(NvmeNamespace *ns)
-{
-    if (ns->params.max_open_zones) {
-        assert(ns->nr_open_zones > 0);
-        ns->nr_open_zones--;
-    }
-    assert(ns->nr_open_zones >= 0);
-}
-
-static inline void nvme_aor_inc_active(NvmeNamespace *ns)
-{
-    assert(ns->nr_active_zones >= 0);
-    if (ns->params.max_active_zones) {
-        ns->nr_active_zones++;
-        assert(ns->nr_active_zones <= ns->params.max_active_zones);
-    }
-}
-
-static inline void nvme_aor_dec_active(NvmeNamespace *ns)
-{
-    if (ns->params.max_active_zones) {
-        assert(ns->nr_active_zones > 0);
-        ns->nr_active_zones--;
-        assert(ns->nr_active_zones >= ns->nr_open_zones);
-    }
-    assert(ns->nr_active_zones >= 0);
-}
-
 void nvme_ns_init_format(NvmeNamespace *ns);
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
diff --git a/hw/nvme/zoned.h b/hw/nvme/zoned.h
new file mode 100644
index 000000000000..e98b282cb615
--- /dev/null
+++ b/hw/nvme/zoned.h
@@ -0,0 +1,97 @@
+#ifndef HW_NVME_ZONED_H
+#define HW_NVME_ZONED_H
+
+#include "qemu/units.h"
+
+#include "nvme.h"
+
+#define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
+
+static inline NvmeZoneState nvme_zoned_zs(NvmeZone *zone)
+{
+    return zone->d.zs >> 4;
+}
+
+static inline void nvme_zoned_set_zs(NvmeZone *zone, NvmeZoneState state)
+{
+    zone->d.zs = state << 4;
+}
+
+static inline uint64_t nvme_zoned_zone_rd_boundary(NvmeNamespace *ns,
+                                                   NvmeZone *zone)
+{
+    return zone->d.zslba + ns->zone_size;
+}
+
+static inline uint64_t nvme_zoned_zone_wr_boundary(NvmeZone *zone)
+{
+    return zone->d.zslba + zone->d.zcap;
+}
+
+static inline bool nvme_zoned_wp_valid(NvmeZone *zone)
+{
+    uint8_t st = nvme_zoned_zs(zone);
+
+    return st != NVME_ZONE_STATE_FULL &&
+           st != NVME_ZONE_STATE_READ_ONLY &&
+           st != NVME_ZONE_STATE_OFFLINE;
+}
+
+static inline uint32_t nvme_ns_zoned_zidx(NvmeNamespace *ns, uint64_t slba)
+{
+    return ns->zone_size_log2 > 0 ? slba >> ns->zone_size_log2 :
+                                    slba / ns->zone_size;
+}
+
+static inline NvmeZone *nvme_ns_zoned_get_by_slba(NvmeNamespace *ns, uint64_t slba)
+{
+    uint32_t zone_idx = nvme_ns_zoned_zidx(ns, slba);
+
+    assert(zone_idx < ns->num_zones);
+    return &ns->zone_array[zone_idx];
+}
+
+static inline uint8_t *nvme_ns_zoned_zde(NvmeNamespace *ns, uint32_t zone_idx)
+{
+    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
+}
+
+static inline void nvme_ns_zoned_aor_inc_open(NvmeNamespace *ns)
+{
+    assert(ns->nr_open_zones >= 0);
+    if (ns->params.max_open_zones) {
+        ns->nr_open_zones++;
+        assert(ns->nr_open_zones <= ns->params.max_open_zones);
+    }
+}
+
+static inline void nvme_ns_zoned_aor_dec_open(NvmeNamespace *ns)
+{
+    if (ns->params.max_open_zones) {
+        assert(ns->nr_open_zones > 0);
+        ns->nr_open_zones--;
+    }
+    assert(ns->nr_open_zones >= 0);
+}
+
+static inline void nvme_ns_zoned_aor_inc_active(NvmeNamespace *ns)
+{
+    assert(ns->nr_active_zones >= 0);
+    if (ns->params.max_active_zones) {
+        ns->nr_active_zones++;
+        assert(ns->nr_active_zones <= ns->params.max_active_zones);
+    }
+}
+
+static inline void nvme_ns_zoned_aor_dec_active(NvmeNamespace *ns)
+{
+    if (ns->params.max_active_zones) {
+        assert(ns->nr_active_zones > 0);
+        ns->nr_active_zones--;
+        assert(ns->nr_active_zones >= ns->nr_open_zones);
+    }
+    assert(ns->nr_active_zones >= 0);
+}
+
+
+#endif /* HW_NVME_ZONED_H */
-- 
2.33.0


