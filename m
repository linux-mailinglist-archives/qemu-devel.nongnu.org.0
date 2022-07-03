Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583EA56435E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:11:53 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nDL-0004ZC-V1
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBT-0001s5-2Z
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:55 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:56111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBP-0000wE-Vg
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656806991; x=1688342991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iFrMNgZb795PtkupPWdOdfi4pfpHCJ8j6NfcibHYPh4=;
 b=PxH+i20imehQjwAGnFKD1jP00wStjSUJyUNyX0oNXdKFOSpwUQncruRJ
 2MYeujXzmaxhql7/0eqLNXqKXs/+K6EjLUh+eGOnnn+43YeOf4Wubbekn
 OzvjGgSFwfiDhxxswduLrddsMWqRTH5cax5k0kBYNeXOjPrrbVgd7dapg
 43ODswAIDzX15xMGGL1SO1HzLs2+EtdzbfLxpX0JOKwdP5UM29jzldnQ0
 xEzXID0wSMc1xeEq3gtrzkfIyKt1MhU6DmpWfPwai8BASZOVmak6b5ehx
 fiMokPSyJBNXBTtIJCIqUVha24Fn0I+VMfx0p8OJbhsohMTUOEyJV13U9 w==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="308989614"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:09:50 +0800
IronPort-SDR: o7CxOGtjuveIrf1lzF9AixbPljRAMEIpKlcdok3xpcbMJI7aNaIAuGZMB3kWo64VbBif6cNhig
 7wIfvJym30l/9an8sYq8A9Z/0l7jtgerbu7hB5gVnYcDOev/ACedS32ye2qN+MZ0DQfWoYQ5aR
 daoZucLPUnFmzB7asA5lkSX0mkCGzVO+/0VtIjJ75U+38q/iXxglpRJMfIVhPD2fk29SohLOpr
 SCghsnZcNscqyOF+QZz2qv8e9mZ9u6a1LkIu1b3JFPAN5lTrAAl3alKxohjdQDBEgs8k6olRx8
 oZK78c7ECLmzyyfWyvIEjurw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:27:12 -0700
IronPort-SDR: 0W/0PQNTvugA8fEOIpHxcgvwRJxG4szJgM/Kn7g7kHEGe/YWU9mPcPS/Oq59rRoTr5Lij7LQE7
 rPazdijxLBWexVs5fNwqWBiBZd7nIVCRrOe6yOve5TxV1KaAIdFSiV4Ig18lVU9xz1aBsrCwdY
 tsPz3rt46fSn4VzpI6k9jsRmZCgME8ddicuNP21AAGGqLniFWzHXFFqb5iWUxmCd1YKyfG5Rjq
 zqRJvrRhyCHCOO0cyF1fi0YJB67qLOj5v3m1KAiKflChyeAupkHc8cSpLrLdTKfvXBYc/Z07tl
 8ug=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:09:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8St49Jdz1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:09:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656806989; x=1659398990; bh=iFrMNgZb795PtkupPW
 dOdfi4pfpHCJ8j6NfcibHYPh4=; b=j+TYVwn9MFmg8z0NZADXS0hgXXJp6X7IUM
 Cu8/o8HFiP4605k0VMyLpN19q7lNZqyHwcDiGMVzuqt+hobA8raFBkOvLJZU6JLX
 GLR+FziDSj+T8VuriT/CVAWpk63Xu47GgA4PbnfqzQfsCAbO2CH0h8xVPvi/6Umk
 vSTP/Prjt2Ahx9Jed2qFpApErB+A+SwV6b8iz7fhvElq0E4Z5dZ/6KfsCt9FHtd0
 xxRRTmtp3sDY8gg02zmU1rTrzKBj49CEUemutepK0dfAMASDO/W/fGS07GFkT0OL
 USyLutrXg+1ev+J3AJrKawg6D9eMRa4OHjeNV8i96DO9assbK3Fg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id csbFcRCuSYUV for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:09:49 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Sr3p8lz1Rwnm;
 Sat,  2 Jul 2022 17:09:48 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/19] target/riscv: Set env->bins in gen_exception_illegal
Date: Sun,  3 Jul 2022 10:09:21 +1000
Message-Id: <20220703000938.437765-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
References: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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


