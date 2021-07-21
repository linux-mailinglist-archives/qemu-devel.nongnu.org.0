Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3EF3D0A1C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:55:50 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6753-0001ew-ED
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yM-0006qJ-EW; Wed, 21 Jul 2021 03:48:54 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yK-0002QZ-KS; Wed, 21 Jul 2021 03:48:54 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE6515816F0;
 Wed, 21 Jul 2021 03:48:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 21 Jul 2021 03:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 69JPLYSnFZhAufymlT12ftm0OEpfY9b/EpDsh51XTk0=; b=jmwQP/QZFs0lJrrz
 +4b0QkdSEjC4Qf8Dj9C8TvTa9jjrlOxT6EgEuuhhHekOR/QShOJltaG+I7gKDcqQ
 fM44Fw7NatJXJqqNeswngxDEWpGG7qhmP5YhT35ncwjyQvPWXUL1v5vv130j/M/q
 ZXGTNe5ALuDblwreXGS/BCq90GmGyNgEG8CfKuwF3IRTgkSDFtYmDbOeFi2Ysdf2
 GS9Nv+qaoK1JkRzG8MxUqkRIDpEja7onMDqdL5qlNx2lJ/MvktywDMwD5dhi8qbL
 vz8FlW/EO3N2vy+V9E7euM32O4hueIQmSWrzOtPtpDUfDKrHLgUwlAP0pWBhAeB+
 vt4HYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=69JPLYSnFZhAufymlT12ftm0OEpfY9b/EpDsh51XT
 k0=; b=iah0JV3auNlDh1lfdwQ1+xWzJZh5id09QzKXTNc9piORhaqfN4VdGZgcw
 vQdtBH4hyIeWi6uDcEXBAScRUaB2oUqQL+EtD/4Mj6opPaXgJH13gVqVSwwjL8/t
 +WTvNQLPpStxi578Rc2DvDTtHWSxGioxM+okb2C+t7nry/iop2ZGpV8OS7gFomkv
 R/zjHb0s9H3kkoaRy/zQJQxucveLrrAcKfYGllQOKTg8Z0+LOsv5ee4212/V0igp
 faADnHSJBt3FgrCLmoSIkIii48yGNHbvVMO63V2+IuWwzMiqCanRs2EiJY6AI9H/
 A61iySOVQsTbmLSqFIWkBaIZUgb6A==
X-ME-Sender: <xms:Y9H3YJuVqumahL9XDuCZ9YwTd8xjJcfmCcm6cMqUFX2d-F3o22c7BQ>
 <xme:Y9H3YCcR5VwaqDLYob3ADb_1D62D7OeaAVw7oEV4R0SoT2JnFLrgcL6b7Br__FajI
 uivjuR96R6fXlgVQvE>
X-ME-Received: <xmr:Y9H3YMyvRfS_BAxU84Ldbcv0BsB7umfacSSI27Dy_2Hm2SdFmR-ZMY2Gy1R_TC4GBdOXyaqIAnqPbLn-r957aaKJUpDpsREkWuF2URl9zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Y9H3YAOOkNoBFfWlA5Gsyd7l6c0Wj6aGHUcf0PaOlIWA69-N-PGPpA>
 <xmx:Y9H3YJ_tKrCiUiExnzTiZv2fceqSGTZmxeMElqu6_d6TYi2PXbv1bA>
 <xmx:Y9H3YAWjPgUEpt2-W2mAREnPNG1IsGdXedZX0TEE36ZcyRNJZ1zXOA>
 <xmx:Y9H3YHf9DimPM3NT-I_Hecgo3pyeWl_r0IRRj10A7FFi6PxtQRJwvA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 03:48:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/5] hw/nvme: use symbolic names for registers
Date: Wed, 21 Jul 2021 09:48:33 +0200
Message-Id: <20210721074836.110232-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721074836.110232-1-its@irrelevant.dk>
References: <20210721074836.110232-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the NvmeBarRegs enum and use these instead of explicit register
offsets.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 include/block/nvme.h | 29 ++++++++++++++++++++++++++++-
 hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 84053b68b987..77aae0117494 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -9,7 +9,7 @@ typedef struct QEMU_PACKED NvmeBar {
     uint32_t    cc;
     uint8_t     rsvd24[4];
     uint32_t    csts;
-    uint32_t    nssrc;
+    uint32_t    nssr;
     uint32_t    aqa;
     uint64_t    asq;
     uint64_t    acq;
@@ -31,6 +31,33 @@ typedef struct QEMU_PACKED NvmeBar {
     uint8_t     css[484];
 } NvmeBar;
 
+enum NvmeBarRegs {
+    NVME_REG_CAP     = offsetof(NvmeBar, cap),
+    NVME_REG_VS      = offsetof(NvmeBar, vs),
+    NVME_REG_INTMS   = offsetof(NvmeBar, intms),
+    NVME_REG_INTMC   = offsetof(NvmeBar, intmc),
+    NVME_REG_CC      = offsetof(NvmeBar, cc),
+    NVME_REG_CSTS    = offsetof(NvmeBar, csts),
+    NVME_REG_NSSR    = offsetof(NvmeBar, nssr),
+    NVME_REG_AQA     = offsetof(NvmeBar, aqa),
+    NVME_REG_ASQ     = offsetof(NvmeBar, asq),
+    NVME_REG_ACQ     = offsetof(NvmeBar, acq),
+    NVME_REG_CMBLOC  = offsetof(NvmeBar, cmbloc),
+    NVME_REG_CMBSZ   = offsetof(NvmeBar, cmbsz),
+    NVME_REG_BPINFO  = offsetof(NvmeBar, bpinfo),
+    NVME_REG_BPRSEL  = offsetof(NvmeBar, bprsel),
+    NVME_REG_BPMBL   = offsetof(NvmeBar, bpmbl),
+    NVME_REG_CMBMSC  = offsetof(NvmeBar, cmbmsc),
+    NVME_REG_CMBSTS  = offsetof(NvmeBar, cmbsts),
+    NVME_REG_PMRCAP  = offsetof(NvmeBar, pmrcap),
+    NVME_REG_PMRCTL  = offsetof(NvmeBar, pmrctl),
+    NVME_REG_PMRSTS  = offsetof(NvmeBar, pmrsts),
+    NVME_REG_PMREBS  = offsetof(NvmeBar, pmrebs),
+    NVME_REG_PMRSWTP = offsetof(NvmeBar, pmrswtp),
+    NVME_REG_PMRMSCL = offsetof(NvmeBar, pmrmscl),
+    NVME_REG_PMRMSCU = offsetof(NvmeBar, pmrmscu),
+};
+
 enum NvmeCapShift {
     CAP_MQES_SHIFT     = 0,
     CAP_CQR_SHIFT      = 16,
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 070d9f6a962d..23ff71f65c0e 100644
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
@@ -5933,7 +5933,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0xe18: /* PMRMSCU */
+    case NVME_REG_PMRMSCU:
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5975,7 +5975,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
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


