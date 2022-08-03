Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFA3588AA7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:35:47 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBj7-00053N-Um
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oJBdx-00015k-7b
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:30:26 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oJBdv-0003mv-2k
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:30:24 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 967B85C0132;
 Wed,  3 Aug 2022 06:30:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 03 Aug 2022 06:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1659522620; x=
 1659609020; bh=2K2RMhw9HLZkI8QTb/8BjZzlwMTyPkvKbC2iSS9RVLM=; b=E
 P4HWGWHDjzXtUylUz8SrbJypBbrOpFYi73OPzdsExFd7KTHNP03moiAKjBON138d
 YGdHCTLKXX9tMr/Xx1AVPfCIWxbyYTLm12Cdc6/2BYMLynDGhel/YWJkIE1aPT/5
 IrQQayW9qAUgl2lllvZdYkG6mGDeNjJ7O2Yi34LHol6eOY5rEK+XJ6m2NUbUFBwP
 gMo8Qn8MJptq5VU0L7dXXq6ACVDniG0QTxQl7o1xZQ6aPGcAR0CtD6SKccDC2qg6
 RXkCdgrsgcwiZxq3x0hJ2nynIyeBFIXViyLjElk5hVVyKZhnRix21+tBcF0+PHOi
 PBuiz0KaJBTSN7r1nKp7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659522620; x=
 1659609020; bh=2K2RMhw9HLZkI8QTb/8BjZzlwMTyPkvKbC2iSS9RVLM=; b=Z
 4pXCtl34VKgFY8oCLqPzOwE6LJg+VmMwcsdrx118bB5l7wM3ly4GPmgwu45ZwrJT
 W/44KSfSXlhKZd9Q3lwrPYqQX67S5ciSS1fPSXPcNXvviUGxbPjgmi5ZnZjjG3X7
 8NqeNz+9PrxuU8b7MixDZi7EEgwgFx5TYbRZgGq88mCc1EYy2TZo5ZfVY9IGENmm
 Vn/ayCs2hXm5/0u5UkmimB+FHsCkI7p3N6JMO4DArjPJc2dpnKe21ygk2ZA+lFwa
 Iv0mb5CgK3Lnf0A661njqDuAgvNOH/sl2Uq4MWk8kh/TmIrOjDEyIf558yX6i3Bx
 mrCsyvH6bSwPAC6/N0piQ==
X-ME-Sender: <xms:PE7qYmzndghalm-stUkaHRsbMv89oSpTSWWFt03yPbs7oiH0MN2C3A>
 <xme:PE7qYiStEbbai3JYDDxU0um68tOguw82zivjd9GU3GI2gqQcOeWRU2BcCek_8bCYY
 EYwojwxNkchMK7kRuQ>
X-ME-Received: <xmr:PE7qYoVopTN_1-mdqOzNCrME1WSrfhWqyp5LBwMbbEODVYUo-Y8qsmfkA4OoPaAB8PCkTUElJa92chXEMIGnBohZ2ZvlIEp722RG0z3CfAv6725dQZVJQ9dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeevfedtffekjeefff
 ejtdduvddujeefvdejleeutdeufefffedtueevvdduveejffenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:PE7qYshq1I5cluYi5YhZT07ExlYh5L0pa4X8TbtYRyCcWhtxZvkYnQ>
 <xmx:PE7qYoDrBMWxhFpNLYa8tYhDJtql5P28frWJldmrCn0vtMzKR0naoA>
 <xmx:PE7qYtLhk-nmT-YlCIOMk8rOidypqkJIUE6c74GvOOaWKMMHlOwf_Q>
 <xmx:PE7qYrPoMbr08VADWT3MhIRbeogh8rg_t7vFWgYMEilBI53kcHPpZA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Aug 2022 06:30:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: laurent@vivier.eu
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/2] linux-user: Set ELF_BASE_PLATFORM for MIPS
Date: Wed,  3 Aug 2022 11:30:09 +0100
Message-Id: <20220803103009.95972-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220803103009.95972-1-jiaxun.yang@flygoat.com>
References: <20220803103009.95972-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
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
Logic is aligned with aligned with set_isa() from 
arch/mips/kernel/cpu-probe.c in Linux kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


