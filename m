Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAFE5144FD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:01:46 +0200 (CEST)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMVO-0003CG-HQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4X-0000Vr-KC; Fri, 29 Apr 2022 04:33:53 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4W-0005Al-4I; Fri, 29 Apr 2022 04:33:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BB1B5C0125;
 Fri, 29 Apr 2022 04:33:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Apr 2022 04:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651221231; x=
 1651307631; bh=bI14oC0u4Q+ZjrEilFFFIb7wHdQ/tqnnaE7dh6MQ8cA=; b=G
 fJ4xOTM2RGJHNWRbqVQM3JjmxLMij/eOOEb0N+kFg/pN3nszMpX3y/vvDDl2scmk
 dF8B4erv3k6M43ryn4S2gl7YZfF6bQlUKj1KAGrvaOplC6DKuPx8CSHiqvCH3fNq
 6vFQ43vVj6+vM5EvKJgXinyDMjapo2hgqvf0FlwFOkIF66tFBgddu+l+QoP4Z1Di
 4NxsFmNGujHaN6R/yawHcLFeveYMCdlkaB+vDKspvCrSf/VcoHZVpoQ7Aahx/X2t
 3yEgfPz535ex8nPpp/TUieJ0aMxdTEeynaLw+2IIiut5npLD5m0nPEJo1Dk646O2
 C9htKes/IWJ0VpzOvLyeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651221231; x=1651307631; bh=bI14oC0u4Q+ZjrEilFFFIb7wHdQ/tqnnaE7
 dh6MQ8cA=; b=YytnamAt0/Mx+a9cGJjbfCwvKQw7Db1c07FmGX/ACmncb0t1bBt
 r9cbmu3qaC7+Orl/BVuZOo4EAD+wFYm61i6ib0B96kMsrW7oPf8zp5WUnelFR6uy
 MnFnyOJf9aGZ+7QyakRGyT+jEt5C5s7+QgjnkysxTSgy608kq7yJXYevHY+fi8Jb
 FY16rrmfLQxDjbRHout/wribzFnzJXclHGfBv2Qx6VYfsafZVTPMETmA/t71xrNA
 dfQRRROjH1nGuvWlXv/az4q5yW22FNNWGKsg27DYWCowGD/Jv6fjWuc8neAHr7tF
 w2kYx+/qfFtR52XbnJnlT0i5hwRYwSSubrg==
X-ME-Sender: <xms:76JrYoDYabSBXf0w2Y45TbcYiMNcK22zP3rqu1L00vtWobkF3f5_nA>
 <xme:76JrYqhKiscztUTgzsveQ_KKFpqQdhy2jSbHibZvgQpu-uEf403eCQwvhz4jf-nbw
 LN1bnwywIw3GRSbgyo>
X-ME-Received: <xmr:76JrYrkRNa9qSGkGaaK-aOwAagQe8fKSZCLBsH9h9_lJJv3rHhz6ozkkM-cNWSyZKPKd25JcgnpyIGfkWRIC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:76JrYuwt9FBF1MMmz4DAsTZbV_gGeHVfgZr69MQD3BnGylfIBq2D5A>
 <xmx:76JrYtRZDRMH_U6vti1eGOvu3fAZjQ0m01UoaWbNMhTQbTzklaHK2g>
 <xmx:76JrYpZTukPPYkPbD8BuUa_9-NvNhtyjFs8PYYaykx_jxzP6_SChxQ>
 <xmx:76JrYq-hYOIG565JIEbuoSheI-HnmFx5oph6f_EIePIjMuGBgzpxGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 04:33:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] hw/nvme: bump firmware revision
Date: Fri, 29 Apr 2022 10:33:36 +0200
Message-Id: <20220429083336.2201286-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429083336.2201286-1-its@irrelevant.dk>
References: <20220429083336.2201286-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Keith Busch <kbusch@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Linux kernel quirks the QEMU NVMe controller pretty heavily because
of the namespace identifier mess. Since this is now fixed, bump the
firmware revision number to allow the quirk to be disabled for this
revision.

As of now, bump the firmware revision number to be equal to the QEMU
release version number.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5a727b6ec344..650b606c6c24 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6713,7 +6713,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
-    strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
+    strpadcpy((char *)id->fr, sizeof(id->fr), QEMU_VERSION, ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
 
     id->cntlid = cpu_to_le16(n->cntlid);
-- 
2.35.1


