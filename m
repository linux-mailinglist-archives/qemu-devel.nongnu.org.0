Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9B699B40
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:27:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSi1v-0002e9-VR; Thu, 16 Feb 2023 12:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQh-0000QX-1p; Thu, 16 Feb 2023 11:48:19 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQf-00045y-55; Thu, 16 Feb 2023 11:48:18 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6143E5C0304;
 Thu, 16 Feb 2023 11:48:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 16 Feb 2023 11:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676566096; x=1676652496; bh=iQ
 mmOMBy+KS4Zz3L8LjzaW5Hwx6eOgsGRv9zmGVknD0=; b=d88rHQ7LhHoTz5ZtKY
 t8avXaTMTKoiloV/X8AwNxBaXnUhPm7uMs8Fa+Gp0xE2hrpgsVukQ5YMKkz6xzfj
 YPBuSvemtM6nJNcnV41XQKpicWVqK4h9/I256aeCQ1PxbpZdaCicF0Ob14Cwpeys
 Wwp33bku08ByKfGeasC+lkvRHFQQSyLcG8f8uQ0nW6wHPvxNs+zrH6u18mrHB8kL
 fKmkeiQQGGNDiOgFvxK0FD10QwUPLuQRomrcw3+r1ItfuezlJSlF0jM8gVYVrVhz
 0NxKWhrND+qmFYJWH9Z7sBJsfm/xFxXBBXC4LtckI7lpBWaEA4WJyw8n41GBWUwW
 3GOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676566096; x=1676652496; bh=iQmmOMBy+KS4Z
 z3L8LjzaW5Hwx6eOgsGRv9zmGVknD0=; b=mvxTxB+ctGpvcBtXYI3T/znB/xTLs
 ppc+dTVPCwUA9VVQ4jtIyo8iM51Ty4twuTD3JLHYVWvYQ+3SxSCxmUPVFRmxwcbv
 fy795ICVKQmtn1/uQwdllBB0AGbeDp76FsssjbW2L3cW6QN8ZKrOxiCrCZCLSyao
 0h4pdPQpf0LCb3IIu0xNIskQUUUS4+Mrzl9/GvHsxbzeQCo1we7G3EBquKnAYnKT
 5O/fPUcrXqQ1iItkrvqj4pD9UGnBJ7L4ZVV2w+ip28tVwUdhFYP1dRXExc/RuHa+
 bunk7n7OMJM9RwC/5jRjdGABc6JvGmz1dkvQnEi8RYWMm6Npdl/tSKZTA==
X-ME-Sender: <xms:UF7uY3b1mB_1aevyPGSLCGxsW72WQ9rbfqgUOhEQehalmQKu0UnY3g>
 <xme:UF7uY2ajZsVsIcdV7-ghFKPdNe7eeyk1F70CIa_sTkiOE1vpd59IDuyHyz6FFSIKM
 Lw9MBYPUSNHoGvZA8Y>
X-ME-Received: <xmr:UF7uY5-O6VBd65Zea5WxOX8b71lY0235bdgV3WgA7Qw8QD5f9JskO2FzYCkz71CMiRfqrG6DOpXkR7qA_jEKu3t5UuD_OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:UF7uY9r_C-unABoYWlEs4c6a3OEmEJEToggqnTR3clFVRMuBars1ow>
 <xmx:UF7uYyqQNQFewUrFWmSisB2jjWS5ej723HYWw_CM6lnSMmYM_wkx9w>
 <xmx:UF7uYzS68nZhS4DPBgbdZMK6GvH0CMHHco-Lu53gABYmw5kCRZg4qA>
 <xmx:UF7uY_iAKF30qkdDLji6eY6-DAAapFLIWqjNGVwl0EQS5R-Si0FfcA>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 11:48:14 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 2/5] hw/nvme: store a pointer to the NvmeSubsystem in the
 NvmeNamespace
Date: Thu, 16 Feb 2023 17:48:03 +0100
Message-Id: <20230216164806.233533-3-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216164806.233533-1-jwd@defmacro.it>
References: <20230216164806.233533-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jwd@defmacro.it;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Feb 2023 12:26:45 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Niklas Cassel <niklas.cassel@wdc.com>

Each NvmeNamespace can be used by serveral controllers,
but a NvmeNamespace can at most belong to a single NvmeSubsystem.
Store a pointer to the NvmeSubsystem, if the namespace was realized
with a NvmeSubsystem.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c   | 1 +
 hw/nvme/nvme.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..8ebab4fbce 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -561,6 +561,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
             return;
         }
+        ns->subsys = subsys;
     }
 
     if (nvme_ns_setup(ns, errp)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 16da27a69b..5d221073ac 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -167,6 +167,7 @@ typedef struct NvmeNamespace {
     int32_t         nr_active_zones;
 
     NvmeNamespaceParams params;
+    NvmeSubsystem *subsys;
 
     struct {
         uint32_t err_rec;
-- 
2.39.1


