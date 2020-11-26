Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D562A2C5E62
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 01:01:47 +0100 (CET)
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiRCs-0000Qi-OE
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 19:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQy1-0007VT-Dh; Thu, 26 Nov 2020 18:46:25 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxx-0003wK-UJ; Thu, 26 Nov 2020 18:46:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DE2E35C0208;
 Thu, 26 Nov 2020 18:46:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1r6PsEZsJ75jd
 7IVSUxM7XHx9gwDInEmWggXzcQ+Upk=; b=nKEuyV4+Oa/M31UR4OZ7dU9w2Mwmy
 mjaQEwGLTW6mZi+weuN6/FI4OrO9wJZAG30JX6+nmPI+Q61e1bbFz6V5U67TDtd5
 5cT0xvGWbGFPHsXCgSIfaQpg/xod7/GNGDq4Cm95Re6Bx1+PUCqzdt2V2uEKigc3
 LmHEVTgtR63hHusMpajYgEdtH8GDUnhNzZ0DvICeXd2OaT+SwHeaTvrG3VuJ8Oh+
 1sQpRrWTnsF8sG0ycMTQQGPuposgS2SO6B0EKiVFhiYCJ6TMxp5j8gosFLwIAyj+
 Et1Ctp7sa5ZMsUtyfoNPyfBLZxDNSBExfXYItqwzyWe/1O1JB8/aMH1RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1r6PsEZsJ75jd7IVSUxM7XHx9gwDInEmWggXzcQ+Upk=; b=laglfpIe
 8u2vY2Dq6V9N19cvDOrlrox1++w7vFixLpiKQimsJrqPI1uvV7XAkqKgzqMFWXL/
 ZD34zEm9boDb7tYc8N5+7rLkpOJ7BWD9kHxtQY8EFK0XRvQp0BnneZf+J6Jv6Jkx
 mx+DYy1qn+USFrYxwq9yg4QghHnx2/jDw7zsk+mA1JXmLPRPOC6lDjPGqQkbjIgR
 VmhjtTVhXncr/TljgB6V+IbDSq9k03x+kA8qUk79cW7g1Wj3KpfaPIgVXf16n0xK
 ufeJuhaxWuyF9OkidsOueAvgGitKnW5HPTd7LamWdwZh2IC1Nfe5Iovw+zCMfT4x
 t25MEcMItekF+A==
X-ME-Sender: <xms:TD7AX9XTZvDKOc1rw9Rp4VQ9A3opUMrISujgS7CIuoxl6GJuXkCPCA>
 <xme:TD7AX9mrawQBPwGM5WzrNZHlUsf4JDDw3nngc_cxegC3KA_tKIiJxsl9mXU-q2Yke
 Eq5yis9bqxjINde1Zc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedvffffudfghfefffdvvddvtdevhffffffgueffkefggfekjefgheduheetvefg
 heenucffohhmrghinheprhgvshhouhhrtggvshdrohhpvghnpdhrvghsohhurhgtvghsrd
 grtghtihhvvgenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnth
 drughk
X-ME-Proxy: <xmx:TD7AX5Z5qS8fZOZNuL_HmyuNH2SI8-e_Xa_mmoglseKH410Of8bDUw>
 <xmx:TD7AXwX1kP3fv1LgaW2BEobpDUk_8NnnkRb98m52nqyc4YvBoLipWg>
 <xmx:TD7AX3mVuqUew-s6uszMY_5052jUHhIQSigCImpt-mjx-H4PW9EnjQ>
 <xmx:TD7AX1bYtF_c1J0rCHKYZ3uaG7pxYOb_zBE2orz_B3V6KYJDgKTTHQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7DB4A3064AAE;
 Thu, 26 Nov 2020 18:46:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/12] hw/block/nvme: allow open to close zone transitions
 by controller
Date: Fri, 27 Nov 2020 00:46:00 +0100
Message-Id: <20201126234601.689714-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126234601.689714-1-its@irrelevant.dk>
References: <20201126234601.689714-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Allow the controller to release open resources by transitioning
implicitly and explicitly opened zones to closed. This is done using a
naive "least recently opened" strategy.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |  5 ++++
 hw/block/nvme-ns.c    |  3 +++
 hw/block/nvme.c       | 57 ++++++++++++++++++++++++++++++++++++++++---
 hw/block/trace-events |  1 +
 4 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 20be2a7c882f..05a79a214605 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -42,6 +42,8 @@ typedef struct NvmeZone {
     uint8_t            *zde;
 
     uint64_t wp_staging;
+
+    QTAILQ_ENTRY(NvmeZone) lru_entry;
 } NvmeZone;
 
 typedef struct NvmeNamespace {
@@ -68,6 +70,9 @@ typedef struct NvmeNamespace {
         struct {
             uint32_t open;
             uint32_t active;
+
+            QTAILQ_HEAD(, NvmeZone) lru_open;
+            QTAILQ_HEAD(, NvmeZone) lru_active;
         } resources;
     } zns;
 } NvmeNamespace;
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 3cbc62556175..cd0f075dd281 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -101,6 +101,9 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
         ns->params.zns.mar + 1 : ns->zns.num_zones;
     ns->zns.resources.open = ns->params.zns.mor != 0xffffffff ?
         ns->params.zns.mor + 1 : ns->zns.num_zones;
+
+    QTAILQ_INIT(&ns->zns.resources.lru_open);
+    QTAILQ_INIT(&ns->zns.resources.lru_active);
 }
 
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index bc1446aeab9d..e62efd7cf0c4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1029,11 +1029,47 @@ static inline void nvme_zone_reset_wp(NvmeZone *zone)
     zone->wp_staging = nvme_zslba(zone);
 }
 
+static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
+                                    NvmeZoneState to);
+
+static uint16_t nvme_zrm_release_open(NvmeNamespace *ns)
+{
+    NvmeZone *candidate;
+    NvmeZoneState zs;
+    uint16_t status;
+
+    trace_pci_nvme_zrm_release_open(ns->params.nsid);
+
+    QTAILQ_FOREACH(candidate, &ns->zns.resources.lru_open, lru_entry) {
+        zs = nvme_zs(candidate);
+
+        /* skip explicitly opened zones */
+        if (zs == NVME_ZS_ZSEO) {
+            continue;
+        }
+
+        /* skip zones that have in-flight writes */
+        if (candidate->wp_staging != nvme_wp(candidate)) {
+            continue;
+        }
+
+        status = nvme_zrm_transition(ns, candidate, NVME_ZS_ZSC);
+        if (status) {
+            return status;
+        }
+
+        return NVME_SUCCESS;
+    }
+
+    return NVME_TOO_MANY_OPEN_ZONES;
+}
+
 static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
                                     NvmeZoneState to)
 {
     NvmeZoneState from = nvme_zs(zone);
     NvmeZoneDescriptor *zd = zone->zd;
+    uint16_t status;
 
     trace_pci_nvme_zrm_transition(ns->params.nsid, nvme_zslba(zone),
                                   nvme_zs_to_str(from), from,
@@ -1057,6 +1093,7 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
             }
 
             ns->zns.resources.active--;
+            QTAILQ_INSERT_TAIL(&ns->zns.resources.lru_active, zone, lru_entry);
 
             break;
 
@@ -1067,11 +1104,15 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
             }
 
             if (!ns->zns.resources.open) {
-                return NVME_TOO_MANY_OPEN_ZONES;
+                status = nvme_zrm_release_open(ns);
+                if (status) {
+                    return status;
+                }
             }
 
             ns->zns.resources.active--;
             ns->zns.resources.open--;
+            QTAILQ_INSERT_TAIL(&ns->zns.resources.lru_open, zone, lru_entry);
 
             break;
 
@@ -1098,11 +1139,15 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
         case NVME_ZS_ZSF:
         case NVME_ZS_ZSRO:
             ns->zns.resources.active++;
+            ns->zns.resources.open++;
+            QTAILQ_REMOVE(&ns->zns.resources.lru_open, zone, lru_entry);
 
-            /* fallthrough */
+            break;
 
         case NVME_ZS_ZSC:
             ns->zns.resources.open++;
+            QTAILQ_REMOVE(&ns->zns.resources.lru_open, zone, lru_entry);
+            QTAILQ_INSERT_TAIL(&ns->zns.resources.lru_active, zone, lru_entry);
 
             break;
 
@@ -1127,16 +1172,22 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
         case NVME_ZS_ZSF:
         case NVME_ZS_ZSRO:
             ns->zns.resources.active++;
+            QTAILQ_REMOVE(&ns->zns.resources.lru_active, zone, lru_entry);
 
             break;
 
         case NVME_ZS_ZSIO:
         case NVME_ZS_ZSEO:
             if (!ns->zns.resources.open) {
-                return NVME_TOO_MANY_OPEN_ZONES;
+                status = nvme_zrm_release_open(ns);
+                if (status) {
+                    return status;
+                }
             }
 
             ns->zns.resources.open--;
+            QTAILQ_REMOVE(&ns->zns.resources.lru_active, zone, lru_entry);
+            QTAILQ_INSERT_TAIL(&ns->zns.resources.lru_open, zone, lru_entry);
 
             break;
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 221dc1af36c9..31482bfba1fe 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -94,6 +94,7 @@ pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
 pci_nvme_zrm_transition(uint32_t nsid, uint64_t zslba, const char *s_from, uint8_t from, const char *s_to, uint8_t to) "nsid %"PRIu32" zslba 0x%"PRIx64" from '%s' (%"PRIu8") to '%s' (%"PRIu8")"
+pci_nvme_zrm_release_open(uint32_t nsid) "nsid %"PRIu32""
 pci_nvme_zns_advance_wp(uint32_t nsid, uint64_t zslba, uint64_t wp_orig, uint32_t nlb) "nsid 0x%"PRIx32" zslba 0x%"PRIx64" wp_orig 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_mmio_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_mmio_write(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data 0x%"PRIx64""
-- 
2.29.2


