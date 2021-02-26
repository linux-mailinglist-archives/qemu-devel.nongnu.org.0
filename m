Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B143432656F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:22:44 +0100 (CET)
Received: from localhost ([::1]:51814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFft5-0005iz-N0
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfqz-0004PT-Dc
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:20:33 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfqs-0003lt-QF
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:20:33 -0500
Received: by mail-pg1-x52e.google.com with SMTP id b21so6497131pgk.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51VJfBomUWlzPOgh52KPvkCUMNk32VAdgGf+JIsREJk=;
 b=GXV2I8mC92jRZ6+ZejAijLimHPi5ms9CN8Qc6FZ+zJf+gJFnhdmqhQhU2Cq/A38p3J
 iqgqkMkX+bLv8326mDejpuP7bvYKbkNYUT5v2RHd0iFlGC6REgCJ5HyGLnh2rFiu5elW
 36VRxnQ5StH4yyrKqrNKzWpccc0q78uv5wL5tDzz87HTNN19+L7fw8SGa1NRuNxcWyq8
 vfs+5K2NhhrQY96Ihfo64a6vCB1Qrd2EifUvjwUPS7PFLl98msF5S41LEZffD7er+Apf
 hqc5UthsqBXYcCCs44w4dhNq8l4UUz2aDhYmODSw0ZP47CEzdK8XVFSqGqOwHfFfxGKZ
 r+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51VJfBomUWlzPOgh52KPvkCUMNk32VAdgGf+JIsREJk=;
 b=GFh8bNxAWgO034Ot31dAAFZQDNEqhmzPkThhuh6oCj07Om4uHvZYbqWvrnc+dGRWDK
 skUWxJqcwMTLsOJC6XNcfHleIlJpQtKYAVo9FL28pES57OI147xAsvQFo2JUxL7TSP5J
 J65MC+z7OZNcavpdIyZyqesnxoNrDX7GPohlWteddyBnyzs2SiNMBffGIr+0OxR8QHO1
 Nls9HXDnztoDZTG/TLLKC9Dbf1Vig/RPGY5GdgJtfhiGt+hax9si0+skSTWJLGufanpW
 0qfmMksudAE6ER2HDLoUKss0w8Ko+O216b4gLOLNP9lPoVWTQH13M1uKYaJ2GY1aAdcG
 9lBg==
X-Gm-Message-State: AOAM5306HiBzrYZ82YDUvoML4kPdvbbWBiwpH2tp09HzzU/80wehOsy6
 5wwoWWzsjxPbX3r8hFmgqCWT+wGUdr6Epw==
X-Google-Smtp-Source: ABdhPJyikJysZbJkSEKth01+BGJKHy2+IX0C5B7p1gey7m76/X4JdDBLUZaCfIvVAj8Kb0/Ko0vfXg==
X-Received: by 2002:a63:f953:: with SMTP id q19mr3485884pgk.125.1614356425183; 
 Fri, 26 Feb 2021 08:20:25 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 6sm9141291pgv.70.2021.02.26.08.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:20:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/i386: Rename helper_fldt, helper_fstt
Date: Fri, 26 Feb 2021 08:20:21 -0800
Message-Id: <20210226162022.375654-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226162022.375654-1-richard.henderson@linaro.org>
References: <20210226162022.375654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: pbonzini@redhat.com, philmd@redhat.com, cfontana@suse.de,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the prefix from "helper" to "do".  The former should be
reserved for those functions that are called from TCG; the latter
is in use within the file already for those functions that are
called from the helper functions, adding a "retaddr" argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..3d9b192901 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -117,8 +117,7 @@ static inline void fpop(CPUX86State *env)
     env->fpstt = (env->fpstt + 1) & 7;
 }
 
-static inline floatx80 helper_fldt(CPUX86State *env, target_ulong ptr,
-                                   uintptr_t retaddr)
+static floatx80 do_fldt(CPUX86State *env, target_ulong ptr, uintptr_t retaddr)
 {
     CPU_LDoubleU temp;
 
@@ -127,8 +126,8 @@ static inline floatx80 helper_fldt(CPUX86State *env, target_ulong ptr,
     return temp.d;
 }
 
-static inline void helper_fstt(CPUX86State *env, floatx80 f, target_ulong ptr,
-                               uintptr_t retaddr)
+static void do_fstt(CPUX86State *env, floatx80 f, target_ulong ptr,
+                    uintptr_t retaddr)
 {
     CPU_LDoubleU temp;
 
@@ -405,14 +404,14 @@ void helper_fldt_ST0(CPUX86State *env, target_ulong ptr)
     int new_fpstt;
 
     new_fpstt = (env->fpstt - 1) & 7;
-    env->fpregs[new_fpstt].d = helper_fldt(env, ptr, GETPC());
+    env->fpregs[new_fpstt].d = do_fldt(env, ptr, GETPC());
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
 }
 
 void helper_fstt_ST0(CPUX86State *env, target_ulong ptr)
 {
-    helper_fstt(env, ST0, ptr, GETPC());
+    do_fstt(env, ST0, ptr, GETPC());
 }
 
 void helper_fpush(CPUX86State *env)
@@ -2468,7 +2467,7 @@ void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
     ptr += (14 << data32);
     for (i = 0; i < 8; i++) {
         tmp = ST(i);
-        helper_fstt(env, tmp, ptr, GETPC());
+        do_fstt(env, tmp, ptr, GETPC());
         ptr += 10;
     }
 
@@ -2495,7 +2494,7 @@ void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
     ptr += (14 << data32);
 
     for (i = 0; i < 8; i++) {
-        tmp = helper_fldt(env, ptr, GETPC());
+        tmp = do_fldt(env, ptr, GETPC());
         ST(i) = tmp;
         ptr += 10;
     }
@@ -2539,7 +2538,7 @@ static void do_xsave_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     addr = ptr + XO(legacy.fpregs);
     for (i = 0; i < 8; i++) {
         floatx80 tmp = ST(i);
-        helper_fstt(env, tmp, addr, ra);
+        do_fstt(env, tmp, addr, ra);
         addr += 16;
     }
 }
@@ -2703,7 +2702,7 @@ static void do_xrstor_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 
     addr = ptr + XO(legacy.fpregs);
     for (i = 0; i < 8; i++) {
-        floatx80 tmp = helper_fldt(env, addr, ra);
+        floatx80 tmp = do_fldt(env, addr, ra);
         ST(i) = tmp;
         addr += 16;
     }
-- 
2.25.1


