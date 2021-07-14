Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2E3C7E5D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:08:50 +0200 (CEST)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Y4f-0003aT-Hf
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xxq-0008UJ-SM; Wed, 14 Jul 2021 02:01:46 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xxp-0000mS-E7; Wed, 14 Jul 2021 02:01:46 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 161782B01243;
 Wed, 14 Jul 2021 02:01:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 14 Jul 2021 02:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=JVoCoMF6CeZvD
 w1/2W09XQ+dmID6Hr903l4AIV3b4DI=; b=eUrxfdB1OONcLrqdZNpjdgYJr5xsM
 aRBP67hD6zTMEjblQi8KOc4oMQtS5BtwCBwb+T6gdmDgYT+tyBIn4A1Plj3KDHLZ
 yUszBhjfFy4s7K6mfp/GA0e/c+yRYbzOO5cjSnVfMJ5gv4NqW+XOxEJECW8hmTkG
 MnHkHQCYmzTw912M0KN4KuU8xlKY58fShr50cSDNEkuXhLCOruFftzXziYwJn+OV
 1U3ShQIET9emT9wfwSaHyyqjl9n1vQ2CzXnqF1M0fB1I4tkBBxcLpdjUU/iIsZHh
 tqeDMbO1N7YrMl+95fH+sXJYPppAJsMod5DuMyKgz+C2tB1xcyVEo/8Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=JVoCoMF6CeZvDw1/2W09XQ+dmID6Hr903l4AIV3b4DI=; b=Qj1jGppk
 12L3Kv/qxS2k+VxJ+CdqzizlWTkvBNArUWH14Nt2hSwez/U1SvH+BNoeItmNW0Ty
 AAxGDIWYgd0p3UuxzxqypN8xFjAp/Da/uD7n7Kei41JU61l4h20nzE2AxbiDDX8K
 Np1DrhibKGXUFk5tubaV8SUGhy93BcOKBnYvdctx7pw0YVBQa2bMHWEMMKYOAxrS
 qISWtklz+LE/u4FZDitU/VYTyAcqMaO+ODgW1g9o00fHvydhOWgoUDGFC1w5uhc9
 ja1TQYib9rDs5RzVyxra5zgA9/rCfgUAWtJxycJf+8EiK+mAnPx3WkqAbXUBkpa8
 UHu2t8I2Yco9IQ==
X-ME-Sender: <xms:xn3uYGpgDlwwCegbLACMolFrc0Xq2sVzKbeesiCgHSLRvBUPSIIwUA>
 <xme:xn3uYEplbDJvXIvUyMP2inoZchsTn0v3OFgRcopHXcqCKiYHj3f7r4RRtmJzZh5mT
 eWhci4lEdbsjMyeQ7o>
X-ME-Received: <xmr:xn3uYLP0v140L2krAwzpRxj1aHK4VSCuS-1Fq-Ov3J0wSPdfwIoyp9EAOiDUlvbb5bUsnz8jRViAxg3Po3R9q_HRcXqvlyMm5QGSFitkPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xn3uYF5ue-F5-UxXfwhc1ECqB0vxb9A2FrGkm2Q3c67N9nsy6uz8KQ>
 <xmx:xn3uYF42omUX627C44GyAWmJ2tGl8vNCUOzAkSIZttIfZKqzflYl0Q>
 <xmx:xn3uYFg2eCZPG7O2q7p-VEV3W3BwEK8eznnnw2S5V031_9RW6OtrpA>
 <xmx:xn3uYEKBiiKBtfnHOrSCHxfYASa6TSngaDHqIeAdTrTBgcIUjPvsxFJr_As>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jul 2021 02:01:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] hw/nvme: fix out-of-bounds reads
Date: Wed, 14 Jul 2021 08:01:23 +0200
Message-Id: <20210714060125.994882-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714060125.994882-1-its@irrelevant.dk>
References: <20210714060125.994882-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Peter noticed that mmio access may read into the NvmeParams member in
the NvmeCtrl struct.

Fix the bounds check.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8c305315f41c..0449cc4dee9b 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5968,23 +5968,26 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
         /* should RAZ, fall through for now */
     }
 
-    if (addr < sizeof(n->bar)) {
-        /*
-         * When PMRWBM bit 1 is set then read from
-         * from PMRSTS should ensure prior writes
-         * made it to persistent media
-         */
-        if (addr == NVME_REG_PMRSTS &&
-            (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
-            memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
-        }
-        memcpy(&val, ptr + addr, size);
-    } else {
+    if (addr > sizeof(n->bar) - size) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
                        "MMIO read beyond last register,"
                        " offset=0x%"PRIx64", returning 0", addr);
+
+        return 0;
     }
 
+    /*
+     * When PMRWBM bit 1 is set then read from
+     * from PMRSTS should ensure prior writes
+     * made it to persistent media
+     */
+    if (addr == NVME_REG_PMRSTS &&
+        (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
+        memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
+    }
+
+    memcpy(&val, ptr + addr, size);
+
     return val;
 }
 
-- 
2.32.0


