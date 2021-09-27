Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96FD418EA9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:28:03 +0200 (CEST)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjBK-0001GD-Mp
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2M-0003MS-4y; Mon, 27 Sep 2021 01:18:46 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:39165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2K-0000Ho-0l; Mon, 27 Sep 2021 01:18:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 890EF2B01210;
 Mon, 27 Sep 2021 01:18:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 27 Sep 2021 01:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=UR/e9aCVn9FNh
 TyZUBSq9J9lnVuyv15+sBoph5fvb8M=; b=b072BLFX3Wj6vnsjJyckizCNBNSx1
 dhmrQYxFjRjjfGPCDPQLNu5V5tVZ4euTbeAmRxKk7pK+rr+ikIVELkGI1rtr15Q4
 k9+QI/thbz4PLSDSjXjqgKLWwN7WY7n3YD5dW8q+y6rQ07ZZjwZMp49khsm9ujUB
 lxbRNUgiXeIppCpVnsAhYIn9eF/fFVWoT8/7o4XkPuo3Shn0CyzYZMaT9sSpOpIr
 bbqFN/5IZmrcKG8ZbIW1Ph8NVzn/ktha+mc6O+3e9EY2ttpSoHU9x/WPTHynmWqL
 HzFuJOQhA5IU3iXFXSOBmph/sPcn/nRHgghzgCtupUOKei6GCOvYJAWNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UR/e9aCVn9FNhTyZUBSq9J9lnVuyv15+sBoph5fvb8M=; b=sUVpNTnb
 Dof9QJm2EWTH2w6kAqKlAVI2igxQtIg8/jZ71jSCgd/UxwmiMtDffmVUJdF9Fnx2
 5Soo124CxSbJFYJ1HEYwYnWn8OZCZkjhJh8iZ2k64IQ8DGI7yGOizxSv/SLDi2M1
 7HIMV1+06ESRzTqgddQ1dtInJB64Xj+UZFgbRN/b7vl/aSUDZxfevoMTpaNP41be
 3BWDKKVz7A+wcKMTXADF7TCzzdlO03ccRVEW0kNvUh/WSW0vTOxhB3DqPgCQYc3T
 tLFT/ZoTo2KJhSpOezBGGPGuUhmwIR/y9xjhtSGao22P65CvIwd7ugOaFR3669yt
 rfPdCiVqB/ZuvA==
X-ME-Sender: <xms:MFRRYfqKCtsh2gCjiIUFeOaDLPk91zeR16SKRw6W4K9WAdUYg_eROA>
 <xme:MFRRYZrkx-5-oeFrq3B7RAJG6Tw9hBW_209-azgDexOGV258_lhX3nXsZa7lB-jYB
 R6bC5LVFlqT40Cj33E>
X-ME-Received: <xmr:MFRRYcMJ14MF5gt791HB8EQvZGDuHFLGXNDMZnvAdZbcYk0Qc4MkNX1A_JoKZvQi99rryxzgwTx9Z2vo3gmVf5QQzgTeNL-lb3MU1lPtaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeltdetfeegkefguedvtdduffejiedvjeejudejieelveekhfekvdefleeludev
 ffenucffohhmrghinhepvddtudelqddtkedrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MFRRYS7G-7PP8ywZRCIPHQftMmg6VgrZFow6axjeqhQEIaVNA9dgbQ>
 <xmx:MFRRYe557KgyyYCuUXFBSYymFXWiVgbySYzDs08KJ7KTRB9P7KZBtQ>
 <xmx:MFRRYahaiq6TVgsA-3Ia5rdIArd7PlGrUXBixXZcLxpIZn_sgN1uTA>
 <xmx:MVRRYRpqjb1k5unB_MQfyp-DS8NgtLP5NxF8BQGRCG5aDSNvS449-qxv0Zs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:38 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 09/16] hw/nvme: hoist qdev state from subsystem
Date: Mon, 27 Sep 2021 07:17:52 +0200
Message-Id: <20210927051759.447305-10-its@irrelevant.dk>
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c   | 10 +++++++---
 hw/nvme/ns.c     |  2 +-
 hw/nvme/nvme.h   | 24 +++++++++++++++---------
 hw/nvme/subsys.c | 36 ++++++++++++++++++------------------
 4 files changed, 41 insertions(+), 31 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 67600d075d32..af2a783ba4c0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6539,7 +6539,7 @@ static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
         return 0;
     }
 
-    cntlid = nvme_subsys_register_ctrl(n, errp);
+    cntlid = nvme_subsys_register_ctrl(n->subsys, n, errp);
     if (cntlid < 0) {
         return -1;
     }
@@ -6567,6 +6567,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     NvmeCtrl *n = NVME(pci_dev);
     Error *local_err = NULL;
 
+    if (n->subsys_dev) {
+        n->subsys = &n->subsys_dev->subsys;
+    }
+
     nvme_check_constraints(n, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -6637,8 +6641,8 @@ static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
     DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmr.dev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
-    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
-                     NvmeSubsystem *),
+    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys_dev, TYPE_NVME_SUBSYSTEM_DEVICE,
+                     NvmeSubsystemDevice *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 582ff7d0236b..d67632174530 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -509,7 +509,7 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
          * If this namespace belongs to a subsystem (through a link on the
          * controller device), reparent the device.
          */
-        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
+        if (!qdev_set_parent_bus(dev, &n->subsys_dev->bus.parent_bus, errp)) {
             return;
         }
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 356d95805f9e..e8f4b8e3e2e0 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -40,24 +40,29 @@ typedef struct NvmeBus {
     BusState parent_bus;
 } NvmeBus;
 
-#define TYPE_NVME_SUBSYS "nvme-subsys"
-#define NVME_SUBSYS(obj) \
-    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
-
 typedef struct NvmeSubsystem {
-    DeviceState parent_obj;
-    NvmeBus     bus;
     uint8_t     subnqn[256];
 
     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
+} NvmeSubsystem;
+
+#define TYPE_NVME_SUBSYSTEM_DEVICE "nvme-subsys"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeSubsystemDevice, NVME_SUBSYSTEM_DEVICE)
+
+typedef struct NvmeSubsystemDevice {
+    DeviceState parent_obj;
+    NvmeBus     bus;
+
+    NvmeSubsystem subsys;
 
     struct {
         char *nqn;
     } params;
-} NvmeSubsystem;
+} NvmeSubsystemDevice;
 
-int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n,
+                              Error **errp);
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n);
 
 static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
@@ -436,7 +441,8 @@ typedef struct NvmeCtrl {
 #define NVME_CHANGED_NSID_SIZE  (NVME_MAX_NAMESPACES + 1)
     DECLARE_BITMAP(changed_nsids, NVME_CHANGED_NSID_SIZE);
 
-    NvmeSubsystem   *subsys;
+    NvmeSubsystem       *subsys;
+    NvmeSubsystemDevice *subsys_dev;
 
     NvmeNamespaceDevice namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 5a9405d05fbe..4d73d14070dc 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -11,9 +11,8 @@
 
 #include "nvme.h"
 
-int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
+int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n, Error **errp)
 {
-    NvmeSubsystem *subsys = n->subsys;
     int cntlid, nsid;
 
     for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
@@ -45,53 +44,54 @@ void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
     n->cntlid = -1;
 }
 
-static void nvme_subsys_setup(NvmeSubsystem *subsys)
+static void nvme_subsys_device_setup(NvmeSubsystemDevice *dev)
 {
-    const char *nqn = subsys->params.nqn ?
-        subsys->params.nqn : subsys->parent_obj.id;
+    NvmeSubsystem *subsys = &dev->subsys;
+    const char *nqn = dev->params.nqn ?
+        dev->params.nqn : dev->parent_obj.id;
 
     snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
              "nqn.2019-08.org.qemu:%s", nqn);
 }
 
-static void nvme_subsys_realize(DeviceState *dev, Error **errp)
+static void nvme_subsys_device_realize(DeviceState *dev, Error **errp)
 {
-    NvmeSubsystem *subsys = NVME_SUBSYS(dev);
+    NvmeSubsystemDevice *subsys = NVME_SUBSYSTEM_DEVICE(dev);
 
     qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
                         dev->id);
 
-    nvme_subsys_setup(subsys);
+    nvme_subsys_device_setup(subsys);
 }
 
-static Property nvme_subsystem_props[] = {
-    DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
+static Property nvme_subsystem_device_props[] = {
+    DEFINE_PROP_STRING("nqn", NvmeSubsystemDevice, params.nqn),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void nvme_subsys_class_init(ObjectClass *oc, void *data)
+static void nvme_subsys_device_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 
-    dc->realize = nvme_subsys_realize;
+    dc->realize = nvme_subsys_device_realize;
     dc->desc = "Virtual NVMe subsystem";
     dc->hotpluggable = false;
 
-    device_class_set_props(dc, nvme_subsystem_props);
+    device_class_set_props(dc, nvme_subsystem_device_props);
 }
 
-static const TypeInfo nvme_subsys_info = {
-    .name = TYPE_NVME_SUBSYS,
+static const TypeInfo nvme_subsys_device_info = {
+    .name = TYPE_NVME_SUBSYSTEM_DEVICE,
     .parent = TYPE_DEVICE,
-    .class_init = nvme_subsys_class_init,
-    .instance_size = sizeof(NvmeSubsystem),
+    .class_init = nvme_subsys_device_class_init,
+    .instance_size = sizeof(NvmeSubsystemDevice),
 };
 
 static void nvme_subsys_register_types(void)
 {
-    type_register_static(&nvme_subsys_info);
+    type_register_static(&nvme_subsys_device_info);
 }
 
 type_init(nvme_subsys_register_types)
-- 
2.33.0


