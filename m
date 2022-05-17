Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA852A055
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:24:46 +0200 (CEST)
Received: from localhost ([::1]:35974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvJl-0006OE-Rf
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nqvBT-0001HP-PQ; Tue, 17 May 2022 07:16:12 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nqvBR-0007Ze-Lh; Tue, 17 May 2022 07:16:11 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9BC405C0183;
 Tue, 17 May 2022 07:16:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 17 May 2022 07:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1652786168; x=1652872568; bh=tklGr3lk/V
 9qKxiYDxtUQbQXXJqR9zPUU7yviLlE9+8=; b=ISrzG3j+rSKvDS7MvJs59B7yvL
 8GmvZ5KA8EfDubM19WFbENE8aRIT8+3en9W4kBkhqiY6qkN1v2ygmTloljBs+iou
 TNwhpbnFjrNQwtBTQbBCNZU8sj2oINqNUeXFWJ6jpC/JukF/nFmYntiOypS790Du
 eiBOq4ZDPjT65rbkiJ3V3TJLwHwptTwrth1BrMGNp4Z6BDlAvA84Qk9VcZRg6vX1
 +ofVyU6kLD+0e7LCgfnwCiBMVhzgRXlxth9gXZGScyBwAtmTMRRNE4Tt6lBU/uex
 dbJUXZen6I1Lr7MwVAt8aEiFrdZ3L0JVCwxhbxgS8FLS1FymV1N5qWKHvE1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652786168; x=1652872568; bh=tklGr3lk/V9qKxiYDxtUQbQXXJqR9zPUU7y
 viLlE9+8=; b=m7ohwAeNV3/C7XIMC+HoP9zPu0zsVdzZ+f7S5EuhKtJHhtVa8ZU
 pHgBYfXL/iY3JTVlYWRUz7T/uD86zFR/JbjtO3Hkdbw4RN5xqpjPzZuAoD8DGydK
 1TnZBtEDt/eQcJaH2sOZNMg+AaW9Db6BdFs+5eokh6EIWHfVG1SBeYIMY8TvO5h9
 vlCfScRHE//7VHhO2YyhtdUB++7Lv0QOtyN4NJYktVz8dyjmd7M56BRn9EzmmzgB
 n+8bfPGtNnHv69YiVkVVMXYSq3+NO7ZYIK3nM+3ccJsVh+sdsU6s2QjdJdh2nxdK
 +hnMXTkw5lBJNrvFj8olzdh67GAznysnA+g==
X-ME-Sender: <xms:-IODYpRE8zHS47OgC7z3wCMjKWF7UAYLMAof2sKHuSPFEmd1sSOFYw>
 <xme:-IODYixHl6zu1_JZvqNz-Uehlw8hiTNnOCOS6mteKDCEVPkIX8h59aKAc2IYOvrSj
 FCyy7q9IRqwlY_qzoI>
X-ME-Received: <xmr:-IODYu0tSyIpiKEHUr8cJ_FTNZShvoCzKWsmXhScmDKzASpccCrIMO2Ou_zxqHeNCqO163FVzpOICO6W9e_R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheejgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpedtleduhfegleehleeltdejffefjedtleeuvdfgteevffegtedvveekheeiieekteen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-IODYhDopEaX04prQ2BtD6Fit-H5jm-MBBmCCbqEn8LRTUY-ZB2obA>
 <xmx:-IODYijzuEexA497Nlfvs1bp20wNUKDKkOoUcsSg780Z8L0fbnALOQ>
 <xmx:-IODYloU_A1yd6I5kOutLuMcUGiffDZZmXhFp0tcM49HY_QUX_XMgA>
 <xmx:-IODYqfJjmH0tKDlRtJW1InvnRwasqSa2xCavCuv9VoYIKgmd9hHjQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 May 2022 07:16:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: clean up CC register write logic
Date: Tue, 17 May 2022 13:16:05 +0200
Message-Id: <20220517111605.1494647-1-its@irrelevant.dk>
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

Note, this applies on top of nvme-next with v8 of Lukasz's sriov series.

 hw/nvme/ctrl.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 658584d417fe..47d971b2404c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6190,9 +6190,8 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
 
     if (pci_is_vf(pci_dev)) {
         sctrl = nvme_sctrl(n);
+
         stl_le_p(&n->bar.csts, sctrl->scs ? 0 : NVME_CSTS_FAILED);
-    } else {
-        stl_le_p(&n->bar.csts, 0);
     }
 }
 
@@ -6405,20 +6404,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -6429,22 +6429,9 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         } else if (!NVME_CC_EN(data) && NVME_CC_EN(cc)) {
             trace_pci_nvme_mmio_stopped();
             nvme_ctrl_reset(n, NVME_RESET_CONTROLLER);
-            cc = 0;
             csts &= ~NVME_CSTS_READY;
         }
 
-        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(cc))) {
-            trace_pci_nvme_mmio_shutdown_set();
-            nvme_ctrl_shutdown(n);
-            cc = data;
-            csts |= NVME_CSTS_SHST_COMPLETE;
-        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(cc)) {
-            trace_pci_nvme_mmio_shutdown_cleared();
-            csts &= ~NVME_CSTS_SHST_COMPLETE;
-            cc = data;
-        }
-
-        stl_le_p(&n->bar.cc, cc);
         stl_le_p(&n->bar.csts, csts);
 
         break;
-- 
2.36.1


