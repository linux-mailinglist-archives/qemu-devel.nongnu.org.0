Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB6506C4B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:24:27 +0200 (CEST)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmu9-0006xR-9e
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmhA-0006fy-Bn; Tue, 19 Apr 2022 08:11:00 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmh8-0003lT-Oz; Tue, 19 Apr 2022 08:11:00 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1CD52320005D;
 Tue, 19 Apr 2022 08:10:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 08:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650370252; x=
 1650456652; bh=HN05d9HDpl5t8OWO7jNOVIrK3UhhLHfIhSdOnZWKGwA=; b=n
 VgRJDqCYZabYvhbgHc5lRitsq9US5LaWviDtkJpnwkHoPLhNdJfodE3ep3sf4kCF
 MlPgj2DiECTyE+CYoSZj1xI7n6oa+AVfz9PIVDViLEz+Y/Oq/cESxhjwUOAtBT33
 ohT8/L2zjfCp5+5XLYvMG9Fx1PIoVYI+y8ZVMcl1wq8x4I+73UwLpYhYOWZqXBlg
 eiFc3qGMh/d7xaD4a+VkGmJpBEDoAmij1WtbIdsdZQhqKUB9oX47CzpVc0rcubkk
 QPKkCFIWhGyz/etaH+lpX3p5NTiIJ5a2QsfLZ9BNHaakVRCNpNhihmZoTUAVA+6q
 js0VvkF/HB0wyfpI4JQog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650370252; x=1650456652; bh=HN05d9HDpl5t8OWO7jNOVIrK3UhhLHfIhSd
 OnZWKGwA=; b=Sg1a6aw0nqPMzZiSG0nZmzoqBB/1HDR79Brp4uUhJRNF3Yb1Moh
 0SE5ITwXdLRtfrc7N3k+JdzsA1rfl5nXX6CmT0wKQRbFPJElINBlvc3ir4sqcPRG
 i3EFSPP3SV36/3x+l8Jug1G1VR35Wndi0wFMEyyNxsbPPW/ynBKCKMCH24wSl74S
 +oi3BwBD8rdCAqpM59sIHEsOs8P/gfvh0PAbrKNRgW2drozqRcS8ppGW155c8ApJ
 i7yiLdsdesidb49N8f48pr02FgW7en+q9KJvlFIqQnPeP53IxRwNVeBcdFq4wUAF
 Ck/u+72Rus2Fg0B0l/gpiV9I4hy3EK2vdyA==
X-ME-Sender: <xms:zKZeYpxVuKwdMH6Wz8-zyql6kjAv4LcV65phuscVwu-Qyz6oXy3_XA>
 <xme:zKZeYpS3LKMcJiAUGPrR8K4eKGDN6gm5-VokCetK9QM6Lhd0WX_Drj0GsSrXSFm9T
 RruapGl8nTAQA4TLno>
X-ME-Received: <xmr:zKZeYjV6yTJT14Iyaol-0fu4XwzgbPI2m7gPxvp9en5uTv-WHjPg8kQxVb73c9cXIR4kypEb98fvh6Dv4n3B1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeiudehfeejteegueeffeekhfelgfekheetfffgteejgeekuefgtddujeeuudeg
 ieenucffohhmrghinhepuhhuihgurdgurghtrgenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zKZeYrgSVIdDnGxrEy0Uru2fY_trwzyRBN5E_W-JAvzS80rcXYbjpg>
 <xmx:zKZeYrAMgTXrn05OMd9-ajGXd2UH1mfguJ3uBxJ7kvNHrBR-m5AY4g>
 <xmx:zKZeYkIjf4zXukzCKRbnCPzYgCpsM74QtlMTHuiIzM2hnJ79Qzyo3w>
 <xmx:zKZeYm6GJIhKkhfuemhxcqw_WQB1knx9RdvrVOCZDSG17BkjUqVkAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:10:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/nvme: do not report null uuid
Date: Tue, 19 Apr 2022 14:10:37 +0200
Message-Id: <20220419121039.1259477-4-its@irrelevant.dk>
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

Do not report the "null uuid" (all zeros) in the namespace
identification descriptors.

Reported-by: Luis Chamberlain <mcgrof@kernel.org>
Reported-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 17cf9862ab89..2b7828ac6952 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4950,16 +4950,13 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
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


