Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5791640B98B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:57:11 +0200 (CEST)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFUM-0001rh-4z
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFCF-00065Q-Ne; Tue, 14 Sep 2021 16:38:27 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:47255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFCB-0004zD-2S; Tue, 14 Sep 2021 16:38:27 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 9E3DE32009DD;
 Tue, 14 Sep 2021 16:38:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 14 Sep 2021 16:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=krWv4DZaVAwa4
 zsbBSrF36zHhEQ3XXtWRynqo7iLJHA=; b=IWQUy5ufgzFdkmHWCUUMKjIpYhnqu
 wvLfM9BAe7aNmhq3r4LVqN4hYVfmU51Id7V8SZ1PRImeVU3tGrhCRA+dUEZEGBlA
 NR6zCVTop0mHo3Romv/ohKBKCza8/QnUZZjgFSSJKYr/OSmIfCzgMuDexMc5s+n1
 WHtwx6HnVIushzIvg99poaM7ECu8qeBlWrrwc3FiYDNRlRz3ba4ze0mTmfFvCS4J
 Oeqjbs9ctb8QXkewNeYs9UZ1PElRfb027i0D7UqnPI8O/QBCfxyuSlssmgZQbQjg
 pPZdmALdV0JsqYb9+jc1fRWaNe0aCirzd2u5dNuao12063MVykrjxh61Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=krWv4DZaVAwa4zsbBSrF36zHhEQ3XXtWRynqo7iLJHA=; b=YBf0mhcq
 bJG/QE+EsX3gQHw9dKjObuzEDZwhavifiROaHT9VRHq9/4pUT26/50aernptTWPu
 5PQDBt08mQBcdGAtKYlWs1LYWAG3Avi9+YQZG5gIrCjkeas4KE9IQN6wseb4MKTa
 uXdjH1cXYSNBUQ+dok4gEpRsALIv3UT2VUQRt7KNxFyYDZhlgNI+F2zz8mxkgHx4
 EGFlmZTtY4SGjd2F9oQIONXyTaKRmaeCLBnjQ3er8mbX5HQu8xqvcpneBYRawYJ8
 XqibpH9BqNxUPwQ/vcjue1NgKnjpEjPENzbaYDnwRg3THhT+fmr9qOjFxlZB9fqX
 TFFzFbI22P45Jw==
X-ME-Sender: <xms:PAhBYRFeP_ah8k74IKpDYMcSCyOWHQO9D3V6PEBYFkiE2DMv-Z8TQg>
 <xme:PAhBYWVvIIVK6YIRP1UmxmaYuwm6bPz0PXp0CJoJBzIABB76ZOjzEiOimJI0ITkmF
 iaq6C5cIsZEaePNmeI>
X-ME-Received: <xmr:PAhBYTKEYBHwUgGDHzOzREK8wkpEHJVKELJKSJy6q20MWRxSfENVPnEZS6xNYn6LPR7GhqeR1_I_JQtVhpmVWP5iYKnVkDJIAvUan9u3GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PAhBYXGh2JuErarPzQcLua-P5sTaJzfyie0nQ3q2LRPYxQqofNYyWw>
 <xmx:PAhBYXUHuAo63B1HgCJwIj-j8T0P334UQ9zm2UqoB78kEMq0o6tmWg>
 <xmx:PAhBYSPn0L1QG6Ed5EQPEvm3mWTAmDxXegO3pAxmQzqusLyUOP7bCg>
 <xmx:PAhBYTrd4Ag28CFu9ZqZjK1hANqDnJxjlKSyykSyhdjS6s4ZNYTP8A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:18 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 12/13] hw/nvme: add experimental objects x-nvme-ns-{nvm,
 zoned}
Date: Tue, 14 Sep 2021 22:37:36 +0200
Message-Id: <20210914203737.182571-13-its@irrelevant.dk>
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

Add implementations of namespaces that supports the NVM and Zoned
Command Sets.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c      |  11 +-
 hw/nvme/dif.h       |   2 +
 hw/nvme/meson.build |   2 +-
 hw/nvme/ns-nvm.c    | 360 +++++++++++++++++++++++++++++++++++
 hw/nvme/ns-zoned.c  | 449 ++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/ns.c        | 281 +++------------------------
 hw/nvme/nvm.h       |  65 +++++++
 hw/nvme/nvme.h      |  96 +---------
 hw/nvme/zoned.h     |  48 +++++
 qapi/qom.json       |  48 +++++
 10 files changed, 1010 insertions(+), 352 deletions(-)
 create mode 100644 hw/nvme/ns-nvm.c
 create mode 100644 hw/nvme/ns-zoned.c
 create mode 100644 hw/nvme/nvm.h

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 563a8f8ad1df..04e564ad6be6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -164,6 +164,7 @@
 
 #include "nvme.h"
 #include "dif.h"
+#include "nvm.h"
 #include "zoned.h"
 
 #include "trace.h"
@@ -5342,7 +5343,7 @@ static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
     nvm->id_ns.dps = (pil << 3) | pi;
     nvm->id_ns.flbas = lbaf | (mset << 4);
 
-    nvme_ns_nvm_init_format(nvm);
+    nvme_ns_nvm_configure_format(nvm);
 }
 
 static void nvme_format_ns_cb(void *opaque, int ret)
@@ -6611,10 +6612,14 @@ static void nvme_legacy_realize(PCIDevice *pci_dev, Error **errp)
     /* setup a namespace if the controller drive property was given */
     if (ctrl->namespace.blkconf.blk) {
         NvmeNamespaceDevice *nsdev = &ctrl->namespace;
-        NvmeNamespace *ns = &nsdev->ns;
+        NvmeNamespace *ns = NVME_NAMESPACE(nsdev->ns);
+        NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
         ns->nsid = 1;
 
-        nvme_ns_init(ns);
+        ns->csi = NVME_CSI_NVM;
+
+        nvme_ns_nvm_configure_identify(ns);
+        nvme_ns_nvm_configure_format(nvm);
 
         nvme_attach_ns(n, ns);
     }
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index 53a22bc7c78e..81efb95cd391 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -1,6 +1,8 @@
 #ifndef HW_NVME_DIF_H
 #define HW_NVME_DIF_H
 
+#include "nvm.h"
+
 /* from Linux kernel (crypto/crct10dif_common.c) */
 static const uint16_t t10_dif_crc_table[256] = {
     0x0000, 0x8BB7, 0x9CD9, 0x176E, 0xB205, 0x39B2, 0x2EDC, 0xA56B,
diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
index 3cf40046eea9..2bb8354bcb57 100644
--- a/hw/nvme/meson.build
+++ b/hw/nvme/meson.build
@@ -1 +1 @@
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c'))
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'ns-nvm.c', 'ns-zoned.c', 'subsys.c'))
diff --git a/hw/nvme/ns-nvm.c b/hw/nvme/ns-nvm.c
new file mode 100644
index 000000000000..afb0482ab9e8
--- /dev/null
+++ b/hw/nvme/ns-nvm.c
@@ -0,0 +1,360 @@
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+
+#include "nvme.h"
+#include "nvm.h"
+
+#include "trace.h"
+
+static char *get_blockdev(Object *obj, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    const char *value;
+
+    value = blk_name(nvm->blk);
+    if (strcmp(value, "") == 0) {
+        BlockDriverState *bs = blk_bs(nvm->blk);
+        if (bs) {
+            value = bdrv_get_node_name(bs);
+        }
+    }
+
+    return g_strdup(value);
+}
+
+static void set_blockdev(Object *obj, const char *str, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+
+    g_free(nvm->blk_nodename);
+    nvm->blk_nodename = g_strdup(str);
+}
+
+static void get_lba_size(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    uint64_t lba_size = nvm->lbasz;
+
+    visit_type_size(v, name, &lba_size, errp);
+}
+
+static void set_lba_size(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    uint64_t lba_size;
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_size(v, name, &lba_size, errp)) {
+        return;
+    }
+
+    nvm->lbasz = lba_size;
+    nvm->lbaf.ds = 31 - clz32(nvm->lbasz);
+}
+
+static void get_metadata_size(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    uint16_t value = nvm->lbaf.ms;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void set_metadata_size(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    uint16_t value;
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    nvm->lbaf.ms = value;
+}
+
+static int get_pi(Object *obj, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    return nvm->id_ns.dps & NVME_ID_NS_DPS_TYPE_MASK;
+}
+
+static void set_pi(Object *obj, int pi_type, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+
+    if (!nvme_ns_prop_writable(obj, "pi-type", errp)) {
+        return;
+    }
+
+    nvm->id_ns.dps |= (nvm->id_ns.dps & ~NVME_ID_NS_DPS_TYPE_MASK) | pi_type;
+}
+
+static bool get_pil(Object *obj, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    return nvm->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT;
+}
+
+static void set_pil(Object *obj, bool first, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+
+    if (!nvme_ns_prop_writable(obj, "pi-first", errp)) {
+        return;
+    }
+
+    if (!first) {
+        return;
+    }
+
+    nvm->id_ns.dps |= NVME_NS_NVM_PI_FIRST;
+}
+
+static bool get_extended_lba(Object *obj, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    return nvm->flags & NVME_NS_NVM_EXTENDED_LBA;
+}
+
+static void set_extended_lba(Object *obj, bool extended, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+
+    if (!nvme_ns_prop_writable(obj, "extended-lba", errp)) {
+        return;
+    }
+
+    if (extended) {
+        nvm->flags |= NVME_NS_NVM_EXTENDED_LBA;
+    } else {
+        nvm->flags &= ~NVME_NS_NVM_EXTENDED_LBA;
+    }
+}
+
+void nvme_ns_nvm_configure_format(NvmeNamespaceNvm *nvm)
+{
+    NvmeIdNs *id_ns = &nvm->id_ns;
+    BlockDriverInfo bdi;
+    int npdg, nlbas, ret;
+    uint32_t discard_granularity = MAX(nvm->lbasz, 4096);
+
+    nvm->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+    nvm->lbasz = 1 << nvm->lbaf.ds;
+
+    if (nvm->lbaf.ms && nvm->flags & NVME_NS_NVM_EXTENDED_LBA) {
+        id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
+    }
+
+    nlbas = nvm->size / (nvm->lbasz + nvm->lbaf.ms);
+
+    id_ns->nsze = cpu_to_le64(nlbas);
+
+    /* no thin provisioning */
+    id_ns->ncap = id_ns->nsze;
+    id_ns->nuse = id_ns->ncap;
+
+    nvm->moff = nlbas * nvm->lbasz;
+
+    npdg = discard_granularity / nvm->lbasz;
+
+    ret = bdrv_get_info(blk_bs(nvm->blk), &bdi);
+    if (ret >= 0 && bdi.cluster_size > discard_granularity) {
+        npdg = bdi.cluster_size / nvm->lbasz;
+    }
+
+    id_ns->npda = id_ns->npdg = npdg - 1;
+}
+
+void nvme_ns_nvm_configure_identify(NvmeNamespace *ns)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    NvmeIdNs *id_ns = &nvm->id_ns;
+
+    static const NvmeLBAF default_lba_formats[16] = {
+        [0] = { .ds =  9           },
+        [1] = { .ds =  9, .ms =  8 },
+        [2] = { .ds =  9, .ms = 16 },
+        [3] = { .ds =  9, .ms = 64 },
+        [4] = { .ds = 12           },
+        [5] = { .ds = 12, .ms =  8 },
+        [6] = { .ds = 12, .ms = 16 },
+        [7] = { .ds = 12, .ms = 64 },
+    };
+
+    id_ns->dlfeat = 0x1;
+
+    /* support DULBE and I/O optimization fields */
+    id_ns->nsfeat = 0x4 | 0x10;
+
+    if (ns->flags & NVME_NS_SHARED) {
+        id_ns->nmic |= NVME_NMIC_NS_SHARED;
+    }
+
+    /* eui64 is always stored in big-endian form */
+    id_ns->eui64 = ns->eui64.v;
+    id_ns->nguid.eui = id_ns->eui64;
+
+    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
+
+    id_ns->dpc = 0x1f;
+
+    memcpy(&id_ns->lbaf, &default_lba_formats, sizeof(id_ns->lbaf));
+    id_ns->nlbaf = 7;
+
+    for (int i = 0; i <= id_ns->nlbaf; i++) {
+        NvmeLBAF *lbaf = &id_ns->lbaf[i];
+
+        if (lbaf->ds == nvm->lbaf.ds && lbaf->ms == nvm->lbaf.ms) {
+            id_ns->flbas |= i;
+            return;
+        }
+    }
+
+    /* add non-standard lba format */
+    id_ns->nlbaf++;
+    id_ns->lbaf[id_ns->nlbaf].ds = nvm->lbaf.ds;
+    id_ns->lbaf[id_ns->nlbaf].ms = nvm->lbaf.ms;
+    id_ns->flbas |= id_ns->nlbaf;
+}
+
+int nvme_ns_nvm_configure(NvmeNamespace *ns, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    BlockBackend *blk;
+    int ret;
+
+    blk = blk_by_name(nvm->blk_nodename);
+    if (!blk) {
+        BlockDriverState *bs = bdrv_lookup_bs(NULL, nvm->blk_nodename, NULL);
+        if (bs) {
+            blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+
+            ret = blk_insert_bs(blk, bs, errp);
+            if (ret < 0) {
+                blk_unref(blk);
+                return -1;
+            }
+        }
+    }
+
+    if (!blk) {
+        error_setg(errp, "invalid blockdev '%s'", nvm->blk_nodename);
+        return -1;
+    }
+
+    blk_ref(blk);
+    blk_iostatus_reset(blk);
+
+    nvm->blk = blk;
+
+    nvm->size = blk_getlength(nvm->blk);
+    if (nvm->size < 0) {
+        error_setg_errno(errp, -(nvm->size), "could not get blockdev size");
+        return -1;
+    }
+
+    ns->csi = NVME_CSI_NVM;
+
+    nvme_ns_nvm_configure_identify(ns);
+    nvme_ns_nvm_configure_format(nvm);
+
+    return 0;
+}
+
+static void nvme_ns_nvm_instance_init(Object *obj)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+
+    nvm->lbasz = 4096;
+    nvm->lbaf.ds = 31 - clz32(nvm->lbasz);
+}
+
+int nvme_ns_nvm_check_params(NvmeNamespace *ns, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    int pi_type = nvm->id_ns.dps & NVME_ID_NS_DPS_TYPE_MASK;
+
+    if (pi_type && nvm->lbaf.ms < 8) {
+        error_setg(errp, "at least 8 bytes of metadata required to enable "
+                   "protection information");
+        return -1;
+    }
+
+    return 0;
+}
+
+static void nvme_ns_nvm_class_init(ObjectClass *oc, void *data)
+{
+    NvmeNamespaceClass *nc = NVME_NAMESPACE_CLASS(oc);
+
+    object_class_property_add_str(oc, "blockdev", get_blockdev, set_blockdev);
+    object_class_property_set_description(oc, "blockdev",
+                                          "node name or identifier of a "
+                                          "block device to use as a backend");
+
+    object_class_property_add(oc, "lba-size", "size",
+                              get_lba_size, set_lba_size,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "lba-size",
+                                          "logical block size");
+
+    object_class_property_add(oc, "metadata-size", "uint16",
+                              get_metadata_size, set_metadata_size,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "metadata-size",
+                                          "metadata size (default: 0)");
+
+    object_class_property_add_bool(oc, "extended-lba",
+                                   get_extended_lba, set_extended_lba);
+    object_class_property_set_description(oc, "extended-lba",
+                                          "use extended logical blocks "
+                                          "(default: off)");
+
+    object_class_property_add_enum(oc, "pi-type", "NvmeProtInfoType",
+                                   &NvmeProtInfoType_lookup,
+                                   get_pi, set_pi);
+    object_class_property_set_description(oc, "pi-type",
+                                          "protection information type "
+                                          "(default: none)");
+
+    object_class_property_add_bool(oc, "pi-first", get_pil, set_pil);
+    object_class_property_set_description(oc, "pi-first",
+                                          "transfer protection information "
+                                          "as the first eight bytes of "
+                                          "metadata (default: off)");
+
+    nc->check_params = nvme_ns_nvm_check_params;
+    nc->configure = nvme_ns_nvm_configure;
+}
+
+static const TypeInfo nvme_ns_nvm_info = {
+    .name = TYPE_NVME_NAMESPACE_NVM,
+    .parent = TYPE_NVME_NAMESPACE,
+    .class_init = nvme_ns_nvm_class_init,
+    .instance_size = sizeof(NvmeNamespaceNvm),
+    .instance_init = nvme_ns_nvm_instance_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&nvme_ns_nvm_info);
+}
+
+type_init(register_types);
diff --git a/hw/nvme/ns-zoned.c b/hw/nvme/ns-zoned.c
new file mode 100644
index 000000000000..19e45f40f0e9
--- /dev/null
+++ b/hw/nvme/ns-zoned.c
@@ -0,0 +1,449 @@
+/*
+ * QEMU NVM Express Virtual Zoned Namespace
+ *
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2021 Samsung Electronics
+ *
+ * Authors:
+ *  Dmitry Fomichev   <dmitry.fomichev@wdc.com>
+ *  Klaus Jensen      <k.jensen@samsung.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+
+#include "nvme.h"
+#include "zoned.h"
+
+#include "trace.h"
+
+static void get_zone_size(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+    uint64_t value = zoned->zone_size << nvm->lbaf.ds;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void set_zone_size(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+    uint64_t value;
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    zoned->zone_size = value >> nvm->lbaf.ds;
+}
+
+static void get_zone_capacity(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+    uint64_t value = zoned->zone_capacity << nvm->lbaf.ds;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void set_zone_capacity(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(obj);
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+    uint64_t value;
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    zoned->zone_capacity = value >> nvm->lbaf.ds;
+}
+
+static void get_zone_max_active(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+
+    visit_type_uint32(v, name, &zoned->max_active_zones, errp);
+}
+
+static void set_zone_max_active(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_uint32(v, name, &zoned->max_active_zones, errp)) {
+        return;
+    }
+}
+
+static void get_zone_max_open(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+
+    visit_type_uint32(v, name, &zoned->max_open_zones, errp);
+}
+
+static void set_zone_max_open(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_uint32(v, name, &zoned->max_open_zones, errp)) {
+        return;
+    }
+}
+
+static bool get_zone_cross_read(Object *obj, Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+    return zoned->flags & NVME_NS_ZONED_CROSS_READ;
+}
+
+static void set_zone_cross_read(Object *obj, bool cross_read, Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+
+    if (!nvme_ns_prop_writable(obj, "zone-cross-read", errp)) {
+        return;
+    }
+
+    if (cross_read) {
+        zoned->flags |= NVME_NS_ZONED_CROSS_READ;
+    } else {
+        zoned->flags &= ~NVME_NS_ZONED_CROSS_READ;
+    }
+}
+
+static void get_zone_descriptor_extension_size(Object *obj, Visitor *v,
+                                               const char *name, void *opaque,
+                                               Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+    uint64_t value = zoned->zd_extension_size;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void set_zone_descriptor_extension_size(Object *obj, Visitor *v,
+                                               const char *name, void *opaque,
+                                               Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+    uint64_t value;
+
+    if (!nvme_ns_prop_writable(obj, name, errp)) {
+        return;
+    }
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value & 0x3f) {
+        error_setg(errp, "zone descriptor extension size must be a "
+                   "multiple of 64 bytes");
+        return;
+    }
+    if ((value >> 6) > 0xff) {
+        error_setg(errp,
+                   "zone descriptor extension size is too large");
+        return;
+    }
+
+    zoned->zd_extension_size = value;
+}
+
+void nvme_ns_zoned_init_state(NvmeNamespaceZoned *zoned)
+{
+    uint64_t start = 0, zone_size = zoned->zone_size;
+    uint64_t capacity = zoned->num_zones * zone_size;
+    NvmeZone *zone;
+    int i;
+
+    zoned->zone_array = g_new0(NvmeZone, zoned->num_zones);
+    if (zoned->zd_extension_size) {
+        zoned->zd_extensions = g_malloc0(zoned->zd_extension_size *
+                                         zoned->num_zones);
+    }
+
+    QTAILQ_INIT(&zoned->exp_open_zones);
+    QTAILQ_INIT(&zoned->imp_open_zones);
+    QTAILQ_INIT(&zoned->closed_zones);
+    QTAILQ_INIT(&zoned->full_zones);
+
+    zone = zoned->zone_array;
+    for (i = 0; i < zoned->num_zones; i++, zone++) {
+        if (start + zone_size > capacity) {
+            zone_size = capacity - start;
+        }
+        zone->d.zt = NVME_ZONE_TYPE_SEQ_WRITE;
+        nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
+        zone->d.za = 0;
+        zone->d.zcap = zoned->zone_capacity;
+        zone->d.zslba = start;
+        zone->d.wp = start;
+        zone->w_ptr = start;
+        start += zone_size;
+    }
+
+    zoned->zone_size_log2 = 0;
+    if (is_power_of_2(zoned->zone_size)) {
+        zoned->zone_size_log2 = 63 - clz64(zoned->zone_size);
+    }
+}
+
+int nvme_ns_zoned_configure(NvmeNamespace *ns, Error **errp)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    NvmeIdNsZoned *id_ns_z = &zoned->id_ns;
+    int i;
+
+    if (nvme_ns_nvm_configure(ns, errp)) {
+        return -1;
+    }
+
+    zoned->num_zones = le64_to_cpu(nvm->id_ns.nsze) / zoned->zone_size;
+
+    if (zoned->max_active_zones && !zoned->max_open_zones) {
+        zoned->max_open_zones = zoned->max_active_zones;
+    }
+
+    if (!zoned->num_zones) {
+        error_setg(errp,
+                   "insufficient namespace size; must be at least the size "
+                   "of one zone (%"PRIu64"B)", zoned->zone_size);
+        return -1;
+    }
+
+    nvme_ns_zoned_init_state(zoned);
+
+    /* MAR/MOR are zeroes-based, FFFFFFFFFh means no limit */
+    id_ns_z->mar = cpu_to_le32(zoned->max_active_zones - 1);
+    id_ns_z->mor = cpu_to_le32(zoned->max_open_zones - 1);
+    id_ns_z->zoc = 0;
+
+    if (zoned->flags & NVME_NS_ZONED_CROSS_READ) {
+        id_ns_z->ozcs |= NVME_ID_NS_ZONED_OZCS_CROSS_READ;
+    }
+
+    for (i = 0; i <= nvm->id_ns.nlbaf; i++) {
+        id_ns_z->lbafe[i].zsze = cpu_to_le64(zoned->zone_size);
+        id_ns_z->lbafe[i].zdes =
+            zoned->zd_extension_size >> 6; /* Units of 64B */
+    }
+
+    ns->csi = NVME_CSI_ZONED;
+    nvm->id_ns.nsze = cpu_to_le64(zoned->num_zones * zoned->zone_size);
+    nvm->id_ns.ncap = nvm->id_ns.nsze;
+    nvm->id_ns.nuse = nvm->id_ns.ncap;
+
+    /*
+     * The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
+     * status of logical blocks. Since the spec defines that logical blocks
+     * SHALL be deallocated when then zone is in the Empty or Offline states,
+     * we can only support DULBE if the zone size is a multiple of the
+     * calculated NPDG.
+     */
+    if (zoned->zone_size % (nvm->id_ns.npdg + 1)) {
+        warn_report("the zone size (%"PRIu64" blocks) is not a multiple of "
+                    "the calculated deallocation granularity (%d blocks); "
+                    "DULBE support disabled",
+                    zoned->zone_size, nvm->id_ns.npdg + 1);
+
+        nvm->id_ns.nsfeat &= ~0x4;
+    }
+
+    return 0;
+}
+
+void nvme_ns_zoned_clear_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone)
+{
+    uint8_t state;
+
+    zone->w_ptr = zone->d.wp;
+    state = nvme_zoned_zs(zone);
+    if (zone->d.wp != zone->d.zslba ||
+        (zone->d.za & NVME_ZA_ZD_EXT_VALID)) {
+        if (state != NVME_ZONE_STATE_CLOSED) {
+            trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
+            nvme_zoned_set_zs(zone, NVME_ZONE_STATE_CLOSED);
+        }
+        nvme_ns_zoned_aor_inc_active(zoned);
+        QTAILQ_INSERT_HEAD(&zoned->closed_zones, zone, entry);
+    } else {
+        trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
+        nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
+    }
+}
+
+/*
+ * Close all the zones that are currently open.
+ */
+void nvme_ns_zoned_shutdown(NvmeNamespace *ns)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+    NvmeZone *zone, *next;
+
+    QTAILQ_FOREACH_SAFE(zone, &zoned->closed_zones, entry, next) {
+        QTAILQ_REMOVE(&zoned->closed_zones, zone, entry);
+        nvme_ns_zoned_aor_dec_active(zoned);
+        nvme_ns_zoned_clear_zone(zoned, zone);
+    }
+    QTAILQ_FOREACH_SAFE(zone, &zoned->imp_open_zones, entry, next) {
+        QTAILQ_REMOVE(&zoned->imp_open_zones, zone, entry);
+        nvme_ns_zoned_aor_dec_open(zoned);
+        nvme_ns_zoned_aor_dec_active(zoned);
+        nvme_ns_zoned_clear_zone(zoned, zone);
+    }
+    QTAILQ_FOREACH_SAFE(zone, &zoned->exp_open_zones, entry, next) {
+        QTAILQ_REMOVE(&zoned->exp_open_zones, zone, entry);
+        nvme_ns_zoned_aor_dec_open(zoned);
+        nvme_ns_zoned_aor_dec_active(zoned);
+        nvme_ns_zoned_clear_zone(zoned, zone);
+    }
+
+    assert(zoned->nr_open_zones == 0);
+}
+
+static void nvme_ns_zoned_instance_init(Object *obj)
+{
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(obj);
+
+    /* assuming 4k default lba-size, set default zone size/capacity to 1M */
+    zoned->zone_size = 4096;
+    zoned->zone_capacity = zoned->zone_size;
+}
+
+static int nvme_ns_zoned_check_params(NvmeNamespace *ns, Error **errp)
+{
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+
+    if (nvme_ns_nvm_check_params(ns, errp)) {
+        return -1;
+    }
+
+    if (zoned->zone_size < nvm->lbaf.ds) {
+        error_setg(errp, "'zone-size' must be at least %"PRIu64" bytes",
+                   nvm->lbasz);
+        return -1;
+    }
+
+    if (zoned->zone_capacity < nvm->lbaf.ds) {
+        error_setg(errp, "'zone-capacity' must be at least %"PRIu64" bytes",
+                   nvm->lbasz);
+        return -1;
+    }
+
+    if (zoned->zone_capacity > zoned->zone_size) {
+        error_setg(errp, "'zone-capacity' must not exceed 'zone-size'");
+        return -1;
+    }
+
+    if (zoned->max_active_zones) {
+        if (zoned->max_open_zones > zoned->max_active_zones) {
+            error_setg(errp, "'zone-max-open' must not exceed 'zone-max-active'");
+            return -1;
+        }
+
+        if (!zoned->max_open_zones) {
+            zoned->max_open_zones = zoned->max_active_zones;
+        }
+    }
+
+    return 0;
+}
+
+static void nvme_ns_zoned_class_init(ObjectClass *oc, void *data)
+{
+    NvmeNamespaceClass *nc = NVME_NAMESPACE_CLASS(oc);
+
+    object_class_property_add(oc, "zone-size", "size",
+                              get_zone_size, set_zone_size,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "zone-size", "zone size");
+
+    object_class_property_add(oc, "zone-capacity", "size",
+                              get_zone_capacity, set_zone_capacity,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "zone-capacity",
+                                          "zone capacity");
+
+    object_class_property_add_bool(oc, "zone-cross-read",
+                                   get_zone_cross_read, set_zone_cross_read);
+    object_class_property_set_description(oc, "zone-cross-read",
+                                          "allow reads to cross zone "
+                                          "boundaries");
+
+    object_class_property_add(oc, "zone-descriptor-extension-size", "size",
+                              get_zone_descriptor_extension_size,
+                              set_zone_descriptor_extension_size,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "zone-descriptor-extension-size",
+                                          "zone descriptor extension size");
+
+    object_class_property_add(oc, "zone-max-active", "uint32",
+                              get_zone_max_active, set_zone_max_active,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "zone-max-active",
+                                          "maximum number of active zones");
+
+    object_class_property_add(oc, "zone-max-open", "uint32",
+                              get_zone_max_open, set_zone_max_open,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "zone-max-open",
+                                          "maximum number of open zones");
+
+    nc->check_params = nvme_ns_zoned_check_params;
+    nc->configure = nvme_ns_zoned_configure;
+    nc->shutdown = nvme_ns_zoned_shutdown;
+}
+
+static const TypeInfo nvme_ns_zoned_info = {
+    .name = TYPE_NVME_NAMESPACE_ZONED,
+    .parent = TYPE_NVME_NAMESPACE_NVM,
+    .class_init = nvme_ns_zoned_class_init,
+    .instance_size = sizeof(NvmeNamespaceZoned),
+    .instance_init = nvme_ns_zoned_instance_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&nvme_ns_zoned_info);
+}
+
+type_init(register_types);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 05828fbb48a5..cd46f471dad6 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -30,107 +30,10 @@
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
-void nvme_ns_nvm_init_format(NvmeNamespaceNvm *nvm)
-{
-    NvmeIdNs *id_ns = &nvm->id_ns;
-    BlockDriverInfo bdi;
-    int npdg, nlbas, ret;
-
-    nvm->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
-    nvm->lbasz = 1 << nvm->lbaf.ds;
-
-    nlbas = nvm->size / (nvm->lbasz + nvm->lbaf.ms);
-
-    id_ns->nsze = cpu_to_le64(nlbas);
-
-    /* no thin provisioning */
-    id_ns->ncap = id_ns->nsze;
-    id_ns->nuse = id_ns->ncap;
-
-    nvm->moff = (int64_t)nlbas << nvm->lbaf.ds;
-
-    npdg = nvm->discard_granularity / nvm->lbasz;
-
-    ret = bdrv_get_info(blk_bs(nvm->blk), &bdi);
-    if (ret >= 0 && bdi.cluster_size > nvm->discard_granularity) {
-        npdg = bdi.cluster_size / nvm->lbasz;
-    }
-
-    id_ns->npda = id_ns->npdg = npdg - 1;
-}
-
-void nvme_ns_init(NvmeNamespace *ns)
-{
-    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    NvmeIdNs *id_ns = &nvm->id_ns;
-    uint8_t ds;
-    uint16_t ms;
-    int i;
-
-    id_ns->dlfeat = 0x1;
-
-    /* support DULBE and I/O optimization fields */
-    id_ns->nsfeat |= (0x4 | 0x10);
-
-    if (ns->flags & NVME_NS_SHARED) {
-        id_ns->nmic |= NVME_NMIC_NS_SHARED;
-    }
-
-    /* simple copy */
-    id_ns->mssrl = cpu_to_le16(nvm->mssrl);
-    id_ns->mcl = cpu_to_le32(nvm->mcl);
-    id_ns->msrc = nvm->msrc;
-    id_ns->eui64 = cpu_to_be64(ns->eui64.v);
-
-    ds = 31 - clz32(nvm->lbasz);
-    ms = nvm->lbaf.ms;
-
-    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
-
-    if (ms && nvm->flags & NVME_NS_NVM_EXTENDED_LBA) {
-        id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
-    }
-
-    id_ns->dpc = 0x1f;
-
-    static const NvmeLBAF lbaf[16] = {
-        [0] = { .ds =  9           },
-        [1] = { .ds =  9, .ms =  8 },
-        [2] = { .ds =  9, .ms = 16 },
-        [3] = { .ds =  9, .ms = 64 },
-        [4] = { .ds = 12           },
-        [5] = { .ds = 12, .ms =  8 },
-        [6] = { .ds = 12, .ms = 16 },
-        [7] = { .ds = 12, .ms = 64 },
-    };
-
-    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-    id_ns->nlbaf = 7;
-
-    for (i = 0; i <= id_ns->nlbaf; i++) {
-        NvmeLBAF *lbaf = &id_ns->lbaf[i];
-        if (lbaf->ds == ds) {
-            if (lbaf->ms == ms) {
-                id_ns->flbas |= i;
-                goto lbaf_found;
-            }
-        }
-    }
-
-    /* add non-standard lba format */
-    id_ns->nlbaf++;
-    id_ns->lbaf[id_ns->nlbaf].ds = ds;
-    id_ns->lbaf[id_ns->nlbaf].ms = ms;
-    id_ns->flbas |= id_ns->nlbaf;
-
-lbaf_found:
-    nvme_ns_nvm_init_format(nvm);
-}
-
 static int nvme_nsdev_init_blk(NvmeNamespaceDevice *nsdev,
                                Error **errp)
 {
-    NvmeNamespace *ns = &nsdev->ns;
+    NvmeNamespace *ns = NVME_NAMESPACE(nsdev->ns);
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockConf *blkconf = &nsdev->blkconf;
     bool read_only;
@@ -167,7 +70,7 @@ static int nvme_nsdev_init_blk(NvmeNamespaceDevice *nsdev,
 static int nvme_nsdev_zoned_check_calc_geometry(NvmeNamespaceDevice *nsdev,
                                                 Error **errp)
 {
-    NvmeNamespace *ns = &nsdev->ns;
+    NvmeNamespace *ns = NVME_NAMESPACE(nsdev->ns);
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
 
@@ -206,152 +109,10 @@ static int nvme_nsdev_zoned_check_calc_geometry(NvmeNamespaceDevice *nsdev,
      */
     zoned->zone_size = zone_size / nvm->lbasz;
     zoned->zone_capacity = zone_cap / nvm->lbasz;
-    zoned->num_zones = le64_to_cpu(nvm->id_ns.nsze) / zoned->zone_size;
-
-    /* Do a few more sanity checks of ZNS properties */
-    if (!zoned->num_zones) {
-        error_setg(errp,
-                   "insufficient drive capacity, must be at least the size "
-                   "of one zone (%"PRIu64"B)", zone_size);
-        return -1;
-    }
 
     return 0;
 }
 
-static void nvme_ns_zoned_init_state(NvmeNamespaceZoned *zoned)
-{
-    uint64_t start = 0, zone_size = zoned->zone_size;
-    uint64_t capacity = zoned->num_zones * zone_size;
-    NvmeZone *zone;
-    int i;
-
-    zoned->zone_array = g_new0(NvmeZone, zoned->num_zones);
-    if (zoned->zd_extension_size) {
-        zoned->zd_extensions = g_malloc0(zoned->zd_extension_size *
-                                         zoned->num_zones);
-    }
-
-    QTAILQ_INIT(&zoned->exp_open_zones);
-    QTAILQ_INIT(&zoned->imp_open_zones);
-    QTAILQ_INIT(&zoned->closed_zones);
-    QTAILQ_INIT(&zoned->full_zones);
-
-    zone = zoned->zone_array;
-    for (i = 0; i < zoned->num_zones; i++, zone++) {
-        if (start + zone_size > capacity) {
-            zone_size = capacity - start;
-        }
-        zone->d.zt = NVME_ZONE_TYPE_SEQ_WRITE;
-        nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
-        zone->d.za = 0;
-        zone->d.zcap = zoned->zone_capacity;
-        zone->d.zslba = start;
-        zone->d.wp = start;
-        zone->w_ptr = start;
-        start += zone_size;
-    }
-
-    zoned->zone_size_log2 = 0;
-    if (is_power_of_2(zoned->zone_size)) {
-        zoned->zone_size_log2 = 63 - clz64(zoned->zone_size);
-    }
-}
-
-static void nvme_ns_zoned_init(NvmeNamespace *ns)
-{
-    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
-    NvmeIdNsZoned *id_ns_z = &zoned->id_ns;
-    int i;
-
-    nvme_ns_zoned_init_state(zoned);
-
-    /* MAR/MOR are zeroes-based, FFFFFFFFFh means no limit */
-    id_ns_z->mar = cpu_to_le32(zoned->max_active_zones - 1);
-    id_ns_z->mor = cpu_to_le32(zoned->max_open_zones - 1);
-    id_ns_z->zoc = 0;
-
-    if (zoned->flags & NVME_NS_ZONED_CROSS_READ) {
-        id_ns_z->ozcs |= NVME_ID_NS_ZONED_OZCS_CROSS_READ;
-    }
-
-    for (i = 0; i <= nvm->id_ns.nlbaf; i++) {
-        id_ns_z->lbafe[i].zsze = cpu_to_le64(zoned->zone_size);
-        id_ns_z->lbafe[i].zdes =
-            zoned->zd_extension_size >> 6; /* Units of 64B */
-    }
-
-    ns->csi = NVME_CSI_ZONED;
-    nvm->id_ns.nsze = cpu_to_le64(zoned->num_zones * zoned->zone_size);
-    nvm->id_ns.ncap = nvm->id_ns.nsze;
-    nvm->id_ns.nuse = nvm->id_ns.ncap;
-
-    /*
-     * The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
-     * status of logical blocks. Since the spec defines that logical blocks
-     * SHALL be deallocated when then zone is in the Empty or Offline states,
-     * we can only support DULBE if the zone size is a multiple of the
-     * calculated NPDG.
-     */
-    if (zoned->zone_size % (nvm->id_ns.npdg + 1)) {
-        warn_report("the zone size (%"PRIu64" blocks) is not a multiple of "
-                    "the calculated deallocation granularity (%d blocks); "
-                    "DULBE support disabled",
-                    zoned->zone_size, nvm->id_ns.npdg + 1);
-
-        nvm->id_ns.nsfeat &= ~0x4;
-    }
-}
-
-static void nvme_ns_zoned_clear_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone)
-{
-    uint8_t state;
-
-    zone->w_ptr = zone->d.wp;
-    state = nvme_zoned_zs(zone);
-    if (zone->d.wp != zone->d.zslba ||
-        (zone->d.za & NVME_ZA_ZD_EXT_VALID)) {
-        if (state != NVME_ZONE_STATE_CLOSED) {
-            trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
-            nvme_zoned_set_zs(zone, NVME_ZONE_STATE_CLOSED);
-        }
-        nvme_ns_zoned_aor_inc_active(zoned);
-        QTAILQ_INSERT_HEAD(&zoned->closed_zones, zone, entry);
-    } else {
-        trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
-        nvme_zoned_set_zs(zone, NVME_ZONE_STATE_EMPTY);
-    }
-}
-
-/*
- * Close all the zones that are currently open.
- */
-static void nvme_ns_zoned_shutdown(NvmeNamespaceZoned *zoned)
-{
-    NvmeZone *zone, *next;
-
-    QTAILQ_FOREACH_SAFE(zone, &zoned->closed_zones, entry, next) {
-        QTAILQ_REMOVE(&zoned->closed_zones, zone, entry);
-        nvme_ns_zoned_aor_dec_active(zoned);
-        nvme_ns_zoned_clear_zone(zoned, zone);
-    }
-    QTAILQ_FOREACH_SAFE(zone, &zoned->imp_open_zones, entry, next) {
-        QTAILQ_REMOVE(&zoned->imp_open_zones, zone, entry);
-        nvme_ns_zoned_aor_dec_open(zoned);
-        nvme_ns_zoned_aor_dec_active(zoned);
-        nvme_ns_zoned_clear_zone(zoned, zone);
-    }
-    QTAILQ_FOREACH_SAFE(zone, &zoned->exp_open_zones, entry, next) {
-        QTAILQ_REMOVE(&zoned->exp_open_zones, zone, entry);
-        nvme_ns_zoned_aor_dec_open(zoned);
-        nvme_ns_zoned_aor_dec_active(zoned);
-        nvme_ns_zoned_clear_zone(zoned, zone);
-    }
-
-    assert(zoned->nr_open_zones == 0);
-}
-
 static int nvme_nsdev_check_constraints(NvmeNamespaceDevice *nsdev,
                                         Error **errp)
 {
@@ -405,7 +166,8 @@ static int nvme_nsdev_check_constraints(NvmeNamespaceDevice *nsdev,
 
 static int nvme_nsdev_setup(NvmeNamespaceDevice *nsdev, Error **errp)
 {
-    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(&nsdev->ns);
+    NvmeNamespace *ns = NVME_NAMESPACE(nsdev->ns);
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     static uint64_t ns_count;
 
     if (nvme_nsdev_check_constraints(nsdev, errp)) {
@@ -413,20 +175,20 @@ static int nvme_nsdev_setup(NvmeNamespaceDevice *nsdev, Error **errp)
     }
 
     if (nsdev->params.shared) {
-        nsdev->ns.flags |= NVME_NS_SHARED;
+        ns->flags |= NVME_NS_SHARED;
     }
 
-    nsdev->ns.nsid = nsdev->params.nsid;
-    memcpy(&nsdev->ns.uuid, &nsdev->params.uuid, sizeof(nsdev->ns.uuid));
+    ns->nsid = nsdev->params.nsid;
+    memcpy(&ns->uuid, &nsdev->params.uuid, sizeof(ns->uuid));
 
     if (nsdev->params.eui64) {
-        stq_be_p(&nsdev->ns.eui64.v, nsdev->params.eui64);
+        stq_be_p(&ns->eui64.v, nsdev->params.eui64);
     }
 
     /* Substitute a missing EUI-64 by an autogenerated one */
     ++ns_count;
-    if (!nsdev->ns.eui64.v && nsdev->params.eui64_default) {
-        nsdev->ns.eui64.v = ns_count + NVME_EUI64_DEFAULT;
+    if (!ns->eui64.v && nsdev->params.eui64_default) {
+        ns->eui64.v = ns_count + NVME_EUI64_DEFAULT;
     }
 
     nvm->id_ns.dps = nsdev->params.pi;
@@ -434,12 +196,13 @@ static int nvme_nsdev_setup(NvmeNamespaceDevice *nsdev, Error **errp)
         nvm->id_ns.dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
     }
 
-    nsdev->ns.csi = NVME_CSI_NVM;
+    ns->csi = NVME_CSI_NVM;
 
-    nvme_ns_init(&nsdev->ns);
+    nvme_ns_nvm_configure_identify(ns);
+    nvme_ns_nvm_configure_format(nvm);
 
     if (nsdev->params.zoned) {
-        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(&nsdev->ns);
+        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
 
         if (nvme_nsdev_zoned_check_calc_geometry(nsdev, errp) != 0) {
             return -1;
@@ -453,7 +216,9 @@ static int nvme_nsdev_setup(NvmeNamespaceDevice *nsdev, Error **errp)
             zoned->flags |= NVME_NS_ZONED_CROSS_READ;
         }
 
-        nvme_ns_zoned_init(&nsdev->ns);
+        if (nvme_ns_zoned_configure(ns, errp)) {
+            return -1;
+        }
     }
 
     return 0;
@@ -468,7 +233,7 @@ void nvme_ns_shutdown(NvmeNamespace *ns)
 {
     blk_flush(nvme_blk(ns));
     if (nvme_ns_zoned(ns)) {
-        nvme_ns_zoned_shutdown(NVME_NAMESPACE_ZONED(ns));
+        nvme_ns_zoned_shutdown(ns);
     }
 }
 
@@ -485,7 +250,7 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
 static void nvme_nsdev_unrealize(DeviceState *dev)
 {
     NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
-    NvmeNamespace *ns = &nsdev->ns;
+    NvmeNamespace *ns = NVME_NAMESPACE(nsdev->ns);
 
     nvme_ns_drain(ns);
     nvme_ns_shutdown(ns);
@@ -495,7 +260,7 @@ static void nvme_nsdev_unrealize(DeviceState *dev)
 static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
 {
     NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
-    NvmeNamespace *ns = &nsdev->ns;
+    NvmeNamespace *ns = NULL;
     BusState *s = qdev_get_parent_bus(dev);
     NvmeCtrlLegacyDevice *ctrl = NVME_DEVICE_LEGACY(s->parent);
     NvmeState *n = NVME_STATE(ctrl);
@@ -525,6 +290,12 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    nsdev->ns = nsdev->params.zoned ? object_new(TYPE_NVME_NAMESPACE_ZONED) :
+        object_new(TYPE_NVME_NAMESPACE_NVM);
+
+    ns = NVME_NAMESPACE(nsdev->ns);
+    ns->realized = true;
+
     if (nvme_nsdev_init_blk(nsdev, errp)) {
         return;
     }
diff --git a/hw/nvme/nvm.h b/hw/nvme/nvm.h
new file mode 100644
index 000000000000..c3882ce5c21d
--- /dev/null
+++ b/hw/nvme/nvm.h
@@ -0,0 +1,65 @@
+#ifndef HW_NVME_NVM_H
+#define HW_NVME_NVM_H
+
+#include "nvme.h"
+
+#define TYPE_NVME_NAMESPACE_NVM "x-nvme-ns-nvm"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeNamespaceNvm, NVME_NAMESPACE_NVM)
+
+enum {
+    NVME_NS_NVM_EXTENDED_LBA = 1 << 0,
+    NVME_NS_NVM_PI_FIRST     = 1 << 1,
+};
+
+typedef struct NvmeNamespaceNvm {
+    NvmeNamespace parent_obj;
+
+    NvmeIdNs id_ns;
+
+    char *blk_nodename;
+    BlockBackend *blk;
+    int64_t size;
+    int64_t moff;
+
+    NvmeLBAF lbaf;
+    size_t   lbasz;
+    uint32_t discard_granularity;
+
+    uint16_t mssrl;
+    uint32_t mcl;
+    uint8_t  msrc;
+
+    unsigned long flags;
+} NvmeNamespaceNvm;
+
+static inline BlockBackend *nvme_blk(NvmeNamespace *ns)
+{
+    return NVME_NAMESPACE_NVM(ns)->blk;
+}
+
+static inline size_t nvme_l2b(NvmeNamespaceNvm *nvm, uint64_t lba)
+{
+    return lba << nvm->lbaf.ds;
+}
+
+static inline size_t nvme_m2b(NvmeNamespaceNvm *nvm, uint64_t lba)
+{
+    return nvm->lbaf.ms * lba;
+}
+
+static inline int64_t nvme_moff(NvmeNamespaceNvm *nvm, uint64_t lba)
+{
+    return nvm->moff + nvme_m2b(nvm, lba);
+}
+
+static inline bool nvme_ns_ext(NvmeNamespaceNvm *nvm)
+{
+    return !!NVME_ID_NS_FLBAS_EXTENDED(nvm->id_ns.flbas);
+}
+
+int nvme_ns_nvm_check_params(NvmeNamespace *ns, Error **errp);
+int nvme_ns_nvm_configure(NvmeNamespace *ns, Error **errp);
+void nvme_ns_nvm_configure_format(NvmeNamespaceNvm *nvm);
+void nvme_ns_nvm_configure_identify(NvmeNamespace *ns);
+
+#endif /* HW_NVME_NVM_H */
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 2a623b9eecd6..abac192f0c81 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -21,6 +21,7 @@
 #include "qemu/uuid.h"
 #include "qemu/notify.h"
 #include "qapi/qapi-builtin-visit.h"
+#include "qapi/qapi-types-qom.h"
 #include "hw/pci/pci.h"
 #include "hw/block/block.h"
 
@@ -58,6 +59,7 @@ struct NvmeNamespaceClass {
 
     int (*check_params)(NvmeNamespace *ns, Error **errp);
     int (*configure)(NvmeNamespace *ns, Error **errp);
+    void (*shutdown)(NvmeNamespace *ns);
 };
 
 #define TYPE_NVME_SUBSYSTEM "x-nvme-subsystem"
@@ -143,66 +145,6 @@ typedef struct NvmeNamespaceParams {
     uint32_t zd_extension_size;
 } NvmeNamespaceParams;
 
-typedef struct NvmeZone {
-    NvmeZoneDescr   d;
-    uint64_t        w_ptr;
-    QTAILQ_ENTRY(NvmeZone) entry;
-} NvmeZone;
-
-enum {
-    NVME_NS_ZONED_CROSS_READ = 1 << 0,
-};
-
-typedef struct NvmeNamespaceZoned {
-    NvmeIdNsZoned id_ns;
-
-    uint32_t num_zones;
-    NvmeZone *zone_array;
-
-    uint64_t zone_size;
-    uint32_t zone_size_log2;
-
-    uint64_t zone_capacity;
-
-    uint32_t zd_extension_size;
-    uint8_t  *zd_extensions;
-
-    uint32_t max_open_zones;
-    int32_t  nr_open_zones;
-    uint32_t max_active_zones;
-    int32_t  nr_active_zones;
-
-    unsigned long flags;
-
-    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) closed_zones;
-    QTAILQ_HEAD(, NvmeZone) full_zones;
-} NvmeNamespaceZoned;
-
-enum {
-    NVME_NS_NVM_EXTENDED_LBA = 1 << 0,
-    NVME_NS_NVM_PI_FIRST     = 1 << 1,
-};
-
-typedef struct NvmeNamespaceNvm {
-    NvmeIdNs id_ns;
-
-    BlockBackend *blk;
-    int64_t size;
-    int64_t moff;
-
-    NvmeLBAF lbaf;
-    size_t   lbasz;
-    uint32_t discard_granularity;
-
-    uint16_t mssrl;
-    uint32_t mcl;
-    uint8_t  msrc;
-
-    unsigned long flags;
-} NvmeNamespaceNvm;
-
 enum NvmeNamespaceFlags {
     NVME_NS_SHARED = 1 << 0,
 };
@@ -234,27 +176,16 @@ typedef struct NvmeNamespace {
     struct {
         uint32_t err_rec;
     } features;
-
-    NvmeNamespaceNvm   nvm;
-    NvmeNamespaceZoned zoned;
 } NvmeNamespace;
 
 bool nvme_ns_prop_writable(Object *obj, const char *name, Error **errp);
 
-#define NVME_NAMESPACE_NVM(ns) (&(ns)->nvm)
-#define NVME_NAMESPACE_ZONED(ns) (&(ns)->zoned)
-
-static inline BlockBackend *nvme_blk(NvmeNamespace *ns)
-{
-    return NVME_NAMESPACE_NVM(ns)->blk;
-}
-
 typedef struct NvmeNamespaceDevice {
     DeviceState  parent_obj;
     BlockConf    blkconf;
     int32_t      bootindex;
 
-    NvmeNamespace       ns;
+    Object       *ns;
     NvmeNamespaceParams params;
 } NvmeNamespaceDevice;
 
@@ -267,27 +198,6 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
     return 0;
 }
 
-static inline size_t nvme_l2b(NvmeNamespaceNvm *nvm, uint64_t lba)
-{
-    return lba << nvm->lbaf.ds;
-}
-
-static inline size_t nvme_m2b(NvmeNamespaceNvm *nvm, uint64_t lba)
-{
-    return nvm->lbaf.ms * lba;
-}
-
-static inline int64_t nvme_moff(NvmeNamespaceNvm *nvm, uint64_t lba)
-{
-    return nvm->moff + nvme_m2b(nvm, lba);
-}
-
-static inline bool nvme_ns_ext(NvmeNamespaceNvm *nvm)
-{
-    return !!NVME_ID_NS_FLBAS_EXTENDED(nvm->id_ns.flbas);
-}
-
-void nvme_ns_nvm_init_format(NvmeNamespaceNvm *nvm);
 void nvme_ns_init(NvmeNamespace *ns);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
diff --git a/hw/nvme/zoned.h b/hw/nvme/zoned.h
index 277d70aee5c7..6e11ad3f34a2 100644
--- a/hw/nvme/zoned.h
+++ b/hw/nvme/zoned.h
@@ -4,9 +4,52 @@
 #include "qemu/units.h"
 
 #include "nvme.h"
+#include "nvm.h"
 
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 
+#define TYPE_NVME_NAMESPACE_ZONED "x-nvme-ns-zoned"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeNamespaceZoned, NVME_NAMESPACE_ZONED)
+
+typedef struct NvmeZone {
+    NvmeZoneDescr   d;
+    uint64_t        w_ptr;
+    QTAILQ_ENTRY(NvmeZone) entry;
+} NvmeZone;
+
+enum {
+    NVME_NS_ZONED_CROSS_READ = 1 << 0,
+};
+
+typedef struct NvmeNamespaceZoned {
+    NvmeNamespaceNvm parent_obj;
+
+    NvmeIdNsZoned id_ns;
+
+    uint32_t num_zones;
+    NvmeZone *zone_array;
+
+    uint64_t zone_size;
+    uint32_t zone_size_log2;
+
+    uint64_t zone_capacity;
+
+    uint32_t zd_extension_size;
+    uint8_t  *zd_extensions;
+
+    uint32_t max_open_zones;
+    int32_t  nr_open_zones;
+    uint32_t max_active_zones;
+    int32_t  nr_active_zones;
+
+    unsigned long flags;
+
+    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) closed_zones;
+    QTAILQ_HEAD(, NvmeZone) full_zones;
+} NvmeNamespaceZoned;
+
 static inline NvmeZoneState nvme_zoned_zs(NvmeZone *zone)
 {
     return zone->d.zs >> 4;
@@ -96,4 +139,9 @@ static inline void nvme_ns_zoned_aor_dec_active(NvmeNamespaceZoned *zoned)
     assert(zoned->nr_active_zones >= 0);
 }
 
+void nvme_ns_zoned_init_state(NvmeNamespaceZoned *zoned);
+int nvme_ns_zoned_configure(NvmeNamespace *ns, Error **errp);
+void nvme_ns_zoned_clear_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone);
+void nvme_ns_zoned_shutdown(NvmeNamespace *ns);
+
 #endif /* HW_NVME_ZONED_H */
diff --git a/qapi/qom.json b/qapi/qom.json
index ec108e887344..feb3cdc98bce 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -680,6 +680,50 @@
             '*uuid': 'str',
             '*attached-ctrls': ['str'] } }
 
+##
+# @NvmeProtInfoType:
+#
+# Indicates the namespace protection information type.
+#
+# Since: 6.1
+##
+{ 'enum': 'NvmeProtInfoType',
+  'data': [ 'none', 'type1', 'type2', 'type3' ] }
+
+##
+# @NvmeNamespaceNvmProperties:
+#
+# Properties for x-nvme-ns-nvm objects.
+#
+# @pi-type: protection information type
+#
+# Since: 6.1
+##
+{ 'struct': 'NvmeNamespaceNvmProperties',
+  'base': 'NvmeNamespaceProperties',
+  'data': { 'blockdev': 'str',
+            '*lba-size': 'size',
+            '*metadata-size': 'size',
+            '*extended-lba': 'bool',
+            '*pi-type': 'NvmeProtInfoType',
+            '*pi-first': 'bool' } }
+
+##
+# @NvmeNamespaceZonedProperties:
+#
+# Properties for x-nvme-ns-zoned objects.
+#
+# Since: 6.1
+##
+{ 'struct': 'NvmeNamespaceZonedProperties',
+  'base': 'NvmeNamespaceNvmProperties',
+  'data': { '*zone-size': 'size',
+            '*zone-capacity': 'size',
+            '*zone-cross-read': 'bool',
+            '*zone-descriptor-extension-size': 'size',
+            '*zone-max-active': 'uint32',
+            '*zone-max-open': 'uint32' } }
+
 ##
 # @PrManagerHelperProperties:
 #
@@ -831,6 +875,8 @@
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
     'x-nvme-subsystem',
+    'x-nvme-ns-nvm',
+    'x-nvme-ns-zoned',
     'pef-guest',
     'pr-manager-helper',
     'qtest',
@@ -890,6 +936,8 @@
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
       'x-nvme-subsystem':           'NvmeSubsystemProperties',
+      'x-nvme-ns-nvm':              'NvmeNamespaceNvmProperties',
+      'x-nvme-ns-zoned':            'NvmeNamespaceZonedProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
-- 
2.33.0


