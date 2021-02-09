Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B5314A70
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:40:16 +0100 (CET)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OZD-0001rr-4D
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVz-0005VF-Sm; Tue, 09 Feb 2021 02:32:51 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVr-0005xJ-Qd; Tue, 09 Feb 2021 02:32:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2DCC6C89;
 Tue,  9 Feb 2021 02:32:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=c53+DvAq7gLZH
 mFKxrJipSeClmeYuCw24/+KvTHpQwQ=; b=Zwt10PQBvi1/+HEM2g8pKCjvA+TKr
 u+f4PSJLSIy5cNE9mXKu+Ej5BkRAHSj5rohI0L3USqu6SPSBdEZD3qILotDWHyGV
 ACVFWJwnNwLxftqTKGRuBnznBev50a6rjQMo6926pOusKWfMLn5ldJekICbweW4n
 TgSxa31ScTzO2lqYRbKqnDAAK9NkKz1RE9JrHaeHyco/nJ8CNGklJer+2ALm2X3S
 DEmvFxZXF/S5+mAwOJ4zIHVLByO6gTxtBWIr0PiIIk3m8FdaqHQEuVaGI5JyUulY
 E9G8jqJzwiTv9zSW6bkkEPKj+pmgv8S0h15BJ8qL5Fn5EMbjy25cDFGng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=c53+DvAq7gLZHmFKxrJipSeClmeYuCw24/+KvTHpQwQ=; b=c312DlQg
 HSFY4nRuov7wlfeTxCcxBuDDFLq1fl4uhjGzW+VaKVF/XJRJpyfj/ejXIGcwLfBQ
 P5+LFGkuz9CZEbPohhQQR4LyzcB1hE7jd7fC9QvFpXk83plZzh9vSC0xu3GPMAd4
 xxBN2NsvjKiq2TisW+SIiFByiRstBCF54ukxMp6dVlyuNE5Dm87pajzvs4nMW5y1
 ElgTmQpw0v4W4Vx+Ok+wJSoYtlSwL53gl7AenftSoKRDGqE8N1KIA5aYxN0N7ThS
 O3AegG1gy1M2v/Yxr5F/ipf2ayrEtBM6osRXAAz5W7k5KaKLpzLZNMWkaK4jFjRF
 otmnZUBvUsCA1g==
X-ME-Sender: <xms:lToiYEOZW4Eh4uRlgQr43UdhUuN7rpiI_934Id_Tg7wuf54syhbJRQ>
 <xme:lToiYK-PbAulYs7UlzMFflrSXArTgfAnFTdeIQHcud47XESgknq06Ppzdk2fGZARp
 yQtxNg7KOloCkgypsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lToiYLS_BJVtT3K0klDBmYW-M3PqhOosXFxwtorjiVyhPNJBDS7qIw>
 <xmx:lToiYMvDFM4hVh3JwEe0j9jcVLmuV7Y_4_H2-9HTKc-idZ-jrpJyWQ>
 <xmx:lToiYMeDJywqh45WQ-_vc2-kbf19VrViJBCeAF1eMYt5jyLKWGl4lw>
 <xmx:lToiYKtjZW1fN4U-pH5j_hqMOcvDvQsPPCFtatrg8Gc15ADz4aoHbA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 71F20108005B;
 Tue,  9 Feb 2021 02:32:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 48/56] hw/block/nvme: bump to v1.4
Date: Tue,  9 Feb 2021 08:30:53 +0100
Message-Id: <20210209073101.548811-49-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With the new CMB logic in place, bump the implemented specification
version to v1.4 by default.

This requires adding the setting the CNTRLTYPE field and modifying the
VWC field since 0x00 is no longer a valid value for bits 2:1.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 3 ++-
 hw/block/nvme.c      | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 2e85b97a6c4e..07cfc929368b 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -951,7 +951,8 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint32_t    rtd3e;
     uint32_t    oaes;
     uint32_t    ctratt;
-    uint8_t     rsvd100[12];
+    uint8_t     rsvd100[11];
+    uint8_t     cntrltype;
     uint8_t     fguid[16];
     uint8_t     rsvd128[128];
     uint16_t    oacs;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1e13d25b0887..c4c968f5951e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -108,7 +108,7 @@
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-#define NVME_SPEC_VER 0x00010300
+#define NVME_SPEC_VER 0x00010400
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
@@ -4450,6 +4450,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(0);
+    id->cntrltype = 0x1;
 
     /*
      * Because the controller always completes the Abort command immediately,
@@ -4478,7 +4479,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
                            NVME_ONCS_COMPARE);
 
-    id->vwc = 0x1;
+    id->vwc = (0x2 << 1) | 0x1;
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-- 
2.30.0


