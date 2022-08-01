Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656F658720E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 22:12:47 +0200 (CEST)
Received: from localhost ([::1]:57092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIbmO-0002dE-EW
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 16:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oIbjQ-0008DU-IC
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:09:40 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oIbjO-0007NU-Ut
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:09:40 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7582F3200915;
 Mon,  1 Aug 2022 16:09:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Aug 2022 16:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1659384576; x=1659470976; bh=VS
 Df1ulTKycp2/Sby8pL+MGzLQc1C+bFtlMpo8fQWyo=; b=TirI17doDu3xcACtSe
 tvdJEX90e+ZtoKymocMFU94Pm2k+BvvJLsdByi+Fkj8TBsUc/4bmfvt0ikR5+Yg7
 pbWVenWo65m9xz2YQvRSBCkjT0miPD1pKYb8Bg45RoSqSlz9VRD/zx/TCrfXWfJd
 e+uAoQb9LM8z2wX11KsWf1P3mruAM3D+wdxYgYEt+uGPrcgHKY7Sq530OTiHwtsr
 jwNEc4APAxEXJOyiKIVPZ4tjqAALNcf4xrfwdKZ95qp5JErpIPCSwWNCi06SvppC
 QHmC3GoklBoxjyCKIECt67bFbTQsMUixYG2nmlM3kBMwts0jbpKDWrJua3Iilu1E
 qqIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659384576; x=1659470976; bh=VSDf1ulTKycp2
 /Sby8pL+MGzLQc1C+bFtlMpo8fQWyo=; b=LT++L+4g6pezH/jfenYewRxBs3LM7
 eIZTFS340EiiYXO7aFxXIMp2KMsE9UuUSQwyxnCt2jydRUFW1UWWv6qtFcqdUl5m
 3KxaMCUmH0xhW6BwWkfGE+gL0k5xQj9nZbdBpyYZHI2kDXmHw3/kwFgtmlP9SYps
 dbl4XuTzFMqJrOFfTYxfKvhf7kONgfbKBbDAISmflOg8O/oaJIwty+Sv39ukcAon
 TC88DrnQDLAR9JrtHAaLW9G8I88d/OjGh8p5sp6+cFSIioLw+q6JhKLs3YAy/WNj
 EwZ/jbHZ8B6C9UN7Scmel7v81LFR3VACGaJ281lOwVsrTAmSbc0NQQuag==
X-ME-Sender: <xms:ADPoYt9sautnITEY_CS0jfSKlSjzAxENPXrubS3ulI8VuR0cIC1N6A>
 <xme:ADPoYhvRquG8pG39MlmekqbanxJIEb7-bYGB7ke7BbiPfMQAaTpCEV_l-dm-DJWEV
 sG7neyIqTrbQ7hEo8A>
X-ME-Received: <xmr:ADPoYrCi3bOmCea8XK75H-PiNeG4FG7HEHlhnbR2xEc9d4ecOd2Pb7JzEUmi9n0e-9SutuLPp7kpJX5OCU6_hIiusY43SC34DPpesDcQf4IH9WXsBCZpPUEx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
 dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:ADPoYhfRq5RclgtaG-lMSJL73qPy5Bm1NuHU9RhSOVUe6pwqVuNWJw>
 <xmx:ADPoYiN1epoHmW--tg7UIVGSWecZgliEd5g4cFEliuvLCkK_0eAaxQ>
 <xmx:ADPoYjnui6JAp93HMaZxTsXfojAWfqX0c1Ur4BomWYeTQJgQ5LclXw>
 <xmx:ADPoYrbjY2DeJmckZRjnY9ThEG2eFx5592jiB9I1F1tujhkSc2Rfaw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 16:09:36 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: laurent@vivier.eu
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] linux-user: Set ELF_BASE_PLATFORM for MIPS
Date: Mon,  1 Aug 2022 21:09:28 +0100
Message-Id: <20220801200928.73741-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
References: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout4-smtp.messagingengine.com
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

Match most appropriate base platform string based on insn_flags.
Logic is aligned with arch/mips/kernel/cpu-probe.c in Linux kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 linux-user/elfload.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index e7666c5c60..8a4ac9787f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1050,6 +1050,37 @@ static uint32_t get_elf_hwcap(void)
 #define elf_check_abi(x) (!((x) & EF_MIPS_ABI2))
 #endif
 
+#define ELF_BASE_PLATFORM get_elf_base_platform()
+
+#define MATCH_PLATFORM_INSN(_flags, _base_platform)      \
+    do { if ((cpu->env.insn_flags & (_flags)) == _flags) \
+    { return _base_platform; } } while (0)
+
+static const char *get_elf_base_platform(void)
+{
+    MIPSCPU *cpu = MIPS_CPU(thread_cpu);
+
+    /* 64 bit ISAs goes first */
+    MATCH_PLATFORM_INSN(CPU_MIPS64R6, "mips64r6");
+    MATCH_PLATFORM_INSN(CPU_MIPS64R5, "mips64r5");
+    MATCH_PLATFORM_INSN(CPU_MIPS64R2, "mips64r2");
+    MATCH_PLATFORM_INSN(CPU_MIPS64R1, "mips64");
+    MATCH_PLATFORM_INSN(CPU_MIPS5, "mips5");
+    MATCH_PLATFORM_INSN(CPU_MIPS4, "mips4");
+    MATCH_PLATFORM_INSN(CPU_MIPS3, "mips3");
+
+    /* 32 bit ISAs */
+    MATCH_PLATFORM_INSN(CPU_MIPS32R6, "mips32r6");
+    MATCH_PLATFORM_INSN(CPU_MIPS32R5, "mips32r5");
+    MATCH_PLATFORM_INSN(CPU_MIPS32R2, "mips32r2");
+    MATCH_PLATFORM_INSN(CPU_MIPS32R1, "mips32");
+    MATCH_PLATFORM_INSN(CPU_MIPS2, "mips2");
+
+    /* Fallback */
+    return "mips";
+}
+#undef MATCH_PLATFORM_INSN
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.32.1 (Apple Git-133)


