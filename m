Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E1653927
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:57:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87my-00017P-KT; Wed, 21 Dec 2022 17:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mv-00010S-Sr
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:13 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mt-0000bf-0t
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662530; x=1703198530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vGws/My0D8GntyXliouHfD7qOmROlWfOigfQcR/d9kU=;
 b=cWRgrhM+CxdkSsYGGNhHaVEE2NMJ5OQzu+JtJeWiClEhAaNSvLIHfJTf
 fPabsCJy12ys3w6a48ViUtzahfDSivYDzfWmc7999Ycps14uFR/9ErGzX
 7NY0Xo62Z2YQZ5/I7jTk2a6YzQxYp/fhCZx4Wu9tgeKjO+47tr460Kvze
 f6ZQPDfO5xyivAG8G4/eZlcmDeaW1dM6pkrQ1DITMrclCnZi2ZRwsTCTP
 WE78Dw8pXoeeHFRzcGrQ40U8woGSWMk7+iNS3EQH01hwkskZKjNsNtgh/
 m59dbq338wamiixRwxaYLHQO4mVGcZoOf+vPFrZGevICRr7s7TPqQfMuR w==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561387"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:24 +0800
IronPort-SDR: pjRjW7x6Es2e3JjvmTcVomknIV6ZzTbhZo6E8pfd15e/iumYKmOXkJMLAoA/nn0YYQOTsYaVA7
 rXUAV9cqwPf/IGaIVXWyODcHT92Bi2xbHij/qbSK94dPMC2V2zGkDVwiYTG9FfFJgeDbMie6Cm
 awBnS6vCn/tYyHnn6BrSH8mXSQNtth+oiY++jgYz/Cz2gBiBnOxA8Ud8lTejlXaPrNr4srMCe4
 8/J3I1+ZLuBUjXbXq5ruUuiYerx+ozg5X/zYbXEeCLTzc4yG25OeEFgdzT6TnyVhhpVB03AzS/
 gBg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:53 -0800
IronPort-SDR: 0xOH7uWCRLhdIy5xmVLljjmx4kiN13/IkVzvnZrSmChnohM6EaTLxeZEtuqzngUaAuPMkYnyhF
 DjaoXyRHFXJ5g59hWdUAO3ySjhL3QdBfHNWZb5CHUa6CzeqY7PAYzJWcw+Wn7l+XfXEVAihBr6
 TvsevJFhicQ5YiCNUYY/rh+hpEUCekEJKlCW5q3Ym2V2R1rvMaEp461SjBk4vBUHHUTL0O98rR
 hyEk6x/+Ea8xMthpp81LY8Affj8q2jRu5j0RlAiz7lQZqMz5ZEeTOf7Oy/DqcvelzkzODI4/4s
 tJ8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMS2RNkz1Rwt8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671662483; x=1674254484; bh=vGws/My
 0D8GntyXliouHfD7qOmROlWfOigfQcR/d9kU=; b=YxrwVgXC0VQTIJcP475T1xz
 3WNl1dsotKZu5sB9kpKACIm95abhjdqXYCaFfniLPK4E+jJVLRjZcCYdJHhf8Uml
 C7QTBfS7iNhiWeXHmRuiyxZHFz0bmK2dmTiS/RbNvf84VMQq4SOe72CcVVy5ZwO1
 qkOq19oxPbUi3KWnImKt02oLvgP374LPDIRZOau5B9emR9wIW/vOBchfPxMQYgrl
 7s4Rx2NZC0IzcUslYZHR5dIEoCCS1s5V26eGGlqMxPHaw3BSkDs2CB5O7JVFkbaN
 v5tQP2YYv02FVo8SHpO2rDIqwdILCHU9yqmZb4At+iEmiUUvBVQ9POtNnYQJ8AQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ej8TFlE1sSe2 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:23 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMP2vCRz1RvLy;
 Wed, 21 Dec 2022 14:41:21 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 26/45] target/riscv: Set pc_succ_insn for !rvc illegal insn
Date: Thu, 22 Dec 2022 08:40:03 +1000
Message-Id: <20221221224022.425831-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
2.38.1


