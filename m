Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE8C69CA65
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4pa-0001O1-Dr; Mon, 20 Feb 2023 06:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pX-0001Mz-Vt; Mon, 20 Feb 2023 06:59:40 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pW-0006cu-He; Mon, 20 Feb 2023 06:59:39 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3E7033200D6D;
 Mon, 20 Feb 2023 06:59:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 20 Feb 2023 06:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676894375; x=1676980775; bh=Uk
 5JL0ZgsACxTXL6a8k0Iz8V5fQGqM9yqjyD62U8WuY=; b=RFYaMyC/RHHZN23SrE
 ShB8dbQPShjzEcFmSzbUMMqMBRtJIToB88itXmyyzd3cG3y7IV6VFdq/vYeau/g5
 2LRp7gT5E2AEymmxntiT9RbzzZmzj90c4HdLhMu2Ks8Xyc1xy+LnvqifIO1qoTle
 egfo2mF3E71sMc2we/G3q+Sz8QyFup/mDqf5z/UVTkXThOBGM8vwjLhXeRSWvOIO
 LhdQarc+B0YWssR7maKbe9tKMUtGsrZZ8wgnjt72xNlhNiuxVHzQxyZnpXvHVjik
 qJIsD3rAxzD01p+kzZtFrMCYw+UZf0ylt4EZ39Yi0+w7JnMOp3Fn755q88CconGw
 TBrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676894375; x=1676980775; bh=Uk5JL0ZgsACxT
 XL6a8k0Iz8V5fQGqM9yqjyD62U8WuY=; b=Rgrj5TaZ5pIDDw2Egdm1WwyprADfQ
 eGuZQxQjxSg5z0v1+428FY3NmMxAB7V4ZQa4PBVdyCXnw86DPkT5U+hQaLdLbJFa
 4cKBiknL8UrHp52J6yjvcf5dBaRUozATuQNhpZvc/WPib2KxB1dG8Onels6iAzkw
 PjT3x9WxrU0tOlBwD0K+aHMS6sEjL/msiPvqRG9++OhaqAYChkLl1SuhGdNWsrVf
 xxKj+5SmbTuQ5vOk54c1l+QadWPm7qJWCq2bv8enCTCVD0b88YrX3c5i80vzsXRB
 TR7UqRlExu3KBTSJd+oRj0MUkwZGkzBCBrXLIypkvuWMtM9oDbB49pmPA==
X-ME-Sender: <xms:p2DzYxrCpypRX4cEFnBY8T34VoytpmGtayhX2jY44dH5sJ9mfuxhxw>
 <xme:p2DzYzodv6WtgI6yQGMR2vjdFGkSnYlukK0i-bPeY14hDJ1YxUrEMF0d1HebIRMej
 exGtPKL86dXjArS1Ak>
X-ME-Received: <xmr:p2DzY-PleXtT8RnibYT-dU5fqkUT9Uss_kRU4lh4JZE3bbQTVNlrJWh2JrYZ_bwTce4qtJaW7j4XIil2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:p2DzY84_mCPgD_5TDJ73pZBsbU3p4jygb3SbYEhhN8nA_bRO88tl9w>
 <xmx:p2DzYw4DUqPCB1VBjFhYlOQCAQcGu86fwwToA-DW7qOcujH5HuyJVA>
 <xmx:p2DzY0h9eK7IxQXIyEpjUoaI6ohPFQcEBeIInMzsa2tDdSsmC4V7lA>
 <xmx:p2DzY9x0l05r_Cl7ZRI69SnUANZEPT2iRTuH1ECT035SXUi_DRU8Sw>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Feb 2023 06:59:33 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 2/5] hw/nvme: store a pointer to the NvmeSubsystem in the
 NvmeNamespace
Date: Mon, 20 Feb 2023 12:59:23 +0100
Message-Id: <20230220115926.54623-3-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220115926.54623-1-jwd@defmacro.it>
References: <20230220115926.54623-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=jwd@defmacro.it;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
2.39.2


