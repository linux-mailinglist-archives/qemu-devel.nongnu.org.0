Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FD506C71
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:28:23 +0200 (CEST)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmxy-0003SE-DL
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmhD-0006iD-03; Tue, 19 Apr 2022 08:11:03 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:48455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmhB-0003m5-Ac; Tue, 19 Apr 2022 08:11:02 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1713532007F9;
 Tue, 19 Apr 2022 08:10:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 08:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650370258; x=
 1650456658; bh=g1G66PylZz2tISXVyUlZvrgNwEikTnLhJ8j6MaJ97r0=; b=j
 oIdSjbpKx+2ylopg3muM/8xw0mBbjMUSnNm/WWVxyBgpYue58MR7nf3M/F4AhisR
 jjHjMu+h8z42OrgFttn57576BTTY9QWG2oYmsQ12X7wdVGL9RjWbschUlOSj00BX
 0/ScAKqixA6GLSCVlQpJB66LXdTHl8JQQE8h8LlieEAXt2IxmQSTcbEOBhDeeFKU
 kUvm0s0ccORSjCSt6TYijgt6EfFGMUCBtUhdbYO4pTwZQ5siUoR+P2Hg2PEx+le2
 v/CWEAYwuA7y8BRbUzyacJP0MtYfapSEd4l0fqIfaMWIv4gnY1b48uSMgsLSPF/S
 z9urUZNWYJ5ZmJPwAuuGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650370258; x=1650456658; bh=g1G66PylZz2tISXVyUlZvrgNwEikTnLhJ8j
 6MaJ97r0=; b=dzZ/HbjVkVBXqhio9twkqIAXYbWi6h/FJm6YMRP5pb0dglM1ahv
 GsBSH9v1/3nq0ut0Eg636znnuUz8Kom785Vw4LUYhho2N0oBbKN/bV+CKMXfS2wS
 yBMS0YG3eSc6ryIwsm3ipqb0EeEfe+NNR6UWza+vAS0KrRKIO9xp9jIitvBC6ARW
 FHuhmycKBJY9NvHxkr2gMloHafpBVTVHQg9exi2/7mV47zBOO2EkuAeXN2BAx+zy
 79VQdIl3VpEFRePrLCU+qUxgyj88RDmsVjnEDsB5vPX964pX5aQp1qABCvOUEdu+
 ngSyA5QsDn2xq6qpHovIhL2p9pf4Wx0ltTA==
X-ME-Sender: <xms:0qZeYq8URqpZDMbUGQ6mdpLX-oYvjU3p4SRAbmEmn9KYxZDyNdWypA>
 <xme:0qZeYqsktpGHLRaCKcHMyIAkQDOCo6wEWL1GfQKDgLvlz7zhUzXAZExiES6TEBtps
 cHoczMy-j1XtP_K4-Y>
X-ME-Received: <xmr:0qZeYgCXg74QB39pI3aLtdnT78IiBeycAkbhnLxl1qyDVX3j7UXywMpldR1Wdoynggz6H_PUjITS9DYbSKSjXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0qZeYie3lNCz2L3AtAoTLQSVFxx_2aZE0y9idVQc5L2kTHvgwKy_XA>
 <xmx:0qZeYvPJFlJulhgs4FqmM5V_ytwWxloJhzadU2s6b8-Nm2ii6ocIlg>
 <xmx:0qZeYsnqDtT8ph3r09d9BgRYYbm5OIEHGgFTsvBzgsPEPIc_ulso0g>
 <xmx:0qZeYq0vZlPx0iDwI-Q9fVTbeKxUyC1GKVFJa47_0cNCFYIU2v4xGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:10:57 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/nvme: bump firmware revision
Date: Tue, 19 Apr 2022 14:10:39 +0200
Message-Id: <20220419121039.1259477-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419121039.1259477-1-its@irrelevant.dk>
References: <20220419121039.1259477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Klaus Jensen <its@irrelevant.dk>, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Linux kernel quirks the QEMU NVMe controller pretty heavily because
of the namespace identifier mess. Since this is now fixed, bump the
firmware revision number to allow the quirk to be disabled for this
revision.

As of now, bump the firmware revision number to be equal to the QEMU
release version number.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2b7828ac6952..dc298aacc422 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6708,7 +6708,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
-    strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
+    strpadcpy((char *)id->fr, sizeof(id->fr), QEMU_VERSION, ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
 
     id->cntlid = cpu_to_le16(n->cntlid);
-- 
2.35.1


