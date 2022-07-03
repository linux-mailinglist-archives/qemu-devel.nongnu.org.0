Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06F564368
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:17:54 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nJB-0007dD-Kl
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEL-00081l-3Y
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:53 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEE-0001pZ-Kv
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807166; x=1688343166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iFrMNgZb795PtkupPWdOdfi4pfpHCJ8j6NfcibHYPh4=;
 b=hiXloEAtZwpSXZQ4shP9Pk/36JdTYA4WkNNThz69OW6z/9wgemsSESNw
 taYBv5ec8RRWs4SkS6W6e+bRo4FGRHERCxl7vVoKj2fQdHA4mvtfekMGs
 h/KrXQU2tmYbUDSbBdD5EKn/oKZAVQHyWVXyh2lFOmdopkWwzQEmCR9Q+
 fqksar8uQ6QpVToDoamk93C8tF5PqYnUpDOHYovVJVUGh3MxmC1+mptJt
 LFH3shd/z2D3rMKON5iHSSoMGIhzYamdHVKjNyargt5N6N5Vl7M3KCV/B
 +QLWlH+3r84UtMs77Zv0zlLnKf0dpHmnkdspSucN9yO5hInOW3bapDy4e A==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667215"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:44 +0800
IronPort-SDR: p8iB/Rt4sq1rGQ+DeYwpjP2O4lVibGwtcPrK3zGgtFZR6YpLbVZNcZb8ecyX5N6y7J6fObR1Lh
 gerS1n5FtFMtxuvBGQaxmfi1X201h6V5XuxTzCZaZoH7opUXzPObDmL0b1MgglLsDXXMZTzz8j
 Ba5YCO97IU64o1VQbVIoO5A2i+nzDsugSac/kr9B83UwaQ25R9T75vZsd56YTJBBbcH1oosJNI
 hpPQE57I8oVA+b5sflLqbuB6SJV8LBQFSzMmg0ffXES98M0Ul5rKBIaW0TLZFVXanZ1c2ZvTAH
 x76GedHeWnb53aj1mAWJChrN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:06 -0700
IronPort-SDR: uK/qH1EDRPnJ9jqcs0KdpQhAZ5mqX6NkupXZUmWvZARsU1dVLKpRH/pytYatRS8CEsLE9De6S0
 EHkhetleCcqf/4WOgbEOoFO4K4TtsGdr9/Lf2dcTbHpzfh6mSQepa6oN8h6ix9SPmvb9vKq2hw
 DIcFb4745LXfhdVzjE7ZMj8Loa4IE71CR+U7k3h9puXSHuvccKpWHpkF4Yu3lsy0oQf8P4Btqm
 lPEWbW79vzgTb8ZRKyWWMPg+5MFimKZemAuBUCdz3pgG6QlwIjn9/JxMDgyuAq4IRodkrCxQlU
 7jg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XD2LLcz1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807163; x=1659399164; bh=iFrMNgZb795PtkupPW
 dOdfi4pfpHCJ8j6NfcibHYPh4=; b=SxXixKRXfoibeN/S1VmI2Q7tEh/bZrQiLA
 d90EpKB7Xv1D+cXpTbb57wBHHfRSi2dv8Wdg+nk6FsJsLzElZPDOhximYGxhzSlA
 19HRMhm8aZGVBHkAe4/TT2UNvkZqB3exO58lYyjl6BqWw6JwCTY9N4+JgcmWZ10/
 I5EvPfP/XtxLnf30fQLAM97F5MKcsx1Fp5j1s1mEzuABCh6yFaYm/PVSGu8F//gc
 Nowq1z+LtHX+dd9oKKztlXr+mGMGNal783ZP4xkICVioIAiEmG2bbLStaqotC7gJ
 X60eXkGVp+laQFCVXtxs0hYQMZ5E8gdxt2YBsGxX9x5fLH5HJ74g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Z6KGGKlI_3Ew for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:43 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XB2zbRz1Rwnm;
 Sat,  2 Jul 2022 17:12:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 02/19] target/riscv: Set env->bins in gen_exception_illegal
Date: Sun,  3 Jul 2022 10:12:17 +1000
Message-Id: <20220703001234.439716-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

While we set env->bins when unwinding for ILLEGAL_INST,
from e.g. csrrw, we weren't setting it for immediately
illegal instructions.

Add a testcase for mtval via both exception paths.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1060
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220604231004.49990-2-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                  |  2 +
 tests/tcg/riscv64/Makefile.softmmu-target | 21 +++++++++
 tests/tcg/riscv64/issue1060.S             | 53 +++++++++++++++++++++++
 tests/tcg/riscv64/semihost.ld             | 21 +++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
 create mode 100644 tests/tcg/riscv64/issue1060.S
 create mode 100644 tests/tcg/riscv64/semihost.ld

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b151c20674..a10f3f939c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -240,6 +240,8 @@ static void generate_exception_mtval(DisasContext *ct=
x, int excp)
=20
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                   offsetof(CPURISCVState, bins));
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv6=
4/Makefile.softmmu-target
new file mode 100644
index 0000000000..e22cdb34c5
--- /dev/null
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -0,0 +1,21 @@
+#
+# RISC-V system tests
+#
+
+TEST_SRC =3D $(SRC_PATH)/tests/tcg/riscv64
+VPATH +=3D $(TEST_SRC)
+
+LINK_SCRIPT =3D $(TEST_SRC)/semihost.ld
+LDFLAGS =3D -T $(LINK_SCRIPT)
+CFLAGS +=3D -g -Og
+
+%.o: %.S
+	$(CC) $(CFLAGS) $< -c -o $@
+%: %.o $(LINK_SCRIPT)
+	$(LD) $(LDFLAGS) $< -o $@
+
+QEMU_OPTS +=3D -M virt -display none -semihosting -device loader,file=3D
+
+EXTRA_RUNS +=3D run-issue1060
+run-issue1060: issue1060
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
diff --git a/tests/tcg/riscv64/issue1060.S b/tests/tcg/riscv64/issue1060.=
S
new file mode 100644
index 0000000000..17b7fe1be2
--- /dev/null
+++ b/tests/tcg/riscv64/issue1060.S
@@ -0,0 +1,53 @@
+	.option	norvc
+
+	.text
+	.global _start
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	# These are all illegal instructions
+	csrw	time, x0
+	.insn	i CUSTOM_0, 0, x0, x0, 0x321
+	csrw	time, x0
+	.insn	i CUSTOM_0, 0, x0, x0, 0x123
+	csrw	cycle, x0
+
+	# Success!
+	li	a0, 0
+	j	_exit
+
+trap:
+	# When an instruction traps, compare it to the insn in memory.
+	csrr	t0, mepc
+	csrr	t1, mtval
+	lwu	t2, 0(t0)
+	bne	t1, t2, fail
+
+	# Skip the insn and continue.
+	addi	t0, t0, 4
+	csrw	mepc, t0
+	mret
+
+fail:
+	li	a0, 1
+
+# Exit code in a0
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	# ADP_Stopped_ApplicationExit
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	# TARGET_SYS_EXIT_EXTENDED
+
+	# Semihosting call sequence
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
diff --git a/tests/tcg/riscv64/semihost.ld b/tests/tcg/riscv64/semihost.l=
d
new file mode 100644
index 0000000000..a59cc56b28
--- /dev/null
+++ b/tests/tcg/riscv64/semihost.ld
@@ -0,0 +1,21 @@
+ENTRY(_start)
+
+SECTIONS
+{
+    /* virt machine, RAM starts at 2gb */
+    . =3D 0x80000000;
+    .text : {
+        *(.text)
+    }
+    .rodata : {
+        *(.rodata)
+    }
+    /* align r/w section to next 2mb */
+    . =3D ALIGN(1 << 21);
+    .data : {
+        *(.data)
+    }
+    .bss : {
+        *(.bss)
+    }
+}
--=20
2.36.1


