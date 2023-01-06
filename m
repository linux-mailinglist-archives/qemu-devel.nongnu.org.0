Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7765FA44
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCn-00029O-EE; Thu, 05 Jan 2023 22:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCf-00020z-L2
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:33 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCd-00088M-3F
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974930; x=1704510930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=85+AtErtWwRyDKEVazxX5h/fNNBLJCH5zQ12Yf0zS+U=;
 b=YEKyvweBg+ONAjNyraU2sFhdMqbcET0VjA/4zPCVQPZB09kxxzolxlOE
 0B/eFLpOP1nLK0Kz0CP2L8LDpCP9jimH7GIUMzlK5rPPeVyAndVUD7xof
 CobhHMeh/lq998+561ZEGbynETUAsGDPEtM0oR3LeU1H7BO2cUuDhWv6h
 CXp7BRwsJsnMfedVN5yDP4ARRt6TuPmE9EpBRSPtmbdSfmoqulTF2OAbD
 oaLyOIq3YLV63EE8tdMdHRpSDF400+AM2C3eg+itT0B5ZdYNWyH/zC7W2
 6zT1eE68519B9e41TNTVJM8VtQ2lDLdlGAyt0/K5BFg15Bxehf16fNaDE A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254806"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:47 +0800
IronPort-SDR: wWDu8gq0fiENKvfB6ynjr32M1m2uL780yjntOqR4arLoBke/9e8OehgmraiFDzcJ167iQUxYZL
 EKCqDM+oErkJ2ahSkvG81LhxGISr+Thg0EEBjyTI9HuuDsQ2esCFCH4cgbn+qAY3Fe2b8StifL
 jKCs/aapHiWLf7i+WO24z5JPjDRMEdJ8xdTOdvOlvTRlCzi+3vYx4iu7TKAjtOtT8OSZP5QxQa
 zMNPoBtpUrKNifV0dWe6OAjuiO/KzEENyl4OWmQ/vPTOFxduyE4RLnvXZ329N0OPuSBOjFo9bM
 JTg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:58 -0800
IronPort-SDR: EVF2wEiui0PNUhuEcTjpjI64YK7Z4/P2INnoZ4C4LYJh2KgblD2GH78nlbYKsGmmDc2o762QYZ
 v7elT5DGhf5ZIlvDPfbhwvWQ2wv6oLR7BoOLferZeFxrx0rDyWwDbpYYc8v0eXeS/XpXqQX1Ll
 rbQpNT8E8xp6CxCh0uqw+tVSUgXdpOaTqOoCL2CFGhEnunJ0cYgGlt/FpFEu7+WAMnFFQebNI4
 x2z/0MnkVc3n8b7ghCMFRZ0506BkrOjyb9TTqu2vfofA9QFmAr8hCJ6wTDVCQ30pqO6AbGjLN0
 +fs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jz1wDlz1Rwtl
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1672974886; x=1675566887; bh=85+AtEr
 tWwRyDKEVazxX5h/fNNBLJCH5zQ12Yf0zS+U=; b=jMFI1lFtdfno+unwAC5+1Ug
 WGjpEWVGUuL8AkxsPmF68Q0ltfVKnIW8H4v0vRt9SAx451ldnpCqPHOxRIH1qJM1
 Um53U7RwlGm3hx1EhrMu6uGh4b8qEViPmDGkIda9RZP5hmEAMNVfpGpJibQn+v8H
 V1kWkbfDBorFKzxqsGaXtogTS7p+bJ9rUB+USbSw/dUqUF5goSEUlaKrOniwCGFD
 Ax8NY3VfJ2uS5YTFVCHdJ6CvXjPLLwjI7e3CWBfFEKDtpiWdJpKgqd6aJDa5G+IS
 c5mD8+3uU4mT6fJg21ApNeAumK5FjPLHBYelHFEhGM/GETwm8PN3PROkcxAc49Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Bm2tJw6_JRvd for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:46 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jw4kKwz1RvTp;
 Thu,  5 Jan 2023 19:14:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 24/43] target/riscv: Set pc_succ_insn for !rvc illegal insn
Date: Fri,  6 Jan 2023 13:13:38 +1000
Message-Id: <20230106031357.777790-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
[ Changes by AF:
 - Add missing run-plugin-test-noc-% line
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c          | 12 ++++--------
 tests/tcg/Makefile.target         |  2 ++
 tests/tcg/riscv64/Makefile.target |  6 ++++++
 tests/tcg/riscv64/test-noc.S      | 32 +++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 8 deletions(-)
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
index b5b89dfb0e..cc3ed65ffd 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -4,3 +4,9 @@
 VPATH +=3D $(SRC_PATH)/tests/tcg/riscv64
 TESTS +=3D test-div
 TESTS +=3D noexec
+
+# Disable compressed instructions for test-noc
+TESTS +=3D test-noc
+test-noc: LDFLAGS =3D -nostdlib -static
+run-test-noc: QEMU_OPTS +=3D -cpu rv64,c=3Dfalse
+run-plugin-test-noc-%: QEMU_OPTS +=3D -cpu rv64,c=3Dfalse
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
2.39.0


