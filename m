Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289A40B9A6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 23:10:01 +0200 (CEST)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFgl-0004gz-LC
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 17:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFC4-0005nl-1y; Tue, 14 Sep 2021 16:38:16 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:56981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFC1-0004t8-WA; Tue, 14 Sep 2021 16:38:15 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E39C132009DF;
 Tue, 14 Sep 2021 16:38:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 16:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Nvv30IUxX1/fX
 GCuw5r6lH8h3YQHnynoFY0+RMDirUM=; b=gdVcnl8FdnpzT3AROohP2KN5JdVPz
 FHJBG4ua6x8QG+4uoyybP0R6nFk4U6jfuniEG7LFwTsuc9CBv+Cly4vHgSPyCFjX
 mnlNESnPghqV7vhMZ/joD2F5UCfylVS/JmwdgFNRLEt97/dZi9p+qLLzFUM4tr35
 dSxyMMpUKZBwC+BehcK3hmXYiRQuhNq8wg1OCfhSyMXIBi/KaGC+qsaOF8PZ+Br8
 q0cQkRnZKQqhS0pJv6bYdSvl7otihVrVgtP/WECv05QuHqO1MW7OQiGQ7RVHap9b
 2yI/e8Ea35oDR42vrIc6P0sO4QLDmUQuSqtuQoOyIPwzMUosgWP6DjP/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Nvv30IUxX1/fXGCuw5r6lH8h3YQHnynoFY0+RMDirUM=; b=SEqNFerJ
 eDrDRY7mKOcoXfn49YFo7RO1+vzxWw7MnyL+IwHFTmTHmIqAmiiUHwHKv4gxReOR
 B0F+qmcvt8i/sEUgGJxdEqBT40BOJuzESK7MMLuc3CrkDApyny6hmfK1lNNx0zMZ
 +lkxqNy6/0B2rdqpBDSU6xN4N3jclw/Tk8oNBpVJOPvo9QPxrIUHHCi6zdbnEQyH
 5WvS0IkBWjUQFT350z0jSfEOhgbpqPPqTIiJIf54ZrXrT6vvalOeTYKRjTH8N3te
 SC+59Pq/JFuBIpSHbaA1R6+RMntVEM+USO74Vwz+5cApOXPuwYAfeW3wvku2CAJi
 Ya9GCUyBSyGglA==
X-ME-Sender: <xms:MwhBYYxWULYfn2KhCt0u8nBGe6MCCnPjMpUmDnv0sjCek-9dDekuDg>
 <xme:MwhBYcS9_EbkJX1kSDbHV-45sCRJD5nEbrjazIpn5VyC9hzJ2Pqj0Kus5_iEj0fw5
 JQvM2KpjqyojVqGPmg>
X-ME-Received: <xmr:MwhBYaU8KyyxolO7HKKET-sl7eyaKV0wPTcx9VZYqfkB6YP4eaKUvhNqfx4caEK6hdfOI2_Raz0WyPEfqIjdoYWBh3rx7QyNrBjjwg5e5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MwhBYWh85Ok8I-sv8JnQ3DjbyatwnMm6Lb61KeSB2IA-2MZCeWpM4g>
 <xmx:MwhBYaAsMvqqLVLat7qSsCNQNBFK-EQhrKPU6N0fkr0Tj9C-FQUJBg>
 <xmx:MwhBYXJc2_81GSWf5n3rlKrbn5Uo__zrvEY8p0nJ1iQVkqKT3lL3PQ>
 <xmx:MwhBYW2Y5h-TvNJwde89mQpNHxuDHA8RIvLnBf9uHNSCY6TYz4322Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:10 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 09/13] hw/nvme: add experimental device x-nvme-ctrl
Date: Tue, 14 Sep 2021 22:37:33 +0200
Message-Id: <20210914203737.182571-10-its@irrelevant.dk>
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

Add a new experimental 'x-nvme-ctrl' device which allows us to get rid
of a bunch of legacy options and slightly change others to better use
the qdev property system.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 111 +++++++++++++++++++++++++++++++++++++------------
 hw/nvme/nvme.h |  11 ++++-
 2 files changed, 93 insertions(+), 29 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6a4f07b8d114..ec63338b5bfc 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6551,8 +6551,28 @@ void nvme_attach_ns(NvmeState *n, NvmeNamespace *ns)
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
-    NvmeCtrl *ctrl = NVME_DEVICE(pci_dev);
-    NvmeState *n = NVME_STATE(ctrl);
+    NvmeState *n = NVME_STATE(pci_dev);
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
 
     if (ctrl->namespace.blkconf.blk && n->subsys) {
         error_setg(errp, "subsystem support is unavailable with legacy "
@@ -6575,6 +6595,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     if (nvme_init_subsys(n, errp)) {
         return;
     }
+
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
@@ -6629,24 +6650,40 @@ static Property nvme_state_props[] = {
     DEFINE_PROP_LINK("subsys", NvmeState, subsys, TYPE_NVME_SUBSYS,
                      NvmeSubsystem *),
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
 
@@ -6702,7 +6739,6 @@ static void nvme_state_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
 
-    pc->realize = nvme_realize;
     pc->exit = nvme_exit;
     pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
     pc->revision = 2;
@@ -6736,25 +6772,45 @@ static const TypeInfo nvme_state_info = {
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
@@ -6763,11 +6819,12 @@ static const TypeInfo nvme_bus_info = {
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
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 980a471e195f..629a8ccab9f8 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -35,9 +35,12 @@ typedef struct NvmeNamespace NvmeNamespace;
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
 
@@ -457,12 +460,16 @@ typedef struct NvmeState {
 
 typedef struct NvmeCtrl {
     NvmeState parent_obj;
+} NvmeCtrl;
+
+typedef struct NvmeCtrlLegacyDevice {
+    NvmeState parent_obj;
 
     NvmeBus bus;
 
     /* for use with legacy single namespace (-device nvme,drive=...) setups */
     NvmeNamespaceDevice namespace;
-} NvmeCtrl;
+} NvmeCtrlLegacyDevice;
 
 static inline NvmeNamespace *nvme_ns(NvmeState *n, uint32_t nsid)
 {
-- 
2.33.0


