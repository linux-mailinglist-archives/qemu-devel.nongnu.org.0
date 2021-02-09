Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F7C314E1F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:20:23 +0100 (CET)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9R4A-000501-JN
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Qt2-0000ru-R8; Tue, 09 Feb 2021 06:08:53 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Qsj-0002l9-OB; Tue, 09 Feb 2021 06:08:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ABC91A63;
 Tue,  9 Feb 2021 06:08:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 06:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 nAO3GlWs1dmAI/k8Q0BUuKiRe7EK9uQuf3Ie62wKBU8=; b=oAsHpTUqovAWGXHq
 NHhCb8npNyj8xGPjtaFT4A44hQn/UI0kf3UqUq2rYbJ97kwnvoH38CIQ9KPh/Yjn
 W6y6SzjOxl2OaV36DAUPpeHG5aYdj8uJas6Ow7fjUSCxRZWI2nnmfKwSDwwNdHvj
 7zGoW/0WKBu90XhBQQ3kGS3ToT6C1CoyHUrbIwjfrbm4YBYrAg4WFipxRfRuhaa3
 TfF/yGa51CjRIIJ23ri5LDOQurA42BVToPxHBZjtXvGiD4/Sdsm1kTuflW7Ljxll
 f11yhruyMrV13xdf6fmjUpMXtFne+KxBchM++LmJKXvhYdGNQ5gKt+S3jDX1LIWh
 +x5NoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=nAO3GlWs1dmAI/k8Q0BUuKiRe7EK9uQuf3Ie62wKB
 U8=; b=cEs1GfDhPn3bW308UfmTwCFPzkJQMssnSV5LLY+NHAnfLYGjghu/K9A0a
 2vk3CV1V35YDTRt4fLaB12ic52ldVuPcF8FVSxZsUcOeBAnwT1+B3mImx3AquXF2
 ElaDQSlKjBhh5drZF4cvOJCZX/ijzCQhfmMklW693/IAi/3r1PSf6fd/q5JZ0b+E
 Dj1VL7+pysnN8ezOP7KulMo7DmF84cs/EMQSngrUJiQe4warpzmkQab8S21tDRXl
 JVnCZxqbDwaI5y0uxqtAG6GVpMxF9816EGL/gwfYCWaYWGjSU9/wrBjZtKu8v4JN
 lAkDrxzyDrT5ciTA+jXXOSem864og==
X-ME-Sender: <xms:L20iYMdZ3F2MNN9Sxb9_C9A1JISVx2M4GmTJk1YS1EIlS6Tvw3DYkw>
 <xme:L20iYOMf5YzIRyYo_6lIvK14RpUlVvrhEaOOG44ku2D2Q6uEcXFZOabClG3MdsKRH
 K2u-3jTRV4NRK_1kUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheehgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfhffdt
 geenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:L20iYNjd2A6IH8r15YNLeDujmQSMoF4KriK8a5XN0YQUv7ApITk6bA>
 <xmx:L20iYB_xqUFIhWZH1FN2nW8GBoGgtqlaDGeGcI0x9KYGrAy7lMjh1A>
 <xmx:L20iYItI1Qpa2oc9jkSM4pJ4t9KlO-gGy6LSrDChXjXlRN9gaGeKsA>
 <xmx:L20iYCXIzyXH7U-uR-U2Hbo6fu87uK6faAPpGuyQTIzZAmUnnOpshg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0060B24005E;
 Tue,  9 Feb 2021 06:08:29 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/nvme: move nvme emulation out of hw/block
Date: Tue,  9 Feb 2021 12:08:25 +0100
Message-Id: <20210209110826.585987-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209110826.585987-1-its@irrelevant.dk>
References: <20210209110826.585987-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With the introduction of the nvme-subsystem device we are really
cluttering up the hw/block directory.

As suggested by Philippe previously, move the nvme emulation to
hw/nvme.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 meson.build                               |   1 +
 hw/block/nvme-ns.h                        | 193 ---------------------
 hw/block/nvme-subsys.h                    |  32 ----
 hw/{block => nvme}/nvme.h                 | 198 +++++++++++++++++++++-
 hw/nvme/trace.h                           |   1 +
 hw/{block/nvme.c => nvme/ctrl.c}          |   1 -
 hw/{block/nvme-ns.c => nvme/ns.c}         |   1 -
 hw/{block/nvme-subsys.c => nvme/subsys.c} |   2 +-
 MAINTAINERS                               |   2 +-
 hw/Kconfig                                |   1 +
 hw/block/Kconfig                          |   5 -
 hw/block/meson.build                      |   1 -
 hw/block/trace-events                     | 180 --------------------
 hw/meson.build                            |   1 +
 hw/nvme/Kconfig                           |   4 +
 hw/nvme/meson.build                       |   1 +
 hw/nvme/trace-events                      | 178 +++++++++++++++++++
 17 files changed, 385 insertions(+), 417 deletions(-)
 delete mode 100644 hw/block/nvme-ns.h
 delete mode 100644 hw/block/nvme-subsys.h
 rename hw/{block => nvme}/nvme.h (55%)
 create mode 100644 hw/nvme/trace.h
 rename hw/{block/nvme.c => nvme/ctrl.c} (99%)
 rename hw/{block/nvme-ns.c => nvme/ns.c} (99%)
 rename hw/{block/nvme-subsys.c => nvme/subsys.c} (98%)
 create mode 100644 hw/nvme/Kconfig
 create mode 100644 hw/nvme/meson.build
 create mode 100644 hw/nvme/trace-events

diff --git a/meson.build b/meson.build
index e3386196ba41..255f54918786 100644
--- a/meson.build
+++ b/meson.build
@@ -1433,6 +1433,7 @@ if have_system
     'hw/misc',
     'hw/misc/macio',
     'hw/net',
+    'hw/nvme',
     'hw/nvram',
     'hw/pci',
     'hw/pci-host',
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
deleted file mode 100644
index 7af6884862b5..000000000000
--- a/hw/block/nvme-ns.h
+++ /dev/null
@@ -1,193 +0,0 @@
-/*
- * QEMU NVM Express Virtual Namespace
- *
- * Copyright (c) 2019 CNEX Labs
- * Copyright (c) 2020 Samsung Electronics
- *
- * Authors:
- *  Klaus Jensen      <k.jensen@samsung.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2. See the
- * COPYING file in the top-level directory.
- *
- */
-
-#ifndef NVME_NS_H
-#define NVME_NS_H
-
-#define TYPE_NVME_NS "nvme-ns"
-#define NVME_NS(obj) \
-    OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
-
-typedef struct NvmeZone {
-    NvmeZoneDescr   d;
-    uint64_t        w_ptr;
-    QTAILQ_ENTRY(NvmeZone) entry;
-} NvmeZone;
-
-typedef struct NvmeNamespaceParams {
-    uint32_t nsid;
-    QemuUUID uuid;
-
-    uint16_t mssrl;
-    uint32_t mcl;
-    uint8_t  msrc;
-
-    bool     zoned;
-    bool     cross_zone_read;
-    uint64_t zone_size_bs;
-    uint64_t zone_cap_bs;
-    uint32_t max_active_zones;
-    uint32_t max_open_zones;
-    uint32_t zd_extension_size;
-} NvmeNamespaceParams;
-
-typedef struct NvmeNamespace {
-    DeviceState  parent_obj;
-    BlockConf    blkconf;
-    int32_t      bootindex;
-    int64_t      size;
-    NvmeIdNs     id_ns;
-    const uint32_t *iocs;
-    uint8_t      csi;
-
-    NvmeSubsystem   *subsys;
-
-    NvmeIdNsZoned   *id_ns_zoned;
-    NvmeZone        *zone_array;
-    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) closed_zones;
-    QTAILQ_HEAD(, NvmeZone) full_zones;
-    uint32_t        num_zones;
-    uint64_t        zone_size;
-    uint64_t        zone_capacity;
-    uint32_t        zone_size_log2;
-    uint8_t         *zd_extensions;
-    int32_t         nr_open_zones;
-    int32_t         nr_active_zones;
-
-    NvmeNamespaceParams params;
-
-    struct {
-        uint32_t err_rec;
-    } features;
-} NvmeNamespace;
-
-static inline uint32_t nvme_nsid(NvmeNamespace *ns)
-{
-    if (ns) {
-        return ns->params.nsid;
-    }
-
-    return -1;
-}
-
-static inline bool nvme_ns_shared(NvmeNamespace *ns)
-{
-    return !!ns->subsys;
-}
-
-static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
-{
-    NvmeIdNs *id_ns = &ns->id_ns;
-    return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
-}
-
-static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
-{
-    return nvme_ns_lbaf(ns)->ds;
-}
-
-/* calculate the number of LBAs that the namespace can accomodate */
-static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
-{
-    return ns->size >> nvme_ns_lbads(ns);
-}
-
-/* convert an LBA to the equivalent in bytes */
-static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
-{
-    return lba << nvme_ns_lbads(ns);
-}
-
-typedef struct NvmeCtrl NvmeCtrl;
-
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
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
-void nvme_ns_drain(NvmeNamespace *ns);
-void nvme_ns_shutdown(NvmeNamespace *ns);
-void nvme_ns_cleanup(NvmeNamespace *ns);
-
-#endif /* NVME_NS_H */
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
deleted file mode 100644
index ccf6a71398d3..000000000000
--- a/hw/block/nvme-subsys.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/*
- * QEMU NVM Express Subsystem: nvme-subsys
- *
- * Copyright (c) 2021 Minwoo Im <minwoo.im.dev@gmail.com>
- *
- * This code is licensed under the GNU GPL v2.  Refer COPYING.
- */
-
-#ifndef NVME_SUBSYS_H
-#define NVME_SUBSYS_H
-
-#define TYPE_NVME_SUBSYS "nvme-subsys"
-#define NVME_SUBSYS(obj) \
-    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
-
-#define NVME_SUBSYS_MAX_CTRLS   32
-#define NVME_SUBSYS_MAX_NAMESPACES  32
-
-typedef struct NvmeCtrl NvmeCtrl;
-typedef struct NvmeNamespace NvmeNamespace;
-typedef struct NvmeSubsystem {
-    DeviceState parent_obj;
-    uint8_t     subnqn[256];
-
-    NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
-    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
-} NvmeSubsystem;
-
-int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
-int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
-
-#endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.h b/hw/nvme/nvme.h
similarity index 55%
rename from hw/block/nvme.h
rename to hw/nvme/nvme.h
index cb2b5175f1a1..452a64499b1b 100644
--- a/hw/block/nvme.h
+++ b/hw/nvme/nvme.h
@@ -2,14 +2,208 @@
 #define HW_NVME_H
 
 #include "block/nvme.h"
-#include "nvme-subsys.h"
-#include "nvme-ns.h"
 
 #define NVME_MAX_NAMESPACES 256
 
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 
+#define TYPE_NVME_SUBSYS "nvme-subsys"
+#define NVME_SUBSYS(obj) \
+    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
+
+#define NVME_SUBSYS_MAX_CTRLS   32
+#define NVME_SUBSYS_MAX_NAMESPACES  32
+
+typedef struct NvmeCtrl NvmeCtrl;
+typedef struct NvmeNamespace NvmeNamespace;
+typedef struct NvmeSubsystem {
+    DeviceState parent_obj;
+    uint8_t     subnqn[256];
+
+    NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
+    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
+} NvmeSubsystem;
+
+int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
+
+#define TYPE_NVME_NS "nvme-ns"
+#define NVME_NS(obj) \
+    OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
+
+typedef struct NvmeZone {
+    NvmeZoneDescr   d;
+    uint64_t        w_ptr;
+    QTAILQ_ENTRY(NvmeZone) entry;
+} NvmeZone;
+
+typedef struct NvmeNamespaceParams {
+    uint32_t nsid;
+    QemuUUID uuid;
+
+    uint16_t mssrl;
+    uint32_t mcl;
+    uint8_t  msrc;
+
+    bool     zoned;
+    bool     cross_zone_read;
+    uint64_t zone_size_bs;
+    uint64_t zone_cap_bs;
+    uint32_t max_active_zones;
+    uint32_t max_open_zones;
+    uint32_t zd_extension_size;
+} NvmeNamespaceParams;
+
+typedef struct NvmeNamespace {
+    DeviceState  parent_obj;
+    BlockConf    blkconf;
+    int32_t      bootindex;
+    int64_t      size;
+    NvmeIdNs     id_ns;
+    const uint32_t *iocs;
+    uint8_t      csi;
+
+    NvmeSubsystem   *subsys;
+
+    NvmeIdNsZoned   *id_ns_zoned;
+    NvmeZone        *zone_array;
+    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) closed_zones;
+    QTAILQ_HEAD(, NvmeZone) full_zones;
+    uint32_t        num_zones;
+    uint64_t        zone_size;
+    uint64_t        zone_capacity;
+    uint32_t        zone_size_log2;
+    uint8_t         *zd_extensions;
+    int32_t         nr_open_zones;
+    int32_t         nr_active_zones;
+
+    NvmeNamespaceParams params;
+
+    struct {
+        uint32_t err_rec;
+    } features;
+} NvmeNamespace;
+
+static inline uint32_t nvme_nsid(NvmeNamespace *ns)
+{
+    if (ns) {
+        return ns->params.nsid;
+    }
+
+    return -1;
+}
+
+static inline bool nvme_ns_shared(NvmeNamespace *ns)
+{
+    return !!ns->subsys;
+}
+
+static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
+{
+    NvmeIdNs *id_ns = &ns->id_ns;
+    return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+}
+
+static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
+{
+    return nvme_ns_lbaf(ns)->ds;
+}
+
+/* calculate the number of LBAs that the namespace can accomodate */
+static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
+{
+    return ns->size >> nvme_ns_lbads(ns);
+}
+
+/* convert an LBA to the equivalent in bytes */
+static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
+{
+    return lba << nvme_ns_lbads(ns);
+}
+
+typedef struct NvmeCtrl NvmeCtrl;
+
+static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
+{
+    return zone->d.zs >> 4;
+}
+
+static inline void nvme_set_zone_state(NvmeZone *zone, NvmeZoneState state)
+{
+    zone->d.zs = state << 4;
+}
+
+static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
+{
+    return zone->d.zslba + ns->zone_size;
+}
+
+static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
+{
+    return zone->d.zslba + zone->d.zcap;
+}
+
+static inline bool nvme_wp_is_valid(NvmeZone *zone)
+{
+    uint8_t st = nvme_get_zone_state(zone);
+
+    return st != NVME_ZONE_STATE_FULL &&
+           st != NVME_ZONE_STATE_READ_ONLY &&
+           st != NVME_ZONE_STATE_OFFLINE;
+}
+
+static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
+                                             uint32_t zone_idx)
+{
+    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
+}
+
+static inline void nvme_aor_inc_open(NvmeNamespace *ns)
+{
+    assert(ns->nr_open_zones >= 0);
+    if (ns->params.max_open_zones) {
+        ns->nr_open_zones++;
+        assert(ns->nr_open_zones <= ns->params.max_open_zones);
+    }
+}
+
+static inline void nvme_aor_dec_open(NvmeNamespace *ns)
+{
+    if (ns->params.max_open_zones) {
+        assert(ns->nr_open_zones > 0);
+        ns->nr_open_zones--;
+    }
+    assert(ns->nr_open_zones >= 0);
+}
+
+static inline void nvme_aor_inc_active(NvmeNamespace *ns)
+{
+    assert(ns->nr_active_zones >= 0);
+    if (ns->params.max_active_zones) {
+        ns->nr_active_zones++;
+        assert(ns->nr_active_zones <= ns->params.max_active_zones);
+    }
+}
+
+static inline void nvme_aor_dec_active(NvmeNamespace *ns)
+{
+    if (ns->params.max_active_zones) {
+        assert(ns->nr_active_zones > 0);
+        ns->nr_active_zones--;
+        assert(ns->nr_active_zones >= ns->nr_open_zones);
+    }
+    assert(ns->nr_active_zones >= 0);
+}
+
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
+void nvme_ns_drain(NvmeNamespace *ns);
+void nvme_ns_shutdown(NvmeNamespace *ns);
+void nvme_ns_cleanup(NvmeNamespace *ns);
+
+
 typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
diff --git a/hw/nvme/trace.h b/hw/nvme/trace.h
new file mode 100644
index 000000000000..b398ea107f59
--- /dev/null
+++ b/hw/nvme/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_nvme.h"
diff --git a/hw/block/nvme.c b/hw/nvme/ctrl.c
similarity index 99%
rename from hw/block/nvme.c
rename to hw/nvme/ctrl.c
index c2f0c88fbf39..262c20c1cba7 100644
--- a/hw/block/nvme.c
+++ b/hw/nvme/ctrl.c
@@ -123,7 +123,6 @@
 #include "qemu/cutils.h"
 #include "trace.h"
 #include "nvme.h"
-#include "nvme-ns.h"
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
diff --git a/hw/block/nvme-ns.c b/hw/nvme/ns.c
similarity index 99%
rename from hw/block/nvme-ns.c
rename to hw/nvme/ns.c
index d0fedc7fc003..a7d55d71d9de 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/nvme/ns.c
@@ -28,7 +28,6 @@
 
 #include "trace.h"
 #include "nvme.h"
-#include "nvme-ns.h"
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
diff --git a/hw/block/nvme-subsys.c b/hw/nvme/subsys.c
similarity index 98%
rename from hw/block/nvme-subsys.c
rename to hw/nvme/subsys.c
index 641de33e99fc..e5f12ed5aa16 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/nvme/subsys.c
@@ -19,8 +19,8 @@
 #include "block/accounting.h"
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
+
 #include "nvme.h"
-#include "nvme-subsys.h"
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
 {
diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41bc..ff1ec820c822 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1887,7 +1887,7 @@ M: Keith Busch <kbusch@kernel.org>
 M: Klaus Jensen <its@irrelevant.dk>
 L: qemu-block@nongnu.org
 S: Supported
-F: hw/block/nvme*
+F: hw/nvme/*
 F: include/block/nvme.h
 F: tests/qtest/nvme-test.c
 F: docs/specs/nvme.txt
diff --git a/hw/Kconfig b/hw/Kconfig
index 4de1797ffdab..4ef9ca40ab0b 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -21,6 +21,7 @@ source mem/Kconfig
 source misc/Kconfig
 source net/Kconfig
 source nubus/Kconfig
+source nvme/Kconfig
 source nvram/Kconfig
 source pci-bridge/Kconfig
 source pci-host/Kconfig
diff --git a/hw/block/Kconfig b/hw/block/Kconfig
index 2d17f481adc6..c2213173ffe5 100644
--- a/hw/block/Kconfig
+++ b/hw/block/Kconfig
@@ -22,11 +22,6 @@ config ECC
 config ONENAND
     bool
 
-config NVME_PCI
-    bool
-    default y if PCI_DEVICES
-    depends on PCI
-
 config VIRTIO_BLK
     bool
     default y
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 83ea2d37978d..96697f739c09 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -13,7 +13,6 @@ softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c', 'nvme-subsys.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b6e972d733a6..314444be1462 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -27,186 +27,6 @@ virtio_blk_submit_multireq(void *vdev, void *mrb, int start, int num_reqs, uint6
 hd_geometry_lchs_guess(void *blk, int cyls, int heads, int secs) "blk %p LCHS %d %d %d"
 hd_geometry_guess(void *blk, uint32_t cyls, uint32_t heads, uint32_t secs, int trans) "blk %p CHS %u %u %u trans %d"
 
-# nvme.c
-# nvme traces for successful events
-pci_nvme_register_namespace(uint32_t nsid) "nsid %"PRIu32""
-pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
-pci_nvme_irq_pin(void) "pulsing IRQ pin"
-pci_nvme_irq_masked(void) "IRQ is masked"
-pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2=0x%"PRIx64""
-pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
-pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
-pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
-pci_nvme_map_sgl(uint16_t cid, uint8_t typ, uint64_t len) "cid %"PRIu16" type 0x%"PRIx8" len %"PRIu64""
-pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
-pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
-pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
-pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
-pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
-pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
-pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
-pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
-pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
-pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
-pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
-pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
-pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
-pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
-pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
-pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
-pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
-pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
-pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
-pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
-pci_nvme_identify_ctrl(void) "identify controller"
-pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
-pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
-pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
-pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
-pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
-pci_nvme_identify_cmd_set(void) "identify i/o command set"
-pci_nvme_identify_ns_descr_list(uint32_t ns) "nsid %"PRIu32""
-pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
-pci_nvme_getfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t sel, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" sel 0x%"PRIx8" cdw11 0x%"PRIx32""
-pci_nvme_setfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t save, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" save 0x%"PRIx8" cdw11 0x%"PRIx32""
-pci_nvme_getfeat_vwcache(const char* result) "get feature volatile write cache, result=%s"
-pci_nvme_getfeat_numq(int result) "get feature number of queues, result=%d"
-pci_nvme_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
-pci_nvme_setfeat_timestamp(uint64_t ts) "set feature timestamp = 0x%"PRIx64""
-pci_nvme_getfeat_timestamp(uint64_t ts) "get feature timestamp = 0x%"PRIx64""
-pci_nvme_process_aers(int queued) "queued %d"
-pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
-pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
-pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8""
-pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
-pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
-pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
-pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
-pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
-pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
-pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
-pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
-pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
-pci_nvme_mmio_doorbell_sq(uint16_t sqid, uint16_t new_tail) "sqid %"PRIu16" new_tail %"PRIu16""
-pci_nvme_mmio_intm_set(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask set, data=0x%"PRIx64", new_mask=0x%"PRIx64""
-pci_nvme_mmio_intm_clr(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask clr, data=0x%"PRIx64", new_mask=0x%"PRIx64""
-pci_nvme_mmio_cfg(uint64_t data) "wrote MMIO, config controller config=0x%"PRIx64""
-pci_nvme_mmio_aqattr(uint64_t data) "wrote MMIO, admin queue attributes=0x%"PRIx64""
-pci_nvme_mmio_asqaddr(uint64_t data) "wrote MMIO, admin submission queue address=0x%"PRIx64""
-pci_nvme_mmio_acqaddr(uint64_t data) "wrote MMIO, admin completion queue address=0x%"PRIx64""
-pci_nvme_mmio_asqaddr_hi(uint64_t data, uint64_t new_addr) "wrote MMIO, admin submission queue high half=0x%"PRIx64", new_address=0x%"PRIx64""
-pci_nvme_mmio_acqaddr_hi(uint64_t data, uint64_t new_addr) "wrote MMIO, admin completion queue high half=0x%"PRIx64", new_address=0x%"PRIx64""
-pci_nvme_mmio_start_success(void) "setting controller enable bit succeeded"
-pci_nvme_mmio_stopped(void) "cleared controller enable bit"
-pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
-pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
-pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-pci_nvme_reset_zone(uint64_t slba, uint32_t zone_idx, int all) "reset zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-pci_nvme_offline_zone(uint64_t slba, uint32_t zone_idx, int all) "offline zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set zone descriptor extension, slba=%"PRIu64", idx=%"PRIu32""
-pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_idx=%"PRIu32""
-pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Closed state"
-pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
-
-# nvme traces for error conditions
-pci_nvme_err_mdts(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
-pci_nvme_err_req_status(uint16_t cid, uint32_t nsid, uint16_t status, uint8_t opc) "cid %"PRIu16" nsid %"PRIu32" status 0x%"PRIx16" opc 0x%"PRIx8""
-pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
-pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
-pci_nvme_err_cfs(void) "controller fatal status"
-pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu16" err '%s' status 0x%"PRIx16""
-pci_nvme_err_copy_invalid_format(uint8_t format) "format 0x%"PRIx8""
-pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
-pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
-pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
-pci_nvme_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
-pci_nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is not page aligned: 0x%"PRIx64""
-pci_nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%"PRIx64""
-pci_nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
-pci_nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8""
-pci_nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t limit) "Invalid LBA start=%"PRIu64" len=%"PRIu64" limit=%"PRIu64""
-pci_nvme_err_invalid_log_page_offset(uint64_t ofs, uint64_t size) "must be <= %"PRIu64", got %"PRIu64""
-pci_nvme_err_cmb_invalid_cba(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
-pci_nvme_err_cmb_not_enabled(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
-pci_nvme_err_unaligned_zone_cmd(uint8_t action, uint64_t slba, uint64_t zslba) "unaligned zone op 0x%"PRIx32", got slba=%"PRIu64", zslba=%"PRIu64""
-pci_nvme_err_invalid_zone_state_transition(uint8_t action, uint64_t slba, uint8_t attrs) "action=0x%"PRIx8", slba=%"PRIu64", attrs=0x%"PRIx32""
-pci_nvme_err_write_not_at_wp(uint64_t slba, uint64_t zone, uint64_t wp) "writing at slba=%"PRIu64", zone=%"PRIu64", but wp=%"PRIu64""
-pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appending at slba=%"PRIu64", but zone=%"PRIu64""
-pci_nvme_err_zone_is_full(uint64_t zslba) "zslba 0x%"PRIx64""
-pci_nvme_err_zone_is_read_only(uint64_t zslba) "zslba 0x%"PRIx64""
-pci_nvme_err_zone_is_offline(uint64_t zslba) "zslba 0x%"PRIx64""
-pci_nvme_err_zone_boundary(uint64_t slba, uint32_t nlb, uint64_t zcap) "lba 0x%"PRIx64" nlb %"PRIu32" zcap 0x%"PRIx64""
-pci_nvme_err_zone_invalid_write(uint64_t slba, uint64_t wp) "lba 0x%"PRIx64" wp 0x%"PRIx64""
-pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
-pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
-pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
-pci_nvme_err_insuff_active_res(uint32_t max_active) "max_active=%"PRIu32" zone limit exceeded"
-pci_nvme_err_insuff_open_res(uint32_t max_open) "max_open=%"PRIu32" zone limit exceeded"
-pci_nvme_err_zd_extension_map_error(uint32_t zone_idx) "can't map descriptor extension for zone_idx=%"PRIu32""
-pci_nvme_err_invalid_iocsci(uint32_t idx) "unsupported command set combination index %"PRIu32""
-pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue deletion, sid=%"PRIu16""
-pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating submission queue, invalid cqid=%"PRIu16""
-pci_nvme_err_invalid_create_sq_sqid(uint16_t sqid) "failed creating submission queue, invalid sqid=%"PRIu16""
-pci_nvme_err_invalid_create_sq_size(uint16_t qsize) "failed creating submission queue, invalid qsize=%"PRIu16""
-pci_nvme_err_invalid_create_sq_addr(uint64_t addr) "failed creating submission queue, addr=0x%"PRIx64""
-pci_nvme_err_invalid_create_sq_qflags(uint16_t qflags) "failed creating submission queue, qflags=%"PRIu16""
-pci_nvme_err_invalid_del_cq_cqid(uint16_t cqid) "failed deleting completion queue, cqid=%"PRIu16""
-pci_nvme_err_invalid_del_cq_notempty(uint16_t cqid) "failed deleting completion queue, it is not empty, cqid=%"PRIu16""
-pci_nvme_err_invalid_create_cq_cqid(uint16_t cqid) "failed creating completion queue, cqid=%"PRIu16""
-pci_nvme_err_invalid_create_cq_size(uint16_t size) "failed creating completion queue, size=%"PRIu16""
-pci_nvme_err_invalid_create_cq_addr(uint64_t addr) "failed creating completion queue, addr=0x%"PRIx64""
-pci_nvme_err_invalid_create_cq_vector(uint16_t vector) "failed creating completion queue, vector=%"PRIu16""
-pci_nvme_err_invalid_create_cq_qflags(uint16_t qflags) "failed creating completion queue, qflags=%"PRIu16""
-pci_nvme_err_invalid_identify_cns(uint16_t cns) "identify, invalid cns=0x%"PRIx16""
-pci_nvme_err_invalid_getfeat(int dw10) "invalid get features, dw10=0x%"PRIx32""
-pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx32""
-pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
-pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
-pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
-pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
-pci_nvme_err_startfail_nbaracq(void) "nvme_start_ctrl failed because the admin completion queue address is null"
-pci_nvme_err_startfail_asq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin submission queue address is misaligned: 0x%"PRIx64""
-pci_nvme_err_startfail_acq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin completion queue address is misaligned: 0x%"PRIx64""
-pci_nvme_err_startfail_page_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the page size is too small: log2size=%u, min=%u"
-pci_nvme_err_startfail_page_too_large(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the page size is too large: log2size=%u, max=%u"
-pci_nvme_err_startfail_cqent_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the completion queue entry size is too small: log2size=%u, min=%u"
-pci_nvme_err_startfail_cqent_too_large(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the completion queue entry size is too large: log2size=%u, max=%u"
-pci_nvme_err_startfail_sqent_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the submission queue entry size is too small: log2size=%u, min=%u"
-pci_nvme_err_startfail_sqent_too_large(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the submission queue entry size is too large: log2size=%u, max=%u"
-pci_nvme_err_startfail_css(uint8_t css) "nvme_start_ctrl failed because invalid command set selected:%u"
-pci_nvme_err_startfail_asqent_sz_zero(void) "nvme_start_ctrl failed because the admin submission queue size is zero"
-pci_nvme_err_startfail_acqent_sz_zero(void) "nvme_start_ctrl failed because the admin completion queue size is zero"
-pci_nvme_err_startfail_zasl_too_small(uint32_t zasl, uint32_t pagesz) "nvme_start_ctrl failed because zone append size limit %"PRIu32" is too small, needs to be >= %"PRIu32""
-pci_nvme_err_startfail(void) "setting controller enable bit failed"
-pci_nvme_err_invalid_mgmt_action(int action) "action=0x%"PRIx8""
-
-# Traces for undefined behavior
-pci_nvme_ub_mmiowr_misaligned32(uint64_t offset) "MMIO write not 32-bit aligned, offset=0x%"PRIx64""
-pci_nvme_ub_mmiowr_toosmall(uint64_t offset, unsigned size) "MMIO write smaller than 32 bits, offset=0x%"PRIx64", size=%u"
-pci_nvme_ub_mmiowr_intmask_with_msix(void) "undefined access to interrupt mask set when MSI-X is enabled"
-pci_nvme_ub_mmiowr_ro_csts(void) "attempted to set a read only bit of controller status"
-pci_nvme_ub_mmiowr_ssreset_w1c_unsupported(void) "attempted to W1C CSTS.NSSRO but CAP.NSSRS is zero (not supported)"
-pci_nvme_ub_mmiowr_ssreset_unsupported(void) "attempted NVM subsystem reset but CAP.NSSRS is zero (not supported)"
-pci_nvme_ub_mmiowr_cmbloc_reserved(void) "invalid write to reserved CMBLOC when CMBSZ is zero, ignored"
-pci_nvme_ub_mmiowr_cmbsz_readonly(void) "invalid write to read only CMBSZ, ignored"
-pci_nvme_ub_mmiowr_pmrcap_readonly(void) "invalid write to read only PMRCAP, ignored"
-pci_nvme_ub_mmiowr_pmrsts_readonly(void) "invalid write to read only PMRSTS, ignored"
-pci_nvme_ub_mmiowr_pmrebs_readonly(void) "invalid write to read only PMREBS, ignored"
-pci_nvme_ub_mmiowr_pmrswtp_readonly(void) "invalid write to read only PMRSWTP, ignored"
-pci_nvme_ub_mmiowr_invalid(uint64_t offset, uint64_t data) "invalid MMIO write, offset=0x%"PRIx64", data=0x%"PRIx64""
-pci_nvme_ub_mmiord_misaligned32(uint64_t offset) "MMIO read not 32-bit aligned, offset=0x%"PRIx64""
-pci_nvme_ub_mmiord_toosmall(uint64_t offset) "MMIO read smaller than 32-bits, offset=0x%"PRIx64""
-pci_nvme_ub_mmiord_invalid_ofs(uint64_t offset) "MMIO read beyond last register, offset=0x%"PRIx64", returning 0"
-pci_nvme_ub_db_wr_misaligned(uint64_t offset) "doorbell write not 32-bit aligned, offset=0x%"PRIx64", ignoring"
-pci_nvme_ub_db_wr_invalid_cq(uint32_t qid) "completion queue doorbell write for nonexistent queue, cqid=%"PRIu32", ignoring"
-pci_nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t new_head) "completion queue doorbell write value beyond queue size, cqid=%"PRIu32", new_head=%"PRIu16", ignoring"
-pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for nonexistent queue, sqid=%"PRIu32", ignoring"
-pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submission queue doorbell write value beyond queue size, sqid=%"PRIu32", new_head=%"PRIu16", ignoring"
-pci_nvme_ub_unknown_css_value(void) "unknown value in cc.css field"
-
 # xen-block.c
 xen_block_realize(const char *type, uint32_t disk, uint32_t partition) "%s d%up%u"
 xen_block_connect(const char *type, uint32_t disk, uint32_t partition) "%s d%up%u"
diff --git a/hw/meson.build b/hw/meson.build
index 010de7219c1d..dcee944cf059 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -21,6 +21,7 @@ subdir('mem')
 subdir('misc')
 subdir('net')
 subdir('nubus')
+subdir('nvme')
 subdir('nvram')
 subdir('pci')
 subdir('pci-bridge')
diff --git a/hw/nvme/Kconfig b/hw/nvme/Kconfig
new file mode 100644
index 000000000000..8ac90942e55e
--- /dev/null
+++ b/hw/nvme/Kconfig
@@ -0,0 +1,4 @@
+config NVME_PCI
+    bool
+    default y if PCI_DEVICES
+    depends on PCI
diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
new file mode 100644
index 000000000000..15c6feb8cfc4
--- /dev/null
+++ b/hw/nvme/meson.build
@@ -0,0 +1 @@
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'ns.c', 'subsys.c'))
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
new file mode 100644
index 000000000000..50670b18feda
--- /dev/null
+++ b/hw/nvme/trace-events
@@ -0,0 +1,178 @@
+# successful events
+pci_nvme_register_namespace(uint32_t nsid) "nsid %"PRIu32""
+pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
+pci_nvme_irq_pin(void) "pulsing IRQ pin"
+pci_nvme_irq_masked(void) "IRQ is masked"
+pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2=0x%"PRIx64""
+pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
+pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
+pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
+pci_nvme_map_sgl(uint16_t cid, uint8_t typ, uint64_t len) "cid %"PRIu16" type 0x%"PRIx8" len %"PRIu64""
+pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
+pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
+pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
+pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
+pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
+pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
+pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
+pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
+pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
+pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
+pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
+pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
+pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
+pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
+pci_nvme_identify_ctrl(void) "identify controller"
+pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
+pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
+pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
+pci_nvme_identify_cmd_set(void) "identify i/o command set"
+pci_nvme_identify_ns_descr_list(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
+pci_nvme_getfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t sel, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" sel 0x%"PRIx8" cdw11 0x%"PRIx32""
+pci_nvme_setfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t save, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" save 0x%"PRIx8" cdw11 0x%"PRIx32""
+pci_nvme_getfeat_vwcache(const char* result) "get feature volatile write cache, result=%s"
+pci_nvme_getfeat_numq(int result) "get feature number of queues, result=%d"
+pci_nvme_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
+pci_nvme_setfeat_timestamp(uint64_t ts) "set feature timestamp = 0x%"PRIx64""
+pci_nvme_getfeat_timestamp(uint64_t ts) "get feature timestamp = 0x%"PRIx64""
+pci_nvme_process_aers(int queued) "queued %d"
+pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
+pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8""
+pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
+pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
+pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
+pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
+pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
+pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
+pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
+pci_nvme_mmio_doorbell_sq(uint16_t sqid, uint16_t new_tail) "sqid %"PRIu16" new_tail %"PRIu16""
+pci_nvme_mmio_intm_set(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask set, data=0x%"PRIx64", new_mask=0x%"PRIx64""
+pci_nvme_mmio_intm_clr(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask clr, data=0x%"PRIx64", new_mask=0x%"PRIx64""
+pci_nvme_mmio_cfg(uint64_t data) "wrote MMIO, config controller config=0x%"PRIx64""
+pci_nvme_mmio_aqattr(uint64_t data) "wrote MMIO, admin queue attributes=0x%"PRIx64""
+pci_nvme_mmio_asqaddr(uint64_t data) "wrote MMIO, admin submission queue address=0x%"PRIx64""
+pci_nvme_mmio_acqaddr(uint64_t data) "wrote MMIO, admin completion queue address=0x%"PRIx64""
+pci_nvme_mmio_asqaddr_hi(uint64_t data, uint64_t new_addr) "wrote MMIO, admin submission queue high half=0x%"PRIx64", new_address=0x%"PRIx64""
+pci_nvme_mmio_acqaddr_hi(uint64_t data, uint64_t new_addr) "wrote MMIO, admin completion queue high half=0x%"PRIx64", new_address=0x%"PRIx64""
+pci_nvme_mmio_start_success(void) "setting controller enable bit succeeded"
+pci_nvme_mmio_stopped(void) "cleared controller enable bit"
+pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
+pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
+pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
+pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
+pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
+pci_nvme_reset_zone(uint64_t slba, uint32_t zone_idx, int all) "reset zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
+pci_nvme_offline_zone(uint64_t slba, uint32_t zone_idx, int all) "offline zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
+pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set zone descriptor extension, slba=%"PRIu64", idx=%"PRIu32""
+pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_idx=%"PRIu32""
+pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Closed state"
+pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
+
+# error conditions
+pci_nvme_err_mdts(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
+pci_nvme_err_req_status(uint16_t cid, uint32_t nsid, uint16_t status, uint8_t opc) "cid %"PRIu16" nsid %"PRIu32" status 0x%"PRIx16" opc 0x%"PRIx8""
+pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
+pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
+pci_nvme_err_cfs(void) "controller fatal status"
+pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu16" err '%s' status 0x%"PRIx16""
+pci_nvme_err_copy_invalid_format(uint8_t format) "format 0x%"PRIx8""
+pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
+pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
+pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
+pci_nvme_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
+pci_nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is not page aligned: 0x%"PRIx64""
+pci_nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%"PRIx64""
+pci_nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
+pci_nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8""
+pci_nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t limit) "Invalid LBA start=%"PRIu64" len=%"PRIu64" limit=%"PRIu64""
+pci_nvme_err_invalid_log_page_offset(uint64_t ofs, uint64_t size) "must be <= %"PRIu64", got %"PRIu64""
+pci_nvme_err_cmb_invalid_cba(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
+pci_nvme_err_cmb_not_enabled(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
+pci_nvme_err_unaligned_zone_cmd(uint8_t action, uint64_t slba, uint64_t zslba) "unaligned zone op 0x%"PRIx32", got slba=%"PRIu64", zslba=%"PRIu64""
+pci_nvme_err_invalid_zone_state_transition(uint8_t action, uint64_t slba, uint8_t attrs) "action=0x%"PRIx8", slba=%"PRIu64", attrs=0x%"PRIx32""
+pci_nvme_err_write_not_at_wp(uint64_t slba, uint64_t zone, uint64_t wp) "writing at slba=%"PRIu64", zone=%"PRIu64", but wp=%"PRIu64""
+pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appending at slba=%"PRIu64", but zone=%"PRIu64""
+pci_nvme_err_zone_is_full(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_read_only(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_offline(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_boundary(uint64_t slba, uint32_t nlb, uint64_t zcap) "lba 0x%"PRIx64" nlb %"PRIu32" zcap 0x%"PRIx64""
+pci_nvme_err_zone_invalid_write(uint64_t slba, uint64_t wp) "lba 0x%"PRIx64" wp 0x%"PRIx64""
+pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
+pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
+pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
+pci_nvme_err_insuff_active_res(uint32_t max_active) "max_active=%"PRIu32" zone limit exceeded"
+pci_nvme_err_insuff_open_res(uint32_t max_open) "max_open=%"PRIu32" zone limit exceeded"
+pci_nvme_err_zd_extension_map_error(uint32_t zone_idx) "can't map descriptor extension for zone_idx=%"PRIu32""
+pci_nvme_err_invalid_iocsci(uint32_t idx) "unsupported command set combination index %"PRIu32""
+pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue deletion, sid=%"PRIu16""
+pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating submission queue, invalid cqid=%"PRIu16""
+pci_nvme_err_invalid_create_sq_sqid(uint16_t sqid) "failed creating submission queue, invalid sqid=%"PRIu16""
+pci_nvme_err_invalid_create_sq_size(uint16_t qsize) "failed creating submission queue, invalid qsize=%"PRIu16""
+pci_nvme_err_invalid_create_sq_addr(uint64_t addr) "failed creating submission queue, addr=0x%"PRIx64""
+pci_nvme_err_invalid_create_sq_qflags(uint16_t qflags) "failed creating submission queue, qflags=%"PRIu16""
+pci_nvme_err_invalid_del_cq_cqid(uint16_t cqid) "failed deleting completion queue, cqid=%"PRIu16""
+pci_nvme_err_invalid_del_cq_notempty(uint16_t cqid) "failed deleting completion queue, it is not empty, cqid=%"PRIu16""
+pci_nvme_err_invalid_create_cq_cqid(uint16_t cqid) "failed creating completion queue, cqid=%"PRIu16""
+pci_nvme_err_invalid_create_cq_size(uint16_t size) "failed creating completion queue, size=%"PRIu16""
+pci_nvme_err_invalid_create_cq_addr(uint64_t addr) "failed creating completion queue, addr=0x%"PRIx64""
+pci_nvme_err_invalid_create_cq_vector(uint16_t vector) "failed creating completion queue, vector=%"PRIu16""
+pci_nvme_err_invalid_create_cq_qflags(uint16_t qflags) "failed creating completion queue, qflags=%"PRIu16""
+pci_nvme_err_invalid_identify_cns(uint16_t cns) "identify, invalid cns=0x%"PRIx16""
+pci_nvme_err_invalid_getfeat(int dw10) "invalid get features, dw10=0x%"PRIx32""
+pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx32""
+pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
+pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
+pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
+pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
+pci_nvme_err_startfail_nbaracq(void) "nvme_start_ctrl failed because the admin completion queue address is null"
+pci_nvme_err_startfail_asq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin submission queue address is misaligned: 0x%"PRIx64""
+pci_nvme_err_startfail_acq_misaligned(uint64_t addr) "nvme_start_ctrl failed because the admin completion queue address is misaligned: 0x%"PRIx64""
+pci_nvme_err_startfail_page_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the page size is too small: log2size=%u, min=%u"
+pci_nvme_err_startfail_page_too_large(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the page size is too large: log2size=%u, max=%u"
+pci_nvme_err_startfail_cqent_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the completion queue entry size is too small: log2size=%u, min=%u"
+pci_nvme_err_startfail_cqent_too_large(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the completion queue entry size is too large: log2size=%u, max=%u"
+pci_nvme_err_startfail_sqent_too_small(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the submission queue entry size is too small: log2size=%u, min=%u"
+pci_nvme_err_startfail_sqent_too_large(uint8_t log2ps, uint8_t maxlog2ps) "nvme_start_ctrl failed because the submission queue entry size is too large: log2size=%u, max=%u"
+pci_nvme_err_startfail_css(uint8_t css) "nvme_start_ctrl failed because invalid command set selected:%u"
+pci_nvme_err_startfail_asqent_sz_zero(void) "nvme_start_ctrl failed because the admin submission queue size is zero"
+pci_nvme_err_startfail_acqent_sz_zero(void) "nvme_start_ctrl failed because the admin completion queue size is zero"
+pci_nvme_err_startfail_zasl_too_small(uint32_t zasl, uint32_t pagesz) "nvme_start_ctrl failed because zone append size limit %"PRIu32" is too small, needs to be >= %"PRIu32""
+pci_nvme_err_startfail(void) "setting controller enable bit failed"
+pci_nvme_err_invalid_mgmt_action(int action) "action=0x%"PRIx8""
+
+# undefined behavior
+pci_nvme_ub_mmiowr_misaligned32(uint64_t offset) "MMIO write not 32-bit aligned, offset=0x%"PRIx64""
+pci_nvme_ub_mmiowr_toosmall(uint64_t offset, unsigned size) "MMIO write smaller than 32 bits, offset=0x%"PRIx64", size=%u"
+pci_nvme_ub_mmiowr_intmask_with_msix(void) "undefined access to interrupt mask set when MSI-X is enabled"
+pci_nvme_ub_mmiowr_ro_csts(void) "attempted to set a read only bit of controller status"
+pci_nvme_ub_mmiowr_ssreset_w1c_unsupported(void) "attempted to W1C CSTS.NSSRO but CAP.NSSRS is zero (not supported)"
+pci_nvme_ub_mmiowr_ssreset_unsupported(void) "attempted NVM subsystem reset but CAP.NSSRS is zero (not supported)"
+pci_nvme_ub_mmiowr_cmbloc_reserved(void) "invalid write to reserved CMBLOC when CMBSZ is zero, ignored"
+pci_nvme_ub_mmiowr_cmbsz_readonly(void) "invalid write to read only CMBSZ, ignored"
+pci_nvme_ub_mmiowr_pmrcap_readonly(void) "invalid write to read only PMRCAP, ignored"
+pci_nvme_ub_mmiowr_pmrsts_readonly(void) "invalid write to read only PMRSTS, ignored"
+pci_nvme_ub_mmiowr_pmrebs_readonly(void) "invalid write to read only PMREBS, ignored"
+pci_nvme_ub_mmiowr_pmrswtp_readonly(void) "invalid write to read only PMRSWTP, ignored"
+pci_nvme_ub_mmiowr_invalid(uint64_t offset, uint64_t data) "invalid MMIO write, offset=0x%"PRIx64", data=0x%"PRIx64""
+pci_nvme_ub_mmiord_misaligned32(uint64_t offset) "MMIO read not 32-bit aligned, offset=0x%"PRIx64""
+pci_nvme_ub_mmiord_toosmall(uint64_t offset) "MMIO read smaller than 32-bits, offset=0x%"PRIx64""
+pci_nvme_ub_mmiord_invalid_ofs(uint64_t offset) "MMIO read beyond last register, offset=0x%"PRIx64", returning 0"
+pci_nvme_ub_db_wr_misaligned(uint64_t offset) "doorbell write not 32-bit aligned, offset=0x%"PRIx64", ignoring"
+pci_nvme_ub_db_wr_invalid_cq(uint32_t qid) "completion queue doorbell write for nonexistent queue, cqid=%"PRIu32", ignoring"
+pci_nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t new_head) "completion queue doorbell write value beyond queue size, cqid=%"PRIu32", new_head=%"PRIu16", ignoring"
+pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for nonexistent queue, sqid=%"PRIu32", ignoring"
+pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submission queue doorbell write value beyond queue size, sqid=%"PRIu32", new_head=%"PRIu16", ignoring"
+pci_nvme_ub_unknown_css_value(void) "unknown value in cc.css field"
-- 
2.30.0


