Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7760418ED0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:53:50 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjaH-00040i-Si
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2c-0003vZ-Dr; Mon, 27 Sep 2021 01:19:02 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:48079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2a-0000VF-5D; Mon, 27 Sep 2021 01:19:02 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A0B0C2B0121A;
 Mon, 27 Sep 2021 01:18:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 27 Sep 2021 01:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9wR8Vc7/ABEF8
 +JyTofZsGpn9fTcOeeRigMV4VuKm/I=; b=Y+G2c0/L8+ITiV1GWh/E3XhdwgZRA
 9rD22hSiLz3aD2RSCSd36wQOmUSrZ5yao+AU6fEVKWAM62bbdcw5ypbyA2sZflMP
 TqFBu+ka/FudA+Bb841bN18evJg3twoBKIpowMwQ0t8kYvbboa8vfRM/q4xL2XNw
 D6XQv6Ng7sbv6kD39xK151Cy34Y+omwAh7d7+R7UzqhBvUUMBv1ZLZGGsTdbxAXf
 ZLiWOXC77WFmgvcoyhB3Bl9XE1Rd4/w5Jhs+a0W48SGf7O/jOdEYE7mJ6ToDpKuJ
 LUxCH+4k7Jdih4bI5lHsaDrlyYAQtcCsBkhLP3WH111JU+/ANE4tx6Ppg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=9wR8Vc7/ABEF8+JyTofZsGpn9fTcOeeRigMV4VuKm/I=; b=bTcrHwWZ
 z7INfvosRiwEzOrFA6PT+Aa7d/+tC98ij9wNhOFpW2a+phqUp3R02dF4lFV1gcIq
 kKa5UubUTryy+NPX5kfkCV8gDakoQ5jHhrK72WjXuvePGIWXOAK4ezuA6c2abRva
 VNNY9ekyqDbmrBt2YRCNl4nZZ5R3AbgRHKtHkwQPePLWvZM8Xj5HvtzvWcIAQJMM
 QUyGiC7lrJVC6PMBsxUGuyC9mZWolJFweUSOxmD44LYM1PBh9Onkp0bFUmaftILZ
 EZPfBYmRhUPl7lknVhL8N9V2/sJ0riXTi6mOAZzBkUSQHeWS4EYhiwiLemPQNEuB
 6f2Ntn/yJvtuuw==
X-ME-Sender: <xms:QVRRYRWkJmi82RbustkGAmGOMYtMG2sCPxxJMz-70i3RR4Lpeju8oA>
 <xme:QVRRYRnXMNGkbl1eeabIwxquW0tmIzMMtpBuwnMh6hXgM3kC3EyNwo2qfSi_ch-VA
 s6sWJvfYnrFMkodihs>
X-ME-Received: <xmr:QVRRYdZjeOMP_5JIyh0n1GGiAbTMfqDG3ivwU_Ekw8CseB8cA50T422le97eauoFAHd257ETTtBsbwYbYpUxmj3KZxoZwDAhVBNkexlpjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QVRRYUUyIObCpncUDc0JG2hDGST33puAiDDIjEXoLqsuHWEK3q3FqQ>
 <xmx:QVRRYbkpv1KcXAUzCqyprDf-fZ6w5V8nq5Y7pND5o4edb_R84LDepg>
 <xmx:QVRRYReWU2ASGXlHsXZRUxX2kZApNJNu1BiFOvp5CqPRGh4fgZ-KMw>
 <xmx:QVRRYTkjKI4FUZ49Fwanq4ye8Ae05r4qVNcMEcV0Eeu3j48AMIR0KWv0fME>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:55 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 13/16] hw/nvme: add experimental abstract object
 x-nvme-ns
Date: Mon, 27 Sep 2021 07:17:56 +0200
Message-Id: <20210927051759.447305-14-its@irrelevant.dk>
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

Add the abstract NvmeNamespace object to base proper namespace types on.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c     | 216 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h   |  22 +++++
 hw/nvme/subsys.c |  31 +++++++
 qapi/qom.json    |  17 ++++
 4 files changed, 286 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 09556f0ec7c9..d75ff4f1cb74 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -13,9 +13,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/ctype.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/qapi-builtin-visit.h"
+#include "qom/object_interfaces.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 
@@ -632,8 +636,220 @@ static const TypeInfo nvme_nsdev_info = {
     .instance_init = nvme_nsdev_instance_init,
 };
 
+bool nvme_ns_prop_writable(Object *obj, const char *name, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+
+    if (ns->realized) {
+        error_setg(errp, "attempt to set immutable property '%s' on "
+                   "active namespace", name);
+        return false;
+    }
+
+    return true;
+}
+
+static char *nvme_ns_get_nsid(Object *obj, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+
+    return g_strdup_printf("%d\n", ns->nsid);
+}
+
+static void nvme_ns_set_nsid(Object *obj, const char *v, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+    unsigned long nsid;
+
+    if (!nvme_ns_prop_writable(obj, "nsid", errp)) {
+        return;
+    }
+
+    if (!strcmp(v, "auto")) {
+        ns->nsid = 0;
+        return;
+    }
+
+    if (qemu_strtoul(v, NULL, 0, &nsid) < 0 || nsid > NVME_MAX_NAMESPACES) {
+        error_setg(errp, "invalid namespace identifier");
+        return;
+    }
+
+    ns->nsid = nsid;
+}
+
+static char *nvme_ns_get_uuid(Object *obj, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+
+    char *str = g_malloc(UUID_FMT_LEN + 1);
+
+    qemu_uuid_unparse(&ns->uuid, str);
+
+    return str;
+}
+
+static void nvme_ns_set_uuid(Object *obj, const char *v, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+
+    if (!nvme_ns_prop_writable(obj, "uuid", errp)) {
+        return;
+    }
+
+    if (!strcmp(v, "auto")) {
+        qemu_uuid_generate(&ns->uuid);
+    } else if (qemu_uuid_parse(v, &ns->uuid) < 0) {
+        error_setg(errp, "invalid uuid");
+    }
+}
+
+static char *nvme_ns_get_eui64(Object *obj, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+
+    const int len = 2 * 8 + 7 + 1; /* "aa:bb:cc:dd:ee:ff:gg:hh\0" */
+    char *str = g_malloc(len);
+
+    snprintf(str, len, "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x",
+             ns->eui64.a[0], ns->eui64.a[1], ns->eui64.a[2], ns->eui64.a[3],
+             ns->eui64.a[4], ns->eui64.a[5], ns->eui64.a[6], ns->eui64.a[7]);
+
+    return str;
+}
+
+static void nvme_ns_set_eui64(Object *obj, const char *v, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+
+    int i, pos;
+
+    if (!nvme_ns_prop_writable(obj, "eui64", errp)) {
+        return;
+    }
+
+    if (!strcmp(v, "auto")) {
+        ns->eui64.a[0] = 0x52;
+        ns->eui64.a[1] = 0x54;
+        ns->eui64.a[2] = 0x00;
+
+        for (i = 0; i < 5; ++i) {
+            ns->eui64.a[3 + i] = g_random_int();
+        }
+
+        return;
+    }
+
+    for (i = 0, pos = 0; i < 8; i++, pos += 3) {
+        long octet;
+
+        if (!(qemu_isxdigit(v[pos]) && qemu_isxdigit(v[pos + 1]))) {
+            goto invalid;
+        }
+
+        if (i == 7) {
+            if (v[pos + 2] != '\0') {
+                goto invalid;
+            }
+        } else {
+            if (!(v[pos + 2] == ':' || v[pos + 2] == '-')) {
+                goto invalid;
+            }
+        }
+
+        if (qemu_strtol(v + pos, NULL, 16, &octet) < 0 || octet > 0xff) {
+            goto invalid;
+        }
+
+        ns->eui64.a[i] = octet;
+    }
+
+    return;
+
+invalid:
+    error_setg(errp, "invalid ieee extended unique identifier");
+}
+
+static void nvme_ns_set_identifiers_if_unset(NvmeNamespace *ns)
+{
+    ns->nguid.eui = ns->eui64.v;
+}
+
+static void nvme_ns_complete(UserCreatable *uc, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(uc);
+    NvmeNamespaceClass *nc = NVME_NAMESPACE_GET_CLASS(ns);
+
+    nvme_ns_set_identifiers_if_unset(ns);
+
+    ns->flags |= NVME_NS_SHARED;
+
+    if (nc->check_params && nc->check_params(ns, errp)) {
+        return;
+    }
+
+    if (nvme_subsys_register_ns(ns->subsys, ns, errp)) {
+        return;
+    }
+
+    if (nc->configure && nc->configure(ns, errp)) {
+        return;
+    }
+
+    ns->realized = true;
+}
+
+static void nvme_ns_class_init(ObjectClass *oc, void *data)
+{
+    ObjectProperty *op;
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    ucc->complete = nvme_ns_complete;
+
+    op = object_class_property_add_str(oc, "nsid", nvme_ns_get_nsid,
+                                       nvme_ns_set_nsid);
+    object_property_set_default_str(op, "auto");
+    object_class_property_set_description(oc, "nsid", "namespace identifier "
+                                          "(\"auto\": assigned by controller "
+                                          "or subsystem; default: \"auto\")");
+
+    object_class_property_add_link(oc, "subsys", TYPE_NVME_SUBSYSTEM,
+                                   offsetof(NvmeNamespace, subsys),
+                                   object_property_allow_set_link, 0);
+    object_class_property_set_description(oc, "subsys", "link to "
+                                          "x-nvme-subsystem object");
+
+    op = object_class_property_add_str(oc, "uuid", nvme_ns_get_uuid,
+                                       nvme_ns_set_uuid);
+    object_property_set_default_str(op, "auto");
+    object_class_property_set_description(oc, "uuid", "namespace uuid "
+                                          "(\"auto\" for random value; "
+                                          "default: \"auto\")");
+
+    op = object_class_property_add_str(oc, "eui64", nvme_ns_get_eui64,
+                                       nvme_ns_set_eui64);
+    object_property_set_default_str(op, "auto");
+    object_class_property_set_description(oc, "eui64", "IEEE Extended Unique "
+                                          "Identifier (\"auto\" for random "
+                                          "value; default: \"auto\")");
+}
+
+static const TypeInfo nvme_ns_info = {
+    .name = TYPE_NVME_NAMESPACE,
+    .parent = TYPE_OBJECT,
+    .abstract = true,
+    .class_size = sizeof(NvmeNamespaceClass),
+    .class_init = nvme_ns_class_init,
+    .instance_size = sizeof(NvmeNamespace),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { },
+    },
+};
+
 static void register_types(void)
 {
+    type_register_static(&nvme_ns_info);
     type_register_static(&nvme_nsdev_info);
 }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index b67e5900a01d..627b28649892 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -19,6 +19,8 @@
 #define HW_NVME_INTERNAL_H
 
 #include "qemu/uuid.h"
+#include "qemu/notify.h"
+#include "qapi/qapi-builtin-visit.h"
 #include "hw/pci/pci.h"
 #include "hw/block/block.h"
 
@@ -45,6 +47,16 @@ typedef struct NvmeBus {
     BusState parent_bus;
 } NvmeBus;
 
+#define TYPE_NVME_NAMESPACE "x-nvme-ns"
+OBJECT_DECLARE_TYPE(NvmeNamespace, NvmeNamespaceClass, NVME_NAMESPACE)
+
+struct NvmeNamespaceClass {
+    ObjectClass parent_class;
+
+    int (*check_params)(NvmeNamespace *ns, Error **errp);
+    int (*configure)(NvmeNamespace *ns, Error **errp);
+};
+
 #define TYPE_NVME_SUBSYSTEM "x-nvme-subsystem"
 OBJECT_DECLARE_SIMPLE_TYPE(NvmeSubsystem, NVME_SUBSYSTEM)
 
@@ -75,6 +87,8 @@ typedef struct NvmeSubsystemDevice {
 int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n,
                               Error **errp);
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n);
+int nvme_subsys_register_ns(NvmeSubsystem *subsys, NvmeNamespace *ns,
+                            Error **errp);
 
 static inline NvmeState *nvme_subsys_ctrl(NvmeSubsystem *subsys,
                                           uint32_t cntlid)
@@ -190,6 +204,11 @@ enum NvmeNamespaceFlags {
 };
 
 typedef struct NvmeNamespace {
+    Object parent_obj;
+    bool   realized;
+
+    NvmeSubsystem *subsys;
+
     uint32_t nsid;
     uint8_t  csi;
     QemuUUID uuid;
@@ -197,6 +216,7 @@ typedef struct NvmeNamespace {
         uint64_t v;
         uint8_t  a[8];
     } eui64;
+    NvmeNGUID nguid;
 
     unsigned long flags;
 
@@ -212,6 +232,8 @@ typedef struct NvmeNamespace {
     NvmeNamespaceZoned zoned;
 } NvmeNamespace;
 
+bool nvme_ns_prop_writable(Object *obj, const char *name, Error **errp);
+
 #define NVME_NAMESPACE_NVM(ns) (&(ns)->nvm)
 #define NVME_NAMESPACE_ZONED(ns) (&(ns)->zoned)
 
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 2599b83c348e..e4dcd8fd20a5 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -47,6 +47,37 @@ void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n)
     n->cntlid = -1;
 }
 
+int nvme_subsys_register_ns(NvmeSubsystem *subsys, NvmeNamespace *ns,
+                            Error **errp)
+{
+    int i;
+
+    if (!ns->nsid) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+            if (!subsys->namespaces[i]) {
+                ns->nsid = i;
+                break;
+            }
+        }
+
+        if (!ns->nsid) {
+            error_setg(errp, "no free namespace identifiers");
+            return -1;
+        }
+    } else if (ns->nsid > NVME_MAX_NAMESPACES) {
+        error_setg(errp, "invalid namespace identifier '%d'", ns->nsid);
+        return -1;
+    } else if (subsys->namespaces[ns->nsid]) {
+        error_setg(errp, "namespace identifier '%d' already allocated",
+                   ns->nsid);
+        return -1;
+    }
+
+    subsys->namespaces[ns->nsid] = ns;
+
+    return 0;
+}
+
 static void get_controllers(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
diff --git a/qapi/qom.json b/qapi/qom.json
index d4c211fc38b1..6d5cef6b92ad 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -662,6 +662,23 @@
   'data': { '*subnqn': 'str',
             '*uuid': 'str' } }
 
+##
+# @NvmeNamespaceProperties:
+#
+# Properties for x-nvme-ns objects.
+#
+# @subsys: nvme controller to attach to
+#
+# @nsid: namespace identifier to assign
+#
+# Since: 6.1
+##
+{ 'struct': 'NvmeNamespaceProperties',
+  'data': { 'subsys': 'str',
+            '*nsid': 'str',
+            '*eui64': 'str',
+            '*uuid': 'str' } }
+
 ##
 # @PrManagerHelperProperties:
 #
-- 
2.33.0


