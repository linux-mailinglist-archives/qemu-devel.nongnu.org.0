Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40E5A007F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:37:13 +0200 (CEST)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuJU-0007ji-J8
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuEE-0001eQ-EH
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuE9-0003ic-4z
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oi3v8wyEHTnNVGvVtjbZW4JGahDFUEA1SL8MH2Bc040=;
 b=N+vrgObsf+zgpBQFKWAYCF0Lovd7QA45gN3ELQWTUzDORxcFNux8HPE8z4Sqg7Z2CWbbuU
 AGeAoivBVpbji1wl+533Xsw8qSWnuR1qe3Zt4uWwZnfwusWMq28IPh51NKXK3btoKJYQuG
 QWFz2xTbl8X//r10oEH4BebKXuNpsOg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-Ayp0SQQZOaOwIHmMvt8cKA-1; Wed, 24 Aug 2022 13:31:36 -0400
X-MC-Unique: Ayp0SQQZOaOwIHmMvt8cKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bca56000000b003a652939bd1so588681wml.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oi3v8wyEHTnNVGvVtjbZW4JGahDFUEA1SL8MH2Bc040=;
 b=At8dGjnwgCnjYlq9BkP5Pdvart0K8vWvnJocnR8phAEpSrXYzKEamZzs5e7WRtQyGh
 mvpBuHElJMHj+0tukh7hbpA5hw3KYCVl/EFyv/+85eQyOG9wZ901ru5dJ3zGIu6k1j0C
 c9whH03MmSkXI8tEtj8wi7NejJMc0E8Fsfj5TEQkkuF56JsyCvxqORUk/WMCkafi5GOi
 4WOq6tN5uHEtUVBGN09+0RQ/EuzhbcHOtD4U3u01qyx8eAGfM8RBkwDoySCEmS39FcJg
 ZaFnrGA6/6YZO7BxLk4PU2Z9nUQxWOwLdKHUyEKNkdmW0FlNYL04xY5IcxRSt5zxJFcW
 /dyg==
X-Gm-Message-State: ACgBeo36HJydXXBb5pr2zyQ5U02bJndmArNMX3wKakQ1zk9/wjaWU3oT
 P2G38nF+K1W1Ijx4f+xEtpdjv7sv7ZLB1Ur4GSMjgGGv2Z5LokMRIrQDS2KIwdvBgjFA0avUfht
 KoPBmiHCaZOV3Tleii7RkQDd3hEEIhjanIcmPNFeWDgt6ZMn0uygJm5M3a9n8bUjL53I=
X-Received: by 2002:a7b:c851:0:b0:3a5:f211:45cd with SMTP id
 c17-20020a7bc851000000b003a5f21145cdmr6084447wml.156.1661362293222; 
 Wed, 24 Aug 2022 10:31:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ubTBbiWxpAJvjR+7Sd4V588FwJH5MzSI2jq3BPNk+sAAq1+S2x26ysxQpcWvwd26O3xLaRw==
X-Received: by 2002:a7b:c851:0:b0:3a5:f211:45cd with SMTP id
 c17-20020a7bc851000000b003a5f21145cdmr6084435wml.156.1661362292887; 
 Wed, 24 Aug 2022 10:31:32 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b002250f9abdefsm20353650wrw.117.2022.08.24.10.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:31:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 05/17] target/i386: add 00-07, 10-17 opcodes
Date: Wed, 24 Aug 2022 19:31:11 +0200
Message-Id: <20220824173123.232018-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824173123.232018-1-pbonzini@redhat.com>
References: <20220824173123.232018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

For simplicity, this also brings in the entire implementation of ALU
operations from the old decoder.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  16 +++++
 target/i386/tcg/emit.c.inc       | 109 +++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index b53afea9c8..6d0d6a683c 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -464,8 +464,24 @@ static void decode_twobyte(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
 
 static X86OpEntry A2_00_F7[16][8] = {
     {
+        X86_OP_ENTRY2(ADD, E,b, G,b),
+        X86_OP_ENTRY2(ADD, E,v, G,v),
+        X86_OP_ENTRY2(ADD, G,b, E,b),
+        X86_OP_ENTRY2(ADD, G,v, E,v),
+        X86_OP_ENTRY2(ADD, 0,b, I,b),   /* AL, Ib */
+        X86_OP_ENTRY2(ADD, 0,v, I,z),   /* rAX, Iz */
+        X86_OP_ENTRYr(PUSH, ES, w, i64),
+        X86_OP_ENTRYw(POP, ES, w, i64)
     },
     {
+        X86_OP_ENTRY2(ADC, E,b, G,b),
+        X86_OP_ENTRY2(ADC, E,v, G,v),
+        X86_OP_ENTRY2(ADC, G,b, E,b),
+        X86_OP_ENTRY2(ADC, G,v, E,v),
+        X86_OP_ENTRY2(ADC, 0,b, I,b),   /* AL, Ib */
+        X86_OP_ENTRY2(ADC, 0,v, I,z),   /* rAX, Iz */
+        X86_OP_ENTRYr(PUSH, SS, w, i64),
+        X86_OP_ENTRYw(POP, SS, w, i64)
     },
     {
     },
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 93d14ff793..758e468a25 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -38,6 +38,115 @@ static void gen_load(DisasContext *s, TCGv v, X86DecodedOp *op, uint64_t imm)
     op->v = v;
 }
 
+static void gen_alu_op(DisasContext *s1, int op, MemOp ot)
+{
+    switch(op) {
+    case OP_ADCL:
+        gen_compute_eflags_c(s1, s1->tmp4);
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_add_tl(s1->T0, s1->tmp4, s1->T1);
+            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T0,
+                                        s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_add_tl(s1->T0, s1->T0, s1->T1);
+            tcg_gen_add_tl(s1->T0, s1->T0, s1->tmp4);
+        }
+        gen_op_update3_cc(s1, s1->tmp4);
+        set_cc_op(s1, CC_OP_ADCB + ot);
+        break;
+    case OP_SBBL:
+        gen_compute_eflags_c(s1, s1->tmp4);
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_add_tl(s1->T0, s1->T1, s1->tmp4);
+            tcg_gen_neg_tl(s1->T0, s1->T0);
+            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T0,
+                                        s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_sub_tl(s1->T0, s1->T0, s1->T1);
+            tcg_gen_sub_tl(s1->T0, s1->T0, s1->tmp4);
+        }
+        gen_op_update3_cc(s1, s1->tmp4);
+        set_cc_op(s1, CC_OP_SBBB + ot);
+        break;
+    case OP_ADDL:
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T1,
+                                        s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_add_tl(s1->T0, s1->T0, s1->T1);
+        }
+        gen_op_update2_cc(s1);
+        set_cc_op(s1, CC_OP_ADDB + ot);
+        break;
+    case OP_SUBL:
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_neg_tl(s1->T0, s1->T1);
+            tcg_gen_atomic_fetch_add_tl(s1->cc_srcT, s1->A0, s1->T0,
+                                        s1->mem_index, ot | MO_LE);
+            tcg_gen_sub_tl(s1->T0, s1->cc_srcT, s1->T1);
+        } else {
+            tcg_gen_mov_tl(s1->cc_srcT, s1->T0);
+            tcg_gen_sub_tl(s1->T0, s1->T0, s1->T1);
+        }
+        gen_op_update2_cc(s1);
+        set_cc_op(s1, CC_OP_SUBB + ot);
+        break;
+    default:
+    case OP_ANDL:
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_atomic_and_fetch_tl(s1->T0, s1->A0, s1->T1,
+                                        s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_and_tl(s1->T0, s1->T0, s1->T1);
+        }
+        gen_op_update1_cc(s1);
+        set_cc_op(s1, CC_OP_LOGICB + ot);
+        break;
+    case OP_ORL:
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_atomic_or_fetch_tl(s1->T0, s1->A0, s1->T1,
+                                       s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_or_tl(s1->T0, s1->T0, s1->T1);
+        }
+        gen_op_update1_cc(s1);
+        set_cc_op(s1, CC_OP_LOGICB + ot);
+        break;
+    case OP_XORL:
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_atomic_xor_fetch_tl(s1->T0, s1->A0, s1->T1,
+                                        s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_xor_tl(s1->T0, s1->T0, s1->T1);
+        }
+        gen_op_update1_cc(s1);
+        set_cc_op(s1, CC_OP_LOGICB + ot);
+        break;
+    }
+}
+
+static void gen_ADC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_ADCL, decode->op[0].ot);
+}
+
+static void gen_ADD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_ADDL, decode->op[0].ot);
+}
+
+static void gen_PUSH(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_push_v(s, decode->op[2].v);
+}
+
+static void gen_POP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = gen_pop_T0(s);
+    /* NOTE: order is important for pop %sp */
+    gen_pop_update(s, ot);
+}
+
 static void gen_writeback(DisasContext *s, X86DecodedOp *op)
 {
     switch (op->alu_op_type) {
-- 
2.37.1



