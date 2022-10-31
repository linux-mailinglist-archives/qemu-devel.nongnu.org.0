Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603186137E9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:26:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUng-0006a6-N5; Mon, 31 Oct 2022 09:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnR-0006KF-LL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnQ-0007jn-7R
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:45 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 97C2E5C0126;
 Mon, 31 Oct 2022 09:25:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 31 Oct 2022 09:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667222743; x=1667309143; bh=yk
 l2LcpkHywJ9akEGsnYSCR9u/kwpYHfkB26yc4f2Ic=; b=EzhVjiS1oIRtNueWft
 yWZLWVH5+pVu0B6cyyK4aTWlTeFH2nSwCyXOB8Drk7foCwHN48tU0H+CgpvY9f7E
 eQThgrJQ8Oebe0c34e+0S3OeD4fLnMmUuEDgEGl/zd3CMUXKtKBQG1AmZz4mGl5v
 YiKr8dv910xZU/N1yFU/Pg3Wxsbg1h176zcmU9Q1z8xcVZIkb94mf/er4nLj6DAi
 r31Gs3BJxQaiw3MZuBMZfkjUnhich1s9xTNI2uXpUW1BdqgVgNDNjXwol4klQPZ0
 q+Jj4LFl4YQt3Grhpt1ClHJ3XSIA2uYZZYFGZCf8gnpne9LO1az/hTroHuzcM+DZ
 ZCiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667222743; x=1667309143; bh=ykl2LcpkHywJ9
 akEGsnYSCR9u/kwpYHfkB26yc4f2Ic=; b=IH2CL7MUZA0zV3+yzKMIUQtdtIojc
 yNBaeaLyHpQZ4/RIVQTcuBlMWlAXt7JR0T2HhyxNhYCDfHjsK+h0o+Fh5v12aNpJ
 Y5rQzmbmw3CiRygfnHk6we9sB2VcAs3cgoO/YfBN44n/0Yh19Z37wV6gvU2RWfbm
 XhVUjpfYLCd4VC6njbKgG2LralNp7jDtR6c4AAB++jqub/ATLI1YaFVbfC1cI6Xa
 rLvE1wJbqp1iz6HMTXHV2uZtwwP4Hx3U7QtKCEsVGNSOs0Ha60UsY94tjcZGuv8d
 c73Tgoel0UMt/25b+QemW7FAh0v15RI9YyKSxZagOKC0QwWjL4SAvnHMQ==
X-ME-Sender: <xms:18xfY9P888mtp7TFf5tdRbRByryfNZ2u22-YOObZ6jJrJbiwFEC04Q>
 <xme:18xfY_9Tgob57FgSJLp4reS7Bm_foiY5DbHJjOjVwy0P2LYHmS9LHY2FSqHq-yBfN
 GriXV-H28xYLygvuzg>
X-ME-Received: <xmr:18xfY8Q1aeXQKffRDdK6Bq9sZvDRQBwNlBFFFP6LBECNO0KzsrjmlaS1kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepfeeludefheegvdeuvddvgeekgfdvtdettdelieeihfegtedugeek
 hfdvhfejfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:18xfY5torQEJUg0BvCLSTwM7inCIn5vU9oyQ1_el2d1CNrRNlJYL-w>
 <xmx:18xfY1eQ-JeXQdId3b3WNdeDgiljnoN_D9m9BZt3s3K48T-g5HpGsg>
 <xmx:18xfY107nglBX3oSYG60UGVpKEzQshuSdO-LYcTnZDS1JZa-dLemyA>
 <xmx:18xfY57PXcFXEB93ISU11oPp-w9opIFZIkDhGtJdQiI1CrWWliG5ZA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 09:25:42 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/3] target/mips: Disable DSP ASE for Octeon68XX
Date: Mon, 31 Oct 2022 13:25:31 +0000
Message-Id: <20221031132531.18122-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
References: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
Acked-by: Richard Henderson <richard.henderson@linaro.org>
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
2.34.1


