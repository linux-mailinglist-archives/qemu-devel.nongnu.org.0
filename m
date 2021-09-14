Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077BB40B9EE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 23:15:51 +0200 (CEST)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFmP-0007fa-TY
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 17:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFC6-0005u1-W3; Tue, 14 Sep 2021 16:38:19 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:57923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFC4-0004vF-Oa; Tue, 14 Sep 2021 16:38:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BE7C932009E0;
 Tue, 14 Sep 2021 16:38:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 16:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9RvYsixCeIiSU
 fyMC0esy/uw/E9o+2NOz+04V4BTEqQ=; b=CbA0733jJqyKH3KIVevffP23Slbip
 mXjYD5fndlkW4J97P5y6LZg877riY64evrnY1k6kIMmHorI71IKebkczPdZ8/M9P
 GjVFxsaEO7YQir/ktz0nCcG4frhQwJ2MxFjtgvzd3bZt3Kn0vArNHJcOtc2OZDRp
 Zj+cdEr4DI6a/UzbyD2OIeDP5wQeJvawpDcNmnIE6bGKY4swu13v4bPgTS0zeCxx
 Ua8YvFizeBFWz+J7sZB7Ds5nQcfZkzuX0BUIQPB315cWWlaZOzBpeSbAa0Ow91wZ
 GAOKxSQKCgot/vVZkCH9SQcFIl5+hBjUc7Fmgq5nk5OBS0wBxcLCpjmkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=9RvYsixCeIiSUfyMC0esy/uw/E9o+2NOz+04V4BTEqQ=; b=BCD3K14f
 q4RfcWlIJQ9MQTKqf0DgxlTHZ5/qe13AAhbO6hUM07y6HWykLR2/WCeGNi1xhXd8
 AD4GMFJ4Y9x91mJ9F1S/Y+oJ3MasEqvctdOx6rC5BdUzcqf20vwa9OLTcRfpv7wN
 lKOv7Ao/EqWDoNxTcIZn+bIHVdWYSX9qrIZVFWnyCn8oTZxAhMnYVTTUzH6kvDV6
 hkYJ/mk45EYmQQVI2iU+0N7YlpveJYundysPXKfcwLfm19akLuimGMt0p9d8uQyW
 1aFDHopvzoYy7R5KvhVrwf+/Odsd6ObEdE0mwiADnTikMxdZHLzxszG39Bwp92C+
 oOaKfhxjAPIzvw==
X-ME-Sender: <xms:NghBYYSwdLw0fjUTvAm91lpNKwMCJTpQMjopnt81b-KgLSCdjM1Eog>
 <xme:NghBYVzc6437bJxbA21aQwWHfww00H507nAOdZ0eTmzvsE9cilkFecUttYK99gzbu
 TTuBUrtJEuIKEQEH7M>
X-ME-Received: <xmr:NghBYV3TlzlOkl0esuPCjtZe20uUJ6iFIBm2qA1yZgl7uE7VNtU2-VdfqFQe637eS4NJchIDtJ7o3Vo3Kudeuge53bJyYNjW-XaAzPhlCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteehhfevffejieeiieehkedtkeejgfevveejgefftefhteeigfdvvedtuddu
 geegnecuffhomhgrihhnpedvtddvuddqtdekrdhorhhgpddvtdduledqtdekrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshes
 ihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NghBYcD4KbILeYm-Xu1h4IkOe4OCQzqBgDmePtZnYMvSGj7RM0JsNQ>
 <xmx:NghBYRgun57pMjjvBpJeTWngtdXNtVAXUiWwxQ2pTzS7xWBNkFAqwA>
 <xmx:NghBYYrMNlwWhp26JgZCXQW8XNTz3Pq5o75Pt1Y5VeuOHc5oafSrNw>
 <xmx:NghBYSVNBq16NzQuymbLfQWM_x3gwG86CAdufXc2qSXMoftL-dHl4w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:12 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 10/13] hw/nvme: add experimental object x-nvme-subsystem
Date: Tue, 14 Sep 2021 22:37:34 +0200
Message-Id: <20210914203737.182571-11-its@irrelevant.dk>
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

Add a basic user creatable object that models an NVMe NVM subsystem.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c   |  26 +++++++---
 hw/nvme/ns.c     |   5 +-
 hw/nvme/nvme.h   |  30 ++++++++----
 hw/nvme/subsys.c | 121 +++++++++++++++++++++++++++++++++++++++--------
 qapi/qom.json    |  17 +++++++
 5 files changed, 162 insertions(+), 37 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ec63338b5bfc..563a8f8ad1df 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6526,7 +6526,7 @@ static int nvme_init_subsys(NvmeState *n, Error **errp)
         return 0;
     }
 
-    cntlid = nvme_subsys_register_ctrl(n, errp);
+    cntlid = nvme_subsys_register_ctrl(n->subsys, n, errp);
     if (cntlid < 0) {
         return -1;
     }
@@ -6557,6 +6557,12 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
+    if (!n->subsys) {
+        error_setg(errp, "device '%s' requires the 'subsys' parameter",
+                   TYPE_NVME_DEVICE);
+        return;
+    }
+
     nvme_init_state(n);
     if (nvme_init_pci(n, pci_dev, errp)) {
         return;
@@ -6574,10 +6580,14 @@ static void nvme_legacy_realize(PCIDevice *pci_dev, Error **errp)
     NvmeState *n = NVME_STATE(pci_dev);
     NvmeCtrlLegacyDevice *ctrl = NVME_DEVICE_LEGACY(n);
 
-    if (ctrl->namespace.blkconf.blk && n->subsys) {
-        error_setg(errp, "subsystem support is unavailable with legacy "
-                   "namespace ('drive' property)");
-        return;
+    if (ctrl->subsys_dev) {
+        if (ctrl->namespace.blkconf.blk) {
+            error_setg(errp, "subsystem support is unavailable with legacy "
+                       "namespace ('drive' property)");
+            return;
+        }
+
+        n->subsys = &ctrl->subsys_dev->subsys;
     }
 
     if (nvme_check_constraints(n, errp)) {
@@ -6647,8 +6657,6 @@ static void nvme_exit(PCIDevice *pci_dev)
 static Property nvme_state_props[] = {
     DEFINE_PROP_LINK("pmrdev", NvmeState, pmr.dev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
-    DEFINE_PROP_LINK("subsys", NvmeState, subsys, TYPE_NVME_SUBSYS,
-                     NvmeSubsystem *),
     DEFINE_PROP_STRING("serial", NvmeState, params.serial),
     DEFINE_PROP_UINT8("aerl", NvmeState, params.aerl, 3),
     DEFINE_PROP_UINT8("mdts", NvmeState, params.mdts, 7),
@@ -6657,6 +6665,8 @@ static Property nvme_state_props[] = {
 };
 
 static Property nvme_props[] = {
+    DEFINE_PROP_LINK("subsys", NvmeState, subsys, TYPE_NVME_SUBSYSTEM,
+                     NvmeSubsystem *),
     DEFINE_PROP_UINT32("cmb-size-mb", NvmeState, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("max-aen-retention", NvmeState, params.aer_max_queued, 64),
     DEFINE_PROP_UINT32("max-ioqpairs", NvmeState, params.max_ioqpairs, 64),
@@ -6674,6 +6684,8 @@ static Property nvme_props[] = {
 
 static Property nvme_legacy_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrlLegacyDevice, namespace.blkconf),
+    DEFINE_PROP_LINK("subsys", NvmeCtrlLegacyDevice, subsys_dev,
+                     TYPE_NVME_SUBSYS_DEVICE, NvmeSubsystemDevice *),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeState, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeState, params.num_queues, 0),
     DEFINE_PROP_UINT32("aer_max_queued", NvmeState, params.aer_max_queued, 64),
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index bdd41a3d1fc3..3d643554644c 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -493,7 +493,8 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
     NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
     NvmeNamespace *ns = &nsdev->ns;
     BusState *s = qdev_get_parent_bus(dev);
-    NvmeState *n = NVME_STATE(s->parent);
+    NvmeCtrlLegacyDevice *ctrl = NVME_DEVICE_LEGACY(s->parent);
+    NvmeState *n = NVME_STATE(ctrl);
     NvmeSubsystem *subsys = n->subsys;
     uint32_t nsid = nsdev->params.nsid;
     int i;
@@ -515,7 +516,7 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
          * If this namespace belongs to a subsystem (through a link on the
          * controller device), reparent the device.
          */
-        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
+        if (!qdev_set_parent_bus(dev, &ctrl->subsys_dev->bus.parent_bus, errp)) {
             return;
         }
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 629a8ccab9f8..1ae185139132 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -48,24 +48,36 @@ typedef struct NvmeBus {
     BusState parent_bus;
 } NvmeBus;
 
-#define TYPE_NVME_SUBSYS "nvme-subsys"
-#define NVME_SUBSYS(obj) \
-    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
+#define TYPE_NVME_SUBSYSTEM "x-nvme-subsystem"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeSubsystem, NVME_SUBSYSTEM)
 
 typedef struct NvmeSubsystem {
-    DeviceState parent_obj;
-    NvmeBus     bus;
-    uint8_t     subnqn[256];
+    Object parent_obj;
+
+    QemuUUID uuid;
+    uint8_t  subnqn[256];
 
     NvmeState     *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
+} NvmeSubsystem;
+
+#define TYPE_NVME_SUBSYS_DEVICE "nvme-subsys"
+#define NVME_SUBSYS_DEVICE(obj) \
+    OBJECT_CHECK(NvmeSubsystemDevice, (obj), TYPE_NVME_SUBSYS_DEVICE)
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
 
-int nvme_subsys_register_ctrl(NvmeState *n, Error **errp);
+int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n,
+                              Error **errp);
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n);
 
 static inline NvmeState *nvme_subsys_ctrl(NvmeSubsystem *subsys,
@@ -469,6 +481,8 @@ typedef struct NvmeCtrlLegacyDevice {
 
     /* for use with legacy single namespace (-device nvme,drive=...) setups */
     NvmeNamespaceDevice namespace;
+
+    NvmeSubsystemDevice *subsys_dev;
 } NvmeCtrlLegacyDevice;
 
 static inline NvmeNamespace *nvme_ns(NvmeState *n, uint32_t nsid)
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 2442ae83b744..26e8e087e986 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -8,12 +8,12 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qom/object_interfaces.h"
 
 #include "nvme.h"
 
-int nvme_subsys_register_ctrl(NvmeState *n, Error **errp)
+int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n, Error **errp)
 {
-    NvmeSubsystem *subsys = n->subsys;
     int cntlid;
 
     for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
@@ -37,53 +37,134 @@ void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n)
     subsys->ctrls[n->cntlid] = NULL;
 }
 
-static void nvme_subsys_setup(NvmeSubsystem *subsys)
+static char *get_subnqn(Object *obj, Error **errp)
 {
-    const char *nqn = subsys->params.nqn ?
-        subsys->params.nqn : subsys->parent_obj.id;
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(obj);
+    return g_strdup((char *)subsys->subnqn);
+}
+
+static void set_subnqn(Object *obj, const char *str, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(obj);
+    snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn), "%s", str);
+}
+
+static char *get_uuid(Object *obj, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(obj);
+    char buf[UUID_FMT_LEN + 1];
+
+    qemu_uuid_unparse(&subsys->uuid, buf);
+
+    return g_strdup(buf);
+}
+
+static void set_uuid(Object *obj, const char *str, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(obj);
+
+    if (!strcmp(str, "auto")) {
+        qemu_uuid_generate(&subsys->uuid);
+    } else if (qemu_uuid_parse(str, &subsys->uuid) < 0) {
+        error_setg(errp, "invalid uuid");
+        return;
+    }
+}
+
+static void subsys_complete(UserCreatable *uc, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(uc);
+
+    if (qemu_uuid_is_null(&subsys->uuid)) {
+        qemu_uuid_generate(&subsys->uuid);
+    }
+
+    if (strcmp((char *)subsys->subnqn, "")) {
+        char buf[UUID_FMT_LEN + 1];
+
+        qemu_uuid_unparse(&subsys->uuid, buf);
+
+        snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
+                 "nqn.2021-08.org.qemu:uuid:%s", buf);
+    }
+}
+
+static void subsys_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+    ucc->complete = subsys_complete;
+
+    object_class_property_add_str(oc, "subnqn", get_subnqn, set_subnqn);
+    object_class_property_set_description(oc, "subnqn", "the NVM Subsystem "
+                                          "NVMe Qualified Name; "
+                                          "(default: nqn.2021-08.org.qemu:uuid:<UUID>)");
+
+    object_class_property_add_str(oc, "uuid", get_uuid, set_uuid);
+    object_class_property_set_description(oc, "subnqn", "NVM Subsystem UUID "
+                                          "(\"auto\" for random value; "
+                                          "default: auto)");
+}
+
+static const TypeInfo subsys_info = {
+    .name = TYPE_NVME_SUBSYSTEM,
+    .parent = TYPE_OBJECT,
+    .class_init = subsys_class_init,
+    .instance_size = sizeof(NvmeSubsystem),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { },
+    }
+};
+
+static void subsys_dev_setup(NvmeSubsystemDevice *dev)
+{
+    NvmeSubsystem *subsys = &dev->subsys;
+    const char *nqn = dev->params.nqn ?
+        dev->params.nqn : dev->parent_obj.id;
 
     snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
              "nqn.2019-08.org.qemu:%s", nqn);
 }
 
-static void nvme_subsys_realize(DeviceState *dev, Error **errp)
+static void subsys_dev_realize(DeviceState *dev, Error **errp)
 {
-    NvmeSubsystem *subsys = NVME_SUBSYS(dev);
+    NvmeSubsystemDevice *subsys = NVME_SUBSYS_DEVICE(dev);
 
     qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
                         dev->id);
 
-    nvme_subsys_setup(subsys);
+    subsys_dev_setup(subsys);
 }
 
-static Property nvme_subsystem_props[] = {
-    DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
+static Property subsys_dev_props[] = {
+    DEFINE_PROP_STRING("nqn", NvmeSubsystemDevice, params.nqn),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void nvme_subsys_class_init(ObjectClass *oc, void *data)
+static void subsys_dev_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 
-    dc->realize = nvme_subsys_realize;
+    dc->realize = subsys_dev_realize;
     dc->desc = "Virtual NVMe subsystem";
     dc->hotpluggable = false;
 
-    device_class_set_props(dc, nvme_subsystem_props);
+    device_class_set_props(dc, subsys_dev_props);
 }
 
-static const TypeInfo nvme_subsys_info = {
-    .name = TYPE_NVME_SUBSYS,
+static const TypeInfo subsys_dev_info = {
+    .name = TYPE_NVME_SUBSYS_DEVICE,
     .parent = TYPE_DEVICE,
-    .class_init = nvme_subsys_class_init,
-    .instance_size = sizeof(NvmeSubsystem),
+    .class_init = subsys_dev_class_init,
+    .instance_size = sizeof(NvmeSubsystemDevice),
 };
 
-static void nvme_subsys_register_types(void)
+static void register_types(void)
 {
-    type_register_static(&nvme_subsys_info);
+    type_register_static(&subsys_info);
+    type_register_static(&subsys_dev_info);
 }
 
-type_init(nvme_subsys_register_types)
+type_init(register_types)
diff --git a/qapi/qom.json b/qapi/qom.json
index 6d5f4a88e644..8d7c968fbd88 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -647,6 +647,21 @@
             '*hugetlbsize': 'size',
             '*seal': 'bool' } }
 
+##
+# @NvmeSubsystemProperties:
+#
+# Properties for nvme-subsys objects.
+#
+# @subnqn: the NVM Subsystem NVMe Qualified Name
+#
+# @uuid: the UUID of the subsystem. Used as default in subnqn.
+#
+# Since: 6.1
+##
+{ 'struct': 'NvmeSubsystemProperties',
+  'data': { 'subnqn': 'str',
+            '*uuid': 'str' } }
+
 ##
 # @PrManagerHelperProperties:
 #
@@ -797,6 +812,7 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
+    'x-nvme-subsystem',
     'pef-guest',
     'pr-manager-helper',
     'qtest',
@@ -855,6 +871,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'x-nvme-subsystem':           'NvmeSubsystemProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
-- 
2.33.0


