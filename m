Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0857B514513
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:06:38 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMaC-00041h-Kq
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4W-0000TX-25; Fri, 29 Apr 2022 04:33:52 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4U-0005AQ-9L; Fri, 29 Apr 2022 04:33:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 79F035C00C3;
 Fri, 29 Apr 2022 04:33:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Apr 2022 04:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651221229; x=
 1651307629; bh=FYefHQ0HLMjNe/wNx6HY2Yxnt4jH2YWaYHU9NjAWEu4=; b=o
 et4yWHT6tpxKdMlmkwzwMGhDN8GJK+r4YaM/KCopGrk+8Ejxa3rPVcC3KXcmzB0d
 UI5SBCX6StArN9PE4YnjmDSVpYLgkkpegTLk4owEsPGSpyehedVpZN7SEYkqesPp
 9xn3/SNNk21lRrgd0fv7U7ah7ofr9c7dllQMEeI4thQ7zo49jEbds8J2tlUEH6f5
 LJphtzTTML/kTuKz8KBY94tobyCOtF0JQ4SlolXX3g1daFBBLepI++Ss7x19dptJ
 /z7RDjhg7D3+uMscXaspSDgczhqUnXQyKA2vixmRKPhtzaqhTzeu9DjjmlqFucj1
 /E7H4D4SqDX7Haz199Ang==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651221229; x=1651307629; bh=FYefHQ0HLMjNe/wNx6HY2Yxnt4jH2YWaYHU
 9NjAWEu4=; b=Mrb7S4cUDtRnyyOurV/5rIO9JMK8ESuSy/s8OIEmIm/Xo2yfZY6
 VCPjUTJtZYvXP6cFngoVCg83grTpDH989fqBB0ufKa1BeqnO3XyK6flHAQPL/qwC
 SVTlNhIiR00xFZiTfsII1q7xB4dhu0FLDo0yYCrJsa04QGPx+sAvFY1IzJlKC3GX
 yTby5rF6d+vPR+iTNY6rweI1krMqumVTsBh2VNAWhMkXhfxqFRcIG/NuBdqdCyEU
 uY3KUdZHs0x69XnXUiUx1yqY/o9Sy9KOYVu2Hno1G/1szUwSyjlub04xW0c/yOa7
 PVASEYrZ1gMeRtT40rQzOoKPizOAebhL5hQ==
X-ME-Sender: <xms:7aJrYsGl-dQeKcPKPAqe1B65F6JFdg3jrZHXwgBrXI4QMHydEpEZ2w>
 <xme:7aJrYlUVGW3Kykpdu5BS8FZ9M7tylFxhp1nzMzUKqo9IPDO05mSqAsonhvkFFoZ3D
 9Rj9RM6DtJ3aZTiVfU>
X-ME-Received: <xmr:7aJrYmLLlFTmGFEObaNGhIotZK_6ncrihzov1wb2OfFPfv1H5D8ZPLsK0ipf5OTnznHRP3kOjYWQGqofRxv_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefggfdtleffteelteeivefgtddvueeigfehgeevueejueefhfeikeefteegveei
 ueenucffohhmrghinhepuhhuihgurdgurghtrgenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7aJrYuEQUHGT5rcNqPa0dV4Fu70SKcc7v4bNsAel1GBP_SpZXeUmhg>
 <xmx:7aJrYiUa8RdutZX7nruPsH-cLfoUzrxFygd-w3zcgEoftunMBrFPHg>
 <xmx:7aJrYhP8J4DNuyIfUnLnz9ICUJBk6GoJmI57PJWTelAaqZJ3R1gB0g>
 <xmx:7aJrYuQrf4hbgDvgXQewfoq6qH76B3lpaRbncKGIJSmlm5x-JVV0mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 04:33:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/nvme: do not report null uuid
Date: Fri, 29 Apr 2022 10:33:35 +0200
Message-Id: <20220429083336.2201286-5-its@irrelevant.dk>
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

Do not report the "null uuid" (all zeros) in the namespace
identification descriptors.

Reported-by: Luis Chamberlain <mcgrof@kernel.org>
Reported-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 08574c4dcbc8..5a727b6ec344 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4955,16 +4955,13 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    /*
-     * If the EUI-64 field is 0 and the NGUID field is 0, the namespace must
-     * provide a valid Namespace UUID in the Namespace Identification Descriptor
-     * data structure. QEMU does not yet support setting NGUID.
-     */
-    uuid.hdr.nidt = NVME_NIDT_UUID;
-    uuid.hdr.nidl = NVME_NIDL_UUID;
-    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
-    memcpy(pos, &uuid, sizeof(uuid));
-    pos += sizeof(uuid);
+    if (!qemu_uuid_is_null(&ns->params.uuid)) {
+        uuid.hdr.nidt = NVME_NIDT_UUID;
+        uuid.hdr.nidl = NVME_NIDL_UUID;
+        memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
+        memcpy(pos, &uuid, sizeof(uuid));
+        pos += sizeof(uuid);
+    }
 
     if (ns->params.eui64) {
         eui64.hdr.nidt = NVME_NIDT_EUI64;
-- 
2.35.1


