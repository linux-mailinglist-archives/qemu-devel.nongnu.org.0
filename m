Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1F3CEF61
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:51:59 +0200 (CEST)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5c7C-00035w-FM
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2Q-0000Lb-Ni; Mon, 19 Jul 2021 18:47:02 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2O-0005O2-MC; Mon, 19 Jul 2021 18:47:02 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AE997580A6A;
 Mon, 19 Jul 2021 18:46:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Jul 2021 18:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 cDlfl5G79+DeHN/8tVvN4OXBxSDbpAHvL/YJeim6ckk=; b=PXRLppIEsXDP0qB3
 WU7PoMEB7MeS3JIyhNzM6vUEvWizl2UVsPtdyq/H+a9vx5uIvgyxKa3FPRnkgd9A
 WKBd17lh5X6YDngndQUIS1PUlflDuzTdS0IEGTVSxqMCKs7LBw5ppbB6q4WnShbK
 cMUd4vfmMHf0PAhXxre0WPUv1pqBhxnMQK0+JO5hDuHumKLIlYIO0+2Tq04P77S4
 reooEHmhIItHx+ezravfcAGnHpAAQ3LHXm3TT90hV5/V6/WbGmUpEWNfNYQercF5
 udBiqeOiRJQuzDxXR8dRQ9PusMiWpUboAcOJOdGJOy5my8UqRpDRuSXX3z6fV+OZ
 u/MT7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=cDlfl5G79+DeHN/8tVvN4OXBxSDbpAHvL/YJeim6c
 kk=; b=aNGwibEtTaqK/wU7jKpUSHd9Jv1aI/IYtOkAAmc/FWGkxyrvzzxTBosqL
 ynzN4DxXdA66X9mtB0y1oQxZO/lKgs2urtzoVPU+lMDm0inpnVW2SdyTi/IM3Gjc
 frzqCgewFTrrd1b8OtLOFR93uact7IsxfrdL81lAXYoNlkevhM4I00ZlS9EFL394
 2i4UOTgJKVcgbgtnR02hH28AxqHbHQjroVQIUPPYweiVbjKwGnZE5WDgVZJmymu+
 xlEdl4ar7ZmPaxlgqnCz4wPlJk1FYMOsHxAejJPzxlZk1pitLqvzuVxX2pcyt1PK
 SLtGcwjyUaLJ6f0kqef7Ri+FG7BEQ==
X-ME-Sender: <xms:4wD2YFgQGgndrkBK9ytbSrfS8h0QWVUZL9op1TBXZJwS7c5zp3ii-w>
 <xme:4wD2YKAh3vM_xkeQx2IhwCrAbkQB3XPFBqJwr5WJTaYpTw9iq8mhyYcs5VNN_Tqp7
 ogd670JPFEqnPCmovg>
X-ME-Received: <xmr:4wD2YFFpqh7z8tRp62S8XuDThljw4y0w-i1LIpP0eZ6pIymvcUi4izXjCBJ69cvRoK3UySoB1JqK9-tySChmMJ-LecOsJeCZ-Vj1Q8QMJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedugddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfhffdt
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4wD2YKQJvcJB9zeEPF9WLxLDPtnV0utWXPUCRklNAjKMYd7js2HmDg>
 <xmx:4wD2YCw3mhj6-XAxlVNI2rTzrql3yJRVXm5FOgwogB7b_BF_UAOetw>
 <xmx:4wD2YA6isYyJ8Zh63EP5J6cEbdundQv_MJDrQSbSl3WVe3kzUX62vA>
 <xmx:4wD2YGiA6k6pBVOF4FR8iZYxjKbAk7Q2IJ6WATDmvsl_TAyeXtj5DA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 18:46:57 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/5] hw/nvme: use symbolic names for registers
Date: Tue, 20 Jul 2021 00:46:44 +0200
Message-Id: <20210719224647.68559-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719224647.68559-1-its@irrelevant.dk>
References: <20210719224647.68559-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the NvmeBarRegs enum and use these instead of explicit register
offsets.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


