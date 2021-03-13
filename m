Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1BC33A0ED
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:13:03 +0100 (CET)
Received: from localhost ([::1]:43254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAdC-0001wO-Ex
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHj-0000eI-L0
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:55 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHh-0007nN-4Q
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b9so3618562wrt.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kGm2EJoc1XC488goSqqMRTpp1YQ8IuoqGvu+9pBStWE=;
 b=IJhORYTQxjz7HlVh5D/FjYbu69ZBakG74QBlp2N9C2tizdoPHJQDAPgIlx4DjyDfNK
 SeLMA4aM7+vOY+SX6CmSYsw4UWgjHjU5W2Uur6YLfbh9Mu/4F+IhqjUuUJQGURZ+AaYI
 MkCx4rQZpx2hiMZ3ukGZ9TPvBF53leVxdQiW2todHY02dUH6cziwuGmKECcfSe+nnnLP
 c77K27ocFTUjVEjOnwHvNgcX1Fu/6nM4Awsnuaz9tXxQyd+kYEKBLsil66WcBijA6Are
 lroxTzKR8yVLuL+bb9YZusihOP8Ygi/5hhr+Poc7qeriWGYXH4F06rhmcwC3qjh/IFGP
 J0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kGm2EJoc1XC488goSqqMRTpp1YQ8IuoqGvu+9pBStWE=;
 b=bYD+HGhYJt14NyO75zjpHpJn2swe2oNFDY4Z7X+QhpKpocSYmxtQmmXVjzqiIftYqi
 jva33LfI1Lp6BPYywXXIK1GgabiidOUIZF7LkyFZjalRHNHcblGsHM3qDM82o/AjdWpG
 GDKNCYPqozq6vKG8BMfxLKtJGE5/rEdFaDMdfHP+8Fe5LWdAL6+gtDY4gf7FIPlR3u0F
 +TPOVw11tLbqOKS3JpbAPNSqFiM6mowHYeraktv56GZC30a7SAuv+T/1M1B2xvkYIxfC
 MKW1FBAbXyMXbILVqSseffNR4L8+BjtuOvxYCcDiQrA86a75AOFcS6XUeCe7LCLnbzXW
 CUxw==
X-Gm-Message-State: AOAM532gKGTHXO5IUQjmNDJSBRliXanixlJrd6COv3i7q5IuTK1soCOv
 jkUm/Gs8w1WQ1+a78TaqsPgHzXlfHSfe4w==
X-Google-Smtp-Source: ABdhPJxXjCSgavxjX1y/QGrYRrF+NatIoydh14mv00ZMoOFaYA0q/8TJEFY+nTuk/5PW8j+CJTMwjw==
X-Received: by 2002:a05:6000:221:: with SMTP id
 l1mr19934338wrz.370.1615665047330; 
 Sat, 13 Mar 2021 11:50:47 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w131sm7272644wmb.8.2021.03.13.11.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:50:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] target/mips/tx79: Salvage instructions description
 comment
Date: Sat, 13 Mar 2021 20:48:29 +0100
Message-Id: <20210313194829.2193621-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This comment describing the tx79 opcodes is helpful. As we
will implement these instructions in tx79_translate.c, move
the comment there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-15-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c      | 160 -----------------------------
 target/mips/tx79_translate.c | 188 +++++++++++++++++++++++++++++++++++
 2 files changed, 188 insertions(+), 160 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9334cd6df2e..c518bf3963b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1130,166 +1130,6 @@ enum {
 };
 
 /*
- *     Overview of the TX79-specific instruction set
- *     =============================================
- *
- * The R5900 and the C790 have 128-bit wide GPRs, where the upper 64 bits
- * are only used by the specific quadword (128-bit) LQ/SQ load/store
- * instructions and certain multimedia instructions (MMIs). These MMIs
- * configure the 128-bit data path as two 64-bit, four 32-bit, eight 16-bit
- * or sixteen 8-bit paths.
- *
- * Reference:
- *
- * The Toshiba TX System RISC TX79 Core Architecture manual,
- * https://wiki.qemu.org/File:C790.pdf
- *
- *     Three-Operand Multiply and Multiply-Add (4 instructions)
- *     --------------------------------------------------------
- * MADD    [rd,] rs, rt      Multiply/Add
- * MADDU   [rd,] rs, rt      Multiply/Add Unsigned
- * MULT    [rd,] rs, rt      Multiply (3-operand)
- * MULTU   [rd,] rs, rt      Multiply Unsigned (3-operand)
- *
- *     Multiply Instructions for Pipeline 1 (10 instructions)
- *     ------------------------------------------------------
- * MULT1   [rd,] rs, rt      Multiply Pipeline 1
- * MULTU1  [rd,] rs, rt      Multiply Unsigned Pipeline 1
- * DIV1    rs, rt            Divide Pipeline 1
- * DIVU1   rs, rt            Divide Unsigned Pipeline 1
- * MADD1   [rd,] rs, rt      Multiply-Add Pipeline 1
- * MADDU1  [rd,] rs, rt      Multiply-Add Unsigned Pipeline 1
- * MFHI1   rd                Move From HI1 Register
- * MFLO1   rd                Move From LO1 Register
- * MTHI1   rs                Move To HI1 Register
- * MTLO1   rs                Move To LO1 Register
- *
- *     Arithmetic (19 instructions)
- *     ----------------------------
- * PADDB   rd, rs, rt        Parallel Add Byte
- * PSUBB   rd, rs, rt        Parallel Subtract Byte
- * PADDH   rd, rs, rt        Parallel Add Halfword
- * PSUBH   rd, rs, rt        Parallel Subtract Halfword
- * PADDW   rd, rs, rt        Parallel Add Word
- * PSUBW   rd, rs, rt        Parallel Subtract Word
- * PADSBH  rd, rs, rt        Parallel Add/Subtract Halfword
- * PADDSB  rd, rs, rt        Parallel Add with Signed Saturation Byte
- * PSUBSB  rd, rs, rt        Parallel Subtract with Signed Saturation Byte
- * PADDSH  rd, rs, rt        Parallel Add with Signed Saturation Halfword
- * PSUBSH  rd, rs, rt        Parallel Subtract with Signed Saturation Halfword
- * PADDSW  rd, rs, rt        Parallel Add with Signed Saturation Word
- * PSUBSW  rd, rs, rt        Parallel Subtract with Signed Saturation Word
- * PADDUB  rd, rs, rt        Parallel Add with Unsigned saturation Byte
- * PSUBUB  rd, rs, rt        Parallel Subtract with Unsigned saturation Byte
- * PADDUH  rd, rs, rt        Parallel Add with Unsigned saturation Halfword
- * PSUBUH  rd, rs, rt        Parallel Subtract with Unsigned saturation Halfword
- * PADDUW  rd, rs, rt        Parallel Add with Unsigned saturation Word
- * PSUBUW  rd, rs, rt        Parallel Subtract with Unsigned saturation Word
- *
- *     Min/Max (4 instructions)
- *     ------------------------
- * PMAXH   rd, rs, rt        Parallel Maximum Halfword
- * PMINH   rd, rs, rt        Parallel Minimum Halfword
- * PMAXW   rd, rs, rt        Parallel Maximum Word
- * PMINW   rd, rs, rt        Parallel Minimum Word
- *
- *     Absolute (2 instructions)
- *     -------------------------
- * PABSH   rd, rt            Parallel Absolute Halfword
- * PABSW   rd, rt            Parallel Absolute Word
- *
- *     Logical (4 instructions)
- *     ------------------------
- * PAND    rd, rs, rt        Parallel AND
- * POR     rd, rs, rt        Parallel OR
- * PXOR    rd, rs, rt        Parallel XOR
- * PNOR    rd, rs, rt        Parallel NOR
- *
- *     Shift (9 instructions)
- *     ----------------------
- * PSLLH   rd, rt, sa        Parallel Shift Left Logical Halfword
- * PSRLH   rd, rt, sa        Parallel Shift Right Logical Halfword
- * PSRAH   rd, rt, sa        Parallel Shift Right Arithmetic Halfword
- * PSLLW   rd, rt, sa        Parallel Shift Left Logical Word
- * PSRLW   rd, rt, sa        Parallel Shift Right Logical Word
- * PSRAW   rd, rt, sa        Parallel Shift Right Arithmetic Word
- * PSLLVW  rd, rt, rs        Parallel Shift Left Logical Variable Word
- * PSRLVW  rd, rt, rs        Parallel Shift Right Logical Variable Word
- * PSRAVW  rd, rt, rs        Parallel Shift Right Arithmetic Variable Word
- *
- *     Compare (6 instructions)
- *     ------------------------
- * PCGTB   rd, rs, rt        Parallel Compare for Greater Than Byte
- * PCEQB   rd, rs, rt        Parallel Compare for Equal Byte
- * PCGTH   rd, rs, rt        Parallel Compare for Greater Than Halfword
- * PCEQH   rd, rs, rt        Parallel Compare for Equal Halfword
- * PCGTW   rd, rs, rt        Parallel Compare for Greater Than Word
- * PCEQW   rd, rs, rt        Parallel Compare for Equal Word
- *
- *     LZC (1 instruction)
- *     -------------------
- * PLZCW   rd, rs            Parallel Leading Zero or One Count Word
- *
- *     Quadword Load and Store (2 instructions)
- *     ----------------------------------------
- * LQ      rt, offset(base)  Load Quadword
- * SQ      rt, offset(base)  Store Quadword
- *
- *     Multiply and Divide (19 instructions)
- *     -------------------------------------
- * PMULTW  rd, rs, rt        Parallel Multiply Word
- * PMULTUW rd, rs, rt        Parallel Multiply Unsigned Word
- * PDIVW   rs, rt            Parallel Divide Word
- * PDIVUW  rs, rt            Parallel Divide Unsigned Word
- * PMADDW  rd, rs, rt        Parallel Multiply-Add Word
- * PMADDUW rd, rs, rt        Parallel Multiply-Add Unsigned Word
- * PMSUBW  rd, rs, rt        Parallel Multiply-Subtract Word
- * PMULTH  rd, rs, rt        Parallel Multiply Halfword
- * PMADDH  rd, rs, rt        Parallel Multiply-Add Halfword
- * PMSUBH  rd, rs, rt        Parallel Multiply-Subtract Halfword
- * PHMADH  rd, rs, rt        Parallel Horizontal Multiply-Add Halfword
- * PHMSBH  rd, rs, rt        Parallel Horizontal Multiply-Subtract Halfword
- * PDIVBW  rs, rt            Parallel Divide Broadcast Word
- * PMFHI   rd                Parallel Move From HI Register
- * PMFLO   rd                Parallel Move From LO Register
- * PMTHI   rs                Parallel Move To HI Register
- * PMTLO   rs                Parallel Move To LO Register
- * PMFHL   rd                Parallel Move From HI/LO Register
- * PMTHL   rs                Parallel Move To HI/LO Register
- *
- *     Pack/Extend (11 instructions)
- *     -----------------------------
- * PPAC5   rd, rt            Parallel Pack to 5 bits
- * PPACB   rd, rs, rt        Parallel Pack to Byte
- * PPACH   rd, rs, rt        Parallel Pack to Halfword
- * PPACW   rd, rs, rt        Parallel Pack to Word
- * PEXT5   rd, rt            Parallel Extend Upper from 5 bits
- * PEXTUB  rd, rs, rt        Parallel Extend Upper from Byte
- * PEXTLB  rd, rs, rt        Parallel Extend Lower from Byte
- * PEXTUH  rd, rs, rt        Parallel Extend Upper from Halfword
- * PEXTLH  rd, rs, rt        Parallel Extend Lower from Halfword
- * PEXTUW  rd, rs, rt        Parallel Extend Upper from Word
- * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
- *
- *     Others (16 instructions)
- *     ------------------------
- * PCPYH   rd, rt            Parallel Copy Halfword
- * PCPYLD  rd, rs, rt        Parallel Copy Lower Doubleword
- * PCPYUD  rd, rs, rt        Parallel Copy Upper Doubleword
- * PREVH   rd, rt            Parallel Reverse Halfword
- * PINTH   rd, rs, rt        Parallel Interleave Halfword
- * PINTEH  rd, rs, rt        Parallel Interleave Even Halfword
- * PEXEH   rd, rt            Parallel Exchange Even Halfword
- * PEXCH   rd, rt            Parallel Exchange Center Halfword
- * PEXEW   rd, rt            Parallel Exchange Even Word
- * PEXCW   rd, rt            Parallel Exchange Center Word
- * QFSRV   rd, rs, rt        Quadword Funnel Shift Right Variable
- * MFSA    rd                Move from Shift Amount Register
- * MTSA    rs                Move to Shift Amount Register
- * MTSAB   rs, immediate     Move Byte Count to Shift Amount Register
- * MTSAH   rs, immediate     Move Halfword Count to Shift Amount Register
- * PROT3W  rd, rt            Parallel Rotate 3 Words
- *
  *     MMI (MultiMedia Instruction) encodings
  *     ======================================
  *
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 6e90eb64608..ad83774b977 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -14,6 +14,22 @@
 /* Include the auto-generated decoder.  */
 #include "decode-tx79.c.inc"
 
+/*
+ *     Overview of the TX79-specific instruction set
+ *     =============================================
+ *
+ * The R5900 and the C790 have 128-bit wide GPRs, where the upper 64 bits
+ * are only used by the specific quadword (128-bit) LQ/SQ load/store
+ * instructions and certain multimedia instructions (MMIs). These MMIs
+ * configure the 128-bit data path as two 64-bit, four 32-bit, eight 16-bit
+ * or sixteen 8-bit paths.
+ *
+ * Reference:
+ *
+ * The Toshiba TX System RISC TX79 Core Architecture manual,
+ * https://wiki.qemu.org/File:C790.pdf
+ */
+
 bool decode_ext_tx79(DisasContext *ctx, uint32_t insn)
 {
     if (TARGET_LONG_BITS == 64 && decode_tx79(ctx, insn)) {
@@ -22,6 +38,30 @@ bool decode_ext_tx79(DisasContext *ctx, uint32_t insn)
     return false;
 }
 
+/*
+ *     Three-Operand Multiply and Multiply-Add (4 instructions)
+ *     --------------------------------------------------------
+ * MADD    [rd,] rs, rt      Multiply/Add
+ * MADDU   [rd,] rs, rt      Multiply/Add Unsigned
+ * MULT    [rd,] rs, rt      Multiply (3-operand)
+ * MULTU   [rd,] rs, rt      Multiply Unsigned (3-operand)
+ */
+
+/*
+ *     Multiply Instructions for Pipeline 1 (10 instructions)
+ *     ------------------------------------------------------
+ * MULT1   [rd,] rs, rt      Multiply Pipeline 1
+ * MULTU1  [rd,] rs, rt      Multiply Unsigned Pipeline 1
+ * DIV1    rs, rt            Divide Pipeline 1
+ * DIVU1   rs, rt            Divide Unsigned Pipeline 1
+ * MADD1   [rd,] rs, rt      Multiply-Add Pipeline 1
+ * MADDU1  [rd,] rs, rt      Multiply-Add Unsigned Pipeline 1
+ * MFHI1   rd                Move From HI1 Register
+ * MFLO1   rd                Move From LO1 Register
+ * MTHI1   rs                Move To HI1 Register
+ * MTLO1   rs                Move To LO1 Register
+ */
+
 static bool trans_MFHI1(DisasContext *ctx, arg_rtype *a)
 {
     gen_store_gpr(cpu_HI[1], a->rd);
@@ -50,6 +90,154 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
     return true;
 }
 
+/*
+ *     Arithmetic (19 instructions)
+ *     ----------------------------
+ * PADDB   rd, rs, rt        Parallel Add Byte
+ * PSUBB   rd, rs, rt        Parallel Subtract Byte
+ * PADDH   rd, rs, rt        Parallel Add Halfword
+ * PSUBH   rd, rs, rt        Parallel Subtract Halfword
+ * PADDW   rd, rs, rt        Parallel Add Word
+ * PSUBW   rd, rs, rt        Parallel Subtract Word
+ * PADSBH  rd, rs, rt        Parallel Add/Subtract Halfword
+ * PADDSB  rd, rs, rt        Parallel Add with Signed Saturation Byte
+ * PSUBSB  rd, rs, rt        Parallel Subtract with Signed Saturation Byte
+ * PADDSH  rd, rs, rt        Parallel Add with Signed Saturation Halfword
+ * PSUBSH  rd, rs, rt        Parallel Subtract with Signed Saturation Halfword
+ * PADDSW  rd, rs, rt        Parallel Add with Signed Saturation Word
+ * PSUBSW  rd, rs, rt        Parallel Subtract with Signed Saturation Word
+ * PADDUB  rd, rs, rt        Parallel Add with Unsigned saturation Byte
+ * PSUBUB  rd, rs, rt        Parallel Subtract with Unsigned saturation Byte
+ * PADDUH  rd, rs, rt        Parallel Add with Unsigned saturation Halfword
+ * PSUBUH  rd, rs, rt        Parallel Subtract with Unsigned saturation Halfword
+ * PADDUW  rd, rs, rt        Parallel Add with Unsigned saturation Word
+ * PSUBUW  rd, rs, rt        Parallel Subtract with Unsigned saturation Word
+ */
+
+/*
+ *     Min/Max (4 instructions)
+ *     ------------------------
+ * PMAXH   rd, rs, rt        Parallel Maximum Halfword
+ * PMINH   rd, rs, rt        Parallel Minimum Halfword
+ * PMAXW   rd, rs, rt        Parallel Maximum Word
+ * PMINW   rd, rs, rt        Parallel Minimum Word
+ */
+
+/*
+ *     Absolute (2 instructions)
+ *     -------------------------
+ * PABSH   rd, rt            Parallel Absolute Halfword
+ * PABSW   rd, rt            Parallel Absolute Word
+ */
+
+/*
+ *     Logical (4 instructions)
+ *     ------------------------
+ * PAND    rd, rs, rt        Parallel AND
+ * POR     rd, rs, rt        Parallel OR
+ * PXOR    rd, rs, rt        Parallel XOR
+ * PNOR    rd, rs, rt        Parallel NOR
+ */
+
+/*
+ *     Shift (9 instructions)
+ *     ----------------------
+ * PSLLH   rd, rt, sa        Parallel Shift Left Logical Halfword
+ * PSRLH   rd, rt, sa        Parallel Shift Right Logical Halfword
+ * PSRAH   rd, rt, sa        Parallel Shift Right Arithmetic Halfword
+ * PSLLW   rd, rt, sa        Parallel Shift Left Logical Word
+ * PSRLW   rd, rt, sa        Parallel Shift Right Logical Word
+ * PSRAW   rd, rt, sa        Parallel Shift Right Arithmetic Word
+ * PSLLVW  rd, rt, rs        Parallel Shift Left Logical Variable Word
+ * PSRLVW  rd, rt, rs        Parallel Shift Right Logical Variable Word
+ * PSRAVW  rd, rt, rs        Parallel Shift Right Arithmetic Variable Word
+ */
+
+/*
+ *     Compare (6 instructions)
+ *     ------------------------
+ * PCGTB   rd, rs, rt        Parallel Compare for Greater Than Byte
+ * PCEQB   rd, rs, rt        Parallel Compare for Equal Byte
+ * PCGTH   rd, rs, rt        Parallel Compare for Greater Than Halfword
+ * PCEQH   rd, rs, rt        Parallel Compare for Equal Halfword
+ * PCGTW   rd, rs, rt        Parallel Compare for Greater Than Word
+ * PCEQW   rd, rs, rt        Parallel Compare for Equal Word
+ */
+
+/*
+ *     LZC (1 instruction)
+ *     -------------------
+ * PLZCW   rd, rs            Parallel Leading Zero or One Count Word
+ */
+
+/*
+ *     Quadword Load and Store (2 instructions)
+ *     ----------------------------------------
+ * LQ      rt, offset(base)  Load Quadword
+ * SQ      rt, offset(base)  Store Quadword
+ */
+
+/*
+ *     Multiply and Divide (19 instructions)
+ *     -------------------------------------
+ * PMULTW  rd, rs, rt        Parallel Multiply Word
+ * PMULTUW rd, rs, rt        Parallel Multiply Unsigned Word
+ * PDIVW   rs, rt            Parallel Divide Word
+ * PDIVUW  rs, rt            Parallel Divide Unsigned Word
+ * PMADDW  rd, rs, rt        Parallel Multiply-Add Word
+ * PMADDUW rd, rs, rt        Parallel Multiply-Add Unsigned Word
+ * PMSUBW  rd, rs, rt        Parallel Multiply-Subtract Word
+ * PMULTH  rd, rs, rt        Parallel Multiply Halfword
+ * PMADDH  rd, rs, rt        Parallel Multiply-Add Halfword
+ * PMSUBH  rd, rs, rt        Parallel Multiply-Subtract Halfword
+ * PHMADH  rd, rs, rt        Parallel Horizontal Multiply-Add Halfword
+ * PHMSBH  rd, rs, rt        Parallel Horizontal Multiply-Subtract Halfword
+ * PDIVBW  rs, rt            Parallel Divide Broadcast Word
+ * PMFHI   rd                Parallel Move From HI Register
+ * PMFLO   rd                Parallel Move From LO Register
+ * PMTHI   rs                Parallel Move To HI Register
+ * PMTLO   rs                Parallel Move To LO Register
+ * PMFHL   rd                Parallel Move From HI/LO Register
+ * PMTHL   rs                Parallel Move To HI/LO Register
+ */
+
+/*
+ *     Pack/Extend (11 instructions)
+ *     -----------------------------
+ * PPAC5   rd, rt            Parallel Pack to 5 bits
+ * PPACB   rd, rs, rt        Parallel Pack to Byte
+ * PPACH   rd, rs, rt        Parallel Pack to Halfword
+ * PPACW   rd, rs, rt        Parallel Pack to Word
+ * PEXT5   rd, rt            Parallel Extend Upper from 5 bits
+ * PEXTUB  rd, rs, rt        Parallel Extend Upper from Byte
+ * PEXTLB  rd, rs, rt        Parallel Extend Lower from Byte
+ * PEXTUH  rd, rs, rt        Parallel Extend Upper from Halfword
+ * PEXTLH  rd, rs, rt        Parallel Extend Lower from Halfword
+ * PEXTUW  rd, rs, rt        Parallel Extend Upper from Word
+ * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
+ */
+
+/*
+ *     Others (16 instructions)
+ *     ------------------------
+ * PCPYH   rd, rt            Parallel Copy Halfword
+ * PCPYLD  rd, rs, rt        Parallel Copy Lower Doubleword
+ * PCPYUD  rd, rs, rt        Parallel Copy Upper Doubleword
+ * PREVH   rd, rt            Parallel Reverse Halfword
+ * PINTH   rd, rs, rt        Parallel Interleave Halfword
+ * PINTEH  rd, rs, rt        Parallel Interleave Even Halfword
+ * PEXEH   rd, rt            Parallel Exchange Even Halfword
+ * PEXCH   rd, rt            Parallel Exchange Center Halfword
+ * PEXEW   rd, rt            Parallel Exchange Even Word
+ * PEXCW   rd, rt            Parallel Exchange Center Word
+ * QFSRV   rd, rs, rt        Quadword Funnel Shift Right Variable
+ * MFSA    rd                Move from Shift Amount Register
+ * MTSA    rs                Move to Shift Amount Register
+ * MTSAB   rs, immediate     Move Byte Count to Shift Amount Register
+ * MTSAH   rs, immediate     Move Halfword Count to Shift Amount Register
+ * PROT3W  rd, rt            Parallel Rotate 3 Words
+ */
+
 /* Parallel Copy Halfword */
 static bool trans_PCPYH(DisasContext *s, arg_rtype *a)
 {
-- 
2.26.2


