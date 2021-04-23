Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF2368CB1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 07:32:11 +0200 (CEST)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZoQD-0000QC-Ql
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 01:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZoG3-0006Wt-Ti; Fri, 23 Apr 2021 01:21:39 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZoG1-0001O4-CN; Fri, 23 Apr 2021 01:21:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2964514F3;
 Fri, 23 Apr 2021 01:21:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 01:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ASPNVKGhYEtw+
 G+01UwLLbB8XBe+KmDswiJfaREDc/k=; b=1KAq1MqMUOS1KYUgduSiVGccMh0ZN
 Z8Yg6K8hjbvWrIGXP0ndZKk1fOhZBHNphZNFpaSLfi59Px/HepaJgEUHFb1yTG9z
 slu5qOz3FctJNH58qPaeDp8Zve8TEaytqaen8lfSezWBMaOkMmXgFHFTNwWj5Ed9
 HUsZjQOGIZh3Z7hhyRR2HMgIMM8gRJ6nLmvSZ/xRH9vxJ5DBGI59y52tD1pVBfTO
 MXGNoMQZy9TraQCqU+384ZBSIJVGv9MLbVRsRoCXemvSUr7C4TH9z/oJdejZpLvh
 jUSjlnLdwm8mVgHM2bdfV2v5onR1Phr778J25p+HdNewK5rq1qLhSmCkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ASPNVKGhYEtw+G+01UwLLbB8XBe+KmDswiJfaREDc/k=; b=ux6dX8rc
 nKzJ9NkN/+pgAYbciZMrLDZ0xOnMnFBrLVtRydzvj4aseiXDEsYruTmcb7aQk3kF
 tNooXSTd0hAI3C8DWxXDbfg4DJg97f2xQggG1BGRF4Cwu6GqKBWd5VtZjRH59Yg6
 ZnnbviWYd7YLSRrMH0GsT4h4pUBDXE8swsbyfvcL0yZUSHtk4aO/LD4GeOjAttxF
 EOTsfBqfWR3+WXF/JjVbiMqNLeRjkzPDps+ISJRAtCCnx7s24fXey9dFgxHMa5YC
 5LVE02kjDkWtIgW7xoQaOexVRse0CKJonaQ25pdYg+h4okk48AKVrSS7UsBEdsIa
 r4UHmzLCmkiCUA==
X-ME-Sender: <xms:XVmCYLI8NZ6MS1cqiUtdnM3oorgokI_fooqhKRR1ubvPMsyWJoR3TQ>
 <xme:XVmCYIFBEWuuOTSa6XVn5XOCSUIMhkKf75GheJZ0QSdMkmCp0E2teDCdXrhaynONH
 os97Frt21JNiSADRjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduuddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XVmCYFq1tvXd4pywJXdRWUIqC8XS4bWARWFXh4Q7hbAeG482jFGd4A>
 <xmx:XVmCYBTGRtz2qhuDgMXaCQRLrMYaXVquwz0qk7wi3_jfLDgzRMH5Sw>
 <xmx:XVmCYCNGWgRz9wP5cA3Lgie1NhiZmw9E8T1pW4yVaXTpDr_rf06kBw>
 <xmx:XVmCYOcxcqhYS1aE2HNlUmEsYIvEZv07lQi2x0xWugtQpZs-hVXLyA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFAA11080063;
 Fri, 23 Apr 2021 01:21:32 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 2/2] hw/block/nvme: disable hotplugging for
 subsystem-linked controllers
Date: Fri, 23 Apr 2021 07:21:27 +0200
Message-Id: <20210423052127.512489-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052127.512489-1-its@irrelevant.dk>
References: <20210423052127.512489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If a controller is linked to a subsystem, do not allow it to be
hotplugged since this will mess up the (possibly shared) namespaces.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5fe082ec34c5..7606b58a39b9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -6140,12 +6140,16 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
 {
+    DeviceClass *dc;
     int cntlid;
 
     if (!n->subsys) {
         return 0;
     }
 
+    dc = DEVICE_GET_CLASS(n);
+    dc->hotpluggable = false;
+
     cntlid = nvme_subsys_register_ctrl(n, errp);
     if (cntlid < 0) {
         return -1;
-- 
2.31.1


