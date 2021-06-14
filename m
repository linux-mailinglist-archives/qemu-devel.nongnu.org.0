Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D393A728D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:36:47 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw8M-0002Cx-5j
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3h-0006Qh-CQ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3Y-0007in-J3
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso638130pjb.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySu31ENiO8Aza71v0+pGGhCJRvj9eKy24Mj6E7gzbMI=;
 b=KrkfdCgHBuqq2VwAZavTf2pOeR9TYh7rTviMqBXZJsD3Rosoy6+DQ3Idb67NKamjZg
 DEDzOpxnHRDCpsDcV8RrTeiZBtQrwu5eIc31XtREFxrJhBnw2vFUdVof/URWon+uo04/
 KWMbjoqrFsTIQ8Fa0n5kdT6XrL7jKUkhzT0vwF+KOTtGDu10yUjKADHkG3Fet6DL9sep
 B6LNPMXzU5isAd20ETUGk9y2yds5MpmATHVqBGEGB9SxB7PAo9gxhBmV9T7+ddV4dPbG
 W/RWZ4fRkIChmCMy8O9PoCfIp3ZcceWPM8z9rHT7ANSqTqwfnlgohW+GICe//BsJsgyT
 NRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySu31ENiO8Aza71v0+pGGhCJRvj9eKy24Mj6E7gzbMI=;
 b=HaIVYuTrqwtIoxCcTxp6tTtXNwLnrAC/dwxkr4CBOnGwUeF+AO6VbA7Z2CLoQc/gmr
 oaSPRBpZ+6SYtmmL4EOdkNcUUQ5QE7o8Np+ikhhiob+gwxMgEPHpp3Q9f/pMabfHznv6
 AASyYJp0r1ct0xUFqIjToMNJrfLYbW6Iegfph0EBksYhqerJe24nnAAZKWrFv6swkTg8
 hicAQ0JYKd4Y3A9cT9GZER6XGiL2/ZikOHj0BN2CSpIRReJMALRb0gdObqn0o57hh8Oe
 mjIHdo2Ghw7IZL7EpmYK620A/zSCJU5DMviP+9DIBarGFjinUEobNnfC81rMKvJJKqFk
 63/Q==
X-Gm-Message-State: AOAM531ezMFKQ2ERXLD1jlMQqeRaoLbuN4c2MqZhFKiWK6a8v/XjfpeS
 h+VRsdByVQN62stLKQKxNKGqgAElYuqpOg==
X-Google-Smtp-Source: ABdhPJzgPCTCC3wUTy6mTDV2vaUIwKXugWQB3i0BnBmg8DOmH6N/q4HiLDc+HLKXtRoHF4SPMJ8Y9A==
X-Received: by 2002:a17:902:8309:b029:115:c2f3:2aed with SMTP id
 bd9-20020a1709028309b0290115c2f32aedmr1554083plb.57.1623713507310; 
 Mon, 14 Jun 2021 16:31:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] util: Pass file+line to qemu_rec_mutex_unlock_impl
Date: Mon, 14 Jun 2021 16:31:39 -0700
Message-Id: <20210614233143.1221879-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create macros for file+line expansion in qemu_rec_mutex_unlock
like we have for qemu_mutex_unlock.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/thread.h    | 10 +++++++++-
 util/qemu-thread-posix.c |  4 ++--
 util/qemu-thread-win32.c |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 2c0d85f3bc..460568d67d 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -32,7 +32,7 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex);
 void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
 void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
 int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line);
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line);
 
 typedef void (*QemuMutexLockFunc)(QemuMutex *m, const char *f, int l);
 typedef int (*QemuMutexTrylockFunc)(QemuMutex *m, const char *f, int l);
@@ -110,6 +110,9 @@ extern QemuCondTimedWaitFunc qemu_cond_timedwait_func;
 #define qemu_mutex_unlock(mutex) \
         qemu_mutex_unlock_impl(mutex, __FILE__, __LINE__)
 
+#define qemu_rec_mutex_unlock(mutex) \
+        qemu_rec_mutex_unlock_impl(mutex, __FILE__, __LINE__)
+
 static inline void (qemu_mutex_lock)(QemuMutex *mutex)
 {
     qemu_mutex_lock(mutex);
@@ -135,6 +138,11 @@ static inline int (qemu_rec_mutex_trylock)(QemuRecMutex *mutex)
     return qemu_rec_mutex_trylock(mutex);
 }
 
+static inline void (qemu_rec_mutex_unlock)(QemuRecMutex *mutex)
+{
+    qemu_rec_mutex_unlock(mutex);
+}
+
 void qemu_cond_init(QemuCond *cond);
 void qemu_cond_destroy(QemuCond *cond);
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 8e2b6653f5..d990826ed8 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -139,9 +139,9 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return qemu_mutex_trylock_impl(mutex, file, line);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_unlock(mutex);
+    qemu_mutex_unlock_impl(mutex, file, line);
 }
 
 void qemu_cond_init(QemuCond *cond)
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index cb5aa2018c..52eb19f351 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -105,7 +105,7 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return !TryEnterCriticalSection(&mutex->lock);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
     assert(mutex->initialized);
     LeaveCriticalSection(&mutex->lock);
-- 
2.25.1


