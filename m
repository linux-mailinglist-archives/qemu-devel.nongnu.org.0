Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3BA40B9AD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 23:12:15 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFiw-0005e0-9J
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 17:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFCD-00061Z-4C; Tue, 14 Sep 2021 16:38:25 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:41285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFC7-0004xL-KV; Tue, 14 Sep 2021 16:38:24 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9D25D3200A10;
 Tue, 14 Sep 2021 16:38:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 16:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=UwrMCHWgGSJXX
 3nwkrDPViKvRqfzJfTK6VGcTx0wI2s=; b=ZxTkSVC5Ugl3oHFOIdQPqZ/k1llY1
 +Y4abuaY1bhnz1/1t7ufo436ESdSKoGcqWx5hlwd10HGsrnDVOTYG7z8cdGFqpYV
 DrFz+L18DMhELh+J9u2D2nnTzNHaUro/CKEGubYOWbcstJTIJ8zY2qLE6P7xIybh
 96ZusbPKv3EJopnSUOw97WPN7CJ+rAVP8pze2jo9Q4mKAQBRkZGz5nJSXsrtJ6Ry
 eb3o4pszFLrkoPmC3Ett8ShQw9f8G8iV199AtyTZysmgvd3b2T0b3qWIwxMxyAMa
 vYSnu3biKhTbo7NLrbuB2x38ObKAYciL54Z7oPghc8c6DEDuhQAFMnoDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UwrMCHWgGSJXX3nwkrDPViKvRqfzJfTK6VGcTx0wI2s=; b=bKRtfjRd
 AWkjF7Ts9Qmz6+bT5USQasNzNGK7PXxq7BJIsbVaRswflLte3YSNH1Wl8gChAOM6
 U+P41GiZrT4f1smo1cwEF9JqNBUXvVE1hKElgWOpE86tF+unZzFKyLYkiOxyBm0L
 /fj5jvWir8oAOK8JF0IYT1TSEOpxKQldWfx4BtpMxE9ZB4YgPhrW0wGlQRFxzXJY
 kmuZXYYUmLzqX0C+zndvr9Ey7Hn8iGVWw3R8fPS/zEqX4EHYJTTZVN8EvDNdHYNu
 dQcCsA6b55UBDtVPfhcLKEV3+WZPNAJk+aiXcubKAedBvIcEuTWWmHgPS9fGuH1I
 YRhARjYYQS4tig==
X-ME-Sender: <xms:OQhBYXhNoUOJQsDVHOzWCwQ7v1ki6BAnU3dVJCGGpYplG1JGB0cbkA>
 <xme:OQhBYUDo3XmLQAiBNKy1I60RiRc7wk2BPjPpdetF1iS5JVk2hvOMYkbPPtqzoTNE1
 0Fs5MK5TkNocdH1us8>
X-ME-Received: <xmr:OQhBYXG7hdT_I9EFjp6oq33OgZuyj4Gm07rDNnBwGRz8ekaQpV9UddshanaemYCrpncmqDXIloxRqmG62eaZDdCm5jaD7HHi4ng1NpMZxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:OQhBYUTBZ7JVR877qjUJaGHxz4d41yAKAdbY16b6NAA2qY3jBJHAIQ>
 <xmx:OQhBYUwmxIydbagiF7Pfj2g4CmQz7DU4OBvzfxlL7L9-8PNsKWtBOA>
 <xmx:OQhBYa4y4-AZLinptTCJxkPxqSHTs8e_tSk1MlIjKQv7Ny1Yoal9WA>
 <xmx:OQhBYTliToiTkmH2Z0caByBu-l6QwxaImHunWZYjkg-jgrrjDc79qg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:15 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 11/13] hw/nvme: add experimental abstract object x-nvme-ns
Date: Tue, 14 Sep 2021 22:37:35 +0200
Message-Id: <20210914203737.182571-12-its@irrelevant.dk>
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

Add the abstract NvmeNamespace object to base proper namespace types on.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c     | 286 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h   |  24 ++++
 hw/nvme/subsys.c |  31 +++++
 qapi/qom.json    |  18 +++
 4 files changed, 359 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 3d643554644c..05828fbb48a5 100644
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
 
@@ -638,8 +642,290 @@ static const TypeInfo nvme_nsdev_info = {
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
+static void set_attached(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    visit_type_strList(v, name, &ns->_ctrls, errp);
+}
+
+static void get_attached(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+    strList *paths = NULL;
+    strList **tail = &paths;
+    int cntlid;
+
+    for (cntlid = 0; cntlid < ARRAY_SIZE(ns->subsys->ctrls); cntlid++) {
+        NvmeState *ctrl = nvme_subsys_ctrl(ns->subsys, cntlid);
+        if (!ctrl || !nvme_ns(ctrl, ns->nsid)) {
+            continue;
+        }
+
+        QAPI_LIST_APPEND(tail, object_get_canonical_path(OBJECT(ctrl)));
+    }
+
+    visit_type_strList(v, name, &paths, errp);
+    qapi_free_strList(paths);
+}
+
+static void get_nsid(Object *obj, Visitor *v, const char *name, void *opaque,
+                     Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+    uint32_t value = ns->nsid;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void set_nsid(Object *obj, Visitor *v, const char *name, void *opaque,
+                     Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(obj);
+    uint32_t value;
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value > NVME_MAX_NAMESPACES) {
+        error_setg(errp, "invalid namespace identifier");
+        return;
+    }
+
+    ns->nsid = value;
+}
+
+static char *get_uuid(Object *obj, Error **errp)
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
+static void set_uuid(Object *obj, const char *v, Error **errp)
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
+static char *get_eui64(Object *obj, Error **errp)
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
+static void set_eui64(Object *obj, const char *v, Error **errp)
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
+static void set_ns_identifiers_if_unset(NvmeNamespace *ns)
+{
+    if (!ns->eui64.v) {
+        ns->eui64.a[0] = 0x52;
+        ns->eui64.a[1] = 0x54;
+        ns->eui64.a[2] = 0x00;
+        ns->eui64.a[4] = ns->nsid >> 24;
+        ns->eui64.a[5] = ns->nsid >> 16;
+        ns->eui64.a[6] = ns->nsid >>  8;
+        ns->eui64.a[7] = ns->nsid;
+    }
+
+    ns->nguid.eui = ns->eui64.v;
+}
+
+static void nvme_ns_machine_done(Notifier *notifier, void *data)
+{
+    NvmeNamespace *ns = container_of(notifier, NvmeNamespace, machine_done);
+    NvmeNamespaceClass *nc = NVME_NAMESPACE_GET_CLASS(ns);
+    Error *err = NULL;
+
+    if (nvme_subsys_register_ns(ns->subsys, ns, &err)) {
+        error_report_err(err);
+        return;
+    }
+
+    if (nc->configure && nc->configure(ns, &err)) {
+        error_report_err(err);
+        return;
+    }
+
+    for (strList *l = ns->_ctrls; l; l = l->next) {
+        Object *obj = object_resolve_path_type(l->value, TYPE_NVME_DEVICE, NULL);
+        if (!obj) {
+            error_report("controller '%s' not found", l->value);
+            continue;
+        }
+
+        nvme_attach_ns(NVME_STATE(obj), ns);
+    }
+
+    qapi_free_strList(ns->_ctrls);
+}
+
+static void nvme_ns_complete(UserCreatable *uc, Error **errp)
+{
+    NvmeNamespace *ns = NVME_NAMESPACE(uc);
+    NvmeNamespaceClass *nc = NVME_NAMESPACE_GET_CLASS(ns);
+
+    set_ns_identifiers_if_unset(ns);
+
+    ns->flags |= NVME_NS_SHARED;
+
+    if (nc->check_params && nc->check_params(ns, errp)) {
+        return;
+    }
+
+    ns->machine_done.notify = nvme_ns_machine_done;
+    qemu_add_machine_init_done_notifier(&ns->machine_done);
+
+    ns->realized = true;
+}
+
+static void nvme_ns_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    ucc->complete = nvme_ns_complete;
+
+    object_class_property_add(oc, "nsid", "uint32", get_nsid, set_nsid, NULL,
+                              NULL);
+    object_class_property_set_description(oc, "nsid", "namespace identifier "
+                                          "(\"auto\": assigned by controller "
+                                          "or subsystem; default: auto)");
+
+    object_class_property_add_link(oc, "subsys", TYPE_NVME_SUBSYSTEM,
+                                   offsetof(NvmeNamespace, subsys),
+                                   object_property_allow_set_link, 0);
+    object_class_property_set_description(oc, "subsys", "link to "
+                                          "x-nvme-subsystem object");
+
+    object_class_property_add(oc, "attached-ctrls", "str", get_attached,
+                              set_attached, NULL, NULL);
+    object_class_property_set_description(oc, "attached-ctrls", "list of "
+                                          "controllers attached to the "
+                                          "namespace");
+
+    object_class_property_add_str(oc, "uuid", get_uuid, set_uuid);
+    object_class_property_set_description(oc, "uuid", "namespace uuid "
+                                          "(\"auto\" for random value; "
+                                          "default: 0)");
+
+    object_class_property_add_str(oc, "eui64", get_eui64, set_eui64);
+    object_class_property_set_description(oc, "eui64", "IEEE Extended Unique "
+                                          "Identifier (\"auto\" for random "
+                                          "value; "
+                                          "default: \"52:54:00:<nsid>\")");
+}
+
+static const TypeInfo nvme_ns_info = {
+    .name = TYPE_NVME_NAMESPACE,
+    .parent = TYPE_OBJECT,
+    .abstract = true,
+    .instance_size = sizeof(NvmeNamespace),
+    .class_size = sizeof(NvmeNamespaceClass),
+    .class_init = nvme_ns_class_init,
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
index 1ae185139132..2a623b9eecd6 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -19,6 +19,8 @@
 #define HW_NVME_INTERNAL_H
 
 #include "qemu/uuid.h"
+#include "qemu/notify.h"
+#include "qapi/qapi-builtin-visit.h"
 #include "hw/pci/pci.h"
 #include "hw/block/block.h"
 
@@ -48,6 +50,16 @@ typedef struct NvmeBus {
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
 
@@ -79,6 +91,8 @@ typedef struct NvmeSubsystemDevice {
 int nvme_subsys_register_ctrl(NvmeSubsystem *subsys, NvmeState *n,
                               Error **errp);
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n);
+int nvme_subsys_register_ns(NvmeSubsystem *subsys, NvmeNamespace *ns,
+                            Error **errp);
 
 static inline NvmeState *nvme_subsys_ctrl(NvmeSubsystem *subsys,
                                           uint32_t cntlid)
@@ -194,6 +208,14 @@ enum NvmeNamespaceFlags {
 };
 
 typedef struct NvmeNamespace {
+    Object parent_obj;
+    bool   realized;
+
+    Notifier machine_done;
+
+    strList       *_ctrls;
+    NvmeSubsystem *subsys;
+
     uint32_t nsid;
     uint8_t  csi;
     QemuUUID uuid;
@@ -217,6 +239,8 @@ typedef struct NvmeNamespace {
     NvmeNamespaceZoned zoned;
 } NvmeNamespace;
 
+bool nvme_ns_prop_writable(Object *obj, const char *name, Error **errp);
+
 #define NVME_NAMESPACE_NVM(ns) (&(ns)->nvm)
 #define NVME_NAMESPACE_ZONED(ns) (&(ns)->zoned)
 
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 26e8e087e986..f1fcd7f3980e 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -37,6 +37,37 @@ void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n)
     subsys->ctrls[n->cntlid] = NULL;
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
 static char *get_subnqn(Object *obj, Error **errp)
 {
     NvmeSubsystem *subsys = NVME_SUBSYSTEM(obj);
diff --git a/qapi/qom.json b/qapi/qom.json
index 8d7c968fbd88..ec108e887344 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -662,6 +662,24 @@
   'data': { 'subnqn': 'str',
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
+            '*nsid': 'uint32',
+            '*eui64': 'str',
+            '*uuid': 'str',
+            '*attached-ctrls': ['str'] } }
+
 ##
 # @PrManagerHelperProperties:
 #
-- 
2.33.0


