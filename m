Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EA59509A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 00:17:51 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzpyH-0002pc-V2
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 18:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMr-0002lI-2s
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMp-0006qw-Mz
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:08 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42603)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMp-0006pz-H4
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:07 -0400
Received: by mail-pg1-x543.google.com with SMTP id p3so1925427pgb.9
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mDWM/Osv7r5Ybg7vyJ1eX9OFfB4jiv5oRDsEzB095y0=;
 b=rwPNNUYqAr6ROe53LH13bsnwtZvO7sqGWIuDuiJzbccjgf8ozzGbwZeBTHhqJMwhNG
 vvampvlbbuTnrI8sOrfsab79guqG06xUlVnXeGDZchNQ26uptm2uedtsGQ1KsW4xHqZf
 mO0dElKyymHr40HN3QewdFJ3itP9mbLwpvgN3aeEmghbVB6Ihqy5jiS8xSNEZ9y3o3Zy
 I5MabClIC8D3DxMjlXEvtbsIol7MQChqoAVfD8KrFTLpciEhnstjFUITU6JgEiz02Cw7
 pRtEIxwq+H7Jt2nKZVxD5yyxuKbo+9ve4asxJmLbnPei7sGErDE1WWPpglIm2x+lvc4G
 ZJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mDWM/Osv7r5Ybg7vyJ1eX9OFfB4jiv5oRDsEzB095y0=;
 b=gfIdqfasWsAVQXRZ/RBCWaGh0s6OcEOMpuv2JhHSkc0kJa2lTo53d4nJIE7nzb/FNO
 aL7SPT9SsIKVXp4zaHNmFl2hRPsg7b9Iq+laxDJN4Ai3dL9zlqL1BPm7mMgBdPZ+Z3GA
 6Y0xQHjKvHQD2US1K2z8tPvFH0tcSEMDPTtPIGPaQHnonmmPoXzwH/OzEpejoH9CacCe
 q0S5nJXwd8jt8YQ+a307HF9sg8wca34LdaUpV9dra3s0zXUXdIFswn6ry8IYnThBeu+j
 pMFdG0AmTw8FphSzL6kQu/VzaRvaMozhkNTf06dZBE+DTrvpIM6UF0D56W7NnQ3J0LHk
 dodQ==
X-Gm-Message-State: APjAAAUjd/ARD27wkblewVVvJcnvQjVsqqb6hdVSWhW18DQ/nDSX5BJN
 ZYwPBBm6EoLw+0n1lkk9wjPzbVdYiME=
X-Google-Smtp-Source: APXvYqyWcvfNCQA/nzYxi4OuaT5ELmueLDK/OVobiGCocBVgbHN3prZrOb7eOJx8n0u9TbHB3Z2waw==
X-Received: by 2002:a17:90a:a40f:: with SMTP id
 y15mr21067641pjp.69.1566250746122; 
 Mon, 19 Aug 2019 14:39:06 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:43 -0700
Message-Id: <20190819213755.26175-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v2 56/68] target/arm: Convert T16,
 Change processor state
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 85 ++++++++++++++++++++----------------------
 target/arm/t16.decode  | 12 ++++++
 2 files changed, 52 insertions(+), 45 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 414c562fb3..368f0ab147 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7474,6 +7474,11 @@ static int negate(DisasContext *s, int x)
     return -x;
 }
 
+static int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
 static int times_2(DisasContext *s, int x)
 {
     return x * 2;
@@ -10152,6 +10157,9 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
 {
     uint32_t mask, val;
 
+    if (ENABLE_ARCH_6 && arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
     if (IS_USER(s)) {
         /* Implemented as NOP in user mode.  */
         return true;
@@ -10182,6 +10190,36 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
     return true;
 }
 
+static bool trans_CPS_v6m(DisasContext *s, arg_CPS_v6m *a)
+{
+    TCGv_i32 tmp, addr;
+
+    if (!(ENABLE_ARCH_6 && arm_dc_feature(s, ARM_FEATURE_M))) {
+        return false;
+    }
+    if (IS_USER(s)) {
+        /* Implemented as NOP in user mode.  */
+        return true;
+    }
+
+    tmp = tcg_const_i32(a->im);
+    /* FAULTMASK */
+    if (a->F) {
+        addr = tcg_const_i32(19);
+        gen_helper_v7m_msr(cpu_env, addr, tmp);
+        tcg_temp_free_i32(addr);
+    }
+    /* PRIMASK */
+    if (a->I) {
+        addr = tcg_const_i32(16);
+        gen_helper_v7m_msr(cpu_env, addr, tmp);
+        tcg_temp_free_i32(addr);
+    }
+    tcg_temp_free_i32(tmp);
+    gen_lookup_tb(s);
+    return true;
+}
+
 /*
  * Clear-Exclusive, Barriers
  */
@@ -10783,51 +10821,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             break;
         }
 
-        case 6:
-            switch ((insn >> 5) & 7) {
-            case 2:
-                /* setend */
-                ARCH(6);
-                if (((insn >> 3) & 1) != !!(s->be_data == MO_BE)) {
-                    gen_helper_setend(cpu_env);
-                    s->base.is_jmp = DISAS_UPDATE;
-                }
-                break;
-            case 3:
-                /* cps */
-                ARCH(6);
-                if (IS_USER(s)) {
-                    break;
-                }
-                if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                    tmp = tcg_const_i32((insn & (1 << 4)) != 0);
-                    /* FAULTMASK */
-                    if (insn & 1) {
-                        addr = tcg_const_i32(19);
-                        gen_helper_v7m_msr(cpu_env, addr, tmp);
-                        tcg_temp_free_i32(addr);
-                    }
-                    /* PRIMASK */
-                    if (insn & 2) {
-                        addr = tcg_const_i32(16);
-                        gen_helper_v7m_msr(cpu_env, addr, tmp);
-                        tcg_temp_free_i32(addr);
-                    }
-                    tcg_temp_free_i32(tmp);
-                    gen_lookup_tb(s);
-                } else {
-                    if (insn & (1 << 4)) {
-                        shift = CPSR_A | CPSR_I | CPSR_F;
-                    } else {
-                        shift = 0;
-                    }
-                    gen_set_psr_im(s, ((insn & 7) << 6), 0, shift);
-                }
-                break;
-            default:
-                goto undef;
-            }
-            break;
+        case 6: /* setend, cps; in decodetree */
+            goto illegal_op;
 
         default:
             goto undef;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index b5b5086e8a..3bf1a31731 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -29,6 +29,8 @@
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 &ldst_block      !extern rn i b u w list
+&setend          !extern E
+&cps             !extern mode imod M A I F
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -183,3 +185,13 @@ SXTAH           1011 0010 00 ... ...            @extend
 SXTAB           1011 0010 01 ... ...            @extend
 UXTAH           1011 0010 10 ... ...            @extend
 UXTAB           1011 0010 11 ... ...            @extend
+
+# Change processor state
+
+%imod           4:1 !function=plus_2
+
+SETEND          1011 0110 010 1 E:1 000         &setend
+{
+  CPS_v6m       1011 0110 011 im:1 00 I:1 F:1
+  CPS           1011 0110 011 . 0 A:1 I:1 F:1   &cps mode=0 M=0 %imod
+}
-- 
2.17.1


