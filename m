Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE2611F3A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 04:02:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oobA8-00006a-3o; Fri, 28 Oct 2022 22:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oobA1-000068-MR
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:22 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oob9y-0002Zy-OP
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:21 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id BA9B2320094C;
 Fri, 28 Oct 2022 22:01:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 28 Oct 2022 22:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667008876; x=1667095276; bh=OW
 jlQO5apEQ/S/jgZSIjj73D/4GHqGSzssO5cICT754=; b=aNUtgI5fP7C0l3DmIC
 DjWXZNIRpyDw7P/vcKEgmNYmVIH3W8kL7qjU1lpGKhBA9nd0jNVbnAy81hKFdAPX
 WM29c0jotyhSZVBN6GCUgPn+JItQDp2keGqRcIM5lWCPg5ph6xUVc2s2kC7NAA42
 gJdte9DyLkf7QJa4naW5o33T+rgOdieik4VVJCyh8UWxbBwANvU5ew81An6il5fN
 chzUIrKMMOXrKcgJQPNGJLH5OT9/Xkdf1Wyk/wQaKqFY7d5zD4HZgBpXPYu/f6el
 QIoRLy54gUj0WWDmNyFT7vDloEouzb+cEsq8mi2FZtRZHMBhOfidwCwb3XssGxAb
 gGWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667008876; x=1667095276; bh=OWjlQO5apEQ/S
 /jgZSIjj73D/4GHqGSzssO5cICT754=; b=LXwPkXx92QVFdSm7b8l+B0Wr5GvNz
 4KtLFpEUMQWjyB94c4ybryrwW1MGaPEY6JgzxnswLGxYTWnNtqg0GgP2CuP59aY0
 4g59c9wv8/0OZ+I6ZROAtizJHJA4EwtnD9MRDANfVIN1W1VJi47GO8kdJzF+0+UZ
 Jmkz14MMspz4FJXWOICYbBAx23wlSylVQI/tJ89LgWeA7THOYlgGw0yOckTN+2Or
 ssNJSgTWbREHg94AJNslCvCiH02/vNx1NCC+9kycuKWUjyXh5dV+E8YOSkniE7tG
 PXmHQ/4/wcQawNYfAW5EgV/dE00c+zkEAZ2psn3CoCVUamrMIgFYE4oJA==
X-ME-Sender: <xms:bIlcY5jLQncRiS2wdFiuz1Zlo511bg1DaocGRpBH_KCBgiwSwXgrMA>
 <xme:bIlcY-BbcZLV6_7kKKyaVjqqRIaznIKJE7qDO6hO_kkn4--0COtrdyy10_U-k46N5
 4nJCUjtbGb6PYVFPAM>
X-ME-Received: <xmr:bIlcY5G2rxyoSvmALmAcC5oPEaAmT5MH0lXGLnul9Z8VoOECNMXkfGz-IIDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdejgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvuedvvd
 egkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:bIlcY-RtZmWtIgT4L4N7fH9mG5ukG69PP8pPSuwIpIix-wVnztilow>
 <xmx:bIlcY2xmy3W0q94ItFiu102eA6J7cZL_LYr-fG6qraDPDEkFY3EOGQ>
 <xmx:bIlcY05AFno-VLKp6HQhf6ldtnm1lC8GJ721sNLalCN87ZsCxcO9wA>
 <xmx:bIlcYx9VPCIVIefiRIs65AkqywyUhXbEQdHZp2Vt1LazLioE9GSAeg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 22:01:15 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/3] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
Date: Sat, 29 Oct 2022 03:00:28 +0100
Message-Id: <20221029020030.13936-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As per "Loongson-2F processor user manual", CP0St_{KX, SX, UX}
should is not writeable and hardcoded to 1.

Without those bits set, kernel is unable to access XKPHYS address
segmant. So just set them up on CPU reset.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d0a76b95f7..a870901bfa 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -304,6 +304,12 @@ static void mips_cpu_reset(DeviceState *dev)
     env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
             0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
     env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
+    if (env->insn_flags & INSN_LOONGSON2F) {
+        /* Loongson-2F has those bits hardcoded to 1 */
+        env->CP0_Status |= (1 << CP0St_KX) | (1 << CP0St_SX) |
+                            (1 << CP0St_UX);
+    }
+
     /*
      * Vectored interrupts not implemented, timer on int 7,
      * no performance counters.
-- 
2.37.1 (Apple Git-137.1)


