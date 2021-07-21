Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA983D1777
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:05:44 +0200 (CEST)
Received: from localhost ([::1]:33816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ITP-0002zI-Qc
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO2-0002gP-Qd
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:10 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO0-0005gt-Nq
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:10 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q13so720167plx.7
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYPOS53QXxnMU3psldAYFVGdynnCru1uw1bavCP9XhE=;
 b=Jb/pOYJjDz/q09sYg7foqBuen31cwzHeKkb0makL6SnZsnkMHuSyp4b5ctq0DsBU7B
 4xGRQDy5VvcZrg8sVXj6nCJJp/ufrhn8ZnxA6n3lDdw6BW6UBXa13VJ5jzmrUaX8krz/
 wYojUTmLzv6PYYD0klYz9RZlo26ZMnspsu7w2QAnHAFY5QaVr0eOkLoH6+H8Nr9j+MCH
 ZRZD5+mLA6IpX3AT3gYQQ0CUE5JKuwfV8vHjt8kg4TehnjBqP5em2Z0UpwCCZAyomvQe
 Xm9p0hDtzy2EPb6TrDecve6cw8Yy4/37Vwal5MECk6SqHOStxnibKiMA+WIgiqtOlZzV
 YSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYPOS53QXxnMU3psldAYFVGdynnCru1uw1bavCP9XhE=;
 b=Lv6N/15eXPEWZiEdkaYr9MOercdNBRC+ELisqjpOEx6G+Ey/pCbFCFPz+5HeoE0El9
 Pk0XOKHwt5KHvcOnmpZLflzimC1W3zzjDNhYf1dhmTrrnB7Le1LjXWroUfY70TIT+1ye
 GqdgN566uTnzdAVnxJWg/6undwkziSXCNCN9nf4V0CVxnM4uRFJROOyO2HRnxaaN+rfr
 cF1aoB+hREBMepSkVhbNG2R1u57Ck1vlWJXmRfLHP6hEU9eYdrfeE976okb+gfN9w7HX
 HCHmM/l0/N+nG0GVA3MUxv6K6e9WOxqXxGLSQzQf63ZMQbO1YR6WZN17U4+cALdx5IaK
 7KKw==
X-Gm-Message-State: AOAM533f7vMNQd7G+sLzRYzOYzTDHEv3BI6vPFv9FYJTw+2S2Sp/NYjq
 dMvnWmCeLx0oww58QNMJ+BrBv/YheCev9A==
X-Google-Smtp-Source: ABdhPJzoaI0S04QwpWsW+0NPBemJ0Kx/J2TSyMnLze9C9sSXrA3mX3r15I1mjJ5cE+ABfxm9Kk35tQ==
X-Received: by 2002:a17:90a:4481:: with SMTP id
 t1mr37103995pjg.232.1626897607039; 
 Wed, 21 Jul 2021 13:00:07 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/27] accel/tcg: Remove ATOMIC_MMU_DECLS
Date: Wed, 21 Jul 2021 09:59:34 -1000
Message-Id: <20210721195954.879535-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All definitions are now empty.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 12 ------------
 accel/tcg/cputlb.c          |  1 -
 accel/tcg/user-exec.c       |  1 -
 3 files changed, 14 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 52fb26a274..ae6b6a03be 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -74,7 +74,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
@@ -96,7 +95,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                          TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
                                          ATOMIC_MMU_IDX);
@@ -111,7 +109,6 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                      TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, true,
                                          ATOMIC_MMU_IDX);
@@ -126,7 +123,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,
@@ -143,7 +139,6 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
@@ -177,7 +172,6 @@ GEN_ATOMIC_HELPER(xor_fetch)
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
     XDATA_TYPE cmp, old, new, val = xval;                           \
     uint16_t info = trace_mem_build_info(SHIFT, false, 0, false,    \
@@ -223,7 +217,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
                               ABI_TYPE cmpv, ABI_TYPE newv,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     DATA_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
@@ -245,7 +238,6 @@ ABI_TYPE ATOMIC_NAME(cmpxchg)(CPUArchState *env, target_ulong addr,
 ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
                          TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE val, *haddr = ATOMIC_MMU_LOOKUP_R;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
                                          ATOMIC_MMU_IDX);
@@ -260,7 +252,6 @@ ABI_TYPE ATOMIC_NAME(ld)(CPUArchState *env, target_ulong addr,
 void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                      TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_W;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, true,
                                          ATOMIC_MMU_IDX);
@@ -277,7 +268,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    ATOMIC_MMU_DECLS;
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;
     ABI_TYPE ret;
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP, false,
@@ -294,7 +284,6 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE val, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                        \
     DATA_TYPE ret;                                                  \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
@@ -326,7 +315,6 @@ GEN_ATOMIC_HELPER(xor_fetch)
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
                         ABI_TYPE xval, TCGMemOpIdx oi, uintptr_t retaddr) \
 {                                                                   \
-    ATOMIC_MMU_DECLS;                                               \
     XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP_RW;                       \
     XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
     uint16_t info = trace_mem_build_info(SHIFT, false, MO_BSWAP,    \
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index cc0e673222..dc646e964a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2693,7 +2693,6 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
-#define ATOMIC_MMU_DECLS
 #define ATOMIC_MMU_LOOKUP_RW \
     atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ | PAGE_WRITE, retaddr)
 #define ATOMIC_MMU_LOOKUP_R \
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index f6f8ddeb60..bc4a38b4df 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1243,7 +1243,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
-#define ATOMIC_MMU_DECLS
 #define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, retaddr)
 #define ATOMIC_MMU_LOOKUP_R   ATOMIC_MMU_LOOKUP_RW
 #define ATOMIC_MMU_LOOKUP_W   ATOMIC_MMU_LOOKUP_RW
-- 
2.25.1


