Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD0A611F3B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 04:02:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oobAC-00008A-Ho; Fri, 28 Oct 2022 22:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oobA4-00006k-Uy
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:25 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oobA2-0002ac-Pf
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:24 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EE94432001AB;
 Fri, 28 Oct 2022 22:01:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 28 Oct 2022 22:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667008880; x=1667095280; bh=ZK
 rNGBecz8aAEAcaJv+m93cMiW6DA6iUj0D1ODVQagg=; b=iec1lwTovbyiiyNgGE
 1FL3XZy0cI+DLQK4htxPBzk3nktRetBIFW3fAZE4tMPwyEvAfsXTMy3G5zVMmFHS
 Tdgbbwgqp/8Lu/caHOwA1x95Ens9Ex2lW0+URjwqjeLz6Oq/FJC28NlKsK6RNVCX
 v9VQ2TQkTMdRI+dVvnOhto9hwvT0LOVUW5Pm3xFr9AK2RjkrMBnF3/idfX9fcCj7
 E9SE12u3pOH/XOhHQqz3VFHHDv8vmNi0ANFSPFPyZd1V0fCasoLasH1tjJIOTGYu
 SQX9cdZjbAsMxWwOzrql2rPdyuYUjI5aC+qkIKeHOxBxFkB5/R+02U+tCWYWHvKs
 0Wrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667008880; x=1667095280; bh=ZKrNGBecz8aAE
 AcaJv+m93cMiW6DA6iUj0D1ODVQagg=; b=DMZb6Y5YTFPRqrTWGKI4Qo+/erq1X
 A+Hk3gKPr5Bq/nUvOWExwCoGSkM/Kj29aJRgHZg1964iLbtkt9Bd15KnDj1JjGZ/
 AMlSylQ0ZDu7zOXxM9PVh6i4FJNwAb+FFjSTmUOC46Yty2o1LzWDN8mT9224lBIK
 IZgXv9gGIxmwKFjprqwD19qiDSHj6e7m7hmhDeX+T3+n6/Zv8yDhqIALKlKC4EYJ
 gMvgL943BWHNVl+flfzc0D6MWHDMQDH/0DD74aSfg+wvYOBWBk77s+ImM7sHgxgG
 r4cs8V1AV2Kj0tDRRBVGKEAnvAwNLsV/5dN2ljXGTCNoE++1AzcTIdz5w==
X-ME-Sender: <xms:cIlcY9qDTjwzk8Sw06mNwqV2lJJlIHc50C5zefUA2ZKg7wMo_dfc9Q>
 <xme:cIlcY_ob0hhfHTyFhcaCP842blS-AqCG1wTc-0seDvfXspAVXKeRXtsFJau5gMztk
 3JjzcdNPw_gLQ2bhJw>
X-ME-Received: <xmr:cIlcY6PdcORE5PmW7tbp14IsbTU6g7I5BcY0uFBEz6JXz6qn7nsJSUS8nOeo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdejgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvuedvvd
 egkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhiiigv
 pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:cIlcY448VpyEIIJhDTGtRrLJoZ6qi8RBo6a1OfaPYZlgFOu3TymsbA>
 <xmx:cIlcY84gSz43kbw1kx81RA7GGsxtP4Xrr-e7cgQlfAeuEgEIk5FW1A>
 <xmx:cIlcYwioRGiqpJVstgBg4e6clozXOKtBOfsC3DE51qoDr_FPfknCXQ>
 <xmx:cIlcY8E5oB2HvGdpWJrl5lSmPkycuOuRzdm9naawWMcw3lsDYntt4g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 22:01:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/3] target/mips: Disable DSP ASE for Octeon68XX
Date: Sat, 29 Oct 2022 03:00:30 +0100
Message-Id: <20221029020030.13936-4-jiaxun.yang@flygoat.com>
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

I don't have access to Octeon68XX hardware but accroading to
my investigation Octeon never had DSP ASE support.

As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
Manual" CP0C3_DSPP is reserved bit and read as 0. Also I do have
access to a Ubiquiti Edgerouter 4 which has Octeon CN7130 processor
and I can confirm CP0C3_DSPP is read as 0 on that processor.

Further more, in linux kernel:
arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h
cpu_has_dsp is overridden as 0.

So I believe we shouldn't emulate DSP in QEMU as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/cpu-defs.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 7f53c94ec8..480e60aeec 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -934,7 +934,7 @@ const mips_def_t mips_defs[] =
                        (1 << CP0C1_DS) | (4 << CP0C1_DL) | (1 << CP0C1_DA) |
                        (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << CP0C1_EP),
         .CP0_Config2 = MIPS_CONFIG2,
-        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA) | (1 << CP0C3_DSPP) ,
+        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA),
         .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M) |
                        (0x3c << CP0C4_KScrExist) | (1U << CP0C4_MMUExtDef) |
                        (3U << CP0C4_MMUSizeExt),
@@ -946,7 +946,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x12F8FFFF,
         .SEGBITS = 42,
         .PABITS = 49,
-        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON | ASE_DSP,
+        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON,
         .mmu_type = MMU_TYPE_R4000,
     },
 
-- 
2.37.1 (Apple Git-137.1)


