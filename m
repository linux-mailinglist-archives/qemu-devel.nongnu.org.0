Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D3558AEE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:49:00 +0200 (CEST)
Received: from localhost ([::1]:52958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Uh8-0005el-3U
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UU6-0004xJ-Ga; Thu, 23 Jun 2022 17:35:30 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UU4-0006fd-3M; Thu, 23 Jun 2022 17:35:30 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3D070320097E;
 Thu, 23 Jun 2022 17:35:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020124; x=
 1656106524; bh=4mUg/HH0qTKh/3xOaecbdOTxrGfoQODZREtxdP5lhZo=; b=H
 nINxHDDecOIdfnUnd+fomtDCvoUQNDifgMmXOW4O04z6sxSiF3ne04lv/38jBCtp
 GgNOFPNdYSYVjJT6wq7kRrbFucfjq+dEWNo1X4+/5IQu+pYqcKtKLhs7NIfrUzUG
 QRDSQYus1U8SZUQyem7nXrbW/UiVTyqVjXajLG4UQc6Cq3zDysuwjZVTLdfEAwlC
 QE+oTQSq+049wARxjjyAVuczJ0F4X+fqGTXbFp2dMeGWZR5gY45YVzCVFQVuphO/
 gtr2sgPWG+fjGs2rcai+ENWU+VP3moCUKJuKey1gc0J61T1LwhNhQX2nVPLU9Zcl
 SboJIZ++HxP4rCGDXwJTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656020124; x=
 1656106524; bh=4mUg/HH0qTKh/3xOaecbdOTxrGfoQODZREtxdP5lhZo=; b=d
 3gMX2Zv86bardHHKpiucyVmCr9VeoKscyO5uXMD0MNYdMnTLH1xFGe/JYGv+EQbS
 fFFEdkjUerDb7XAdJk+/G5IArrrmgO9d/44qQprA6LAQJtZ40o74RG5p5y4y+opF
 icIYC4o7MH2+xVrqKLkdo5O47c5UPx9B64OadX1NNTIh0WP2CrgWY4BAuMg7tnDD
 gHuCRO/i0bkc/outOOIUO1g7bQuhdP6d90UVaH9UPUrstQpg4fK+97uEt4P+yFdB
 e5UQtWmwrhko1ZrAnxLwu0EEDCu+RHXbJ1ZjmurcTmyXTXh+u0+TgBnvN51oe30r
 ORc2jjTU85RbUSmZG34kg==
X-ME-Sender: <xms:nNy0YtM-Ky39HB1xw058kftqu7CMPvzaEQ6IjH1UKHGua17GarXwhA>
 <xme:nNy0Yv9tVUIzw8DW49vxtDFjyZuakRsK2fbnYTWHIiWFoT5wKy0uEVp8BvwQKsza2
 2B2OQNzzjNFmDKjmbQ>
X-ME-Received: <xmr:nNy0YsRHp383Qjx95SczkQrlsIqx-hEKCKSotYL23-3AkrXVBol-RaZ_W73WgUug1S8aDomdtpCnrAA8Uy2J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhl
 rghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrf
 grthhtvghrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffet
 jeeihfdvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:nNy0YpsSRwozFyjzpz2E-OkimuBPtRWydQ-IYTRW24TXiSQR5QGYzg>
 <xmx:nNy0YlfyIQiJcIgFB8VPe5EUkIgbWopANuf83UPI6nBPWmi8jLbr4w>
 <xmx:nNy0Yl31SFGLKRfUirgEy3DAJjv-8Nj069UDqqTghDEEFK5D-f3WRw>
 <xmx:nNy0Yg1tnq2F63DxN3vkH_RUG7o3J6XKtlU_273UCLZrfwJwMBzc1A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:22 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 08/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Date: Thu, 23 Jun 2022 23:34:35 +0200
Message-Id: <20220623213442.67789-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

With four new properties:
 - sriov_v{i,q}_flexible,
 - sriov_max_v{i,q}_per_vf,
one can configure the number of available flexible resources, as well as
the limits. The primary and secondary controller capability structures
are initialized accordingly.

Since the number of available queues (interrupts) now varies between
VF/PF, BAR size calculation is also adjusted.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 141 ++++++++++++++++++++++++++++++++++++++++---
 hw/nvme/nvme.h       |   4 ++
 include/block/nvme.h |   5 ++
 3 files changed, 143 insertions(+), 7 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 3315e5c3de0a..3728813e90f0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -36,6 +36,10 @@
  *              zoned.zasl=<N[optional]>, \
  *              zoned.auto_transition=<on|off[optional]>, \
  *              sriov_max_vfs=<N[optional]> \
+ *              sriov_vq_flexible=<N[optional]> \
+ *              sriov_vi_flexible=<N[optional]> \
+ *              sriov_max_vi_per_vf=<N[optional]> \
+ *              sriov_max_vq_per_vf=<N[optional]> \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -113,6 +117,29 @@
  *   enables reporting of both SR-IOV and ARI capabilities by the NVMe device.
  *   Virtual function controllers will not report SR-IOV capability.
  *
+ *   NOTE: Single Root I/O Virtualization support is experimental.
+ *   All the related parameters may be subject to change.
+ *
+ * - `sriov_vq_flexible`
+ *   Indicates the total number of flexible queue resources assignable to all
+ *   the secondary controllers. Implicitly sets the number of primary
+ *   controller's private resources to `(max_ioqpairs - sriov_vq_flexible)`.
+ *
+ * - `sriov_vi_flexible`
+ *   Indicates the total number of flexible interrupt resources assignable to
+ *   all the secondary controllers. Implicitly sets the number of primary
+ *   controller's private resources to `(msix_qsize - sriov_vi_flexible)`.
+ *
+ * - `sriov_max_vi_per_vf`
+ *   Indicates the maximum number of virtual interrupt resources assignable
+ *   to a secondary controller. The default 0 resolves to
+ *   `(sriov_vi_flexible / sriov_max_vfs)`.
+ *
+ * - `sriov_max_vq_per_vf`
+ *   Indicates the maximum number of virtual queue resources assignable to
+ *   a secondary controller. The default 0 resolves to
+ *   `(sriov_vq_flexible / sriov_max_vfs)`.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -185,6 +212,7 @@
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 #define NVME_MAX_VFS 127
+#define NVME_VF_RES_GRANULARITY 1
 #define NVME_VF_OFFSET 0x1
 #define NVME_VF_STRIDE 1
 
@@ -6658,6 +6686,53 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "PMR is not supported with SR-IOV");
             return;
         }
+
+        if (!params->sriov_vq_flexible || !params->sriov_vi_flexible) {
+            error_setg(errp, "both sriov_vq_flexible and sriov_vi_flexible"
+                       " must be set for the use of SR-IOV");
+            return;
+        }
+
+        if (params->sriov_vq_flexible < params->sriov_max_vfs * 2) {
+            error_setg(errp, "sriov_vq_flexible must be greater than or equal"
+                       " to %d (sriov_max_vfs * 2)", params->sriov_max_vfs * 2);
+            return;
+        }
+
+        if (params->max_ioqpairs < params->sriov_vq_flexible + 2) {
+            error_setg(errp, "(max_ioqpairs - sriov_vq_flexible) must be"
+                       " greater than or equal to 2");
+            return;
+        }
+
+        if (params->sriov_vi_flexible < params->sriov_max_vfs) {
+            error_setg(errp, "sriov_vi_flexible must be greater than or equal"
+                       " to %d (sriov_max_vfs)", params->sriov_max_vfs);
+            return;
+        }
+
+        if (params->msix_qsize < params->sriov_vi_flexible + 1) {
+            error_setg(errp, "(msix_qsize - sriov_vi_flexible) must be"
+                       " greater than or equal to 1");
+            return;
+        }
+
+        if (params->sriov_max_vi_per_vf &&
+            (params->sriov_max_vi_per_vf - 1) % NVME_VF_RES_GRANULARITY) {
+            error_setg(errp, "sriov_max_vi_per_vf must meet:"
+                       " (sriov_max_vi_per_vf - 1) %% %d == 0 and"
+                       " sriov_max_vi_per_vf >= 1", NVME_VF_RES_GRANULARITY);
+            return;
+        }
+
+        if (params->sriov_max_vq_per_vf &&
+            (params->sriov_max_vq_per_vf < 2 ||
+             (params->sriov_max_vq_per_vf - 1) % NVME_VF_RES_GRANULARITY)) {
+            error_setg(errp, "sriov_max_vq_per_vf must meet:"
+                       " (sriov_max_vq_per_vf - 1) %% %d == 0 and"
+                       " sriov_max_vq_per_vf >= 2", NVME_VF_RES_GRANULARITY);
+            return;
+        }
     }
 }
 
@@ -6666,10 +6741,19 @@ static void nvme_init_state(NvmeCtrl *n)
     NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
     NvmeSecCtrlList *list = &n->sec_ctrl_list;
     NvmeSecCtrlEntry *sctrl;
+    uint8_t max_vfs;
     int i;
 
-    n->conf_ioqpairs = n->params.max_ioqpairs;
-    n->conf_msix_qsize = n->params.msix_qsize;
+    if (pci_is_vf(&n->parent_obj)) {
+        sctrl = nvme_sctrl(n);
+        max_vfs = 0;
+        n->conf_ioqpairs = sctrl->nvq ? le16_to_cpu(sctrl->nvq) - 1 : 0;
+        n->conf_msix_qsize = sctrl->nvi ? le16_to_cpu(sctrl->nvi) : 1;
+    } else {
+        max_vfs = n->params.sriov_max_vfs;
+        n->conf_ioqpairs = n->params.max_ioqpairs;
+        n->conf_msix_qsize = n->params.msix_qsize;
+    }
 
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
@@ -6678,14 +6762,41 @@ static void nvme_init_state(NvmeCtrl *n)
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 
-    list->numcntl = cpu_to_le16(n->params.sriov_max_vfs);
-    for (i = 0; i < n->params.sriov_max_vfs; i++) {
+    list->numcntl = cpu_to_le16(max_vfs);
+    for (i = 0; i < max_vfs; i++) {
         sctrl = &list->sec[i];
         sctrl->pcid = cpu_to_le16(n->cntlid);
         sctrl->vfn = cpu_to_le16(i + 1);
     }
 
     cap->cntlid = cpu_to_le16(n->cntlid);
+    cap->crt = NVME_CRT_VQ | NVME_CRT_VI;
+
+    if (pci_is_vf(&n->parent_obj)) {
+        cap->vqprt = cpu_to_le16(1 + n->conf_ioqpairs);
+    } else {
+        cap->vqprt = cpu_to_le16(1 + n->params.max_ioqpairs -
+                                 n->params.sriov_vq_flexible);
+        cap->vqfrt = cpu_to_le32(n->params.sriov_vq_flexible);
+        cap->vqrfap = cap->vqfrt;
+        cap->vqgran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
+        cap->vqfrsm = n->params.sriov_max_vq_per_vf ?
+                        cpu_to_le16(n->params.sriov_max_vq_per_vf) :
+                        cap->vqfrt / MAX(max_vfs, 1);
+    }
+
+    if (pci_is_vf(&n->parent_obj)) {
+        cap->viprt = cpu_to_le16(n->conf_msix_qsize);
+    } else {
+        cap->viprt = cpu_to_le16(n->params.msix_qsize -
+                                 n->params.sriov_vi_flexible);
+        cap->vifrt = cpu_to_le32(n->params.sriov_vi_flexible);
+        cap->virfap = cap->vifrt;
+        cap->vigran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
+        cap->vifrsm = n->params.sriov_max_vi_per_vf ?
+                        cpu_to_le16(n->params.sriov_max_vi_per_vf) :
+                        cap->vifrt / MAX(max_vfs, 1);
+    }
 }
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -6758,11 +6869,14 @@ static uint64_t nvme_bar_size(unsigned total_queues, unsigned total_irqs,
     return bar_size;
 }
 
-static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
-                            uint64_t bar_size)
+static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
 {
     uint16_t vf_dev_id = n->params.use_intel_id ?
                          PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT_NVME;
+    NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+    uint64_t bar_size = nvme_bar_size(le16_to_cpu(cap->vqfrsm),
+                                      le16_to_cpu(cap->vifrsm),
+                                      NULL, NULL);
 
     pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
                        n->params.sriov_max_vfs, n->params.sriov_max_vfs,
@@ -6860,7 +6974,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
 
     if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
-        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
+        nvme_init_sriov(n, pci_dev, 0x120);
     }
 
     return 0;
@@ -6884,6 +6998,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
+    NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -6976,6 +7091,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     stl_le_p(&n->bar.vs, NVME_SPEC_VER);
     n->bar.intmc = n->bar.intms = 0;
+
+    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
+        stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
+    }
 }
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
@@ -7116,6 +7235,14 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
     DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
+    DEFINE_PROP_UINT16("sriov_vq_flexible", NvmeCtrl,
+                       params.sriov_vq_flexible, 0),
+    DEFINE_PROP_UINT16("sriov_vi_flexible", NvmeCtrl,
+                       params.sriov_vi_flexible, 0),
+    DEFINE_PROP_UINT8("sriov_max_vi_per_vf", NvmeCtrl,
+                      params.sriov_max_vi_per_vf, 0),
+    DEFINE_PROP_UINT8("sriov_max_vq_per_vf", NvmeCtrl,
+                      params.sriov_max_vq_per_vf, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index d9deb0b1ec43..9afa5e1a930a 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -412,6 +412,10 @@ typedef struct NvmeParams {
     bool     auto_transition_zones;
     bool     legacy_cmb;
     uint8_t  sriov_max_vfs;
+    uint16_t sriov_vq_flexible;
+    uint16_t sriov_vi_flexible;
+    uint8_t  sriov_max_vq_per_vf;
+    uint8_t  sriov_max_vi_per_vf;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 94efd32578cb..58d08d5c2aaf 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1576,6 +1576,11 @@ typedef struct QEMU_PACKED NvmePriCtrlCap {
     uint8_t     rsvd80[4016];
 } NvmePriCtrlCap;
 
+typedef enum NvmePriCtrlCapCrt {
+    NVME_CRT_VQ             = 1 << 0,
+    NVME_CRT_VI             = 1 << 1,
+} NvmePriCtrlCapCrt;
+
 typedef struct QEMU_PACKED NvmeSecCtrlEntry {
     uint16_t    scid;
     uint16_t    pcid;
-- 
2.36.1


