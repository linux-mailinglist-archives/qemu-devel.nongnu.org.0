Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686F558B02
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:57:36 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UpT-0003gz-10
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUT-00057d-1t; Thu, 23 Jun 2022 17:35:53 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUR-0006hn-BY; Thu, 23 Jun 2022 17:35:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6D5F3320098D;
 Thu, 23 Jun 2022 17:35:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020147; x=
 1656106547; bh=eEvKSMaTLKY9dfsde1sYRfcZsvX+6J+8FjefYyFN6X8=; b=D
 QVA70tmLtm7alZ4U+9WXVQ9o0XTyt29uSTyHl/fFyCtoxJ7fcmfueyen/kE6SP15
 t5OL1CjWrjHkJ54vQQuw4fbY30bwtxpMNKP3Ww2Z/9dIh063XFx8qKaevb13u8aF
 +hnBWe7TRif4y/AY1Wk1HocBk6jW577ZB9ZcAEiokccFZIDdAozFpGh3wMCSEEOg
 SdkQR3Ka9iVOtv1AogY+ZhU/VDjHpvY27ZED9fCG1n7DDzinTfEYPEWFwZucpzqp
 wHwvWCD1RmMO9kmbKmuJs3sjmi5wiGzrI5V/8NqtyCmc0fqkSMN/riCVR/qvYyNP
 +k44MubE36XfpL0JKW27Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656020147; x=
 1656106547; bh=eEvKSMaTLKY9dfsde1sYRfcZsvX+6J+8FjefYyFN6X8=; b=T
 aVyhZN9qiLwagdn4K81cMQx/yZ38ZhHBkPp+O4/bYRoetWZnCo4J2XFjt9UcoTQa
 ZRry26iqgdIs7qQ7i9VQdnbKIVNTRPUIjYXYHSJw3ZVpmZiORLaMtPT1L/DmLJNi
 5FhNdp0fUkqDi8if3uf3/7tH9I1kkxmoYoiM/F3a5h6vjsxXizyqtSiPuKs6tEt0
 vBo6tRUPGzVeDeDB8q3DmpnY7JUl/CkrzJR2rbTDqi6nfUTtlP0YFn36pTGlP5Pa
 R/JjxgXKkzFJYEKRaAT1RCatdw5OOiOKxoPp+tQHBS5hmMm1/G8Sj134G59QU0WB
 G/0n6lSywU5GBBIbPdL9g==
X-ME-Sender: <xms:s9y0YhqzB7szzFotBQR6U-V7S4qHyXy7Yu7cDAzq1-UbVYk23FDLwQ>
 <xme:s9y0Yjq6Hn15mWsCBIHS4pSwlitxvqLcUUQcMf_mq047a6IL4uBd2U-BoeywhUYkq
 49vXCLZqOLsobQPTzk>
X-ME-Received: <xmr:s9y0YuO-PdIdqNnDXHNs1zyTcH4KYWalal3SniGM-UN0Ct824Wvf5ODMUj_UCShSOyn2QElIMkjr74sd5zED>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhl
 rghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrf
 grthhtvghrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffet
 jeeihfdvnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:s9y0Ys6k8RXAq3fvPi_et1Y0VNMxWJPBbT2NQMbEAf4LzgQY4MFrFw>
 <xmx:s9y0Yg4EIEDaZElTKXqqaM9xHnJb2cmgsjHIadNG4xqNw1QsVW5NSQ>
 <xmx:s9y0YkjqFHMT0c_Wb9gM1JTE4hd2BkuAOS1qavP28dDwt3H_STLKjA>
 <xmx:s9y0Yrr72iE3aS7K1FO1YFKdEdFQeCi2MSx6LTDTI78b-WWm5Cxl2Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:45 -0400 (EDT)
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
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: [PULL 13/15] hw/nvme: clean up CC register write logic
Date: Thu, 23 Jun 2022 23:34:40 +0200
Message-Id: <20220623213442.67789-14-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

The SRIOV series exposed an issued with how CC register writes are
handled and how CSTS is set in response to that. Specifically, after
applying the SRIOV series, the controller could end up in a state with
CC.EN set to '1' but with CSTS.RDY cleared to '0', causing drivers to
expect CSTS.RDY to transition to '1' but timing out.

Clean this up.

Reviewed-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 658584d417fe..a558f5cb29c1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6190,10 +6190,15 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
 
     if (pci_is_vf(pci_dev)) {
         sctrl = nvme_sctrl(n);
+
         stl_le_p(&n->bar.csts, sctrl->scs ? 0 : NVME_CSTS_FAILED);
     } else {
         stl_le_p(&n->bar.csts, 0);
     }
+
+    stl_le_p(&n->bar.intms, 0);
+    stl_le_p(&n->bar.intmc, 0);
+    stl_le_p(&n->bar.cc, 0);
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -6405,20 +6410,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         nvme_irq_check(n);
         break;
     case NVME_REG_CC:
+        stl_le_p(&n->bar.cc, data);
+
         trace_pci_nvme_mmio_cfg(data & 0xffffffff);
 
-        /* Windows first sends data, then sends enable bit */
-        if (!NVME_CC_EN(data) && !NVME_CC_EN(cc) &&
-            !NVME_CC_SHN(data) && !NVME_CC_SHN(cc))
-        {
-            cc = data;
+        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(cc))) {
+            trace_pci_nvme_mmio_shutdown_set();
+            nvme_ctrl_shutdown(n);
+            csts &= ~(CSTS_SHST_MASK << CSTS_SHST_SHIFT);
+            csts |= NVME_CSTS_SHST_COMPLETE;
+        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(cc)) {
+            trace_pci_nvme_mmio_shutdown_cleared();
+            csts &= ~(CSTS_SHST_MASK << CSTS_SHST_SHIFT);
         }
 
         if (NVME_CC_EN(data) && !NVME_CC_EN(cc)) {
-            cc = data;
-
-            /* flush CC since nvme_start_ctrl() needs the value */
-            stl_le_p(&n->bar.cc, cc);
             if (unlikely(nvme_start_ctrl(n))) {
                 trace_pci_nvme_err_startfail();
                 csts = NVME_CSTS_FAILED;
@@ -6429,22 +6435,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         } else if (!NVME_CC_EN(data) && NVME_CC_EN(cc)) {
             trace_pci_nvme_mmio_stopped();
             nvme_ctrl_reset(n, NVME_RESET_CONTROLLER);
-            cc = 0;
-            csts &= ~NVME_CSTS_READY;
-        }
 
-        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(cc))) {
-            trace_pci_nvme_mmio_shutdown_set();
-            nvme_ctrl_shutdown(n);
-            cc = data;
-            csts |= NVME_CSTS_SHST_COMPLETE;
-        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(cc)) {
-            trace_pci_nvme_mmio_shutdown_cleared();
-            csts &= ~NVME_CSTS_SHST_COMPLETE;
-            cc = data;
+            break;
         }
 
-        stl_le_p(&n->bar.cc, cc);
         stl_le_p(&n->bar.csts, csts);
 
         break;
-- 
2.36.1


