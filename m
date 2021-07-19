Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B133CEC3A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:14:50 +0200 (CEST)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Zf7-0001iF-8u
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYH-0001AG-Kl; Mon, 19 Jul 2021 16:07:45 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:53243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYF-0001Vy-Mf; Mon, 19 Jul 2021 16:07:45 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id AD69658165E;
 Mon, 19 Jul 2021 16:07:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 19 Jul 2021 16:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=j/2kmdR7NtEfS
 Fyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=k+0EwxrM14b8kdad/w0pbRjVorRLj
 +3EgX0CBAVB4yDO/oULV+2+s+qbIUQpAYy8zZq6ogRcW02wtCpydT7mfvmnpOobc
 bYpPX99KTFh9d7spigacDaIJaUHNeHklFTRYapTJIoBGnAbS50PyTo4vRsJSJ4Yg
 oWqHflAID0yU9CXUjhYDn0dPpO342HCTtOm7nnqszil+HBFVDpYXrCRNEGEjTEcu
 ue4VIkoZtPQJhyAPN7H4wth3DQ2UWRu85LndcfFbdVTwDXYIhuayOK7ExIDjfF7i
 GsY1969pX+TJOhvC3C6j1O8OPD2IHLyfjgYGs5OXh443qQMZJCNexu7xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=j/2kmdR7NtEfSFyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=TdboDlbh
 lEjCLncMf1Ric7/txB61qFjOS1xifRbuYfOmqM0Vhi9IlooQiZXvl7APC3Xknf8m
 vYFMphFF6dL1Q6iTduM6gCCzSuR224Ff0HcDC5u5uxSxlW0TfTt+fpmmPOjz2odY
 ovgLSvQZhEZn953GzTdcPDSSrDHWtX+0plV9P/Sp3T8RMMiX/ROiJtOHJcEfqp49
 x4RzlQ9/huqCv88vNc5MIri/Re2zrYPRstKTtNbWVXC6C0UEHe6BahoE0c/ozgc0
 U2hslF/pXWlzF3dT0rPY4bKEbJT6gzYF2yK9AJJxhSFy5zIjBopMbfk3IQD8cx5x
 NGX8ZsbgJPHoOA==
X-ME-Sender: <xms:jdv1YP3YgqDbwpwXb0IWl1ZYpFwW9ymxaqjz8qV-06OTEFsXz3V7TA>
 <xme:jdv1YOHN250MKepu5JZy2vu76IrHmdvHaafWf6RQGI2BTH-m8XeUVadXMknmJKEtl
 Rdf_4sT9TVUkyru2YA>
X-ME-Received: <xmr:jdv1YP4mW5K5hbW_TKFSBkVmWXlTJou_PWGNWJjLBtrOm5jg9GDMYn0eYqCwDUfDnjo9BQ1MG4gV5vjkedZcvKw4MlJf6_H_0UMVbJkGHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jdv1YE0647Ait8j_IFseCJ-FtgQMOE93nP5jBfjUl7LdLlB6d8XUWQ>
 <xmx:jdv1YCHFYDgWROTLWPTnLpiJAZRS-o-PiNy2cMfpnZ37gNiNXoxIiQ>
 <xmx:jdv1YF8xoss-j4JPqUiL5HxBBsPhJApNDpxKcwKJm4ZBcdoWtme8Gg>
 <xmx:jdv1YOFyQ8qTFBOMc8Ex4ee8v02ajuiE8mV23-qfSM3POIxWN6itcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 16:07:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] hw/nvme: split pmrmsc register into upper and lower
Date: Mon, 19 Jul 2021 22:07:29 +0200
Message-Id: <20210719200733.28502-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719200733.28502-1-its@irrelevant.dk>
References: <20210719200733.28502-1-its@irrelevant.dk>
MIME-Version: 1.0
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

The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
make up the 64 bit logical PMRMSC register.

Make it so.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 31 ++++++++++++++++---------------
 hw/nvme/ctrl.c       |  9 +++++----
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 527105fafc0b..84053b68b987 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -26,7 +26,8 @@ typedef struct QEMU_PACKED NvmeBar {
     uint32_t    pmrsts;
     uint32_t    pmrebs;
     uint32_t    pmrswtp;
-    uint64_t    pmrmsc;
+    uint32_t    pmrmscl;
+    uint32_t    pmrmscu;
     uint8_t     css[484];
 } NvmeBar;
 
@@ -475,25 +476,25 @@ enum NvmePmrswtpMask {
 #define NVME_PMRSWTP_SET_PMRSWTV(pmrswtp, val)   \
     (pmrswtp |= (uint64_t)(val & PMRSWTP_PMRSWTV_MASK) << PMRSWTP_PMRSWTV_SHIFT)
 
-enum NvmePmrmscShift {
-    PMRMSC_CMSE_SHIFT   = 1,
-    PMRMSC_CBA_SHIFT    = 12,
+enum NvmePmrmsclShift {
+    PMRMSCL_CMSE_SHIFT   = 1,
+    PMRMSCL_CBA_SHIFT    = 12,
 };
 
-enum NvmePmrmscMask {
-    PMRMSC_CMSE_MASK   = 0x1,
-    PMRMSC_CBA_MASK    = 0xfffffffffffff,
+enum NvmePmrmsclMask {
+    PMRMSCL_CMSE_MASK   = 0x1,
+    PMRMSCL_CBA_MASK    = 0xfffff,
 };
 
-#define NVME_PMRMSC_CMSE(pmrmsc)    \
-    ((pmrmsc >> PMRMSC_CMSE_SHIFT)   & PMRMSC_CMSE_MASK)
-#define NVME_PMRMSC_CBA(pmrmsc)     \
-    ((pmrmsc >> PMRMSC_CBA_SHIFT)   & PMRMSC_CBA_MASK)
+#define NVME_PMRMSCL_CMSE(pmrmscl)    \
+    ((pmrmscl >> PMRMSCL_CMSE_SHIFT)   & PMRMSCL_CMSE_MASK)
+#define NVME_PMRMSCL_CBA(pmrmscl)     \
+    ((pmrmscl >> PMRMSCL_CBA_SHIFT)   & PMRMSCL_CBA_MASK)
 
-#define NVME_PMRMSC_SET_CMSE(pmrmsc, val)   \
-    (pmrmsc |= (uint64_t)(val & PMRMSC_CMSE_MASK) << PMRMSC_CMSE_SHIFT)
-#define NVME_PMRMSC_SET_CBA(pmrmsc, val)   \
-    (pmrmsc |= (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
+#define NVME_PMRMSCL_SET_CMSE(pmrmscl, val)   \
+    (pmrmscl |= (uint32_t)(val & PMRMSCL_CMSE_MASK) << PMRMSCL_CMSE_SHIFT)
+#define NVME_PMRMSCL_SET_CBA(pmrmscl, val)   \
+    (pmrmscl |= (uint32_t)(val & PMRMSCL_CBA_MASK) << PMRMSCL_CBA_SHIFT)
 
 enum NvmeSglDescriptorType {
     NVME_SGL_DESCR_TYPE_DATA_BLOCK          = 0x0,
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2f0524e12a36..28299c6f3764 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5916,11 +5916,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             return;
         }
 
-        n->bar.pmrmsc = (n->bar.pmrmsc & ~0xffffffff) | (data & 0xffffffff);
+        n->bar.pmrmscl = data & 0xffffffff;
         n->pmr.cmse = false;
 
-        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
-            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
+            hwaddr cba = n->bar.pmrmscu |
+                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
             if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
                 NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
                 return;
@@ -5936,7 +5937,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             return;
         }
 
-        n->bar.pmrmsc = (n->bar.pmrmsc & 0xffffffff) | (data << 32);
+        n->bar.pmrmscu = data & 0xffffffff;
         return;
     default:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
-- 
2.32.0


