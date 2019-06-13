Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0F43641
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 15:08:42 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbPT7-00030r-8X
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 09:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOdZ-0008Gm-Sm
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOdU-0004ac-M8
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45254)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbOdU-0004LS-4d
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:15:20 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f9so20488128wre.12
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pAYGcuXLW+jNCf7bXM4RKr51ic5n9fmJq+PJHu/PS/w=;
 b=B4ZehyvKgPIt39ZnVifSsXVpQvA2aqEJVKpgnIh4H8ocTWZf8H/Uk9U7fav70veePn
 cN5uf/1t6dyO6Zoe0cMGxk1qeD5EH3+O3Kko1hRIs9prqwZSOZmsNUfs8hIv7xMwUdcn
 ldpL72XMguYKWaE4UTZaanBOnmnLHqyM4JmsDAMWZTmhPo3jWL6gQxbzKviteagqxd/v
 K7o60idFipD+ELWdxp6HDuMw5zjypdJyP0lxC7VP66iNIwIGkajCsyOIl14Qy6lYOPT6
 SAFfxVQPCTSgnZmF6NQ8Fb0EyUfbsuw3CZStKF/qnHArrSfQDvWNviIphhcPAVOYezw6
 QQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAYGcuXLW+jNCf7bXM4RKr51ic5n9fmJq+PJHu/PS/w=;
 b=NuZRNGuVV29UoeMDoMxnNI7vi/D4umTc1hvfbUexQwgOkO3Kr8T87TzOqGNQHspWsb
 S8MyRf6C3Vpel38ZWPMY7+sxDZKUqTZax8BG/TbHaTNFDhL2H8Hju0KIK81QmdC0uT3D
 o0WY8QNKyNimpWe1APKhbhYVQuli/jq3YwojQydROMM7CnEdo7+sisIRZ1rSmq2YfW3t
 r/FCBvTJ6vhk9i4rYvlEzYDeFD1enOUfscYlF7cTc4IkHDNKuiYgHvhHMg3dF+f470bA
 ncxVgiTn7LnplT+7bFvq3YUTQQ1Nu08T0psBbZPIRQQWkt/LLwYR/kPtyTI0UBj09ESV
 km1g==
X-Gm-Message-State: APjAAAWtWmHC1+w7eKxuVLhrjRGhNoMBUvPj1sWknqim+ZyeqqaeTeXZ
 JXuRtUoNRYztEFEdOYhj77wi8AA6Ed/zjw==
X-Google-Smtp-Source: APXvYqx9M2FcBmuZ9loDR+rjxlOK5cPF18Au5Q8VRG8KQBQmha7BV5xpFS7Ch3L7oFWmkAB7LU6CnA==
X-Received: by 2002:a5d:5089:: with SMTP id a9mr2461264wrt.290.1560428107222; 
 Thu, 13 Jun 2019 05:15:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y6sm2010576wrp.12.2019.06.13.05.15.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 05:15:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 13:14:14 +0100
Message-Id: <20190613121433.5246-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613121433.5246-1-peter.maydell@linaro.org>
References: <20190613121433.5246-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: [Qemu-devel] [PULL 29/48] target/arm: Convert VNMUL to decodetree
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the VNMUL instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 24 ++++++++++++++++++++++++
 target/arm/translate.c         |  7 +------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a2afe82b349..4c684f033b6 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1427,3 +1427,27 @@ static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_muld, a->vd, a->vn, a->vm, false);
 }
+
+static void gen_VNMUL_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muls(vd, vn, vm, fpst);
+    gen_helper_vfp_negs(vd, vd);
+}
+
+static bool trans_VNMUL_sp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VNMUL_sp, a->vd, a->vn, a->vm, false);
+}
+
+static void gen_VNMUL_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muld(vd, vn, vm, fpst);
+    gen_helper_vfp_negd(vd, vd);
+}
+
+static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VNMUL_dp, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 34be68fb8cb..cf03672db8c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1388,7 +1388,6 @@ static inline void gen_vfp_##name(int dp)                             \
 
 VFP_OP2(add)
 VFP_OP2(sub)
-VFP_OP2(mul)
 VFP_OP2(div)
 
 #undef VFP_OP2
@@ -3112,7 +3111,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 4:
+            case 0 ... 5:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3298,10 +3297,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 5: /* nmul: -(fn * fm) */
-                    gen_vfp_mul(dp);
-                    gen_vfp_neg(dp);
-                    break;
                 case 6: /* add: fn + fm */
                     gen_vfp_add(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index d7fcb9709a9..3063fcac23f 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -122,3 +122,8 @@ VMUL_sp      ---- 1110 0.10 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMUL_dp      ---- 1110 0.10 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VNMUL_sp     ---- 1110 0.10 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VNMUL_dp     ---- 1110 0.10 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1


