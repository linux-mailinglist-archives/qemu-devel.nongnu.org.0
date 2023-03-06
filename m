Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034096AC36A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:36:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBvM-0006QM-UH; Mon, 06 Mar 2023 09:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvJ-0006OW-Vr; Mon, 06 Mar 2023 09:34:46 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvI-0005Uy-HW; Mon, 06 Mar 2023 09:34:45 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AAC055C02BE;
 Mon,  6 Mar 2023 09:34:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 06 Mar 2023 09:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678113283; x=
 1678199683; bh=sfzU2rLzlJm2OF2cme98RYLx8G1VEL+GN5OZplAGtRM=; b=u
 FMfXSBl30OyeGBp3wjDcF7JhDpD+2b/Nv+AbqWM2DcRh33OdVF5yR7rlTTD4vEZP
 Z0XvQp04sELIx28+SfM6bTojbHKD7KDGCgbw9uwYQe+GKt8CrA0hh++wN1efwFo0
 XWoWP2Pac1mmSmgAPe7jLKBh7Q72JewPIR4vLA8qNeNVM/7YZPA6jXi8UQlC+igB
 jC93Jaymrp+KaK4+52J3+XhDbWqssbanVjTckrvz+RjKL/4Z1HmfwRZkTA2lg3jE
 wAJw2rF25v+LPHm6b21OLrqCnQxta1q7mqbjDDCdragiR2UUPmnu4xg9io86L5SO
 J/QJBwq6Q+3scv6lROU8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1678113283; x=
 1678199683; bh=sfzU2rLzlJm2OF2cme98RYLx8G1VEL+GN5OZplAGtRM=; b=M
 dqlo1xMxsYYbSntI0IsAfIoTm/1exHB8s3N73VnNdk13584L+Tne+rdM+6GcbfnX
 q74gSu99EBuWkCnHZffQoXS0rsclvtxiqYtVvrG4WdGS7MjPWed0x9PDwSyKGHgc
 5fsarN3CMAg2Hcgki2t3fHCphJrJX7Ktp35rV/e2U+/yyL+utmy+/6uCaL9UHpFq
 280XYgkLKTlpiaSpu7NNPmM0n0Tlj6vB/DvMJWfZtBbOPHgQGR//hIhRryuwzroq
 JEm0PZfrfwt5DlP3hsbNX3k1ot+A7vBu+jMLnl+xXZYNIsTZYQ9rrqZphDBFknkG
 y244G6t4xGzPIi9xva/YA==
X-ME-Sender: <xms:A_oFZLLP7x2s5LX4fzacLaC-nb_jNYQtBunqTKHbe76mfkGpfrZaTA>
 <xme:A_oFZPJ2w08g1LQmjx2_InLF49bY0UqWqVSCdbCW9Pd_KmfJF-pVNvy4P93_BNW_-
 m2oHF24xmwYHcH5Odg>
X-ME-Received: <xmr:A_oFZDtpjw3GsrBQ-SuQ0vtYKBfT2SeW5-s4Kc-1r11zNiesPMr0tSqMZ5v8XP6XV2CP9hnvLqQ-qRrjm2oo2eA5wR0PfSFgRi0xvgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:A_oFZEY84g9mwWERItrZkqDWZnu6iBj7MVvxYvA-UXJZL2GfnF3uBQ>
 <xmx:A_oFZCZSRoZ1HYe7WmB8-i2M91IahRaNDG7jojrFmWZ6YL3z0nKatA>
 <xmx:A_oFZIC6rYkhBj3DIDcjBcSzMEvaof6SZkEL1Au0Zgb9QyC1wnn67A>
 <xmx:A_oFZPS5Ha6nBsrwMghOLbyzP1C0wjPLPGhpwFiQyfpSxCeyodq89w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 09:34:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 2/5] hw/nvme: store a pointer to the NvmeSubsystem in the
 NvmeNamespace
Date: Mon,  6 Mar 2023 15:34:30 +0100
Message-Id: <20230306143433.10351-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306143433.10351-1-its@irrelevant.dk>
References: <20230306143433.10351-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; i=k.jensen@samsung.com;
 h=from:subject; bh=TsWhXMqC3vOl1XSTCVLpOn22OdD3mS9gO5gOTakgK+Y=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQF+fjnSPNaSqioAG9ggBVU4E+fi9zgKbeEd
 yLyBOPYceg+yokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkBfn4AAoJEE3hrzFt
 Tw3pvJgIALgM39WeTg2p3c0s6mkp9F0MaU/aIJmr17HU6YJK13ZBP7GUx1nA33abPk62bBktYoC
 n6luchEt4jeZIIgJ1ajzyeDPDEjckhWQTMeueBIdKlmTAXUawqpk8erGP0s0lSE1kVuV7L7WzN2
 O053XQnArHVVAOCo9PMe1mYpwqQnM7ofALl6TMPQYdhp6ff6HXWQLXNJcgbh0hkBtnf82LAjO9B
 UqfsSIIdqHdEXCZatvgnn7+5OLSCFv7+B3x5ddArebHHCPKfjymoPoWqHG9I2rW3I7cn+gTSuKt
 PZllT3EVazy8qFThuWNTnPngETLY2FxhjqbvJpr36mFgM/XlaHthlqxT
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c   | 1 +
 hw/nvme/nvme.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be010..8ebab4fbceaf 100644
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
index 16da27a69bfb..5d221073ac68 100644
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


