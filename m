Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902EE53FF65
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:49:25 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyYeC-0007CA-L5
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nyXJ3-0005Hq-Rp; Tue, 07 Jun 2022 07:23:32 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nyXJ1-0003I1-FV; Tue, 07 Jun 2022 07:23:29 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E40C85C0192;
 Tue,  7 Jun 2022 07:23:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 07 Jun 2022 07:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654601003; x=1654687403; bh=mjXPWOgj5Z
 dunSoZb2BsY1kpECkdGuTBlRoSYRozV6o=; b=KnO9400++Ctf8yMSFyiwnqhdes
 ikn4bvwQE3o9RB5ueETDmDRvkKV/IVJvLqFXmjKNgH/8/FuWyDA1NbPg3NXgObwr
 dof6WtUJLBbjVHi7QFLfMkqNpScjVpvPrYlTYJeQp1qt8+1tSkxFDI6yfzABnE1M
 oJNufIrx74uIQaWAGKX8jiVb7DziCOUjEAePxrA4hIgPJzb6rfHuO3xrDbGJyTgT
 rWq/pOhmUB34E0NKMXSTBRimVPJ+QgDn0TAYZ/EhCvwM9G/fvR6izlrZhtD321+B
 aA4AUhS5DCwQKsWpqh6ZC76xe11q7mEO2fjZUs/XtVi4fdIFfx1OSsGE7OIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1654601003; x=1654687403; bh=mjXPWOgj5ZdunSoZb2BsY1kpECkdGuTBlRo
 SYRozV6o=; b=k/j5piy1Wp6YlMTGedb3rOT29rWncxdPyG1GxllKKPVuV8SR8VD
 TdI7qmeigmru3za8a/r6wd3F8ovDp8rQb15z97f0nWggcIryJadM1rA+rTQQDAkR
 PlweQ1fyBeXz6xoJW7boVgB5jEYcG2wkerzZYLxz4OOTMm0S5N8uqp8HzLDhWf3j
 XFF5/vGAkBw7RMpOi1/aITtBeuWqDgbDCco9kWSWaKYbwqkoca2wjBKAUq9KJwn7
 s6wQ0cI8yEMnVSTgZ4E3p17A7mBXMYEjcC7WBf2EGWHRnTFQoSWHd0iKZX93B6II
 +/cvMK5TFRxI/VMVsT+1dGOH0h06faoRoKQ==
X-ME-Sender: <xms:KjWfYiveJ8U5S4XL_QK-bSfeoqYVDl2cyiphtPkdFNrzFKI53mz9bg>
 <xme:KjWfYndWLiVnht1_Ma5O5MyCIWFsu_5QI4NmENrz7E3hTQLmirqvPkWhMKZHtdM3i
 2DXkIkbxNdb_3_agpo>
X-ME-Received: <xmr:KjWfYtwSflW7YxbHIlZfrc1pi2VKM8yiMbwxZVwWXkEFuOpOgezZEtWh6_3IxAYKRoFrDElpi83qZfvV0j_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:KzWfYtMbUxs50Ty34fFCXZ3zXbe7_W4WzY3h05AgX7-XVh0f56gPAw>
 <xmx:KzWfYi8vKir_s2bgdMp3iurFOJoQllT3PTpkr5U_S189RWPxyHquCA>
 <xmx:KzWfYlXtlJw3_qINRxxNg8oc440_bmHFj5yC0aEl8ReDj1XKhYOHtg>
 <xmx:KzWfYmbLluSvuELjqdESdxVLxzMiwafe-L_0mB6EQ7Bu43vCy19yhw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 07:23:21 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3] hw/nvme: clean up CC register write logic
Date: Tue,  7 Jun 2022 13:23:20 +0200
Message-Id: <20220607112320.58532-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
v3:
  * clear intms/intmc/cc regardless of reset type

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


