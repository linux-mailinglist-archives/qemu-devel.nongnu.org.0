Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2BD10B556
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 19:12:48 +0100 (CET)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia1nz-00017B-9Q
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 13:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ia1Vt-0002IP-48
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:54:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ia1Vm-0006l1-SQ
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:54:02 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42348)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ia1Vk-0006hh-NO
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:53:58 -0500
Received: by mail-wr1-x441.google.com with SMTP id a15so27741705wrf.9
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 09:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxR7Iv3DhIKJfqsz1SqVshE1qjoP0eyBpKH96Ci3yJQ=;
 b=oUZs70FMFhP6HkA+3yx4KvW5ohSC+bbUyCc75TZxR4488rfzspjvnFH7nz29+EqZFi
 xud53yCaRnPmttvkHLsjVhD53RmQVQtqZyjAkCodtQFs29tg502rOm6aciPcl2w7TR6P
 2kR0z0j8S1LvczOlEgx5z4hTK54Gn4PKtuNl2VpiRiFx8Yujf1Yn8F+7Nbzeg2EbmfOv
 kU+QHTG04k/n3lvSZ5xTFm7Nw6wWCoiNdLQ5pvb9IBdcNZHAGaTX9M9qEyHEV2WNs4gn
 WufmModUMB839Nbj6pC5+1ZzXCsYkbZCRUUAwv1T7gqQUvdIEutcAk04FW7sPmjgkZ5v
 Dwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxR7Iv3DhIKJfqsz1SqVshE1qjoP0eyBpKH96Ci3yJQ=;
 b=LLK9pTqzyYyVLUE4tzNG66TjFuRRazSmFvZSkQnilJ++tJLAe9rSkvhT5NbDGfl1fV
 kSk1GRCp+Z/I1O7VhxgVZ4jBH7gUBlA/KGpQh0M0N4xTnK8IbLI0bJfRk0CJ7GxdT0nW
 DEXZKDHoLzVyFdDHcbhV8lFVcfcpv8OIJW/SUvfA7E7ncmO/MGUeAOtgpyUOwZfTWfUI
 hCZsFtPZkchu4Hh27+y78bID8cOgG0PoW6rVRLlHkrGTGLCAHZNKlFmfGWmoZQEvX2rP
 iSQefE9wHWKsodM03knpfyob/c7Gz03DQIyuVUWiiGZVIjlocrnJhJ2NFfbal997IuPq
 4MUw==
X-Gm-Message-State: APjAAAVMbYl8oqzxxJFUQzG34ojukySluJdvcbncrvKbKTgEFDfAGlnI
 u5W3L4mJBKmb5zYM1GUS1YL+WBjmFIMfNmfy
X-Google-Smtp-Source: APXvYqxrQRCsOcI1it2xKflYEjv7tdFUAM3BlN1TU7eFf2ole7Ed1SEdGrPe0CPc6DG9HxuulEm48w==
X-Received: by 2002:adf:e78d:: with SMTP id n13mr40717801wrm.59.1574877231659; 
 Wed, 27 Nov 2019 09:53:51 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-178-2-87.red.bezeqint.net. [79.178.2.87])
 by smtp.gmail.com with ESMTPSA id b2sm20238295wrr.76.2019.11.27.09.53.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Nov 2019 09:53:50 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v37 10/17] target/avr: Add instruction disassembly function
Date: Wed, 27 Nov 2019 19:52:50 +0200
Message-Id: <20191127175257.23480-11-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191127175257.23480-1-mrolnik@gmail.com>
References: <20191127175257.23480-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org, dovgaluk@ispras.ru,
 imammedo@redhat.com, philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide function disassembles executed instruction when `-d in_asm` is
provided

Example:
`./avr-softmmu/qemu-system-avr -bios free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf -d in_asm` will produce something like the following

```
    ...
    IN:
    0x0000014a:  CALL      0x3808

    IN: main
    0x00003808:  CALL      0x4b4

    IN: vParTestInitialise
    0x000004b4:  LDI       r24, 255
    0x000004b6:  STS       r24, 0
    0x000004b8:  MULS      r16, r20
    0x000004ba:  OUT       $1, r24
    0x000004bc:  LDS       r24, 0
    0x000004be:  MULS      r16, r20
    0x000004c0:  OUT       $2, r24
    0x000004c2:  RET
    ...
```

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/avr/cpu.h       |   1 +
 target/avr/cpu.c       |   2 +-
 target/avr/disas.c     | 228 +++++++++++++++++++++++++++++++++++++++++
 target/avr/translate.c |  11 ++
 4 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 target/avr/disas.c

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 9ea5260165..a3e615a1eb 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -157,6 +157,7 @@ bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int avr_print_insn(bfd_vma addr, disassemble_info *info);
 
 static inline int avr_feature(CPUAVRState *env, int feature)
 {
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index dae56d7845..52ec21dd16 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -83,7 +83,7 @@ static void avr_cpu_reset(CPUState *cs)
 static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_arch_avr;
-    info->print_insn = NULL;
+    info->print_insn = avr_print_insn;
 }
 
 static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/avr/disas.c b/target/avr/disas.c
new file mode 100644
index 0000000000..a51ade7c2a
--- /dev/null
+++ b/target/avr/disas.c
@@ -0,0 +1,228 @@
+/*
+ * AVR disassembler
+ *
+ * Copyright (c) 2018 Richard Henderson <rth@twiddle.net>
+ * Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "disas/dis-asm.h"
+#include "qemu/bitops.h"
+#include "cpu.h"
+
+typedef struct {
+    disassemble_info *info;
+    uint16_t next_word;
+    bool next_word_used;
+} DisasContext;
+
+static int to_regs_16_31_by_one(DisasContext *ctx, int indx)
+{
+    return 16 + (indx % 16);
+}
+
+static int to_regs_16_23_by_one(DisasContext *ctx, int indx)
+{
+    return 16 + (indx % 8);
+}
+static int to_regs_24_30_by_two(DisasContext *ctx, int indx)
+{
+    return 24 + (indx % 4) * 2;
+}
+static int to_regs_00_30_by_two(DisasContext *ctx, int indx)
+{
+    return (indx % 16) * 2;
+}
+
+static uint16_t next_word(DisasContext *ctx)
+{
+    ctx->next_word_used = true;
+    return ctx->next_word;
+}
+
+static int append_16(DisasContext *ctx, int x)
+{
+    return x << 16 | next_word(ctx);
+}
+
+
+/* Include the auto-generated decoder.  */
+static bool decode_insn(DisasContext *ctx, uint16_t insn);
+#include "decode_insn.inc.c"
+
+#define output(mnemonic, format, ...) \
+    (pctx->info->fprintf_func(pctx->info->stream, "%-9s " format, \
+                        mnemonic, ##__VA_ARGS__))
+
+int avr_print_insn(bfd_vma addr, disassemble_info *info)
+{
+    DisasContext ctx;
+    DisasContext *pctx = &ctx;
+    bfd_byte buffer[4];
+    uint16_t insn;
+    int status;
+
+    ctx.info = info;
+
+    status = info->read_memory_func(addr, buffer, 4, info);
+    if (status != 0) {
+        info->memory_error_func(status, addr, info);
+        return -1;
+    }
+    insn = bfd_getl16(buffer);
+    ctx.next_word = bfd_getl16(buffer + 2);
+    ctx.next_word_used = false;
+
+    if (!decode_insn(&ctx, insn)) {
+        output(".db", "0x%02x, 0x%02x", buffer[0], buffer[1]);
+    }
+
+    return ctx.next_word_used ? 4 : 2;
+}
+
+
+#define INSN(opcode, format, ...)                                       \
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        \
+{                                                                       \
+    output(#opcode, format, ##__VA_ARGS__);                             \
+    return true;                                                        \
+}
+
+#define INSN_MNEMONIC(opcode, mnemonic, format, ...)                    \
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        \
+{                                                                       \
+    output(mnemonic, format, ##__VA_ARGS__);                            \
+    return true;                                                        \
+}
+
+/*
+ *   C       Z       N       V       S       H       T       I
+ *   0       1       2       3       4       5       6       7
+ */
+static const char *brbc[] = {
+    "BRCC", "BRNE", "BRPL", "BRVC", "BRGE", "BRHC", "BRTC", "BRID"
+};
+
+static const char *brbs[] = {
+    "BRCS", "BREQ", "BRMI", "BRVS", "BRLT", "BRHS", "BRTS", "BRIE"
+};
+
+static const char *bset[] = {
+    "SEC",  "SEZ",  "SEN",  "SEZ",  "SES",  "SEH",  "SET",  "SEI"
+};
+
+static const char *bclr[] = {
+    "CLC",  "CLZ",  "CLN",  "CLZ",  "CLS",  "CLH",  "CLT",  "CLI"
+};
+
+INSN(ADC,    "r%d, r%d", a->rd, a->rr)
+INSN(ADD,    "r%d, r%d", a->rd, a->rr)
+INSN(ADIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
+INSN(AND,    "r%d, r%d", a->rd, a->rr)
+INSN(ANDI,   "r%d, %d", a->rd, a->imm)
+INSN(ASR,    "r%d", a->rd)
+INSN_MNEMONIC(BCLR,  bclr[a->bit], "")
+INSN(BLD,    "r%d, %d", a->rd, a->bit)
+INSN_MNEMONIC(BRBC,  brbc[a->bit], ".%+d", a->imm * 2)
+INSN_MNEMONIC(BRBS,  brbs[a->bit], ".%+d", a->imm * 2)
+INSN(BREAK,  "")
+INSN_MNEMONIC(BSET,  bset[a->bit], "")
+INSN(BST,    "r%d, %d", a->rd, a->bit)
+INSN(CALL,   "0x%x", a->imm * 2)
+INSN(CBI,    "%d, %d", a->reg, a->bit)
+INSN(COM,    "r%d", a->rd)
+INSN(CP,     "r%d, r%d", a->rd, a->rr)
+INSN(CPC,    "r%d, r%d", a->rd, a->rr)
+INSN(CPI,    "r%d, %d", a->rd, a->imm)
+INSN(CPSE,   "r%d, r%d", a->rd, a->rr)
+INSN(DEC,    "r%d", a->rd)
+INSN(DES,    "%d", a->imm)
+INSN(EICALL, "")
+INSN(EIJMP,  "")
+INSN(ELPM1,  "")
+INSN(ELPM2,  "r%d, Z", a->rd)
+INSN(ELPMX,  "r%d, Z+", a->rd)
+INSN(EOR,    "r%d, r%d", a->rd, a->rr)
+INSN(FMUL,   "r%d, r%d", a->rd, a->rr)
+INSN(FMULS,  "r%d, r%d", a->rd, a->rr)
+INSN(FMULSU, "r%d, r%d", a->rd, a->rr)
+INSN(ICALL,  "")
+INSN(IJMP,   "")
+INSN(IN,     "r%d, $%d", a->rd, a->imm)
+INSN(INC,    "r%d", a->rd)
+INSN(JMP,    "0x%x", a->imm * 2)
+INSN(LAC,    "Z, r%d", a->rd)
+INSN(LAS,    "Z, r%d", a->rd)
+INSN(LAT,    "Z, r%d", a->rd)
+INSN(LDDY,   "r%d, Y+%d", a->rd, a->imm)
+INSN(LDDZ,   "r%d, Z+%d", a->rd, a->imm)
+INSN(LDI,    "r%d, %d", a->rd, a->imm)
+INSN(LDS,    "r%d, %d", a->rd, a->imm)
+INSN(LDX1,   "r%d, X", a->rd)
+INSN(LDX2,   "r%d, X+", a->rd)
+INSN(LDX3,   "r%d, -X", a->rd)
+INSN(LDY2,   "r%d, Y+", a->rd)
+INSN(LDY3,   "r%d, -Y", a->rd)
+INSN(LDZ2,   "r%d, Z+", a->rd)
+INSN(LDZ3,   "r%d, -Z", a->rd)
+INSN(LPM1,   "")
+INSN(LPM2,   "r%d, Z", a->rd)
+INSN(LPMX,   "r%d, Z+", a->rd)
+INSN(LSR,    "r%d", a->rd)
+INSN(MOV,    "r%d, r%d", a->rd, a->rr)
+INSN(MOVW,   "r%d:r%d, r%d,r:r%d", a->rd + 1, a->rd, a->rr + 1, a->rr)
+INSN(MUL,    "r%d, r%d", a->rd, a->rr)
+INSN(MULS,   "r%d, r%d", a->rd, a->rr)
+INSN(MULSU,  "r%d, r%d", a->rd, a->rr)
+INSN(NEG,    "r%d", a->rd)
+INSN(NOP,    "")
+INSN(OR,     "r%d, r%d", a->rd, a->rr)
+INSN(ORI,    "r%d, %d", a->rd, a->imm)
+INSN(OUT,    "$%d, r%d", a->imm, a->rd)
+INSN(POP,    "r%d", a->rd)
+INSN(PUSH,   "r%d", a->rd)
+INSN(RCALL,  ".%+d", a->imm * 2)
+INSN(RET,    "")
+INSN(RETI,   "")
+INSN(RJMP,   ".%+d", a->imm * 2)
+INSN(ROR,    "r%d", a->rd)
+INSN(SBC,    "r%d, r%d", a->rd, a->rr)
+INSN(SBCI,   "r%d, %d", a->rd, a->imm)
+INSN(SBI,    "$%d, %d", a->reg, a->bit)
+INSN(SBIC,   "$%d, %d", a->reg, a->bit)
+INSN(SBIS,   "$%d, %d", a->reg, a->bit)
+INSN(SBIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
+INSN(SBRC,   "r%d, %d", a->rr, a->bit)
+INSN(SBRS,   "r%d, %d", a->rr, a->bit)
+INSN(SLEEP,  "")
+INSN(SPM,    "")
+INSN(SPMX,   "Z+")
+INSN(STDY,   "r%d, Y+%d", a->rd, a->imm)
+INSN(STDZ,   "r%d, Z+%d", a->rd, a->imm)
+INSN(STS,    "r%d, %d", a->rd, a->imm)
+INSN(STX1,   "r%d, X", a->rr)
+INSN(STX2,   "r%d, X+", a->rr)
+INSN(STX3,   "r%d, -X", a->rr)
+INSN(STY2,   "r%d, Y+", a->rd)
+INSN(STY3,   "r%d, -Y", a->rd)
+INSN(STZ2,   "r%d, Z+", a->rd)
+INSN(STZ3,   "r%d, -Z", a->rd)
+INSN(SUB,    "r%d, r%d", a->rd, a->rr)
+INSN(SUBI,   "r%d, %d", a->rd, a->imm)
+INSN(SWAP,   "r%d", a->rd)
+INSN(WDR,    "")
+INSN(XCH,    "Z, r%d", a->rd)
+
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 941db8e168..e562e68d88 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -3032,6 +3032,17 @@ done_generating:
 
     tb->size = (ctx.npc - pc_start) * 2;
     tb->icount = num_insns;
+
+#ifdef DEBUG_DISAS
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
+        && qemu_log_in_addr_range(tb->pc)) {
+        qemu_log_lock();
+        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
+        log_target_disas(cs, tb->pc, tb->size);
+        qemu_log("\n");
+        qemu_log_unlock();
+    }
+#endif
 }
 
 void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
-- 
2.17.2 (Apple Git-113)


