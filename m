Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23FD533793
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 09:44:36 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntlh5-0005f8-SV
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 03:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ntlYI-0000tI-6i; Wed, 25 May 2022 03:35:31 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ntlYG-00067d-Jf; Wed, 25 May 2022 03:35:29 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E8E6E5C0242;
 Wed, 25 May 2022 03:35:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 25 May 2022 03:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1653464126; x=1653550526; bh=COcy5zVGWu
 b1NrTqSWYL0qyBJLgIKlRWXhwAuV3l0QE=; b=IAQLfsftGSeA0SqsrJeOD64mxd
 dg/aGMquCAxaVY6yXHL3FIxfhjtFrchE7zMSJL2eW20A1NSUy7bQt2h3/ZKoWGs2
 f7fS9lH/yAf7MJIXMhc/NALVy4FqjEH+GMsyv4iRPotW8GxybKgYAfkp8qN0dMCg
 iMdYkg8dJp1Bn6WjrKnBuZtA9ALAuqeLCQauAJwE8gEcqzLEpd4UlIF4HaRKgglt
 Hs92ATLoH+x3za1+LY/+GOLCwzeI68OibfSh9qWPJicB1/FW9UiKx2hLTDGghEoe
 fQi722k0/Dt3Aa/fdUDxyG1rGMnP5aIL5jBl5ankENx5fC/N4ux4sU9+fv0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1653464126; x=1653550526; bh=COcy5zVGWub1NrTqSWYL0qyBJLgIKlRWXhw
 AuV3l0QE=; b=nr2wIwtKmeqPrhtGt8jgV2AqsC8jdhkrkBUgK4ocVvh7ZjiHyD6
 0dXB1hgsF3rGeUXNDpzXxP789zK4zVKfqzH951w973merRFJlClhWo14mTmHlX8z
 8+OaM+citzrQe20M00o7aFHBte1fns0ltHSux231zAZ5o/hOAjTPhpVFK7dWAclE
 PBO2dFCyw27tuCBS6bJ4DFcBvG0EpL/ahrd/+6bVTuF+kjoCP0JCbVO1BV32ML1p
 9r0a9Jwwr9QHjxEphgh6R867SQQ8cwabyLk1CHnq3VhI2d1ckz2FmGByrh8IChsj
 eTw1GP5C26Qdkl8kF9nYRXkEjSybFyEpxEQ==
X-ME-Sender: <xms:PtyNYho07lSZV6_0WbJIFGwIP6_z9oRoL1acttSyXhJt-HEKi2riKA>
 <xme:PtyNYjqnKQiVx9bpldxXtpTNUsqls3Gszlnjfq8kcQNsTLXMb3CTU1j2lzvJS7FCu
 4i35trOxbBkRyzEXzc>
X-ME-Received: <xmr:PtyNYuOn0lLuaZMST9U_1la579I0AraegfEHaCpbRLmdrmx7ohXRP_k6x9AlZ15EnabuSDiaaVsbfe_C9d0lNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeeggdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PtyNYs7ZrmoWWGoYoNSzw4k5F0aQuULqmHdPbvAeCr8lOUoEZ8DGiw>
 <xmx:PtyNYg6VTS7WMz7R9iPJDy_Wwxd1ziGgooVACxwBqwE7Y-jRUWEEZw>
 <xmx:PtyNYkinwXjkCB0FOUT6kIfYcf0wmnutHBJvST5OoUsOfBWC6-1rIg>
 <xmx:PtyNYr0BZTyvmnMw5FsaVfuM4HTMRgAe2a3gJHpyHe3QR1NuHqMpRQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 03:35:25 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2] hw/nvme: clean up CC register write logic
Date: Wed, 25 May 2022 09:35:24 +0200
Message-Id: <20220525073524.2227333-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 658584d417fe..8b16b2b8febb 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6190,8 +6190,12 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
 
     if (pci_is_vf(pci_dev)) {
         sctrl = nvme_sctrl(n);
+
         stl_le_p(&n->bar.csts, sctrl->scs ? 0 : NVME_CSTS_FAILED);
     } else {
+        stl_le_p(&n->bar.intms, 0);
+        stl_le_p(&n->bar.intmc, 0);
+        stl_le_p(&n->bar.cc, 0);
         stl_le_p(&n->bar.csts, 0);
     }
 }
@@ -6405,20 +6409,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -6429,22 +6434,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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


