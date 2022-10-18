Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50F602E95
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:34:26 +0200 (CEST)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknfl-0007kR-Ci
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004Rb-51
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiB-0005Hd-Fb
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDXZjCYjQLrNOW0dqzxDO4h2X036GTnfY4eNA8ldCcQ=;
 b=OqbwknJG6BkYsCQg8freQqJDNOypXBULl/SP9B9MJPLGYbtfMbQ5+r0bhVvTbs4boHeP3s
 uvgr4SxM9r0RGycL0OCvf1/Lp/BFQYYmYczuVYMKat29O2jXfOSM2iL/rV8vWvQZ+Ccrrj
 YsVhGTW8l38jH1c0OMm4dokZgZ0TOyw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-o58CwZZNOLSW-KvBIWBFhQ-1; Tue, 18 Oct 2022 09:32:43 -0400
X-MC-Unique: o58CwZZNOLSW-KvBIWBFhQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so4287704edb.22
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDXZjCYjQLrNOW0dqzxDO4h2X036GTnfY4eNA8ldCcQ=;
 b=kD3P+bs04rQ2wav/pnGeFZ7nt7H+XGbDUy0jtzx5wMmrEAKe14aO4wbX0EqzCA7EpZ
 /+YoNLZY/Rve0vT4AwGLOG5opvPqugl8VI4nBJaeCubiSFEUCms1ERA7b/nftdmgIvrZ
 V/eAQH5xYaSD2FsOy1pPyoZUZcLNbWVdsIF7fMHYX1o2WHxWpAbLMH1n+hwyQ8Djiplh
 12i9VXN0zOlKx5b/Dyx3w3ZWN5iTgX/JMj33UnlsMXvRYH0w6D0UkOe3UH0FcyQMMse+
 guHdE3tmIUSIcOMlqOsblwS8zfuvYFFp94cQ+ytBuKZMQulks4XeVJLGhjDC2XEMfp5Z
 ZNeQ==
X-Gm-Message-State: ACrzQf1v7eWQJYvDKufTXnuLy6BcKV6msaf+RAOAtNxnCEib2QslqizK
 aZuEUuFfAjHBEaGSBrv7zdQXEHGwBY6ZKkvcTJwYW4MoHVSSTseOzrlcXNpZj0AgBH/VUu2jhcI
 YAgRidpRDg5DCbJCyNSvwF4UusUSz7ItpNVhd2UB35gdi7QqShlUv9Fuo7Gl7xIgoKvE=
X-Received: by 2002:a17:906:5dae:b0:78e:302f:4218 with SMTP id
 n14-20020a1709065dae00b0078e302f4218mr2586017ejv.22.1666099961547; 
 Tue, 18 Oct 2022 06:32:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6hWK7+8rd9rO7lIitBbQagZmHeoYGHf85H+An8HAzeeDg/QMN3sdYKwDlHULBSW+FdoUjviQ==
X-Received: by 2002:a17:906:5dae:b0:78e:302f:4218 with SMTP id
 n14-20020a1709065dae00b0078e302f4218mr2585990ejv.22.1666099961155; 
 Tue, 18 Oct 2022 06:32:41 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 l3-20020aa7cac3000000b0045723aa48ccsm8757590edt.93.2022.10.18.06.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 36/53] target/i386: reimplement 0x0f 0xd8-0xdf, 0xe8-0xef,
 0xf8-0xff, add AVX
Date: Tue, 18 Oct 2022 15:30:25 +0200
Message-Id: <20221018133042.856368-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

These are more simple integer instructions present in both MMX and SSE/AVX,
with no holes that were later occupied by newer instructions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 28 ++++++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 32 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  4 +++-
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 8a749f33fd..a160a0b7a3 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -273,6 +273,34 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x6d] = X86_OP_ENTRY3(PUNPCKHQDQ, V,x, H,x, W,x,  vex4 p_66 avx2_256),
     [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
     [0x6f] = X86_OP_GROUP0(0F6F),
+
+    /* Incorrectly missing from 2-17 */
+    [0xd8] = X86_OP_ENTRY3(PSUBUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xd9] = X86_OP_ENTRY3(PSUBUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xda] = X86_OP_ENTRY3(PMINUB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdb] = X86_OP_ENTRY3(PAND,     V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdc] = X86_OP_ENTRY3(PADDUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdd] = X86_OP_ENTRY3(PADDUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xde] = X86_OP_ENTRY3(PMAXUB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xdf] = X86_OP_ENTRY3(PANDN,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+
+    [0xe8] = X86_OP_ENTRY3(PSUBSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xe9] = X86_OP_ENTRY3(PSUBSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xea] = X86_OP_ENTRY3(PMINSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xeb] = X86_OP_ENTRY3(POR,     V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xec] = X86_OP_ENTRY3(PADDSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xed] = X86_OP_ENTRY3(PADDSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xee] = X86_OP_ENTRY3(PMAXSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xef] = X86_OP_ENTRY3(PXOR,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+
+    [0xf8] = X86_OP_ENTRY3(PSUBB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xf9] = X86_OP_ENTRY3(PSUBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfa] = X86_OP_ENTRY3(PSUBD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfb] = X86_OP_ENTRY3(PSUBQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfc] = X86_OP_ENTRY3(PADDB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfd] = X86_OP_ENTRY3(PADDW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0xfe] = X86_OP_ENTRY3(PADDD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    /* 0xff = UD0 */
 };
 
 static void do_decode_0F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 8dbacc21ed..0d35a8627f 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -328,9 +328,31 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
          decode->op[2].offset, vec_len, vec_len);                                  \
 }
 
+BINARY_INT_GVEC(PADDB,   tcg_gen_gvec_add, MO_8)
+BINARY_INT_GVEC(PADDW,   tcg_gen_gvec_add, MO_16)
+BINARY_INT_GVEC(PADDD,   tcg_gen_gvec_add, MO_32)
+BINARY_INT_GVEC(PADDSB,  tcg_gen_gvec_ssadd, MO_8)
+BINARY_INT_GVEC(PADDSW,  tcg_gen_gvec_ssadd, MO_16)
+BINARY_INT_GVEC(PADDUSB, tcg_gen_gvec_usadd, MO_8)
+BINARY_INT_GVEC(PADDUSW, tcg_gen_gvec_usadd, MO_16)
+BINARY_INT_GVEC(PAND,    tcg_gen_gvec_and, MO_64)
 BINARY_INT_GVEC(PCMPGTB, tcg_gen_gvec_cmp, TCG_COND_GT, MO_8)
 BINARY_INT_GVEC(PCMPGTW, tcg_gen_gvec_cmp, TCG_COND_GT, MO_16)
 BINARY_INT_GVEC(PCMPGTD, tcg_gen_gvec_cmp, TCG_COND_GT, MO_32)
+BINARY_INT_GVEC(PMAXSW,  tcg_gen_gvec_smax, MO_16)
+BINARY_INT_GVEC(PMAXUB,  tcg_gen_gvec_umax, MO_8)
+BINARY_INT_GVEC(PMINSW,  tcg_gen_gvec_smin, MO_16)
+BINARY_INT_GVEC(PMINUB,  tcg_gen_gvec_umin, MO_8)
+BINARY_INT_GVEC(POR,     tcg_gen_gvec_or, MO_64)
+BINARY_INT_GVEC(PSUBB,   tcg_gen_gvec_sub, MO_8)
+BINARY_INT_GVEC(PSUBW,   tcg_gen_gvec_sub, MO_16)
+BINARY_INT_GVEC(PSUBD,   tcg_gen_gvec_sub, MO_32)
+BINARY_INT_GVEC(PSUBQ,   tcg_gen_gvec_sub, MO_64)
+BINARY_INT_GVEC(PSUBSB,  tcg_gen_gvec_sssub, MO_8)
+BINARY_INT_GVEC(PSUBSW,  tcg_gen_gvec_sssub, MO_16)
+BINARY_INT_GVEC(PSUBUSB, tcg_gen_gvec_ussub, MO_8)
+BINARY_INT_GVEC(PSUBUSW, tcg_gen_gvec_ussub, MO_16)
+BINARY_INT_GVEC(PXOR,    tcg_gen_gvec_xor, MO_64)
 
 
 /*
@@ -608,6 +630,16 @@ static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 
 }
 
+static void gen_PANDN(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    /* Careful, operand order is reversed!  */
+    tcg_gen_gvec_andc(MO_64,
+                      decode->op[0].offset, decode->op[2].offset,
+                      decode->op[1].offset, vec_len, vec_len);
+}
+
 static void gen_PDEP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[1].ot;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5133b8c23d..ff5c4bbb56 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4781,7 +4781,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #ifndef CONFIG_USER_ONLY
         use_new &= b <= limit;
 #endif
-        if (use_new && (b >= 0x160 && b <= 0x16f)) {
+        if (use_new &&
+            ((b >= 0x160 && b <= 0x16f) ||
+             (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
         }
-- 
2.37.3


