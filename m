Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46853D9B18
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:31:03 +0200 (CEST)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ut5-0006LI-0g
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG3-0000xf-K6
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:44 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG1-0004oO-5x
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:43 -0400
Received: by mail-pj1-x1035.google.com with SMTP id l19so7870661pjz.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BuFT5vVQ1j/5dx8tNSenLCReq0pA0e4R4ixpnNqAqnA=;
 b=T1YIN4p8SYyFqxXJTxYxJnzUKRaQ6GQfFDIMoeYjRtYv0SeKqDbDcAot1FDmp15AZV
 s48bQ/OhyiyFyc6IkIxnPIeb0dazzJdjdZMXBtZm4Y7ZcuMQAbG3hwEyybACz7WzsQzy
 S3FXCjvcxfI9FhvyYYHKxP0evB7f5hLEt+ebiP17Ys2nL+ufJEb2ucr2ZuHjy9OgDvJM
 x8NTwsALZQ9MAISrtpuQmbI6Y/+LwMOaPxbU6h7he+j5k7cWk9xVyYQDG+e8VTzQNtqM
 Z42WrJsLxXkjD/j3KBmMhMfovORpjGGjxM6OAtl0TJFFt+oT8GL3M3fTWE4mDifzo2Xn
 m/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BuFT5vVQ1j/5dx8tNSenLCReq0pA0e4R4ixpnNqAqnA=;
 b=IWjSrIFPCX+89aOt6g5mYj8UWLMmpILwICeCr06FVBdAONbdq05tks9DBRM/VJ6l5r
 D3Io9YBhZFnJfPvWe/WHkI0zHkdegq21PGMIksojWcioU3BJuGRuvD7T3jHq8rBOBci1
 G/YLOK+qRmNS+np1AMz70iE+t/f2RncqXaQB5PKdLjzXNZ3IFbw9X8v4zwMMNZniN48M
 hC/0wXN7Z34ED1KJW+UESRa9G5AB/HilqiJtYpu16oLt8U8LhlRhwCpTFt5p+XD18365
 p6WclcZFOlr4dLcPA0yd9J5xEtsGls9jbGcwjII4tG+rDey8TRx3YWHVpJJOx+mJzlbl
 cO+Q==
X-Gm-Message-State: AOAM533arRif0jVpjyws86Hy1juYim3CX6b/EbMfERCMq5BlNiuDL/8s
 1ElqQD3ol3WgDm1IluqL62UzeQK9AokbnA==
X-Google-Smtp-Source: ABdhPJwahZ4neASMX1GLIkCZPExg7xn6n7Y67AeEIC8cYIG+p2M6KpjnzPuWJR70inUUQ9K2lPQXmg==
X-Received: by 2002:a65:62da:: with SMTP id m26mr1484841pgv.370.1627519839575; 
 Wed, 28 Jul 2021 17:50:39 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id gg3sm947137pjb.35.2021.07.28.17.50.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:50:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 40/43] linux-user/alpha: Remove TARGET_ALIGNED_ONLY
Date: Wed, 28 Jul 2021 14:46:44 -1000
Message-Id: <20210729004647.282017-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, the Linux kernel fixes up unaligned accesses.
Therefore, as the kernel surrogate, qemu should as well.
No fixups are done for load-locked/store-conditional, so
mark those as MO_ALIGN.

There is a syscall to disable this, and (among other things)
deliver SIGBUS, but it is essentially unused.  A survey of
open source code shows no uses of SSI_NVPAIRS except trivial
examples that show how to disable unaligned fixups.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/alpha-linux-user.mak | 1 -
 target/alpha/translate.c             | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/configs/targets/alpha-linux-user.mak b/configs/targets/alpha-linux-user.mak
index 7e62fd796a..f7d3fb4afa 100644
--- a/configs/targets/alpha-linux-user.mak
+++ b/configs/targets/alpha-linux-user.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=alpha
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index de6c0a8439..8c60e90114 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -293,14 +293,14 @@ static inline void gen_qemu_lds(TCGv t0, TCGv t1, int flags)
 
 static inline void gen_qemu_ldl_l(TCGv t0, TCGv t1, int flags)
 {
-    tcg_gen_qemu_ld_i64(t0, t1, flags, MO_LESL);
+    tcg_gen_qemu_ld_i64(t0, t1, flags, MO_LESL | MO_ALIGN);
     tcg_gen_mov_i64(cpu_lock_addr, t1);
     tcg_gen_mov_i64(cpu_lock_value, t0);
 }
 
 static inline void gen_qemu_ldq_l(TCGv t0, TCGv t1, int flags)
 {
-    tcg_gen_qemu_ld_i64(t0, t1, flags, MO_LEQ);
+    tcg_gen_qemu_ld_i64(t0, t1, flags, MO_LEQ | MO_ALIGN);
     tcg_gen_mov_i64(cpu_lock_addr, t1);
     tcg_gen_mov_i64(cpu_lock_value, t0);
 }
@@ -2840,12 +2840,12 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
     case 0x2E:
         /* STL_C */
         ret = gen_store_conditional(ctx, ra, rb, disp16,
-                                    ctx->mem_idx, MO_LESL);
+                                    ctx->mem_idx, MO_LESL | MO_ALIGN);
         break;
     case 0x2F:
         /* STQ_C */
         ret = gen_store_conditional(ctx, ra, rb, disp16,
-                                    ctx->mem_idx, MO_LEQ);
+                                    ctx->mem_idx, MO_LEQ | MO_ALIGN);
         break;
     case 0x30:
         /* BR */
-- 
2.25.1


