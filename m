Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C3216711
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 09:12:38 +0200 (CEST)
Received: from localhost ([::1]:47168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jshmP-000163-2d
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 03:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshj2-0004PW-QW
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:09:09 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jshj0-00043W-W3
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:09:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f7so40959475wrw.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 00:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qqS4w4mRnCRDCTfWQqRgg26scMxtoAIPpRe2SvN8Gk=;
 b=RQeNH/EWZqgdFsCUzh4H97+zKDBdI28lkG6B4qicotvqO80bI/hyKfy1nMuWVrCy25
 vA7ijNBi00ddkc1DzKSKhvapsBJBXXHWj/6as2U5/WQsPfJCp+S5dN0nkUarUR+Y4V2w
 r/5Ml5kiS2ZH/STPZnDNEkT8ZmRwR5+lMxB8W65RMsXxwPQQ1zL1ex/SUHHug+t818n1
 19mnHstgArAs5Wpsp9XABoKreF1DdPRN1zp2gULPCBbYNCvQLJ+mR2P8p8RdXxBPlokP
 3WUOlSntttjtd275XDqcM6iwby9i4Jn6kj00X+nmqHSKf0DmjzbYRwn1ncPrWaBy1ofi
 aPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qqS4w4mRnCRDCTfWQqRgg26scMxtoAIPpRe2SvN8Gk=;
 b=leolTC7Zdcjp8jUYrJNKeTMLi4DRAe4PLqLlwix3kB9/T7YuYikH50/tiHeEeAmFKP
 0JiKlYHzsjnkBZwZ1S9FBo5J9QDZjBEyMh4evIE6M/1mvTgg5fEhsH6L9VDAUo9qrj8q
 uHBehSE+WnwDP+8I40hLpRMxeazXzTRyqzGijhFDi6iOAfsspTGDG1zZ9sFT4uA6p1c8
 hgkmzxcJ09kAxasZPf59jGRelZt/1JwVMgS5bP/U40DSGqCTiZIxvtcrOkjeYTz0Jia1
 Q4JFZBQwneE5JZmLOzXLvvi7rjlmQACvq6Vo68iqs7wSqT9NnpmrJojwg3TjUs1rrFl7
 8fLQ==
X-Gm-Message-State: AOAM530ol0msfAa/D/+1gsDn9nSQXd2NykucXYQXs8VJWAkixjBQHWXr
 tgeY3Ebl8PC0tp5t6+vi8dzSXw==
X-Google-Smtp-Source: ABdhPJxwQnADNtnOWFDm+mhL/66k1bNonrCjKjVq/1hpPNQVr66Boj/tUEtXVE5k9pDA3O4ad3cbCw==
X-Received: by 2002:a05:6000:1c8:: with SMTP id
 t8mr56219990wrx.73.1594105745480; 
 Tue, 07 Jul 2020 00:09:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o9sm26892564wrs.1.2020.07.07.00.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:09:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A638F1FF8C;
 Tue,  7 Jul 2020 08:08:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/41] util/coroutine: Cleanup start_switch_fiber_ for TSAN.
Date: Tue,  7 Jul 2020 08:08:19 +0100
Message-Id: <20200707070858.6622-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200707070858.6622-1-alex.bennee@linaro.org>
References: <20200707070858.6622-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Robert Foley <robert.foley@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

This is a cleanup patch to follow-up the patch which introduced TSAN.
This patch makes separate start_switch_fiber_ functions for TSAN and ASAN.

This does two things:
1. Unrelated ASAN and TSAN code is separate and each function only
   has arguments that are actually needed.
2. The co->tsan_caller_fiber and co->tsan_co_fiber fields are only
   access from within #ifdef CONFIG_TSAN.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200626170001.27017-1-robert.foley@linaro.org>
Message-Id: <20200701135652.1366-5-alex.bennee@linaro.org>

diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index f0b66320e102..fff20aad80a4 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -52,8 +52,10 @@ typedef struct {
 #endif
     sigjmp_buf env;
 
+#ifdef CONFIG_TSAN
     void *tsan_co_fiber;
     void *tsan_caller_fiber;
+#endif
 
 #ifdef CONFIG_VALGRIND_H
     unsigned int valgrind_stack_id;
@@ -77,7 +79,10 @@ union cc_arg {
     int i[2];
 };
 
-/* QEMU_ALWAYS_INLINE only does so if __OPTIMIZE__, so we cannot use it. */
+/*
+ * QEMU_ALWAYS_INLINE only does so if __OPTIMIZE__, so we cannot use it.
+ * always_inline is required to avoid TSan runtime fatal errors.
+ */
 static inline __attribute__((always_inline))
 void on_new_fiber(CoroutineUContext *co)
 {
@@ -87,6 +92,7 @@ void on_new_fiber(CoroutineUContext *co)
 #endif
 }
 
+/* always_inline is required to avoid TSan runtime fatal errors. */
 static inline __attribute__((always_inline))
 void finish_switch_fiber(void *fake_stack_save)
 {
@@ -109,18 +115,29 @@ void finish_switch_fiber(void *fake_stack_save)
 #endif
 }
 
-static inline __attribute__((always_inline)) void start_switch_fiber(
-    CoroutineAction action, void **fake_stack_save,
-    const void *bottom, size_t size, void *new_fiber)
+/* always_inline is required to avoid TSan runtime fatal errors. */
+static inline __attribute__((always_inline))
+void start_switch_fiber_asan(CoroutineAction action, void **fake_stack_save,
+                             const void *bottom, size_t size)
 {
 #ifdef CONFIG_ASAN
     __sanitizer_start_switch_fiber(
             action == COROUTINE_TERMINATE ? NULL : fake_stack_save,
             bottom, size);
 #endif
+}
+
+/* always_inline is required to avoid TSan runtime fatal errors. */
+static inline __attribute__((always_inline))
+void start_switch_fiber_tsan(void **fake_stack_save,
+                             CoroutineUContext *co,
+                             bool caller)
+{
 #ifdef CONFIG_TSAN
-    void *curr_fiber =
-        __tsan_get_current_fiber();
+    void *new_fiber = caller ?
+                      co->tsan_caller_fiber :
+                      co->tsan_co_fiber;
+    void *curr_fiber = __tsan_get_current_fiber();
     __tsan_acquire(curr_fiber);
 
     *fake_stack_save = curr_fiber;
@@ -144,12 +161,9 @@ static void coroutine_trampoline(int i0, int i1)
 
     /* Initialize longjmp environment and switch back the caller */
     if (!sigsetjmp(self->env, 0)) {
-        start_switch_fiber(
-            COROUTINE_YIELD,
-            &fake_stack_save,
-            leader.stack,
-            leader.stack_size,
-            self->tsan_caller_fiber);
+        start_switch_fiber_asan(COROUTINE_YIELD, &fake_stack_save, leader.stack,
+                                leader.stack_size);
+        start_switch_fiber_tsan(&fake_stack_save, self, true); /* true=caller */
         siglongjmp(*(sigjmp_buf *)co->entry_arg, 1);
     }
 
@@ -208,10 +222,10 @@ Coroutine *qemu_coroutine_new(void)
 
     /* swapcontext() in, siglongjmp() back out */
     if (!sigsetjmp(old_env, 0)) {
-        start_switch_fiber(
-            COROUTINE_YIELD,
-            &fake_stack_save,
-            co->stack, co->stack_size, co->tsan_co_fiber);
+        start_switch_fiber_asan(COROUTINE_YIELD, &fake_stack_save, co->stack,
+                                co->stack_size);
+        start_switch_fiber_tsan(&fake_stack_save,
+                                co, false); /* false=not caller */
 
 #ifdef CONFIG_SAFESTACK
         /*
@@ -287,8 +301,10 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
 
     ret = sigsetjmp(from->env, 0);
     if (ret == 0) {
-        start_switch_fiber(action, &fake_stack_save,
-                           to->stack, to->stack_size, to->tsan_co_fiber);
+        start_switch_fiber_asan(action, &fake_stack_save, to->stack,
+                                to->stack_size);
+        start_switch_fiber_tsan(&fake_stack_save,
+                                to, false); /* false=not caller */
         siglongjmp(to->env, action);
     }
 
-- 
2.20.1


