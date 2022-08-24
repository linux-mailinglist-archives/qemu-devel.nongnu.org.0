Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7B5A00AF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:47:34 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuTV-00010G-Nu
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuEL-0001hw-Rd
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuE8-0003i5-9R
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZL4F7ZNvAr6VdsW4su/kjiv3FAUVKYaKaXXFtObEzM=;
 b=crdebNz78bqx+xOUjEeVPOdcCbGBPraOp9aZ0sV4+sr6/UJH4MiDVug7UGyHWHMw7BG5Wo
 9QJezakschkt7zuPsg4QM2MgktMfg2gTu4vp6YWangkZlvAi22STx45q4ktSDaUl6uVey1
 u/NOC1L8H3tEjRJCZ5VCtdpaO/42gIA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-Cu3V6WHROIiQOb0PsL8A_Q-1; Wed, 24 Aug 2022 13:31:33 -0400
X-MC-Unique: Cu3V6WHROIiQOb0PsL8A_Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so1103504wma.7
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VZL4F7ZNvAr6VdsW4su/kjiv3FAUVKYaKaXXFtObEzM=;
 b=Yu+DdG3H3aDH3vItJBiTwNmDdv988W0fTx7DMkBHZLm9z6q6lCIrJ23sfst6BP9cS9
 wWowwrfOaK/VSFwcDpzEeLx2RywcM7eYqvembsY6oG0sKXUoRuM5OZun8CdYkdUHJ9HW
 9xnh5baR4UMCFBmgy5mLkx44zkt220SaB+EG25GA8I7K5iob+pqxumTEL3Ks/SyIfy1Q
 TOp1emGW1S1O3rcZ87vU8BezVRvY8VuLK/wOq7vjSnWpjODd2QR2vouirLgT0Azob3U5
 EKMctj8FO3igZrfhAMOi0JzEoDdz84gsP6sW6zPUZkbZXLGpf8f8QpdvQyc7+BYZKKjC
 gUEg==
X-Gm-Message-State: ACgBeo2vu7GCJT9688mpdfxAjlTh2d9PJfGkYhuhmXPRsVT/xj392ppc
 U3CQxmeGszTkVvNoXCEoAG1W+pMOUtM3rnJWv6Qb9V/9iuakPOmp/M1QTpX7J2SY3hVevIk+sLr
 eaGfVWIsZp7NhNgck4acR1TbmCbQcP4X+cboz1b7qvVLYFDvNTGDUzwRd1VWf1tRBfFg=
X-Received: by 2002:a5d:5350:0:b0:225:7560:8403 with SMTP id
 t16-20020a5d5350000000b0022575608403mr129784wrv.507.1661362291228; 
 Wed, 24 Aug 2022 10:31:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4i66GVcPOzQySgqPPStpeOXWAjPSRuUMxihN1egS/K6k7G6VmcGChAaceXjG1BLDbzGCjZWg==
X-Received: by 2002:a5d:5350:0:b0:225:7560:8403 with SMTP id
 t16-20020a5d5350000000b0022575608403mr129768wrv.507.1661362290934; 
 Wed, 24 Aug 2022 10:31:30 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 b18-20020a5d6352000000b002252751629dsm17312648wrw.24.2022.08.24.10.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:31:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 04/17] target/i386: add ALU load/writeback core
Date: Wed, 24 Aug 2022 19:31:10 +0200
Message-Id: <20220824173123.232018-5-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add generic code generation that takes care of preparing operands
around calls to decode.e.gen in a table-driven manner, so that ALU
operations need not take care of that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 14 +++++++-
 target/i386/tcg/emit.c.inc       | 62 ++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index d661f1f6f0..b53afea9c8 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -133,6 +133,7 @@ typedef struct X86DecodedOp {
     MemOp ot;     /* For b/c/d/p/s/q/v/w/y/z */
     X86ALUOpType alu_op_type;
     bool has_ea;
+    TCGv v;
 } X86DecodedOp;
 
 struct X86DecodedInsn {
@@ -987,7 +988,18 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
     if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
         gen_load_ea(s, &decode.mem);
     }
-    decode.e.gen(s, env, &decode);
+    if (s->prefix & PREFIX_LOCK) {
+        if (decode.op[0].alu_op_type != X86_ALU_MEM) {
+            goto illegal_op;
+        }
+        gen_load(s, s->T1, &decode.op[2], decode.immediate);
+        decode.e.gen(s, env, &decode);
+    } else {
+        gen_load(s, s->T0, &decode.op[1], decode.immediate);
+        gen_load(s, s->T1, &decode.op[2], decode.immediate);
+        decode.e.gen(s, env, &decode);
+        gen_writeback(s, &decode.op[0]);
+    }
     return s->pc;
  illegal_op:
     gen_illegal_opcode(s);
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 688aca86f6..93d14ff793 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -8,3 +8,65 @@ static void gen_load_ea(DisasContext *s, AddressParts *mem)
     TCGv ea = gen_lea_modrm_1(s, *mem);
     gen_lea_v_seg(s, s->aflag, ea, mem->def_seg, s->override);
 }
+
+static void gen_load(DisasContext *s, TCGv v, X86DecodedOp *op, uint64_t imm)
+{
+    switch (op->alu_op_type) {
+    case X86_ALU_SKIP:
+        return;
+    case X86_ALU_SEG:
+        tcg_gen_ld32u_tl(v, cpu_env,
+                         offsetof(CPUX86State,segs[op->n].selector));
+        break;
+    case X86_ALU_CR:
+        tcg_gen_ld_tl(v, cpu_env, offsetof(CPUX86State, cr[op->n]));
+        break;
+    case X86_ALU_DR:
+        tcg_gen_ld_tl(v, cpu_env, offsetof(CPUX86State, dr[op->n]));
+        break;
+    case X86_ALU_GPR:
+        gen_op_mov_v_reg(s, op->ot, v, op->n);
+        break;
+    case X86_ALU_MEM:
+        assert(op->has_ea);
+        gen_op_ld_v(s, op->ot, v, s->A0);
+        break;
+    case X86_ALU_IMM:
+        tcg_gen_movi_tl(v, imm);
+        break;
+    }
+    op->v = v;
+}
+
+static void gen_writeback(DisasContext *s, X86DecodedOp *op)
+{
+    switch (op->alu_op_type) {
+    case X86_ALU_SKIP:
+        break;
+    case X86_ALU_SEG:
+        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
+        gen_movl_seg_T0(s, op->n);
+        if (s->base.is_jmp) {
+            gen_jmp_im(s, s->pc - s->cs_base);
+            if (op->n == R_SS) {
+                s->flags &= ~HF_TF_MASK;
+                gen_eob_inhibit_irq(s, true);
+            } else {
+                gen_eob(s);
+            }
+        }
+        break;
+    case X86_ALU_CR:
+    case X86_ALU_DR:
+        /* TBD */
+        break;
+    case X86_ALU_GPR:
+        gen_op_mov_reg_v(s, op->ot, op->n, s->T0);
+        break;
+    case X86_ALU_MEM:
+        gen_op_st_v(s, op->ot, s->T0, s->A0);
+        break;
+    default:
+        abort();
+    }
+}
-- 
2.37.1



