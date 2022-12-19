Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57565066B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:29:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75k1-0001cl-SZ; Sun, 18 Dec 2022 21:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jt-0001Yw-Hm
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:54 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jr-00015O-PP
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416327; x=1702952327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jzu4w1v0TJpnBmXkZe8wqb1VN0yzrvZdJQ4Z2Lx9Dzs=;
 b=Z9LhlBR+YKhobnQzErt8/iaFtaVw5Qyog3BbO/JuSWNUd7EOIlWsdMq6
 McMMRpW40Hh4djTXjuz2B159YPKPjWahuSGBXN5OJ1KtmWL/rYTG+sCxf
 ADfP1v0duHV/Pmp8uzbm6B/ImPuE6c7xGawB4LvlY3ioHU9isCsdt/2Fo
 VJSpIjofB69ElMDhRipLgkLJQmcERLMKO1t3SbaxhAd/dbS4khm1c1f/L
 ffn9K1GrZkyE9e2aB3oLUPhMw4EDmPRMrnma0q9yKJ0yq7mysv6z61ZXy
 8rmDkWdkwWCvQ3gmUG+34+wg5wmuAVqcdZXHkByiz8eEEwkf+CuEe8Njj g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199386"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:15 +0800
IronPort-SDR: kRAwKT/4j+lJYrzgWhbN6jCRW+P925NxAEhcMjK+L/Y1n/8CVF8NKbKajHzNkjh7n0RtkXl2Xs
 I4v4OlviFVgaGMjdwsvbNMdQB6cYQnyN2mGmF2RWUXzNnD7BLZC358Tgk20dXeStNh3hoE7QOz
 cFLmoHhHFe35Ils1BFd3QjCEsfKxZYHF+Eas8YWj99L51K06v+cnXPSiowP7lyomXNIk1wBV1H
 HKIOPIBU3G1sx3Nv1QDUz74w5//g5SfPV4CHCrLiR9Wv23SezyadcaBPFIB+V02w+I47crx2Yy
 r1g=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:47 -0800
IronPort-SDR: j++HBdJz6mdCOC+GuJ2cUL4OsbvJGIWMFdoWrgrPUruT4ZoMcmgI4rxf7IHjSMFXSB+yGWM5ua
 QT0GVBnN4iqRjViGIgegLL9hUJ3uOzdqkk4qxSxmsb5/Q5ffkmypfDVyhw5nQXaZCX32Zl0xqe
 oz69V1yFd3wPCYcZkdopMiV86NcpJren8slW3J9EFhKUmE6KTOdj5jKRdpnp3/QCm2vWLs6QBS
 oMsX1H0L7ibFNXD7LJHWcdTcEwc9DKRRAP+Tmkj9GcIeS53W/e1l6iLns5wPBhZv9AditV1oOs
 mxk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3K271hvz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671416294; x=1674008295; bh=Jzu4w1v
 0TJpnBmXkZe8wqb1VN0yzrvZdJQ4Z2Lx9Dzs=; b=K4mvxcppjCK9Yl0hs/emQ5C
 qZo3AZAd4h7CtafXVRroqhKHLcHG+Cgqt6X47SsALGhKyl8TMEH++XaWLPH3BbyC
 rsJ3AY5rr15B+PSdpeW+JR/FZD0ipx/PTzHqIwAe77KByLkSMlmKsLPsKEDWkQTj
 6vciSLRVI+ofpRIObah8Ec6M20My4lLTWoS/yJUuAbPAkOBFuBr1YvfPa6mEDU+p
 +zZfyWS75K9QYUlME5wj4dswWJp7rpBxYH4WEy3Cq9QLlbhGygPFBMK0Q+voaeCG
 rp9zmJ6ts98YNKVxrYY6ZLIlw0vwLg1PspBXi7y5G65cxeJsxiQeBbmRL1E4TBw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id L8KYwHybRHj6 for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:14 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3K036bgz1RvTp;
 Sun, 18 Dec 2022 18:18:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 26/45] target/riscv: Set pc_succ_insn for !rvc illegal insn
Date: Mon, 19 Dec 2022 12:16:44 +1000
Message-Id: <20221219021703.20473-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Failure to set pc_succ_insn may result in a TB covering zero bytes,
which triggers an assert within the code generator.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1224
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Message-Id: <20221203175744.151365-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c          | 12 ++++--------
 tests/tcg/Makefile.target         |  2 ++
 tests/tcg/riscv64/Makefile.target |  5 +++++
 tests/tcg/riscv64/test-noc.S      | 32 +++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 8 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-noc.S

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index cd5eb25ee8..160aefc3df 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1096,14 +1096,10 @@ static void decode_opc(CPURISCVState *env, DisasC=
ontext *ctx, uint16_t opcode)
     ctx->virt_inst_excp =3D false;
     /* Check for compressed insn */
     if (insn_len(opcode) =3D=3D 2) {
-        if (!has_ext(ctx, RVC)) {
-            gen_exception_illegal(ctx);
-        } else {
-            ctx->opcode =3D opcode;
-            ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
-            if (decode_insn16(ctx, opcode)) {
-                return;
-            }
+        ctx->opcode =3D opcode;
+        ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
+        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
+            return;
         }
     } else {
         uint32_t opcode32 =3D opcode;
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 75257f2b29..14bc013181 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -117,6 +117,8 @@ endif
=20
 %: %.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+%: %.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 else
 # For softmmu targets we include a different Makefile fragement as the
 # build options for bare programs are usually pretty different. They
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefi=
le.target
index b5b89dfb0e..9973ba3b5f 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -4,3 +4,8 @@
 VPATH +=3D $(SRC_PATH)/tests/tcg/riscv64
 TESTS +=3D test-div
 TESTS +=3D noexec
+
+# Disable compressed instructions for test-noc
+TESTS +=3D test-noc
+test-noc: LDFLAGS =3D -nostdlib -static
+run-test-noc: QEMU_OPTS +=3D -cpu rv64,c=3Dfalse
diff --git a/tests/tcg/riscv64/test-noc.S b/tests/tcg/riscv64/test-noc.S
new file mode 100644
index 0000000000..e29d60c8b3
--- /dev/null
+++ b/tests/tcg/riscv64/test-noc.S
@@ -0,0 +1,32 @@
+#include <asm/unistd.h>
+
+	.text
+	.globl _start
+_start:
+	.option	norvc
+	li	a0, 4		/* SIGILL */
+	la	a1, sa
+	li	a2, 0
+	li	a3, 8
+	li	a7, __NR_rt_sigaction
+	scall
+
+	.option	rvc
+	li	a0, 1
+	j	exit
+	.option	norvc
+
+pass:
+	li	a0, 0
+exit:
+	li	a7, __NR_exit
+	scall
+
+	.data
+	/* struct kernel_sigaction sa =3D { .sa_handler =3D pass }; */
+	.type	sa, @object
+	.size	sa, 32
+sa:
+	.dword	pass
+	.zero	24
+
--=20
2.38.1


