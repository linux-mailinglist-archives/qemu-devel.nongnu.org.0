Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CD5602F0B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:59:40 +0200 (CEST)
Received: from localhost ([::1]:39202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oko4B-0000B3-BZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmin-0005AJ-LN
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmil-0005SC-Nt
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666100006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+rTt+0maihMoL88ENhVH0IoVmTHIVkAzWPxPUgXPkI=;
 b=Gpxm2eB3OoTzkUJzTZxvmKrP1yGE8hZH8gZXA/8qgT7rm39CaT5wnAeATVHGMS3VBSGCn/
 MLYVbPkoLVZizNLxY4Kc11YK0ThVro6WKaewltHDyHFMaOa49MC9NMFa11If19ERXzuTIA
 e90drdrvwi4Lq8z393JKPsHmrWlDGls=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-cAxmkME-MQe4f3SQ0Sr0aQ-1; Tue, 18 Oct 2022 09:33:25 -0400
X-MC-Unique: cAxmkME-MQe4f3SQ0Sr0aQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 jg38-20020a170907972600b007919b3ad75aso1267095ejc.10
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+rTt+0maihMoL88ENhVH0IoVmTHIVkAzWPxPUgXPkI=;
 b=hHXjDLLeOqJCfuoi0iHgZlam+jQGCxYWMRpYJFqNOBrPgNtmXV1sgXY4WaTelA0obw
 6gIfnUl3DhJER5hKAHBgAjB80Ef9et3kUpFjEEvBWJfyoFjqtznOqz0OMsALLoZXOYbn
 1fsvzmW+gfuLTsLQkcigSZTm9+gvI9nsulmtuJV2xmDqPV1v5WPp0j1RNREvUKF96lf9
 KhkT/vEGSptXf4QginrQjetW7vehcNNRf/4T3X+vxszLu+bjjrK9+Y4/SYuJaAWPvBJq
 WL55uet7NWTPI8al2VhcwWU6r1sucEYsz+5GmcB0APasOlKWyVgoGHycqVuNdEoM5JhC
 QdQw==
X-Gm-Message-State: ACrzQf0RQeUPzAxxsThKUmAKrlF0jdCuQpecEo0Kj7aEb8DoPQxqZk8D
 8DHSGcREYOvu2c83JK8Pg9PEOBEeuHAvlJxWSKfxbeKKC9J+Wqc39UgL+pTPmeVfyeyJiVctIsu
 Bwgh+lnw16UtPAbZh0kBbQ9xzwbOZGmz6WCk8GmUejZ1HXRcVGzGVNch19I9qupyeNJY=
X-Received: by 2002:a17:907:2c75:b0:78d:c201:e9aa with SMTP id
 ib21-20020a1709072c7500b0078dc201e9aamr2430542ejc.235.1666100003602; 
 Tue, 18 Oct 2022 06:33:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/e+VPxC9etXpEBameACk9hgPyWhYIMLHMvulthSvzphF01eFY2TdgW83hzb+nMfPXTNLUyg==
X-Received: by 2002:a17:907:2c75:b0:78d:c201:e9aa with SMTP id
 ib21-20020a1709072c7500b0078dc201e9aamr2430524ejc.235.1666100003318; 
 Tue, 18 Oct 2022 06:33:23 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906292100b00773f3cb67ffsm7535672ejd.28.2022.10.18.06.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 49/53] target/i386: implement VLDMXCSR/VSTMXCSR
Date: Tue, 18 Oct 2022 15:30:38 +0200
Message-Id: <20221018133042.856368-50-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are exactly the same as the non-VEX version, but one has to be careful
that only VEX.L=0 is allowed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 25 +++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 20 ++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index a5d5428260..5f4268bdfb 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -82,6 +82,10 @@
 
 #define X86_OP_ENTRY2(op, op0, s0, op1, s1, ...)                  \
     X86_OP_ENTRY3(op, op0, s0, 2op, s0, op1, s1, ## __VA_ARGS__)
+#define X86_OP_ENTRYw(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, op0, s0, None, None, None, None, ## __VA_ARGS__)
+#define X86_OP_ENTRYr(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, None, None, None, None, op0, s0, ## __VA_ARGS__)
 #define X86_OP_ENTRY0(op, ...)                                    \
     X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
 
@@ -149,6 +153,25 @@ static inline const X86OpEntry *decode_by_prefix(DisasContext *s, const X86OpEnt
     }
 }
 
+static void decode_group15(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    /* only includes ldmxcsr and stmxcsr, because they have AVX variants.  */
+    static const X86OpEntry group15_reg[8] = {
+    };
+
+    static const X86OpEntry group15_mem[8] = {
+        [2] = X86_OP_ENTRYr(LDMXCSR,    E,d, vex5),
+        [3] = X86_OP_ENTRYw(STMXCSR,    E,d, vex5),
+    };
+
+    uint8_t modrm = get_modrm(s, env);
+    if ((modrm >> 6) == 3) {
+        *entry = group15_reg[(modrm >> 3) & 7];
+    } else {
+        *entry = group15_mem[(modrm >> 3) & 7];
+    }
+}
+
 static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86GenFunc group17_gen[8] = {
@@ -830,6 +853,8 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP0(0F7F),
 
+    [0xae] = X86_OP_GROUP0(group15),
+
     [0xc2] = X86_OP_ENTRY4(VCMP,       V,x, H,x, W,x,       vex2_rep3 p_00_66_f3_f2),
     [0xc4] = X86_OP_ENTRY4(PINSRW,     V,dq,H,dq,E,w,       vex5 mmx p_00_66),
     [0xc5] = X86_OP_ENTRY3(PEXTRW,     G,d, U,dq,I,b,       vex5 mmx p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 266e7499ad..d7c2290db1 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1099,6 +1099,16 @@ static void gen_INSERTQ_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
     gen_helper_insertq_r(cpu_env, OP_PTR0, OP_PTR2);
 }
 
+static void gen_LDMXCSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->vex_l) {
+        gen_illegal_opcode(s);
+        return;
+    }
+    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T1);
+    gen_helper_ldmxcsr(cpu_env, s->tmp2_i32);
+}
+
 static void gen_MASKMOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
@@ -1688,6 +1698,16 @@ static void gen_VAESKEYGEN(DisasContext *s, CPUX86State *env, X86DecodedInsn *de
     gen_helper_aeskeygenassist_xmm(cpu_env, OP_PTR0, OP_PTR1, imm);
 }
 
+static void gen_STMXCSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->vex_l) {
+        gen_illegal_opcode(s);
+        return;
+    }
+    gen_helper_update_mxcsr(cpu_env);
+    tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, mxcsr));
+}
+
 static void gen_VAESIMC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     assert(!s->vex_l);
-- 
2.37.3


