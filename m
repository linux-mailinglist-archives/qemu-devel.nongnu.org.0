Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B6933246B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:50:50 +0100 (CET)
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJasz-000217-7t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanp-0008Ax-Eu; Tue, 09 Mar 2021 06:45:29 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:47239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanj-0008SW-Qg; Tue, 09 Mar 2021 06:45:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C281C2728;
 Tue,  9 Mar 2021 06:45:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VGP+Ymo6TFTLk
 65CJB6MoE1RmI6Gr39/j6r4vBbLqaM=; b=ACUwyhfXMqbdRfLSMevA61dx2ILEh
 yRWkaNB+SvFcE9jZbveHUSckt2eVhwsu8i+q0EIhEjWS0N2jtt6341EstsvKHdJw
 CDerEI7uemFu+qlqn9/CRGNTuZe9HnPfF055AT+pTSsIsaD7vrlx75PYClp3Lrp3
 xS4d0AKi88kyrx41X105Rz47A2LgxfjQzMEzb89Qc4zZ/yDwibblaY38DSi30+45
 siOCnVj1hxZ9NHSBXb1ZzcUdRkODeau8WygczJA+f8pJZgnqDMp3KdPXJK2G+aER
 fzeiIo78IbU8iiuEhhSfde8Yh4Z41fUUJAsmYqTIMx+Qb5oxavt5/IwQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VGP+Ymo6TFTLk65CJB6MoE1RmI6Gr39/j6r4vBbLqaM=; b=dR0svKsZ
 N40VGqkrNZZEYhJ1csSzlh7RYkON1Yfr64JqQA9945dNppCQQOPmF3chfxiXMMW5
 eckcxEOZ3OtCRfUbb163CdcoROiF8ENK6uaySELWHRItw7mYtVz3l9/x5tggxroJ
 MuCiN+fNPIeCRnt/mAzvYLbiwm33g0MF46DmtjRv2FBiR7BH0CpgJGLDtsXNe64W
 /g0KeBolg+QSX4DfxNBommOdF/vmFvk3ePgmt+vUvHQyQrjy5FSSGSKh3SwsCmvt
 h+YHCMI/fbKlc0gBq93B9vogPQqoI9AUqMUB7YZfKpsZZmBsMvFcYqmcYnI6YlHY
 KHkO7CBkFnxjow==
X-ME-Sender: <xms:z19HYFB49RkMH8Jnwyb32L7qGfN1iOmWp6VgHMMlO2docatonLNJuQ>
 <xme:z19HYDg2Uil6_40rPx1t45lSafhy7Cble9MjuPRFSIAujV5Olo7SAedDrj_o-gtqr
 c_HYXAyKjXOZprzE4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeltdetfeegkefguedvtdduffejiedvjeejudejieelveekhfekvdefleeludev
 ffenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:z19HYAm-t_cBh4GS-KSeVwTLKWqazt2HhvEtMZjphi_gyvrFv0nUig>
 <xmx:z19HYPxrJ9EKAwzUcgxKhLjHU2hO4v9XKVl6QWT85xICnlbE1Yh8dQ>
 <xmx:z19HYKQmYcn0afFQWudrL23bkYRdBHe8cm7oOea-62Z40pfCwXgHqg>
 <xmx:z19HYNE65gj3ETr-9MnZUYG7z9FXvBvA4mf75zsey24xrIXEYctZIcF6s3U>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E092B240054;
 Tue,  9 Mar 2021 06:45:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 02/38] hw/block/nvme: support to map controller to a
 subsystem
Date: Tue,  9 Mar 2021 12:44:36 +0100
Message-Id: <20210309114512.536489-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

nvme controller(nvme) can be mapped to a NVMe subsystem(nvme-subsys).
This patch maps a controller to a subsystem by adding a parameter
'subsys' to the nvme device.

To map a controller to a subsystem, we need to put nvme-subsys first and
then maps the subsystem to the controller:

  -device nvme-subsys,id=subsys0
  -device nvme,serial=foo,id=nvme0,subsys=subsys0

If 'subsys' property is not given to the nvme controller, then subsystem
NQN will be created with serial (e.g., 'foo' in above example),
Otherwise, it will be based on subsys id (e.g., 'subsys0' in above
example).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |  3 +++
 hw/block/nvme.c | 30 +++++++++++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index dee6092bd45f..04d4684601fd 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -2,6 +2,7 @@
 #define HW_NVME_H
 
 #include "block/nvme.h"
+#include "nvme-subsys.h"
 #include "nvme-ns.h"
 
 #define NVME_MAX_NAMESPACES 256
@@ -170,6 +171,8 @@ typedef struct NvmeCtrl {
 
     uint8_t     zasl;
 
+    NvmeSubsystem   *subsys;
+
     NvmeNamespace   namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 98bd987abccf..f5a19fd54676 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -23,7 +23,8 @@
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
+ *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
+ *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>
  *
@@ -53,6 +54,13 @@
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
+ * - `subsys`
+ *   Specifying this parameter attaches the controller to the subsystem and
+ *   the SUBNQN field in the controller will report the NQN of the subsystem
+ *   device. This also enables multi controller capability represented in
+ *   Identify Controller data structure in CMIC (Controller Multi-path I/O and
+ *   Namesapce Sharing Capabilities).
+ *
  * - `aerl`
  *   The Asynchronous Event Request Limit (AERL). Indicates the maximum number
  *   of concurrently outstanding Asynchronous Event Request commands support
@@ -4417,11 +4425,23 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     return 0;
 }
 
+static void nvme_init_subnqn(NvmeCtrl *n)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    NvmeIdCtrl *id = &n->id_ctrl;
+
+    if (!subsys) {
+        snprintf((char *)id->subnqn, sizeof(id->subnqn),
+                 "nqn.2019-08.org.qemu:%s", n->params.serial);
+    } else {
+        pstrcpy((char *)id->subnqn, sizeof(id->subnqn), (char*)subsys->subnqn);
+    }
+}
+
 static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
-    char *subnqn;
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -4468,9 +4488,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", n->params.serial);
-    strpadcpy((char *)id->subnqn, sizeof(id->subnqn), subnqn, '\0');
-    g_free(subnqn);
+    nvme_init_subnqn(n);
 
     id->psd[0].mp = cpu_to_le16(0x9c4);
     id->psd[0].enlat = cpu_to_le32(0x10);
@@ -4562,6 +4580,8 @@ static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
     DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmr.dev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
+                     NvmeSubsystem *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
-- 
2.30.1


