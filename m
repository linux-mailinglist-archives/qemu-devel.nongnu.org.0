Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B65B5206
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:43:29 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWbo-0006VK-VH
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1n-000299-Sm
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1k-0007Tl-JT
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMMsdqPj65b1k2EoYmQmlkH+oVmOYz12tl46MzuK+wQ=;
 b=bnSr7jsOqUx3pVYjSZCABz9ox113dcBDypze5PH4hHYjTuyTFJWHDj7rRY2AmOGm62zXFl
 EaL7dfUW51/PjRhnW7wePL7BEQ3An3xGLZlfiAy98nfNDx3QNJHIBeko2VBVGd9HWt5UAo
 0PAe/qZHuxmDYSnwOxC3xs3IMpz0H7k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-yPQWi3j-MhKeR1kf22xUvg-1; Sun, 11 Sep 2022 19:06:04 -0400
X-MC-Unique: yPQWi3j-MhKeR1kf22xUvg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so4946627edc.13
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rMMsdqPj65b1k2EoYmQmlkH+oVmOYz12tl46MzuK+wQ=;
 b=rGwVUjqt+0F5gxms5d7NyDXslvl6oV8IeAZRU93F1lJI/mk6DLCRkaJZe+1dJt47Ag
 j8R4ccjyU4PvaBFD6rTceCLffKJ90ul6xtERe2Yg07j6HDiYWiXDPRKx3Tn4csCPHUDO
 OKX7vBVwpPN11DF6L2M1OEnT+pwrBJKwGJdads7Zas06377uKnk4atKzglJncX5Q4cvP
 +ckt+72I5QIfKS/fQ+3lAD13US7Yb2aZGfMTFfKgcW5bi6dvDpEk4hme1L4WQSEgkjWP
 vc9VZ2DssHf3in0Q+uWq3EE0L8vhmQ1n+zS62Iwo4OV854ofWqUtCp0o20xdWRKmGmZi
 BRrg==
X-Gm-Message-State: ACgBeo2fJXGUbGs3w6blF9cSs4YinAt6pB9Tr0fm0sWFHMjpV0hjHO1a
 AnQpDhWN4TastpSsiKzj3UtcWBt3qG3ahfyGih34Qq+Ck9S+OPtgU16R3nzbV4ddb3NVMSyFjJu
 E3vixyp+s0wSNFalkhAOEfnq3yDrHwIEfsMl4i/PQ207LaZOHvXzoexyUxhn+kLsbmVM=
X-Received: by 2002:a17:907:2be1:b0:770:8268:ec95 with SMTP id
 gv33-20020a1709072be100b007708268ec95mr16558922ejc.105.1662937563049; 
 Sun, 11 Sep 2022 16:06:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR51GzMSZz0w9kdB5Xc4FQiGgY9xFM7LInw/9u3dgdBTNmxGmXt8f8zZkEk1d+rdOYjWhNOBvA==
X-Received: by 2002:a17:907:2be1:b0:770:8268:ec95 with SMTP id
 gv33-20020a1709072be100b007708268ec95mr16558914ejc.105.1662937562710; 
 Sun, 11 Sep 2022 16:06:02 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a170906293100b0077e6be40e4asm237054ejd.175.2022.09.11.16.06.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:06:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/37] target/i386: implement VLDMXCSR/VSTMXCSR
Date: Mon, 12 Sep 2022 01:04:14 +0200
Message-Id: <20220911230418.340941-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

These are exactly the same as the non-VEX version, but one has to be careful
that only VEX.L=0 is allowed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 25 +++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 20 ++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 383a425ccd..e468a32787 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -80,6 +80,10 @@
 
 #define X86_OP_ENTRY2(op, op0, s0, op1, s1, ...)                  \
     X86_OP_ENTRY3(op, op0, s0, 2op, s0, op1, s1, ## __VA_ARGS__)
+#define X86_OP_ENTRYw(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, op0, s0, None, None, None, None, ## __VA_ARGS__)
+#define X86_OP_ENTRYr(op, op0, s0, ...)                           \
+    X86_OP_ENTRY3(op, None, None, None, None, op0, s0, ## __VA_ARGS__)
 #define X86_OP_ENTRY0(op, ...)                                    \
     X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
 
@@ -147,6 +151,25 @@ static inline const X86OpEntry *decode_by_prefix(DisasContext *s, const X86OpEnt
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
@@ -754,6 +777,8 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP3(0F6F,       W,x, None,None, V,x, vex5 mmx p_00_66_f3),
 
+    [0xae] = X86_OP_GROUP0(group15),
+
     [0xc2] = X86_OP_ENTRY4(VCMP,       V,x, H,x, W,x,       vex2_rep3 p_00_66_f3_f2),
     [0xc4] = X86_OP_ENTRY4(PINSRW,     V,dq,H,dq,E,w,       vex5 mmx p_00_66),
     [0xc5] = X86_OP_ENTRY3(PEXTRW,     G,d, U,dq,I,b,       vex5 mmx p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index d61b43f21c..942766de0f 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -979,6 +979,16 @@ static void gen_LDDQU(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_load_sse(s, s->T0, decode->op[0].ot, decode->op[0].offset);
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
@@ -1808,6 +1818,16 @@ static void gen_SSE4a_R(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
     }
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
 static inline void gen_VAESIMC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     assert(!s->vex_l);
-- 
2.37.2



