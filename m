Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61853D29C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:06:50 +0200 (CEST)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDZJ-0004JR-TA
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNc-0006h1-JO; Fri, 03 Jun 2022 15:54:44 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNZ-0008C7-JL; Fri, 03 Jun 2022 15:54:43 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A362C320094F;
 Fri,  3 Jun 2022 15:54:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Jun 2022 15:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286078; x=
 1654372478; bh=z/L9OSPPnR3dL47BmyRviirXZ57IMkZ4Gb5vJuB4fvQ=; b=C
 fkMTOXM7i7GSzzsW4gg+ldRTbGiatDX+7unXIOxA65h+rp3LWQKqzD42AD9hOhFI
 oyRwBFxNM2Lml5wGUuOtM4OqEJRWvYmv9HayLaj8pNMQ5xpYoLlpwjBVPiD7/FGk
 tLe/r4aFN50E24dkA0WOO0SuAI4PuS+6bv2F6z7v6Z5kuHqR1ksyjI75oQnPIM6R
 bun9BTiOlp43aNj+uGmFqI+SheuwN5J6z9w7oIE1RRNSto1jzWjTg1IqbXN4wtJA
 CO3UnU02Q081YLMZbgJQfDMIaAQnecJjV5fkEdZ6tq9aC8JeMCmHfZuLy1XeeZ3h
 7ZcjuE9g4VH0frEoNd2ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286078; x=1654372478; bh=z/L9OSPPnR3dL
 47BmyRviirXZ57IMkZ4Gb5vJuB4fvQ=; b=lMCunqPTHyFT02YKj0mJaMQBnHfHl
 yNCeze46eFYap4OO6AnP5vbwDBMJx0Cas1hO7P4UEnEXv00Qf9d+UvA4WOtOh9wU
 LDdu/Vg6y476tAQvhS4S2GLDLKa90zBjefssglhIBwssMCFc28zQaLMH41Sh7VmT
 iqjDeGggJbyv/+TSW6Gke9svsPUcBmG85FlMaSL04RztdQ1yK1S4vHkurTBzxd/r
 RSXEPHHdunfhxLVBDgyqqTirDg9mCYRMdc5Hk00HSie+uCsbeLtbMFdCRj+UeYHx
 XL+fpFOY71U9LPDka25t6uxR2tvIqI/zYGRoVTXaDKfkr0CTyzimM3vHw==
X-ME-Sender: <xms:_WaaYsXf2FE0CvayU6B94IRkwHp3oun_uzfotvw8udXOwe9Rz34jig>
 <xme:_WaaYglh9Bmfu3YJ-l2ivOm5ELbHGW_QZ0TcAd36dPeFkBPpPsIkJvGWBSgi_PQG1
 sfA_Wb3LZhTAEUE1LY>
X-ME-Received: <xmr:_WaaYga_59VGlY56ligzwT-9sNPlSUpDDZ9oJwWQleOcfndwdeg8cuh_D-eI92qhpUrvAJqWD4xKTabR7O1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepgffgtdelffetleetieevgfdtvdeuiefgheegveeujeeufefhieekfeetgeev
 ieeunecuffhomhgrihhnpehuuhhiugdruggrthgrnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_maaYrUlt9u-7a0WyVqUDRWypskjML6M38x3ssnp67R-2APDMlxO0w>
 <xmx:_maaYmlw-w2kkBvXC5WCvX5LMJvs5IlrgPWyt43Nav6URwCA0dRJSA>
 <xmx:_maaYgfPvwprZcimi_DQpGuX_3VK3uWmmM1ddROpvsNUvzezrmkluQ>
 <xmx:_maaYinXXkA_iRL44J3u5Z30sNdSjXVL_SlGuMJ5xetJmNBgC_hPmQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:35 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Subject: [PULL 08/11] hw/nvme: do not report null uuid
Date: Fri,  3 Jun 2022 21:53:51 +0200
Message-Id: <20220603195354.705516-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
index a2f6069f7fe1..909e357a7eb9 100644
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
2.36.1


