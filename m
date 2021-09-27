Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3768418EDC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 08:03:30 +0200 (CEST)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjjd-0004dJ-Sf
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 02:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2k-0004E7-S6; Mon, 27 Sep 2021 01:19:10 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:49231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2i-0000cV-Dx; Mon, 27 Sep 2021 01:19:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DA81A2B0121D;
 Mon, 27 Sep 2021 01:19:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 27 Sep 2021 01:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=s0AJ4WKeeSCB3
 969Tlnnj33j2oRAr/BPhg8TLTc7dMo=; b=C5oWwc08wjCsgTHbTKiHzo0A/rihx
 v3hTGgTABAywALFPcXWMB7vV2sFbRtX1jyadn/9EbQNVPIIAoHE91k1pgrv2Aqdc
 bJq8wcGkBBkXn9I/DevjCdTTwdsb83JmJgCRrHoLNwB5uWv1w5PFA1nfMoD3WFo2
 aY3AG3Tznh/GzXNIFu75hoaVdGG/MLxuufG+U0mKLOopF5avBUNhQ9lLYcJ1h+Ov
 gA4Abo3lhfE6PpNl+C4EkDkJ1CICU/EgsDG5PpDlr3KmS0Fpgufcdj7Egw5vRue2
 OwdrrlkPC8KhUU+9SgSnftZL4V0CEcksWVJ4Im1cuK54RiBVNNcnZCldA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=s0AJ4WKeeSCB3969Tlnnj33j2oRAr/BPhg8TLTc7dMo=; b=JmKlrCHq
 rSj3DlMBO8TW+IvyHkmeXb8mFk6XAwEQNMOa8OO1SwKaVpf2dP7rIEQH0/2QKQqr
 KlrI9ceF4lw4VrhI5BuaeiKszE2BcjDcOKEQfpJVgX7QApqEM3b156VY8TMt4ymb
 mOzISf/KqdN7Tw81NFFcfrdQjt0NmK8Iu6aUGulJW4+8gBOxhw9gcXA5Ng46T9s/
 vq0/yiPR2K2Uw/PdaxLNx3q8zOrUaDuAfkZfdVGAhXHkyOAt7YLm5XFKqWq1FiTZ
 C0qSxWPVqYvgZHoGM5Og8adsvXNUpHXUKDbBARWHe3VC+akQhwswzsguKqS7GhnM
 ARLiKrBAsV7WSw==
X-ME-Sender: <xms:SVRRYYzeXDT5j6EL5B_CrQ_tht9vwLzENGKuSsP_ulElt3lCR6P5iw>
 <xme:SVRRYcSlgpQwPCR-Seje3Ah_pZka-Pr9yFmSpSqxTBYw2oBSUuLVIZlOptbzQO4ah
 ehNT4OZZ8kYiUjzO7A>
X-ME-Received: <xmr:SVRRYaUEn1wAIfl5Ul7r5VE4irAZpUuvJzAfaIcA8dmIM1oziYIfQkcaD8At99LIiO9WKhUJSYAVmyAdsdGVHsFvfJAmzUaOYeMZRM54gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SVRRYWik4PBMYzUM2jcDue1x2Ub_y7iS-ozBIIoAtFpWO0nAQtz-QA>
 <xmx:SVRRYaA0f199B1ewjL4Nns0HVc-UIZGe_hmMmSH3OzFwz7ltabcFtA>
 <xmx:SVRRYXLE17bIdl6xQQdlIsOCaqhY3L8CbUfK5PNOu7ThSrw4jUcUJg>
 <xmx:SVRRYQRVK31I_Vsk41KBKOOZftXo8CiP3KNGuteZhSTE_IHCW_Z6n94Mfs0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:19:03 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 15/16] hw/nvme: add experimental device x-nvme-ctrl
Date: Mon, 27 Sep 2021 07:17:58 +0200
Message-Id: <20210927051759.447305-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927051759.447305-1-its@irrelevant.dk>
References: <20210927051759.447305-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add a new experimental 'x-nvme-ctrl' device which allows us to get rid
of a bunch of legacy options and slightly change others to better use
the qdev property system.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c   | 137 +++++++++++++++++++++++++++++++++++------------
 hw/nvme/ns.c     |   2 +-
 hw/nvme/nvme.h   |  11 +++-
 hw/nvme/subsys.c |  27 ++++++----
 4 files changed, 130 insertions(+), 47 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 31499b10fc49..fa2f537f114d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6529,19 +6529,14 @@ static void nvme_init_ctrl(NvmeState *n, PCIDevice *pci_dev)
 
 static int nvme_init_subsys(NvmeState *n, Error **errp)
 {
-    int cntlid;
-
     if (!n->subsys) {
         return 0;
     }
 
-    cntlid = nvme_subsys_register_ctrl(n->subsys, n, errp);
-    if (cntlid < 0) {
+    if (nvme_subsys_register_ctrl(n->subsys, n, errp)) {
         return -1;
     }
 
-    n->cntlid = cntlid;
-
     return 0;
 }
 
@@ -6560,8 +6555,39 @@ void nvme_attach_ns(NvmeState *n, NvmeNamespace *ns)
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
-    NvmeCtrl *ctrl = NVME_DEVICE(pci_dev);
-    NvmeState *n = NVME_STATE(ctrl);
+    NvmeState *n = NVME_STATE(pci_dev);
+    const int SN_LEN = 12;
+
+    if (!n->params.serial) {
+        int i;
+
+        n->params.serial = g_malloc0(SN_LEN + 1);
+
+        for (i = 0; i < SN_LEN; i++) {
+             n->params.serial[i] = g_random_int_range(0x41, 0x5A);
+        }
+    }
+
+    if (nvme_check_constraints(n, errp)) {
+        return;
+    }
+
+    nvme_init_state(n);
+    if (nvme_init_pci(n, pci_dev, errp)) {
+        return;
+    }
+
+    if (nvme_init_subsys(n, errp)) {
+        return;
+    }
+
+    nvme_init_ctrl(n, pci_dev);
+}
+
+static void nvme_legacy_realize(PCIDevice *pci_dev, Error **errp)
+{
+    NvmeState *n = NVME_STATE(pci_dev);
+    NvmeCtrlLegacyDevice *ctrl = NVME_DEVICE_LEGACY(n);
 
     if (ctrl->subsys_dev) {
         if (ctrl->namespace.blkconf.blk) {
@@ -6588,6 +6614,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     if (nvme_init_subsys(n, errp)) {
         return;
     }
+
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
@@ -6643,27 +6670,47 @@ static void nvme_exit(PCIDevice *pci_dev)
 static Property nvme_state_props[] = {
     DEFINE_PROP_LINK("pmrdev", NvmeState, pmr.dev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
-    DEFINE_PROP_LINK("subsys", NvmeState, subsys_dev,
-                     TYPE_NVME_SUBSYSTEM_DEVICE, NvmeSubsystemDevice *),
     DEFINE_PROP_STRING("serial", NvmeState, params.serial),
-    DEFINE_PROP_UINT32("cmb_size_mb", NvmeState, params.cmb_size_mb, 0),
-    DEFINE_PROP_UINT32("num_queues", NvmeState, params.num_queues, 0),
-    DEFINE_PROP_UINT32("max_ioqpairs", NvmeState, params.max_ioqpairs, 64),
-    DEFINE_PROP_UINT16("msix_qsize", NvmeState, params.msix_qsize, 65),
     DEFINE_PROP_UINT8("aerl", NvmeState, params.aerl, 3),
-    DEFINE_PROP_UINT32("aer_max_queued", NvmeState, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeState, params.mdts, 7),
-    DEFINE_PROP_UINT8("vsl", NvmeState, params.vsl, 7),
-    DEFINE_PROP_BOOL("use-intel-id", NvmeState, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeState, params.legacy_cmb, false),
-    DEFINE_PROP_UINT8("zoned.zasl", NvmeState, params.zasl, 0),
-    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeState,
-                     params.auto_transition_zones, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static Property nvme_props[] = {
-    DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
+    DEFINE_PROP_LINK("subsys", NvmeState, subsys, TYPE_NVME_SUBSYSTEM,
+                     NvmeSubsystem *),
+
+    DEFINE_PROP_UINT16("cntlid", NvmeState, cntlid, 0),
+    DEFINE_PROP_UINT32("cmb-size-mb", NvmeState, params.cmb_size_mb, 0),
+    DEFINE_PROP_UINT32("max-aen-retention", NvmeState, params.aer_max_queued, 64),
+    DEFINE_PROP_UINT32("max-ioqpairs", NvmeState, params.max_ioqpairs, 64),
+    DEFINE_PROP_UINT16("msix-vectors", NvmeState, params.msix_qsize, 2048),
+
+    /* nvm command set specific properties */
+    DEFINE_PROP_UINT8("nvm-vsl", NvmeState, params.vsl, 7),
+
+    /* zoned command set specific properties */
+    DEFINE_PROP_UINT8("zoned-zasl", NvmeState, params.zasl, 0),
+    DEFINE_PROP_BOOL("zoned-auto-transition-zones", NvmeState,
+                     params.auto_transition_zones, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static Property nvme_legacy_props[] = {
+    DEFINE_BLOCK_PROPERTIES(NvmeCtrlLegacyDevice, namespace.blkconf),
+    DEFINE_PROP_LINK("subsys", NvmeCtrlLegacyDevice, subsys_dev,
+                     TYPE_NVME_SUBSYSTEM_DEVICE, NvmeSubsystemDevice *),
+    DEFINE_PROP_UINT32("cmb_size_mb", NvmeState, params.cmb_size_mb, 0),
+    DEFINE_PROP_UINT32("num_queues", NvmeState, params.num_queues, 0),
+    DEFINE_PROP_UINT32("aer_max_queued", NvmeState, params.aer_max_queued, 64),
+    DEFINE_PROP_UINT32("max_ioqpairs", NvmeState, params.max_ioqpairs, 64),
+    DEFINE_PROP_UINT16("msix_qsize", NvmeState, params.msix_qsize, 65),
+    DEFINE_PROP_BOOL("use-intel-id", NvmeState, params.use_intel_id, false),
+    DEFINE_PROP_UINT8("vsl", NvmeState, params.vsl, 7),
+    DEFINE_PROP_UINT8("zoned.zasl", NvmeState, params.zasl, 0),
+    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeState,
+                     params.auto_transition_zones, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -6719,7 +6766,6 @@ static void nvme_state_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
 
-    pc->realize = nvme_realize;
     pc->exit = nvme_exit;
     pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
     pc->revision = 2;
@@ -6753,25 +6799,45 @@ static const TypeInfo nvme_state_info = {
 static void nvme_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
+
+    pc->realize = nvme_realize;
+
     device_class_set_props(dc, nvme_props);
 }
 
-static void nvme_instance_init(Object *obj)
-{
-    NvmeCtrl *ctrl = NVME_DEVICE(obj);
-
-    device_add_bootindex_property(obj, &ctrl->namespace.blkconf.bootindex,
-                                  "bootindex", "/namespace@1,0",
-                                  DEVICE(obj));
-}
-
 static const TypeInfo nvme_info = {
     .name = TYPE_NVME_DEVICE,
     .parent = TYPE_NVME_STATE,
     .class_init = nvme_class_init,
     .instance_size = sizeof(NvmeCtrl),
-    .instance_init = nvme_instance_init,
-    .class_init = nvme_class_init,
+};
+
+static void nvme_legacy_instance_init(Object *obj)
+{
+    NvmeCtrlLegacyDevice *ctrl = NVME_DEVICE_LEGACY(obj);
+
+    device_add_bootindex_property(obj, &ctrl->namespace.blkconf.bootindex,
+                                  "bootindex", "/namespace@1,0",
+                                  DEVICE(obj));
+}
+
+static void nvme_legacy_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
+
+    pc->realize = nvme_legacy_realize;
+
+    device_class_set_props(dc, nvme_legacy_props);
+}
+
+static const TypeInfo nvme_legacy_info = {
+    .name = TYPE_NVME_DEVICE_LEGACY,
+    .parent = TYPE_NVME_STATE,
+    .class_init = nvme_legacy_class_init,
+    .instance_size = sizeof(NvmeCtrlLegacyDevice),
+    .instance_init = nvme_legacy_instance_init,
 };
 
 static const TypeInfo nvme_bus_info = {
@@ -6780,11 +6846,12 @@ static const TypeInfo nvme_bus_info = {
     .instance_size = sizeof(NvmeBus),
 };
 
-static void nvme_register_types(void)
+static void register_types(void)
 {
     type_register_static(&nvme_state_info);
     type_register_static(&nvme_info);
+    type_register_static(&nvme_legacy_info);
     type_register_static(&nvme_bus_info);
 }
 
-type_init(nvme_register_types)
+type_init(register_types)
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 757a90b58ea8..90fc8d810ae0 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -262,7 +262,7 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
     NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
     NvmeNamespace *ns = NULL;
     BusState *s = qdev_get_parent_bus(dev);
-    NvmeCtrl *ctrl = NVME_DEVICE(s->parent);
+    NvmeCtrlLegacyDevice *ctrl = NVME_DEVICE_LEGACY(s->parent);
     NvmeState *n = NVME_STATE(ctrl);
     NvmeSubsystem *subsys = n->subsys;
     uint32_t nsid = nsdev->params.nsid;
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 5e516f8fb377..613aaab3ccd2 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -38,9 +38,12 @@ typedef struct NvmeNamespace NvmeNamespace;
 #define TYPE_NVME_STATE "nvme-state"
 OBJECT_DECLARE_SIMPLE_TYPE(NvmeState, NVME_STATE)
 
-#define TYPE_NVME_DEVICE "nvme"
+#define TYPE_NVME_DEVICE "x-nvme-ctrl"
 OBJECT_DECLARE_SIMPLE_TYPE(NvmeCtrl, NVME_DEVICE)
 
+#define TYPE_NVME_DEVICE_LEGACY "nvme"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeCtrlLegacyDevice, NVME_DEVICE_LEGACY)
+
 #define TYPE_NVME_BUS "nvme-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
 
@@ -400,6 +403,10 @@ typedef struct NvmeState {
 
 typedef struct NvmeCtrl {
     NvmeState parent_obj;
+} NvmeCtrl;
+
+typedef struct NvmeCtrlLegacyDevice {
+    NvmeState parent_obj;
 
     NvmeBus bus;
 
@@ -407,7 +414,7 @@ typedef struct NvmeCtrl {
     NvmeNamespaceDevice namespace;
 
     NvmeSubsystemDevice *subsys_dev;
-} NvmeCtrl;
+} NvmeCtrlLegacyDevice;
 
 static inline NvmeNamespace *nvme_ns(NvmeState *n, uint32_t nsid)
 {
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index e4dcd8fd20a5..48700ca06aa6 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -16,20 +16,29 @@
 int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n,
                               Error **errp)
 {
-    int cntlid, nsid;
+    int nsid;
 
-    for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
-        if (!subsys->ctrls[cntlid]) {
-            break;
+    if (!n->cntlid) {
+        int cntlid;
+
+        for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
+            if (!subsys->ctrls[cntlid]) {
+                break;
+            }
         }
-    }
 
-    if (cntlid == ARRAY_SIZE(subsys->ctrls)) {
-        error_setg(errp, "no more free controller id");
+        if (cntlid == ARRAY_SIZE(subsys->ctrls)) {
+            error_setg(errp, "no more free controller identifiers");
+            return -1;
+        }
+
+        n->cntlid = cntlid;
+    } else if (subsys->ctrls[n->cntlid]) {
+        error_setg(errp, "controller identifier already assigned");
         return -1;
     }
 
-    subsys->ctrls[cntlid] = n;
+    subsys->ctrls[n->cntlid] = n;
 
     for (nsid = 1; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
         NvmeNamespace *ns = subsys->namespaces[nsid];
@@ -38,7 +47,7 @@ int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n,
         }
     }
 
-    return cntlid;
+    return 0;
 }
 
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n)
-- 
2.33.0


