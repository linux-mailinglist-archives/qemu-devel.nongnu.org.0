Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BABD3C76F6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:30:58 +0200 (CEST)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3O7N-0001t3-7M
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1J-0007Ow-75; Tue, 13 Jul 2021 15:24:41 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1H-0003QW-Ds; Tue, 13 Jul 2021 15:24:40 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B41D8580AC0;
 Tue, 13 Jul 2021 15:24:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 13 Jul 2021 15:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zG9JyqHT8Dwq+
 p6OcpKp2PSDpchYQzomo1T27aiWcYg=; b=WAN2qpDg3o6jPKDkIyyK1J94wWFzp
 kYFKL3UWodbEgf/JbzMykt91t5u0h5VKgbziOWtPP4lGUaifRdbXVOCb5oafZ6Uk
 xd8GteSTieIOCkwRIa0jBPUBMOGdfn+UK7n/z4I1RkX1GH/AjSUq6W1YBSUkpjIo
 bbVJmtuUrft1S9VrHjE0RjxXl5/w7yp/znBOb/vnAfPQvLz+NJqwsnIRP8+iLXVY
 opOS4LqDo85MKGGcH5A44oGODWK40f5nLCXu6C/CsMnivqZkRiV8jmQFc3FEdL4S
 8Xth0QETXTN0qPIRusBJGBOx3uRIf8keyNzAsl9smr4VmHJolgym7TyUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zG9JyqHT8Dwq+p6OcpKp2PSDpchYQzomo1T27aiWcYg=; b=vfDJc9ZA
 OGuOoBrUH0NJpWLIp5/ILza/m49DaeI0B9K4jAgByCHDUmOywBwxIJZ4sA/2gpPU
 LpiCzpI2OsodEi0RfLbrTaX+GOWc+ZrNLSAs5rez2W9xRbi25bqt8SChP65cME9z
 W3Rz42hpdWgRWB1NVbKGVeYDewagozQSIop5My1oxbj4pX98kq8Anls3g4SwY3f6
 +QotUCKn+NnPjPimx393DBom8RZ35K5Lxc8zkPK9g2+yby9CieF/AqxRtD49612/
 Ukxzwnec9Za5jSu4la/vXaJZ8Gm999gFtttufwjev0AAk1OU8TddFc9F4NVK5mTj
 K3i3z+iZYrmm4g==
X-ME-Sender: <xms:dujtYOwpZUh4hYWbUW_BQ1DkV1F3S2cGE46bdTka1knm_i-OkAGvDQ>
 <xme:dujtYKT9Qkz-IbBRD4O6i9UIiIdUAGT0wvgC8P5-bC3Nzsq-2Fs39M0j7lj18rnWh
 W6VDN3fUJi43cgHVBM>
X-ME-Received: <xmr:dujtYAWv96rdoExuOTopX0_VfNbPdj6QznUUCNAIuxxWmmhTWe9A24fJpMicgy40vyCOBu9XkQUUr04B9L-Il9iHHKMs6gBImcAl4IEiBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:dujtYEhvM0bZlcv7_TKpQVRKBBb5C-_jKAasYCZWcZTxcgCqyAN08Q>
 <xmx:dujtYADWhFx_R5KrE9J_uwobMEyvIEfM87NBejG5gRLI-en4aCQ_TA>
 <xmx:dujtYFK6uYUgc5e2FjQy4URUvV80K-MbvWcNRfr4dL53gjkr6HycHQ>
 <xmx:dujtYM4OJWyHS7uk6poRvuvoPQ_fiqxkdU0UnKREABIwtZTxtmoj5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 15:24:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/nvme: use symbolic names for registers
Date: Tue, 13 Jul 2021 21:24:25 +0200
Message-Id: <20210713192428.950160-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713192428.950160-1-its@irrelevant.dk>
References: <20210713192428.950160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the NvmeBarRegs enum and use these instead of explicit register
offsets.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 27 +++++++++++++++++++++++++++
 hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
 2 files changed, 49 insertions(+), 22 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 84053b68b987..082d4bddbf9f 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -31,6 +31,33 @@ typedef struct QEMU_PACKED NvmeBar {
     uint8_t     css[484];
 } NvmeBar;
 
+enum NvmeBarRegs {
+    NVME_REG_CAP     = 0x0,
+    NVME_REG_VS      = 0x8,
+    NVME_REG_INTMS   = 0xc,
+    NVME_REG_INTMC   = 0x10,
+    NVME_REG_CC      = 0x14,
+    NVME_REG_CSTS    = 0x1c,
+    NVME_REG_NSSR    = 0x20,
+    NVME_REG_AQA     = 0x24,
+    NVME_REG_ASQ     = 0x28,
+    NVME_REG_ACQ     = 0x30,
+    NVME_REG_CMBLOC  = 0x38,
+    NVME_REG_CMBSZ   = 0x3c,
+    NVME_REG_BPINFO  = 0x40,
+    NVME_REG_BPRSEL  = 0x44,
+    NVME_REG_BPMBL   = 0x48,
+    NVME_REG_CMBMSC  = 0x50,
+    NVME_REG_CMBSTS  = 0x58,
+    NVME_REG_PMRCAP  = 0xe00,
+    NVME_REG_PMRCTL  = 0xe04,
+    NVME_REG_PMRSTS  = 0xe08,
+    NVME_REG_PMREBS  = 0xe0c,
+    NVME_REG_PMRSWTP = 0xe10,
+    NVME_REG_PMRMSCL = 0xe14,
+    NVME_REG_PMRMSCU = 0xe18,
+};
+
 enum NvmeCapShift {
     CAP_MQES_SHIFT     = 0,
     CAP_CQR_SHIFT      = 16,
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 28299c6f3764..8c305315f41c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5740,7 +5740,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
     }
 
     switch (offset) {
-    case 0xc:   /* INTMS */
+    case NVME_REG_INTMS:
         if (unlikely(msix_enabled(&(n->parent_obj)))) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
                            "undefined access to interrupt mask set"
@@ -5752,7 +5752,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         trace_pci_nvme_mmio_intm_set(data & 0xffffffff, n->bar.intmc);
         nvme_irq_check(n);
         break;
-    case 0x10:  /* INTMC */
+    case NVME_REG_INTMC:
         if (unlikely(msix_enabled(&(n->parent_obj)))) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
                            "undefined access to interrupt mask clr"
@@ -5764,7 +5764,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, n->bar.intmc);
         nvme_irq_check(n);
         break;
-    case 0x14:  /* CC */
+    case NVME_REG_CC:
         trace_pci_nvme_mmio_cfg(data & 0xffffffff);
         /* Windows first sends data, then sends enable bit */
         if (!NVME_CC_EN(data) && !NVME_CC_EN(n->bar.cc) &&
@@ -5798,7 +5798,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->bar.cc = data;
         }
         break;
-    case 0x1c:  /* CSTS */
+    case NVME_REG_CSTS:
         if (data & (1 << 4)) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
                            "attempted to W1C CSTS.NSSRO"
@@ -5809,7 +5809,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                            " of controller status");
         }
         break;
-    case 0x20:  /* NSSR */
+    case NVME_REG_NSSR:
         if (data == 0x4e564d65) {
             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
         } else {
@@ -5817,38 +5817,38 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             return;
         }
         break;
-    case 0x24:  /* AQA */
+    case NVME_REG_AQA:
         n->bar.aqa = data & 0xffffffff;
         trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
         break;
-    case 0x28:  /* ASQ */
+    case NVME_REG_ASQ:
         n->bar.asq = size == 8 ? data :
             (n->bar.asq & ~0xffffffffULL) | (data & 0xffffffff);
         trace_pci_nvme_mmio_asqaddr(data);
         break;
-    case 0x2c:  /* ASQ hi */
+    case NVME_REG_ASQ + 4:
         n->bar.asq = (n->bar.asq & 0xffffffff) | (data << 32);
         trace_pci_nvme_mmio_asqaddr_hi(data, n->bar.asq);
         break;
-    case 0x30:  /* ACQ */
+    case NVME_REG_ACQ:
         trace_pci_nvme_mmio_acqaddr(data);
         n->bar.acq = size == 8 ? data :
             (n->bar.acq & ~0xffffffffULL) | (data & 0xffffffff);
         break;
-    case 0x34:  /* ACQ hi */
+    case NVME_REG_ACQ + 4:
         n->bar.acq = (n->bar.acq & 0xffffffff) | (data << 32);
         trace_pci_nvme_mmio_acqaddr_hi(data, n->bar.acq);
         break;
-    case 0x38:  /* CMBLOC */
+    case NVME_REG_CMBLOC:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbloc_reserved,
                        "invalid write to reserved CMBLOC"
                        " when CMBSZ is zero, ignored");
         return;
-    case 0x3C:  /* CMBSZ */
+    case NVME_REG_CMBSZ:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
                        "invalid write to read only CMBSZ, ignored");
         return;
-    case 0x50:  /* CMBMSC */
+    case NVME_REG_CMBMSC:
         if (!NVME_CAP_CMBS(n->bar.cap)) {
             return;
         }
@@ -5876,15 +5876,15 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0x54:  /* CMBMSC hi */
+    case NVME_REG_CMBMSC + 4:
         n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
         return;
 
-    case 0xe00: /* PMRCAP */
+    case NVME_REG_PMRCAP:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
                        "invalid write to PMRCAP register, ignored");
         return;
-    case 0xe04: /* PMRCTL */
+    case NVME_REG_PMRCTL:
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5899,19 +5899,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->pmr.cmse = false;
         }
         return;
-    case 0xe08: /* PMRSTS */
+    case NVME_REG_PMRSTS:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
                        "invalid write to PMRSTS register, ignored");
         return;
-    case 0xe0C: /* PMREBS */
+    case NVME_REG_PMREBS:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
                        "invalid write to PMREBS register, ignored");
         return;
-    case 0xe10: /* PMRSWTP */
+    case NVME_REG_PMRSWTP:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
                        "invalid write to PMRSWTP register, ignored");
         return;
-    case 0xe14: /* PMRMSCL */
+    case NVME_REG_PMRMSCL:
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5932,7 +5932,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0xe18: /* PMRMSCU */
+    case NVME_REG_PMRMSCU:
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5974,7 +5974,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          * from PMRSTS should ensure prior writes
          * made it to persistent media
          */
-        if (addr == 0xe08 &&
+        if (addr == NVME_REG_PMRSTS &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
-- 
2.32.0


