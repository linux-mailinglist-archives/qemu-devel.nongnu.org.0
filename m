Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376775FE501
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:10:18 +0200 (CEST)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6PB-0003Ro-94
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj644-0002tj-IG
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj642-0005Lv-Q6
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQtOx2llSZVuu9ce9q0XarL83jV3E780EhdVaB39olw=;
 b=ZABlV929ZYf10StbJ0rJBPnMQpZ/08ynXMD6OnaL9u5qxjVz1kWofL9igIkH+IxjG9sck3
 d9uIp0/IynPqdUa9WWH9JIIAfrezjnxPoV1xV7V4f3Bfu7StbV4SyQ8oIds29nOr1Uk9Qo
 zNH3MdPJvmPPNM9OgVCjbep5v11H5SM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-NEBplf_JP_ObDED4fksLJQ-1; Thu, 13 Oct 2022 17:48:25 -0400
X-MC-Unique: NEBplf_JP_ObDED4fksLJQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x4-20020a05640226c400b0045c09fc1bd4so2317706edd.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQtOx2llSZVuu9ce9q0XarL83jV3E780EhdVaB39olw=;
 b=Zd8wOsVx2I+6cwm+po+8dzukf8AIkFClSWE+9TyuttC8wZs8RNJ9YMURPyajgpWBUl
 /VYgOJ4PkXOsmRD1q+xb5R7ESMuUDfrwsXP11H1Qy/hYLriT5Pq3TOuH1XbWlf/0RyDm
 AZEyC9kRCD94H2yBjPGI3GOXutfTt8Unlkw7RrZyVRX5YzNSrQS5OMpK7rr8wLTAziHQ
 ktOD8VPaG3dFgd+FhdvipxTfka5tLSn2SHUMldDQDZ+4AlSz9VXkOsyt1USGT8YRCKU0
 fe+kzoDaVEVPX+MQ/CCHbLjpGkpUdvKbV1klMFJMdd9//+VuBKuXgaAgGm5e34G7fUat
 WooQ==
X-Gm-Message-State: ACrzQf0nx8Sc61cWPozAyHZrzzwHKIIAStbgOCZVtplh6k/hkGAj3a9j
 JBdWx4ziDq/jWNd4N3k4zZm3KxsVogW6yl5cEBninXsA5nKJfpU6a2uP2WdPDKQ6OMAZ5ngj/0k
 l+/u9hY+k1p7WcGz8cCH50U7t00O9VzlHMblLmfPtsbACr6c8UQHrD47EsE1cqZ84/GQ=
X-Received: by 2002:a17:906:1e08:b0:73d:c724:4876 with SMTP id
 g8-20020a1709061e0800b0073dc7244876mr1313940ejj.62.1665697703475; 
 Thu, 13 Oct 2022 14:48:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/ZS7juMyOv0DeaYQuDkShlfP663j1+aUDy7sUtOmVAdNthBWJJLc/CepfsIR3ySvGHFJMdw==
X-Received: by 2002:a17:906:1e08:b0:73d:c724:4876 with SMTP id
 g8-20020a1709061e0800b0073dc7244876mr1313928ejj.62.1665697703124; 
 Thu, 13 Oct 2022 14:48:23 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a0564020f1200b00458a03203b1sm541063eda.31.2022.10.13.14.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 31/35] target/i386: implement VLDMXCSR/VSTMXCSR
Date: Thu, 13 Oct 2022 23:46:47 +0200
Message-Id: <20221013214651.672114-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index 2105d080b4..20ab702c0f 100644
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
@@ -837,6 +860,8 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP0(0F7F),
 
+    [0xae] = X86_OP_GROUP0(group15),
+
     [0xc2] = X86_OP_ENTRY4(VCMP,       V,x, H,x, W,x,       vex2_rep3 p_00_66_f3_f2),
     [0xc4] = X86_OP_ENTRY4(PINSRW,     V,dq,H,dq,E,w,       vex5 mmx p_00_66),
     [0xc5] = X86_OP_ENTRY3(PEXTRW,     G,d, U,dq,I,b,       vex5 mmx p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index c4bf47eac2..aa5cd6730f 100644
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
@@ -1693,6 +1703,16 @@ static void gen_VAESKEYGEN(DisasContext *s, CPUX86State *env, X86DecodedInsn *de
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


