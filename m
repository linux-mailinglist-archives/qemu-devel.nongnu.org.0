Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5956F5A009B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:43:51 +0200 (CEST)
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuPu-00062Z-DZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuEL-0001hv-OZ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuE7-0003iN-36
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPEi09UZWczc0iRHlbbJoT8IKqZIvnSmqU5S+SnF5H4=;
 b=LaBaOAzCVaH3IdGBtYUnNhrWxBFEqxefmV95JuTBYdD3HqHJsc5K3Jf94L84+JoVR+rU6U
 6i34hAHuUpNT7Ipu4ZVAiRm6TDKQZCY9ZDWqWtu/+GxeL0t6mt1SAOrPWeFendE7gFqq+w
 qOpHeuqcTzFlc7SrtMjb1UiJzzzikuU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556--CQe1nF_PXysKr4yXh-2Vw-1; Wed, 24 Aug 2022 13:31:35 -0400
X-MC-Unique: -CQe1nF_PXysKr4yXh-2Vw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l25-20020adfa399000000b002252058bad2so2994760wrb.11
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sPEi09UZWczc0iRHlbbJoT8IKqZIvnSmqU5S+SnF5H4=;
 b=e1qjjJMqdSwokJLy96Uhnk2zJ2vO17lDHmyfE4tyAOCogr4YtLkwJ03vG7NVsoRTtj
 q8gr8efwQl9b/9Uorxnnt53Yd2+PAmVMuEE+5AiJelUjUCk8HOi/vd+HPJC0Ifd/SCga
 Ta7O/UwvGnRgJEU/pZwD7cDUUYBSx+AjOGprzj4YhAzuQda7RGYyWuMT3PHj+WMJl4LY
 H0FFaEp/yOPMpJsjOCfATTMbIS9wQSQMgFSRgo/docT2kO4mAjYD1XE4Ocyg/6l4w99R
 v2s7HOD7wAZHyfKkd96/bJh8adIWiOsIUxJh+wccOKTxY0y4lBQjnl1PSbPLCXJ2zZvD
 N24Q==
X-Gm-Message-State: ACgBeo21bX/awGGB6YW5CnkuQnVVhY8fBXw9XmOSTkQTonGIuW7XoBLF
 JS3dmaDcxTORMOmDKNADlPNx1RlpHBrzNZn7ZHy3bx7WKYRXwIHgN7aUfIbI56RTZvT8elcmrVB
 8WkgzfESCOUfMMffb76954vj+KRgwMHFKbS9xuA0szIPdCov2/xChpYKM+7AOrk0lqxw=
X-Received: by 2002:a05:6000:15c8:b0:225:5263:a223 with SMTP id
 y8-20020a05600015c800b002255263a223mr145473wry.335.1661362290576; 
 Wed, 24 Aug 2022 10:31:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5uIntZyTFXq9nywoCnfLBRiM+kaq+QyvKf2W5k/tmhcnEheshPuxqAQWnKXqX+k4ApB4GAnA==
X-Received: by 2002:a05:6000:15c8:b0:225:5263:a223 with SMTP id
 y8-20020a05600015c800b002255263a223mr145436wry.335.1661362289804; 
 Wed, 24 Aug 2022 10:31:29 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a5d5907000000b00220592005edsm17568662wrd.85.2022.08.24.10.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:31:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 03/17] target/i386: add core of new i386 decoder
Date: Wed, 24 Aug 2022 19:31:09 +0200
Message-Id: <20220824173123.232018-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824173123.232018-1-pbonzini@redhat.com>
References: <20220824173123.232018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The new decoder is based on three principles:

- use mostly table-driven decoding, using tables derived as much as possible
  from the Intel manual, keeping the code as "non-branchy" as possible

- keep address generation and (for ALU operands) memory loads and write back
  as much in common code as possible (this is less relevant to non-ALU
  instructions because read-modify-write operations are rare)

- do minimal changes on the old decoder while allowing incremental
  replacement of the old decoder with the new one

This patch introduces the main decoder flow, and integrates the old
decoder with the new one.  The old decoder takes care of parsing
prefixes and then optionally drops to the new one.

There is a debugging mechanism through a "LIMIT" environment variable.
In user-mode emulation, the variable is the number of instructions
decoded by the new decoder before permanently switching to the old one.
In system emulation, the variable is the highest opcode that is decoded
by the new decoder (this is less friendly, but it's the best that can
be done without requiring deterministic execution).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 998 +++++++++++++++++++++++++++++++
 target/i386/tcg/decode-old.c.inc |  15 +
 target/i386/tcg/emit.c.inc       |  10 +
 target/i386/tcg/translate.c      |  31 +
 4 files changed, 1054 insertions(+)
 create mode 100644 target/i386/tcg/decode-new.c.inc
 create mode 100644 target/i386/tcg/emit.c.inc

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
new file mode 100644
index 0000000000..d661f1f6f0
--- /dev/null
+++ b/target/i386/tcg/decode-new.c.inc
@@ -0,0 +1,998 @@
+/* Decode table flags, mostly based on Intel SDM.  */
+
+typedef enum X86OpType {
+    X86_TYPE_A, /* Implicit */
+    X86_TYPE_B, /* VEX.vvvv selects a GPR */
+    X86_TYPE_C, /* REG in the modrm byte selects a control register */
+    X86_TYPE_D, /* REG in the modrm byte selects a debug register */
+    X86_TYPE_E, /* ALU modrm operand */
+    X86_TYPE_F, /* EFLAGS/RFLAGS */
+    X86_TYPE_G, /* REG in the modrm byte selects a GPR */
+    X86_TYPE_H, /* For AVX, VEX.vvvv selects an XMM/YMM register */
+    X86_TYPE_I, /* Immediate */
+    X86_TYPE_J, /* Relative offset for a jump */
+    X86_TYPE_L, /* The upper 4 bits of the immediate select a 128-bit register */
+    X86_TYPE_M, /* modrm byte selects a memory operand */
+    X86_TYPE_N, /* R/M in the modrm byte selects an MMX register */
+    X86_TYPE_O, /* Absolute address encoded in the instruction */
+    X86_TYPE_P, /* reg in the modrm byte selects an MMX register */
+    X86_TYPE_Q, /* MMX modrm operand */
+    X86_TYPE_R, /* R/M in the modrm byte selects a register */
+    X86_TYPE_S, /* reg selects a segment register */
+    X86_TYPE_U, /* R/M in the modrm byte selects an XMM/YMM register */
+    X86_TYPE_V, /* reg in the modrm byte selects an XMM/YMM register */
+    X86_TYPE_W, /* XMM/YMM modrm operand */
+    X86_TYPE_X, /* string source */
+    X86_TYPE_Y, /* string destination */
+
+    /* Custom */
+    X86_TYPE_None,
+    X86_TYPE_2op, /* 2-operand RMW instruction */
+    X86_TYPE_LoBits, /* encoded in bits 0-2 of the operand + REX.B */
+    X86_TYPE_0, /* Hard-coded GPRs (RAX..RDI) */
+    X86_TYPE_1,
+    X86_TYPE_2,
+    X86_TYPE_3,
+    X86_TYPE_4,
+    X86_TYPE_5,
+    X86_TYPE_6,
+    X86_TYPE_7,
+    X86_TYPE_ES, /* Hard-coded segment registers */
+    X86_TYPE_CS,
+    X86_TYPE_SS,
+    X86_TYPE_DS,
+    X86_TYPE_FS,
+    X86_TYPE_GS,
+} X86OpType;
+
+typedef enum X86OpSize {
+    X86_SIZE_a,  /* BOUND operand */
+    X86_SIZE_b,  /* byte */
+    X86_SIZE_c,  /* 16/32-bit, based on operand size */
+    X86_SIZE_d,  /* 32-bit */
+    X86_SIZE_dq, /* 2x64-bit */
+    X86_SIZE_p,  /* Far pointer */
+    X86_SIZE_pd, /* SSE/AVX packed double precision */
+    X86_SIZE_pi, /* MMX */
+    X86_SIZE_ps, /* SSE/AVX packed single precision */
+    X86_SIZE_q,  /* 64-bit */
+    X86_SIZE_qq, /* 2x128-bit */
+    X86_SIZE_s,  /* Descriptor */
+    X86_SIZE_sd, /* SSE/AVX scalar double precision */
+    X86_SIZE_ss, /* SSE/AVX scalar single precision */
+    X86_SIZE_si, /* 32-bit GPR */
+    X86_SIZE_v,  /* 16/32/64-bit, based on operand size */
+    X86_SIZE_w,  /* 16-bit */
+    X86_SIZE_x,  /* 128/256-bit, based on operand size */
+    X86_SIZE_y,  /* 32/64-bit, based on operand size */
+    X86_SIZE_z,  /* 16-bit for 16-bit operand size, else 32-bit */
+
+    /* Custom */
+    X86_SIZE_None,
+    X86_SIZE_d64,
+    X86_SIZE_f64,
+} X86OpSize;
+
+/* Execution flags */
+
+typedef enum X86ALUOpType {
+    X86_ALU_SKIP,
+    X86_ALU_SEG,
+    X86_ALU_CR,
+    X86_ALU_DR,
+    X86_ALU_GPR,
+    X86_ALU_MEM,
+    X86_ALU_IMM,
+} X86ALUOpType;
+
+typedef enum X86OpSpecial {
+    X86_SPECIAL_None,
+
+    /* Always locked if it has a memory operand (XCHG) */
+    X86_SPECIAL_Locked,
+
+    /* Fault outside protected mode */
+    X86_SPECIAL_ProtMode,
+
+    /* Writeback not needed or done manually in the callback */
+    X86_SPECIAL_NoWriteback,
+
+    /* Illegal or exclusive to 64-bit mode */
+    X86_SPECIAL_i64,
+    X86_SPECIAL_o64,
+} X86OpSpecial;
+
+typedef struct X86OpEntry  X86OpEntry;
+typedef struct X86DecodedInsn X86DecodedInsn;
+
+/* Decode function for multibyte opcodes.  */
+typedef void (*X86DecodeFunc)(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b);
+
+/* Code generation function.  */
+typedef void (*X86GenFunc)(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode);
+
+struct X86OpEntry {
+    /* Based on the is_decode flags.  */
+    union {
+        X86GenFunc gen;
+        X86DecodeFunc decode;
+    };
+    /* op0 is always written, op1 and op2 are always read.  */
+    X86OpType op0 : 8;
+    X86OpSize s0  : 8;
+    X86OpType op1 : 8;
+    X86OpSize s1  : 8;
+    X86OpType op2 : 8;
+    X86OpSize s2  : 8;
+    X86OpSpecial special;
+    bool is_decode;
+};
+
+typedef struct X86DecodedOp {
+    int8_t n;
+    MemOp ot;     /* For b/c/d/p/s/q/v/w/y/z */
+    X86ALUOpType alu_op_type;
+    bool has_ea;
+} X86DecodedOp;
+
+struct X86DecodedInsn {
+    X86OpEntry e;
+    X86DecodedOp op[3];
+    target_ulong immediate;
+    AddressParts mem;
+
+    uint8_t b;
+};
+
+#include "emit.c.inc"
+
+#define X86_OP_NONE { 0 },
+
+#define X86_OP_GROUP3(op, op0_, s0_, op1_, s1_, op2_, s2_, ...) {  \
+    .decode = glue(decode_group_, op),                       \
+    .op0 = glue(X86_TYPE_, op0_),                             \
+    .s0 = glue(X86_SIZE_, s0_),                               \
+    .op1 = glue(X86_TYPE_, op1_),                             \
+    .s1 = glue(X86_SIZE_, s1_),                               \
+    .op2 = glue(X86_TYPE_, op2_),                             \
+    .s2 = glue(X86_SIZE_, s2_),                               \
+    .is_decode = true,                                       \
+    ## __VA_ARGS__                                           \
+}
+
+#define X86_OP_ENTRY3(op, op0_, s0_, op1_, s1_, op2_, s2_, ...) {  \
+    .gen = glue(gen_, op),                                   \
+    .op0 = glue(X86_TYPE_, op0_),                             \
+    .s0 = glue(X86_SIZE_, s0_),                               \
+    .op1 = glue(X86_TYPE_, op1_),                             \
+    .s1 = glue(X86_SIZE_, s1_),                               \
+    .op2 = glue(X86_TYPE_, op2_),                             \
+    .s2 = glue(X86_SIZE_, s2_),                               \
+    ## __VA_ARGS__                                           \
+}
+
+#define X86_OP_ENTRY2(op, op0, s0, op1, s1, ...)                  \
+    X86_OP_ENTRY3(op, op0, s0, 2op, s0, op1, s1, ## __VA_ARGS__)
+#define X86_OP_GROUP2(op, op0, s0, op1, s1, ...)                  \
+    X86_OP_GROUP3(op, op0, s0, 2op, s0, op1, s1, ## __VA_ARGS__)
+
+#define X86_OP_ENTRYw(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, op0, s0, None, None, None, None, ## __VA_ARGS__)
+#define X86_OP_GROUPw(op, op0, s0, ...)                           \
+    X86_OP_GROUP3(op, op0, s0, None, None, None, None, ## __VA_ARGS__)
+#define X86_OP_ENTRYr(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, None, None, None, None, op0, s0, ## __VA_ARGS__)
+#define X86_OP_ENTRY1(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, op0, s0, 2op, s0, None, None, ## __VA_ARGS__)
+
+#define X86_OP_ENTRY0(op, ...)                                    \
+    X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
+#define X86_OP_GROUP0(op, ...)                                    \
+    X86_OP_GROUP3(op, None, None, None, None, None, None, ## __VA_ARGS__)
+
+#define i64 .special = X86_SPECIAL_i64,
+#define o64 .special = X86_SPECIAL_o64,
+#define nowb .special = X86_SPECIAL_NoWriteback,
+#define xchg .special = X86_SPECIAL_Locked,
+
+static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
+{
+    if (!s->has_modrm) {
+        s->modrm = x86_ldub_code(env, s);
+        s->has_modrm = true;
+    }
+    return s->modrm;
+}
+
+static X86OpEntry A4_00_F7[16][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static X86OpEntry A4_08_FF[16][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static void decode_threebyte_38(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *b = x86_ldub_code(env, s);
+    if (!(*b & 8)) {
+        *entry = A4_00_F7[*b >> 4][*b & 7];
+    } else {
+        *entry = A4_08_FF[*b >> 4][*b & 7];
+    }
+}
+
+static X86OpEntry A5_00_F7[16][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static X86OpEntry A5_08_FF[16][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static void decode_threebyte_3a(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *b = x86_ldub_code(env, s);
+    if (!(*b & 8)) {
+        *entry = A5_00_F7[*b >> 4][*b & 7];
+    } else {
+        *entry = A5_08_FF[*b >> 4][*b & 7];
+    }
+}
+
+static X86OpEntry A3_00_77[8][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static X86OpEntry A3_08_7F[8][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+        [0x38 & 7] = { .decode = decode_threebyte_38, .is_decode = true },
+        [0x3a & 7] = { .decode = decode_threebyte_3a, .is_decode = true },
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static X86OpEntry A3_80_F7[8][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static X86OpEntry A3_88_FF[8][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static void decode_twobyte(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    *b = x86_ldub_code(env, s);
+    switch (*b & 0x88) {
+    case 0x00:
+        *entry = A3_00_77[*b >> 4][*b & 7];
+        break;
+    case 0x08:
+        *entry = A3_08_7F[*b >> 4][*b & 7];
+        break;
+    case 0x80:
+        *entry = A3_80_F7[(*b - 0x80) >> 4][*b & 7];
+        break;
+    case 0x88:
+        *entry = A3_88_FF[(*b - 0x80) >> 4][*b & 7];
+        break;
+    }
+}
+
+static X86OpEntry A2_00_F7[16][8] = {
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+static X86OpEntry A2_08_FF[16][8] = {
+    {
+        [7] = { .decode = decode_twobyte, .is_decode = true, }
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+    {
+    },
+};
+
+/*
+ * Decode the fixed part of the opcode and place the last
+ * in b.
+ */
+static void decode_root(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    if (!(*b & 8)) {
+        *entry = A2_00_F7[*b >> 4][*b & 7];
+    } else {
+        *entry = A2_08_FF[*b >> 4][*b & 7];
+    }
+}
+
+
+static int decode_modrm(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                        X86DecodedOp *op, X86OpType type)
+{
+    int modrm = get_modrm(s, env);
+    if ((modrm >> 6) == 3) {
+        if ((s->prefix & PREFIX_LOCK) || type == X86_TYPE_M) {
+            decode->e.gen = gen_illegal;
+            return 0xff;
+        }
+        op->n = (modrm & 7) | REX_B(s);
+    } else {
+        op->has_ea = true;
+        op->n = -1;
+        decode->mem = gen_lea_modrm_0(env, s, get_modrm(s, env));
+    }
+    return modrm;
+}
+
+static MemOp decode_op_size(DisasContext *s, X86OpSize size)
+{
+    switch (size) {
+    case X86_SIZE_b:  /* byte */
+        return MO_8;
+
+    case X86_SIZE_c:  /* 16/32-bit, based on operand size */
+        return s->dflag == MO_64 ? MO_32 : s->dflag;
+
+    case X86_SIZE_d:  /* 32-bit */
+        return MO_32;
+
+    case X86_SIZE_q:  /* 64-bit */
+        return MO_64;
+
+    case X86_SIZE_p:  /* Far pointer */
+    case X86_SIZE_s:  /* Descriptor */
+    case X86_SIZE_v:  /* 16/32/64-bit, based on operand size */
+        return s->dflag;
+
+    case X86_SIZE_w:  /* 16-bit */
+        return MO_16;
+
+    case X86_SIZE_y:  /* 32/64-bit, based on operand size */
+        return CODE64(s) ? MO_64 : MO_32;
+
+    case X86_SIZE_z:  /* 16-bit for 16-bit operand size, else 32-bit */
+        return s->dflag == MO_16 ? MO_16 : MO_32;
+
+    case X86_SIZE_d64:  /* Default to 64-bit in 64-bit mode */
+        return CODE64(s) && s->dflag == MO_32 ? MO_64 : s->dflag;
+
+    case X86_SIZE_f64:  /* Ignore size override prefix in 64-bit mode */
+        return CODE64(s) ? MO_64 : s->dflag;
+
+    default:
+        return -1;
+    }
+}
+
+static void decode_op(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                      X86DecodedOp *op, X86OpType type, int b)
+{
+    int modrm;
+
+    switch (type) {
+    case X86_TYPE_A:  /* Implicit */
+    case X86_TYPE_F:  /* EFLAGS/RFLAGS */
+        break;
+
+    case X86_TYPE_B:  /* VEX.vvvv selects a GPR */
+        op->alu_op_type = X86_ALU_GPR;
+        op->n = s->vex_v;
+        break;
+
+    case X86_TYPE_C:  /* REG in the modrm byte selects a control register */) | REX_R(s);
+        break;
+
+    case X86_TYPE_E:  /* ALU modrm operand */
+        modrm = decode_modrm(s, env, decode, op, type);
+        op->alu_op_type = (modrm >> 6) == 3 ? X86_ALU_GPR : X86_ALU_MEM;
+        break;
+
+    case X86_TYPE_M:  /* modrm byte selects a memory operand */
+    case X86_TYPE_N:  /* R/M in the modrm byte selects an MMX register */
+    case X86_TYPE_Q:  /* MMX modrm operand */
+    case X86_TYPE_R:  /* R/M in the modrm byte selects a register */
+    case X86_TYPE_U:  /* R/M in the modrm byte selects an XMM/YMM register */
+    case X86_TYPE_W:  /* XMM/YMM modrm operand */
+        decode_modrm(s, env, decode, op, type);
+        break;
+
+    case X86_TYPE_O:  /* Absolute address encoded in the instruction */
+        op->alu_op_type = X86_ALU_MEM;
+        op->has_ea = true;
+        op->n = -1;
+        decode->mem = (AddressParts) {
+            .def_seg = R_DS,
+            .base = -1,
+            .index = -1,
+            .disp = insn_get_addr(env, s, s->aflag)
+        };
+        break;
+
+    case X86_TYPE_H:  /* For AVX, VEX.vvvv selects an XMM/YMM register */
+        /* SSE only for now */
+        *op = decode->op[0];
+        break;
+
+    case X86_TYPE_I:  /* Immediate */
+        op->alu_op_type = X86_ALU_IMM;
+        decode->immediate = insn_get_signed(env, s, op->ot);
+        break;
+
+    case X86_TYPE_J:  /* Relative offset for a jump */
+        op->alu_op_type = X86_ALU_IMM;
+        decode->immediate = insn_get_signed(env, s, op->ot);
+        decode->immediate += s->pc - s->cs_base;
+        if (s->dflag == MO_16) {
+            decode->immediate &= 0xffff;
+        } else if (!CODE64(s)) {
+            decode->immediate &= 0xffffffffu;
+        }
+        break;
+
+    case X86_TYPE_L:  /* The upper 4 bits of the immediate select a 128-bit register */
+        op->n = insn_get(env, s, op->ot) >> 4;
+        break;
+
+    case X86_TYPE_X:  /* string source */
+        op->n = -1;
+        decode->mem = (AddressParts) {
+            .def_seg = R_DS,
+            .base = R_ESI,
+            .index = -1,
+        };
+        break;
+
+    case X86_TYPE_Y:  /* string destination */
+        op->n = -1;
+        decode->mem = (AddressParts) {
+            .def_seg = R_ES,
+            .base = R_EDI,
+            .index = -1,
+        };
+        break;
+
+    case X86_TYPE_2op:
+        *op = decode->op[0];
+        break;
+
+    case X86_TYPE_LoBits:
+        op->n = (b & 7) | REX_B(s);
+        op->alu_op_type = X86_ALU_GPR;
+        break;
+
+    case X86_TYPE_0 ... X86_TYPE_7:
+        op->n = type - X86_TYPE_0;
+        op->alu_op_type = X86_ALU_GPR;
+        break;
+
+    case X86_TYPE_ES ... X86_TYPE_GS:
+        op->n = type - X86_TYPE_ES;
+        op->alu_op_type = X86_ALU_SEG;
+        break;
+
+    default:
+        abort();
+    }
+}
+
+static void decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_func,
+                        X86DecodedInsn *decode)
+{
+    X86OpEntry *e = &decode->e;
+
+    decode_func(s, env, e, &decode->b);
+    while (e->is_decode) {
+        e->is_decode = false;
+        e->decode(s, env, e, &decode->b);
+    }
+
+    /* First compute size of operands in order to initialize s->rip_offset.  */
+    if (e->op0 != X86_TYPE_None) {
+        decode->op[0].ot = decode_op_size(s, e->s0);
+        if (e->op0 == X86_TYPE_I) {
+            s->rip_offset += 1 << decode->op[0].ot;
+        }
+    }
+    if (e->op1 != X86_TYPE_None) {
+        decode->op[1].ot = decode_op_size(s, e->s1);
+        if (e->op1 == X86_TYPE_I) {
+            s->rip_offset += 1 << decode->op[1].ot;
+        }
+    }
+    if (e->op2 != X86_TYPE_None) {
+        decode->op[2].ot = decode_op_size(s, e->s2);
+        if (e->op2 == X86_TYPE_I) {
+            s->rip_offset += 1 << decode->op[2].ot;
+        }
+    }
+
+    if (e->op0 != X86_TYPE_None) {
+        decode_op(s, env, decode, &decode->op[0], e->op0, decode->b);
+    }
+
+    if (e->op1 != X86_TYPE_None) {
+        decode_op(s, env, decode, &decode->op[1], e->op1, decode->b);
+    }
+
+    if (e->op2 != X86_TYPE_None) {
+        decode_op(s, env, decode, &decode->op[2], e->op2, decode->b);
+    }
+}
+
+/* convert one instruction. s->base.is_jmp is set if the translation must
+   be stopped. Return the next pc value */
+static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
+{
+    CPUX86State *env = cpu->env_ptr;
+    bool first = true;
+    X86DecodedInsn decode;
+    X86DecodeFunc decode_func = decode_root;
+
+#ifdef CONFIG_USER_ONLY
+    --limit;
+#endif
+    s->has_modrm = false;
+#if 0
+    s->pc_start = s->pc = s->base.pc_next;
+    s->override = -1;
+#ifdef TARGET_X86_64
+    s->rex_w = false;
+    s->rex_r = 0;
+    s->rex_x = 0;
+    s->rex_b = 0;
+#endif
+    s->prefix = 0;
+    s->rip_offset = 0; /* for relative ip address */
+    s->vex_l = 0;
+    s->vex_v = 0;
+    if (sigsetjmp(s->jmpbuf, 0) != 0) {
+        gen_exception_gpf(s);
+        return s->pc;
+    }
+#endif
+
+ next_byte:
+    if (first) {
+        first = false;
+    } else {
+        b = x86_ldub_code(env, s);
+    }
+    /* Collect prefixes.  */
+    switch (b) {
+    case 0xf3:
+        s->prefix |= PREFIX_REPZ;
+        goto next_byte;
+    case 0xf2:
+        s->prefix |= PREFIX_REPNZ;
+        goto next_byte;
+    case 0xf0:
+        s->prefix |= PREFIX_LOCK;
+        goto next_byte;
+    case 0x2e:
+        s->override = R_CS;
+        goto next_byte;
+    case 0x36:
+        s->override = R_SS;
+        goto next_byte;
+    case 0x3e:
+        s->override = R_DS;
+        goto next_byte;
+    case 0x26:
+        s->override = R_ES;
+        goto next_byte;
+    case 0x64:
+        s->override = R_FS;
+        goto next_byte;
+    case 0x65:
+        s->override = R_GS;
+        goto next_byte;
+    case 0x66:
+        s->prefix |= PREFIX_DATA;
+        goto next_byte;
+    case 0x67:
+        s->prefix |= PREFIX_ADR;
+        goto next_byte;
+#ifdef TARGET_X86_64
+    case 0x40 ... 0x4f:
+        if (CODE64(s)) {
+            /* REX prefix */
+            s->prefix |= PREFIX_REX;
+            s->rex_w = (b >> 3) & 1;
+            s->rex_r = (b & 0x4) << 1;
+            s->rex_x = (b & 0x2) << 2;
+            s->rex_b = (b & 0x1) << 3;
+            goto next_byte;
+        }
+        break;
+#endif
+    case 0xc5: /* 2-byte VEX */
+    case 0xc4: /* 3-byte VEX */
+        /* VEX prefixes cannot be used except in 32-bit mode.
+           Otherwise the instruction is LES or LDS.  */
+        if (CODE32(s) && !VM86(s)) {
+            static const int pp_prefix[4] = {
+                0, PREFIX_DATA, PREFIX_REPZ, PREFIX_REPNZ
+            };
+            int vex3, vex2 = x86_ldub_code(env, s);
+
+            if (!CODE64(s) && (vex2 & 0xc0) != 0xc0) {
+                /* 4.1.4.6: In 32-bit mode, bits [7:6] must be 11b,
+                   otherwise the instruction is LES or LDS.  */
+                s->pc--; /* rewind the advance_pc() x86_ldub_code() did */
+                break;
+            }
+
+            /* 4.1.1-4.1.3: No preceding lock, 66, f2, f3, or rex prefixes. */
+            if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ
+                             | PREFIX_LOCK | PREFIX_DATA | PREFIX_REX)) {
+                goto illegal_op;
+            }
+#ifdef TARGET_X86_64
+            s->rex_r = (~vex2 >> 4) & 8;
+#endif
+            if (b == 0xc5) {
+                /* 2-byte VEX prefix: RVVVVlpp, implied 0f leading opcode byte */
+                vex3 = vex2;
+                decode_func = decode_twobyte;
+            } else {
+                /* 3-byte VEX prefix: RXBmmmmm wVVVVlpp */
+                vex3 = x86_ldub_code(env, s);
+#ifdef TARGET_X86_64
+                s->rex_x = (~vex2 >> 3) & 8;
+                s->rex_b = (~vex2 >> 2) & 8;
+                s->rex_w = (vex3 >> 7) & 1;
+#endif
+                switch (vex2 & 0x1f) {
+                case 0x01: /* Implied 0f leading opcode bytes.  */
+                    decode_func = decode_twobyte;
+                    break;
+                case 0x02: /* Implied 0f 38 leading opcode bytes.  */
+                    decode_func = decode_threebyte_38;
+                    break;
+                case 0x03: /* Implied 0f 3a leading opcode bytes.  */
+                    decode_func = decode_threebyte_3a;
+                    break;
+                default:   /* Reserved for future use.  */
+                    goto unknown_op;
+                }
+            }
+            s->vex_v = (~vex3 >> 3) & 0xf;
+            s->vex_l = (vex3 >> 2) & 1;
+            s->prefix |= pp_prefix[vex3 & 3] | PREFIX_VEX;
+        }
+        break;
+    }
+
+    /* Post-process prefixes.  */
+    if (CODE64(s)) {
+        /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
+           data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
+           over 0x66 if both are present.  */
+        s->dflag = (REX_W(s) ? MO_64 : s->prefix & PREFIX_DATA ? MO_16 : MO_32);
+        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
+        s->aflag = (s->prefix & PREFIX_ADR ? MO_32 : MO_64);
+    } else {
+        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
+        if (CODE32(s) ^ ((s->prefix & PREFIX_DATA) != 0)) {
+            s->dflag = MO_32;
+        } else {
+            s->dflag = MO_16;
+        }
+        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
+        if (CODE32(s) ^ ((s->prefix & PREFIX_ADR) != 0)) {
+            s->aflag = MO_32;
+        }  else {
+            s->aflag = MO_16;
+        }
+    }
+
+    memset(&decode, 0, sizeof(decode));
+    decode.b = b;
+    decode_insn(s, env, decode_func, &decode);
+    if (!decode.e.gen) {
+        goto unknown_op;
+    }
+
+    switch (decode.e.special) {
+    case X86_SPECIAL_None:
+        break;
+
+    case X86_SPECIAL_Locked:
+        if (decode.op[0].alu_op_type == X86_ALU_MEM) {
+            s->prefix |= PREFIX_LOCK;
+        }
+        break;
+
+    case X86_SPECIAL_ProtMode:
+        if (!PE(s) || VM86(s)) {
+            goto illegal_op;
+        }
+        break;
+
+    case X86_SPECIAL_i64:
+        if (CODE64(s)) {
+            goto illegal_op;
+        }
+        break;
+    case X86_SPECIAL_o64:
+        if (!CODE64(s)) {
+            goto illegal_op;
+        }
+        break;
+
+    case X86_SPECIAL_NoWriteback:
+        decode.op[0].alu_op_type = X86_ALU_SKIP;
+        break;
+    }
+
+    if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
+        gen_load_ea(s, &decode.mem);
+    }
+    decode.e.gen(s, env, &decode);
+    return s->pc;
+ illegal_op:
+    gen_illegal_opcode(s);
+    return s->pc;
+ unknown_op:
+    gen_unknown_opcode(env, s);
+    return s->pc;
+}
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index 603642d6e1..fb86855501 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1808,10 +1808,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     prefixes = 0;
 
+    if (first) first = false, limit = getenv("LIMIT") ? atol(getenv("LIMIT")) : -1;
+    bool use_new = true;
  next_byte:
+    s->prefix = prefixes;
     b = x86_ldub_code(env, s);
     /* Collect prefixes.  */
     switch (b) {
+    default:
+#ifdef CONFIG_USER_ONLY
+        use_new &= limit > 0;
+#else
+        use_new &= b <= limit;
+#endif
+        if (use_new && 0) {
+            return disas_insn_new(s, cpu, b);
+        }
+    case 0x0f:
+        break;
     case 0xf3:
         prefixes |= PREFIX_REPZ;
         goto next_byte;
@@ -1860,6 +1874,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0xc5: /* 2-byte VEX */
     case 0xc4: /* 3-byte VEX */
+        use_new = false;
         /* VEX prefixes cannot be used except in 32-bit mode.
            Otherwise the instruction is LES or LDS.  */
         if (CODE32(s) && !VM86(s)) {
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
new file mode 100644
index 0000000000..688aca86f6
--- /dev/null
+++ b/target/i386/tcg/emit.c.inc
@@ -0,0 +1,10 @@
+static void gen_illegal(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_illegal_opcode(s);
+}
+
+static void gen_load_ea(DisasContext *s, AddressParts *mem)
+{
+    TCGv ea = gen_lea_modrm_1(s, *mem);
+    gen_lea_v_seg(s, s->aflag, ea, mem->def_seg, s->override);
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5c4b685de7..9b925c7ec8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -71,6 +71,9 @@ typedef struct DisasContext {
     int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
     uint8_t prefix;
 
+    bool has_modrm;
+    uint8_t modrm;
+
 #ifndef CONFIG_USER_ONLY
     uint8_t cpl;   /* code priv level */
     uint8_t iopl;  /* i/o priv level */
@@ -2316,6 +2319,31 @@ static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, MemOp ot)
     return ret;
 }
 
+static inline target_long insn_get_signed(CPUX86State *env, DisasContext *s, MemOp ot)
+{
+    target_long ret;
+
+    switch (ot) {
+    case MO_8:
+        ret = (int8_t) x86_ldub_code(env, s);
+        break;
+    case MO_16:
+        ret = (int16_t) x86_lduw_code(env, s);
+        break;
+    case MO_32:
+        ret = (int32_t) x86_ldl_code(env, s);
+        break;
+#ifdef TARGET_X86_64
+    case MO_64:
+        ret = x86_ldq_code(env, s);
+        break;
+#endif
+    default:
+        tcg_abort();
+    }
+    return ret;
+}
+
 static inline int insn_const_size(MemOp ot)
 {
     if (ot <= MO_32) {
@@ -2787,6 +2815,9 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
     tcg_gen_movi_i64(s->tmp1_i64, 0);
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
 }
+
+static bool first = true; static unsigned long limit;
+#include "decode-new.c.inc"
 #include "decode-old.c.inc"
 
 void tcg_x86_init(void)
-- 
2.37.1



