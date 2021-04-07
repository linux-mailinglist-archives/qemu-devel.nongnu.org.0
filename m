Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0D356388
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:56:36 +0200 (CEST)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU1B4-0007A4-U1
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11f-0002A8-V3; Wed, 07 Apr 2021 01:46:51 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11b-00053J-Bd; Wed, 07 Apr 2021 01:46:51 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 888AE5C00F9;
 Wed,  7 Apr 2021 01:46:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Apr 2021 01:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=xDUhosuBbLDU0
 K1B3DBX8t/+krTqG5VpGGmDeVQV7Bg=; b=W8CkUUL/dPOglG8AoL/kA0Er4JkSW
 24opMxEpS57kJjezorn3JMM/Xi86Rze6brZClXPujH4re/cz/X2TfM4jusGQz0JD
 2mX1CyjJNfl43mXYGK4jb9Vy2vO2P4Po7UYl301HahadpR4d5B/NJBJCyMcLc/fw
 bQYXIprm9+M0fXnquavN7UbZwHNQeWdXTVZy+B1VkzXps3ZvVxmZ1cTsOabgI0yk
 /94BtRnYPESpbvO52KKqsT9yV69hTSeizrJcOWhqpA63hAiavzYbr30TQSDpxLsg
 YZGlUhNVbyDJ0Db/H0EY/m+HeiRtrsp954GxFAvJjyb5/HDJfU3KO3igA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=xDUhosuBbLDU0K1B3DBX8t/+krTqG5VpGGmDeVQV7Bg=; b=p6rf2aiC
 yAelTIPR4aQq7FaHhcdHb0ovzQosh7LxFbVb9aZb8cWiz7KnFlIEM16KLCFu9oRi
 HUjt7XTCD1Tu3+1enGAunBaH1YpugHiLBZZccxloIwvdohFBkvZov2CgXZdjtk1W
 EspRuVWnLYzLan6KkH/CbiQJSKK6UIFvpX/4CqkvwrS0XfJz50OXkTd1GFs5+Bdp
 TxnGNssdiEGeX/CKBVesaHKkLMINCmEsBHQPFR1rVH+TWTyTjIH3mdbJkv7j2cR7
 xNvkO8waNdZc8iB4QS2E3qIu7ufwq8iwA1DoQnMmnwAEr8uU34P09z/ure2i6oNQ
 8MZWwAMbBqXVew==
X-ME-Sender: <xms:RkdtYO60CZcUD3En0je40C8QI255FDJa0jLbgs9qBLJb2N9Ml3JDjA>
 <xme:RkdtYH1ejZ9cusejuUGm3KbSo1aCk53sa_UR8lmpduzAi-gTukRFbAtqVA0WgK5jf
 1f-UAcmz9OoOcPSGec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:RkdtYKV-dhS1onl-8c9g04ECvf629EC--H50vDN21V6fiLHprt96jA>
 <xmx:RkdtYC4XA8QlVrBGJnod-fEZvuwKPmT7Ojl4sXoabxC327mH5MokBA>
 <xmx:RkdtYBI8i43C8YCLb_BXhVH2bGy7qDTHbj0LJozcgaKv7oPsREPDSA>
 <xmx:RkdtYC9HOrCW-NJ4kJI-rI4fa0T7_iMJZxLdMZJWumrQjP6OMmMSIg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 222BF108005F;
 Wed,  7 Apr 2021 01:46:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 05/10] hw/block/nvme: update dmsrl limit on
 namespace detachment
Date: Wed,  7 Apr 2021 07:46:30 +0200
Message-Id: <20210407054635.189440-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
References: <20210407054635.189440-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Non-MDTS DMSRL limit must be recomputed when namespaces are
detached.

Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 09c38fb35e0d..0898ece2af31 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4868,6 +4868,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+static void nvme_update_dmrsl(NvmeCtrl *n)
+{
+    int nsid;
+
+    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
+        NvmeNamespace *ns = nvme_ns(n, nsid);
+        if (!ns) {
+            continue;
+        }
+
+        n->dmrsl = MIN_NON_ZERO(n->dmrsl,
+                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+    }
+}
+
 static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
@@ -4917,6 +4932,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_ns_detach(ctrl, ns);
+
+            nvme_update_dmrsl(ctrl);
         }
 
         /*
-- 
2.31.1


