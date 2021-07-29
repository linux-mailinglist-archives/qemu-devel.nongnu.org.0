Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3D3D9AC3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:03:39 +0200 (CEST)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uSY-0005iI-KN
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCa-0004La-U7
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:09 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCZ-0002XL-FF
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so6656363pji.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQHwrcsq1PszUxdcPO+xJ5EXm+5xhLjl/eOGt9epIgI=;
 b=hJCEk0/gCb6vopSFKmabt7zZD9HSL86R7ckRUCvxhXQMZEAFVURbN/qvDfX4JQbaEL
 O6xREx4Z72KY8W0hBfuiv/rdcOC2vWLJlHz0wv61o8LFIqmWGsCd9RSKOop6bRZKstAv
 MGLvbZ0G1rwMOULhV/h6Gnx2852DFB2vIyySfUyP433qlmJFzUCgpAuo6r5QgqENWY2c
 ma3d+BTzhTOIks1T1xu7NIP3XctfT4z6iTX2n4pkbAcnowNcA02iQSHY27ZEybV8otqT
 vAa6PHqwhQjpNQ/Ca1aEkBhSrG+8Bfg62lMuU+6IjLIWAhEsNgE+2lFNE865mt4GqVy2
 sEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQHwrcsq1PszUxdcPO+xJ5EXm+5xhLjl/eOGt9epIgI=;
 b=RxDzdYRx9MCNM6DhMPmL0VtsKDDaA+ZJ1iMcO3mnTWbnJyjEsfXR9PjBbB0Xj+/39s
 n/3FrAhAI7P3ZaXLZ7e1NyoPvNop+FuCsgxNrudVCKijxR/64WLMNrKN6BxBHSPlozbg
 JwQIoQ1WF92+h61OJIJGLOWDGrBXfjYbrc5cm4I8qOmBH/yOyzCPoKPIQwMX2p9aJpJ1
 fLA0qHxbp5bB+JprhSJkwfUWHigOglBpdCoiUNtcbXbLS+v36Erq5S4iNf0jdrkEvJcZ
 9EKBkiPQiGD5HojGX9FULQ1vIIQTDAffW3TIq7ap/V4oXhdbkBF8wa43WNjH48ogjFS/
 05HQ==
X-Gm-Message-State: AOAM530xWd8a6p8rZO628soZtwj9+INmIjVbKT13XG99nu3Q1EhBtBTL
 aWJH381ufORu1Ze6noSCgnqRSFK+KrUsCQ==
X-Google-Smtp-Source: ABdhPJxcLBOnoBB6b7UeyXnIgbrXjFHwFmJ+PJkhUfm7EtKENtY15nqczT8capKjdydCd1ovi7zMyQ==
X-Received: by 2002:a17:90a:c094:: with SMTP id
 o20mr2053109pjs.207.1627519626070; 
 Wed, 28 Jul 2021 17:47:06 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 13/43] target/sparc: Remove DEBUG_UNALIGNED
Date: Wed, 28 Jul 2021 14:46:17 -1000
Message-Id: <20210729004647.282017-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The printf should have been qemu_log_mask, the parameters
themselves no longer compile, and because this is placed
before unwinding the PC is actively wrong.

We get better (and correct) logging on the other side of
raising the exception, in sparc_cpu_do_interrupt.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 22327d7d72..974afea041 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -27,7 +27,6 @@
 
 //#define DEBUG_MMU
 //#define DEBUG_MXCC
-//#define DEBUG_UNALIGNED
 //#define DEBUG_UNASSIGNED
 //#define DEBUG_ASI
 //#define DEBUG_CACHE_CONTROL
@@ -364,10 +363,6 @@ static void do_check_align(CPUSPARCState *env, target_ulong addr,
                            uint32_t align, uintptr_t ra)
 {
     if (addr & align) {
-#ifdef DEBUG_UNALIGNED
-        printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-               "\n", addr, env->pc);
-#endif
         cpu_raise_exception_ra(env, TT_UNALIGNED, ra);
     }
 }
@@ -1968,10 +1963,6 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
 
-#ifdef DEBUG_UNALIGNED
-    printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-           "\n", addr, env->pc);
-#endif
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
 #endif
-- 
2.25.1


