Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8F418ED3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:54:52 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjbH-0004s4-7w
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2U-0003fU-LY; Mon, 27 Sep 2021 01:18:54 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:47465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2S-0000Os-7K; Mon, 27 Sep 2021 01:18:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B89682B01215;
 Mon, 27 Sep 2021 01:18:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 27 Sep 2021 01:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=v+TeP58r9HCCS
 zTGXmrxPSlB17ufLDToEjdmHrP2U0E=; b=YzpALq4GcKPAVc1ndvmaw4Yr2IO9H
 5Ay4oVzG4t4iSA4lnHJ210piZCIGOGr8SsHaBuXAlyl7V/wtfzpcIj4R9n9QouCy
 AYTCTQlPwsZjuWu15OSHCPHHkoSxGkTU3fl4IIv2ZNBgL8VnLlBxKZFEqUUsYONM
 pr3m9osrGsmixahoY50B3RHny9HRiNKAWJjU4RLJharjtkfRdtf3/Bv7LPyzrxZC
 LWtNq2O5jfgVz3PDytzaexaRT5u0rxx2LZuPba5JReXzc76Ra6nPR7cmXtWUwaaY
 AK0mzzccHOOIEDM7HFm0nsxWUv19X7iIYKGjztM/+31Cp0aIh7tmg/JAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=v+TeP58r9HCCSzTGXmrxPSlB17ufLDToEjdmHrP2U0E=; b=vb49OF4i
 OfIoDQmw+Bl8mNE9IgVfRBo68huEsAFBBqc3xCyjmnISe7YjC6r+PmIFVOmPvbc/
 Lfg8VxaKb7DgHad+/nrimqEOYBuF4sLXq3W9pvf7viQzWur0bEQFaFCLTD1C2VBq
 0Wzo+d62NwJLXNRkCM1lPNaVzEIGIrhXiQXayPzbVhHwn+AT0jMydXnA7mgxCnTj
 q2Q2Eetch/V8cNQjv9+xmNuuY1qD8ozL7M+gJjLSYZ4/M79dW1wBRLK08FoZevVQ
 RIDJDGKAVtZbg1VbQlcyAEwupAXcoYiThhsP8DRulTSGJfBI78Rh943tGiHp1+pC
 9BxDsBD5JjurEg==
X-ME-Sender: <xms:OVRRYWY4yEwB_G3HdwjpPuu4SWzD6ZBEg2VFd_fF1Js57p8Zl4vonw>
 <xme:OVRRYZbD6U0GHjlS6fBah6qYVjHrLucMuqiQjCWk3aYVpfAJOBLx-AJHVhcJM91oM
 LjfxG6cezq-ptdV3uo>
X-ME-Received: <xmr:OVRRYQ9j6Yve6hQkemE4Mw_-ZlbyvshYkw2Tp4U5y_znqBd_ThqorbqycEeE4RxInMlfp3y0qWi_2k9O9havB-MXXWGwFRfHgaANywM1mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeivdekgeethfevfeelhfejudehieefjeelffevieduueffueffveeihfejudet
 vdenucffohhmrghinhepvddtudegqddtkedrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OVRRYYoTFtozj7MdifYg6yhGjzePxMtFHVyvEtfylYtH76wLR1lCbw>
 <xmx:OVRRYRoScJw8bQ3ZbfHvDMDXrqzEou6ExWJzGOGm3jq-9RgwaJM_Jw>
 <xmx:OVRRYWSt2QhOtNLTq5NmwWVuh4VuCQObRtOJvnFUrdTizZfntZu7iA>
 <xmx:OVRRYZZDm8si8P6NRCPpuVaZrEWxDZrtL2ZhPLWWBErtpeP5nXIv5NVtTTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 11/16] hw/nvme: add experimental object x-nvme-subsystem
Date: Mon, 27 Sep 2021 07:17:54 +0200
Message-Id: <20210927051759.447305-12-its@irrelevant.dk>
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

Add a basic user creatable object that models an NVMe NVM subsystem.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c   |  14 ++---
 hw/nvme/ns.c     |   5 +-
 hw/nvme/nvme.h   |  10 +++-
 hw/nvme/subsys.c | 144 +++++++++++++++++++++++++++++++++++++++++++++--
 qapi/qom.json    |  17 ++++++
 5 files changed, 175 insertions(+), 15 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index b27bf00f623f..c798aeb095e1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6562,14 +6562,14 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     NvmeCtrl *ctrl = NVME_DEVICE(pci_dev);
     NvmeState *n = NVME_STATE(ctrl);
 
-    if (n->subsys_dev) {
-        n->subsys = &n->subsys_dev->subsys;
-    }
+    if (ctrl->subsys_dev) {
+        if (ctrl->namespace.blkconf.blk) {
+            error_setg(errp, "subsystem support is unavailable with legacy "
+                       "namespace ('drive' property)");
+            return;
+        }
 
-    if (ctrl->namespace.blkconf.blk && n->subsys) {
-        error_setg(errp, "subsystem support is unavailable with legacy "
-                   "namespace ('drive' property)");
-        return;
+        n->subsys = &ctrl->subsys_dev->subsys;
     }
 
     if (nvme_check_constraints(n, errp)) {
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index efbe9b3808e4..09556f0ec7c9 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -493,7 +493,8 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
     NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
     NvmeNamespace *ns = &nsdev->ns;
     BusState *s = qdev_get_parent_bus(dev);
-    NvmeState *n = NVME_STATE(s->parent);
+    NvmeCtrl *ctrl = NVME_DEVICE(s->parent);
+    NvmeState *n = NVME_STATE(ctrl);
     NvmeSubsystem *subsys = n->subsys;
     uint32_t nsid = nsdev->params.nsid;
     int i;
@@ -509,7 +510,7 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
          * If this namespace belongs to a subsystem (through a link on the
          * controller device), reparent the device.
          */
-        if (!qdev_set_parent_bus(dev, &n->subsys_dev->bus.parent_bus, errp)) {
+        if (!qdev_set_parent_bus(dev, &ctrl->subsys_dev->bus.parent_bus, errp)) {
             return;
         }
     }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index a0c34a49772f..b67e5900a01d 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -45,8 +45,14 @@ typedef struct NvmeBus {
     BusState parent_bus;
 } NvmeBus;
 
+#define TYPE_NVME_SUBSYSTEM "x-nvme-subsystem"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeSubsystem, NVME_SUBSYSTEM)
+
 typedef struct NvmeSubsystem {
-    uint8_t     subnqn[256];
+    Object parent_obj;
+
+    QemuUUID uuid;
+    uint8_t  subnqn[256];
 
     NvmeState     *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
@@ -467,6 +473,8 @@ typedef struct NvmeCtrl {
 
     /* for use with legacy single namespace (-device nvme,drive=...) setups */
     NvmeNamespaceDevice namespace;
+
+    NvmeSubsystemDevice *subsys_dev;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeState *n, uint32_t nsid)
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 3e1736d846b7..2599b83c348e 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -8,10 +8,13 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-builtin-visit.h"
+#include "qom/object_interfaces.h"
 
 #include "nvme.h"
 
-int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n, Error **errp)
+int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n,
+                              Error **errp)
 {
     int cntlid, nsid;
 
@@ -44,6 +47,136 @@ void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n)
     n->cntlid = -1;
 }
 
+static void get_controllers(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(obj);
+    strList *paths = NULL;
+    strList **tail = &paths;
+    unsigned cntlid;
+
+    for (cntlid = 0; cntlid < NVME_MAX_CONTROLLERS; cntlid++) {
+        NvmeState *n = subsys->ctrls[cntlid];
+        if (!n) {
+            continue;
+        }
+
+        QAPI_LIST_APPEND(tail, object_get_canonical_path(OBJECT(n)));
+    }
+
+    visit_type_strList(v, name, &paths, errp);
+    qapi_free_strList(paths);
+}
+
+static void get_namespaces(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(obj);
+    strList *paths = NULL;
+    strList **tail = &paths;
+    unsigned nsid;
+
+    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
+        NvmeNamespace *ns = subsys->namespaces[nsid];
+        if (!ns) {
+            continue;
+        }
+
+        QAPI_LIST_APPEND(tail, object_get_canonical_path(OBJECT(ns)));
+    }
+
+    visit_type_strList(v, name, &paths, errp);
+    qapi_free_strList(paths);
+}
+
+static char *get_subnqn(Object *obj, Error **errp)
+{
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
+static void nvme_subsys_complete(UserCreatable *uc, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYSTEM(uc);
+
+    if (!strcmp((char *)subsys->subnqn, "")) {
+        char buf[UUID_FMT_LEN + 1];
+
+        qemu_uuid_unparse(&subsys->uuid, buf);
+
+        snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
+                 "nqn.2014-08.org.nvmexpress:uuid:%s", buf);
+    }
+}
+
+static void nvme_subsys_instance_init(Object *obj)
+{
+    object_property_add(obj, "controllers", "str", get_controllers, NULL, NULL,
+                        NULL);
+
+    object_property_add(obj, "namespaces", "str", get_namespaces, NULL, NULL,
+                        NULL);
+}
+
+static void nvme_subsys_class_init(ObjectClass *oc, void *data)
+{
+    ObjectProperty *op;
+
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+    ucc->complete = nvme_subsys_complete;
+
+    object_class_property_add_str(oc, "subnqn", get_subnqn, set_subnqn);
+    object_class_property_set_description(oc, "subnqn", "the NVM Subsystem "
+                                          "NVMe Qualified Name; "
+                                          "(default: \"nqn.2014-08.org.nvmexpress:uuid:<uuid>\")");
+
+    op = object_class_property_add_str(oc, "uuid", get_uuid, set_uuid);
+    object_property_set_default_str(op, "auto");
+    object_class_property_set_description(oc, "subnqn", "NVM Subsystem UUID "
+                                          "(\"auto\" for random value; "
+                                          "default: \"auto\")");
+}
+
+static const TypeInfo nvme_subsys_info = {
+    .name = TYPE_NVME_SUBSYSTEM,
+    .parent = TYPE_OBJECT,
+    .class_init = nvme_subsys_class_init,
+    .instance_init = nvme_subsys_instance_init,
+    .instance_size = sizeof(NvmeSubsystem),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { },
+    }
+};
+
 static void nvme_subsys_device_setup(NvmeSubsystemDevice *dev)
 {
     NvmeSubsystem *subsys = &dev->subsys;
@@ -64,7 +197,7 @@ static void nvme_subsys_device_realize(DeviceState *dev, Error **errp)
     nvme_subsys_device_setup(subsys);
 }
 
-static Property nvme_subsystem_device_props[] = {
+static Property nvme_subsys_device_props[] = {
     DEFINE_PROP_STRING("nqn", NvmeSubsystemDevice, params.nqn),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -79,7 +212,7 @@ static void nvme_subsys_device_class_init(ObjectClass *oc, void *data)
     dc->desc = "Virtual NVMe subsystem";
     dc->hotpluggable = false;
 
-    device_class_set_props(dc, nvme_subsystem_device_props);
+    device_class_set_props(dc, nvme_subsys_device_props);
 }
 
 static const TypeInfo nvme_subsys_device_info = {
@@ -89,9 +222,10 @@ static const TypeInfo nvme_subsys_device_info = {
     .instance_size = sizeof(NvmeSubsystemDevice),
 };
 
-static void nvme_subsys_register_types(void)
+static void register_types(void)
 {
+    type_register_static(&nvme_subsys_info);
     type_register_static(&nvme_subsys_device_info);
 }
 
-type_init(nvme_subsys_register_types)
+type_init(register_types)
diff --git a/qapi/qom.json b/qapi/qom.json
index a25616bc7a7d..d4c211fc38b1 100644
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
+  'data': { '*subnqn': 'str',
+            '*uuid': 'str' } }
+
 ##
 # @PrManagerHelperProperties:
 #
@@ -797,6 +812,7 @@
     { 'name': 'memory-backend-memfd',
       'if': 'CONFIG_LINUX' },
     'memory-backend-ram',
+    'x-nvme-subsystem',
     'pef-guest',
     'pr-manager-helper',
     'qtest',
@@ -855,6 +871,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'x-nvme-subsystem':           'NvmeSubsystemProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
-- 
2.33.0


