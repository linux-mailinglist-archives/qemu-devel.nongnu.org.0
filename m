Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755122C2694
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:55:24 +0100 (CET)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXqt-000402-GA
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXog-0002lq-Hn
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXoe-0004u8-Ev
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606222383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hkJjpSFDjtw+pYOQ2SgwYYu0WrsmOxzO50vbsgX3QaY=;
 b=c54VMbTOF1E09riwMyn1+3OWia/cYXqgLbPB8gx3Nmejm34h8T5SXF7IY/LKATo/b1nTSY
 Esbm1DZ8o2CYWN17kKccXrO0JRG2+N+V6+tRGmLQ74yOzMFKN9JLNEng6y3UI9AeyQsCq9
 Sy9tun6OzrakPLt63akVardqNgmtxpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-bG4mS0dpNUqE-OJNKtZk_w-1; Tue, 24 Nov 2020 07:52:59 -0500
X-MC-Unique: bG4mS0dpNUqE-OJNKtZk_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9690F81C478;
 Tue, 24 Nov 2020 12:52:58 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC8F760BE5;
 Tue, 24 Nov 2020 12:52:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Remove GCC version checks (all < 4.8)
Date: Tue, 24 Nov 2020 16:52:34 +0400
Message-Id: <20201124125235.266884-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201124125235.266884-1-marcandre.lureau@redhat.com>
References: <20201124125235.266884-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 richard.henderson@linaro.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/atomic.h         | 17 -----------------
 include/qemu/compiler.h       | 22 ++++++----------------
 include/qemu/qemu-plugin.h    |  9 ++-------
 tools/virtiofsd/fuse_common.h |  4 +---
 accel/tcg/cpu-exec.c          |  2 +-
 tests/tcg/arm/fcvt.c          |  8 +++-----
 6 files changed, 13 insertions(+), 49 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index c1d211a351..8f4b3a80fb 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -241,23 +241,6 @@
 
 #else /* __ATOMIC_RELAXED */
 
-/*
- * We use GCC builtin if it's available, as that can use mfence on
- * 32-bit as well, e.g. if built with -march=pentium-m. However, on
- * i386 the spec is buggy, and the implementation followed it until
- * 4.3 (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36793).
- */
-#if defined(__i386__) || defined(__x86_64__)
-#if !QEMU_GNUC_PREREQ(4, 4)
-#if defined __x86_64__
-#define smp_mb()    ({ asm volatile("mfence" ::: "memory"); (void)0; })
-#else
-#define smp_mb()    ({ asm volatile("lock; addl $0,0(%%esp) " ::: "memory"); (void)0; })
-#endif
-#endif
-#endif
-
-
 #ifdef __alpha__
 #define smp_read_barrier_depends()   asm volatile("mb":::"memory")
 #endif
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c76281f354..e391de15ef 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -44,10 +44,6 @@
 #endif
 
 #ifndef likely
-#if __GNUC__ < 3
-#define __builtin_expect(x, n) (x)
-#endif
-
 #define likely(x)   __builtin_expect(!!(x), 1)
 #define unlikely(x)   __builtin_expect(!!(x), 0)
 #endif
@@ -104,20 +100,14 @@
                                    sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
 
 #if defined __GNUC__
-# if !QEMU_GNUC_PREREQ(4, 4)
-   /* gcc versions before 4.4.x don't support gnu_printf, so use printf. */
-#  define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
-# else
-   /* Use gnu_printf when supported (qemu uses standard format strings). */
-#  define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
-#  if defined(_WIN32)
-    /* Map __printf__ to __gnu_printf__ because we want standard format strings
-     * even when MinGW or GLib include files use __printf__. */
-#   define __printf__ __gnu_printf__
-#  endif
+# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
+# if defined(_WIN32)
+   /* Map __printf__ to __gnu_printf__ because we want standard format strings
+    * even when MinGW or GLib include files use __printf__. */
+#  define __printf__ __gnu_printf__
 # endif
 #else
-#define GCC_FMT_ATTR(n, m)
+# define GCC_FMT_ATTR(n, m)
 #endif
 
 #ifndef __has_warning
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index bab8b0d4b3..5775e82c4e 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -28,13 +28,8 @@
   #endif
   #define QEMU_PLUGIN_LOCAL
 #else
-  #if __GNUC__ >= 4
-    #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
-    #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
-  #else
-    #define QEMU_PLUGIN_EXPORT
-    #define QEMU_PLUGIN_LOCAL
-  #endif
+  #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
+  #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
 #endif
 
 typedef uint64_t qemu_plugin_id_t;
diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 5aee5193eb..2f073578fe 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -810,9 +810,7 @@ void fuse_remove_signal_handlers(struct fuse_session *se);
  * On 32bit systems please add -D_FILE_OFFSET_BITS=64 to your compile flags!
  */
 
-#if defined(__GNUC__) &&                                      \
-    (__GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ >= 6) && \
-    !defined __cplusplus
+#if defined(__GNUC__) && !defined __cplusplus
 _Static_assert(sizeof(off_t) == 8, "fuse: off_t must be 64bit");
 #else
 struct _fuse_off_t_must_be_64bit_dummy_struct {
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 58aea605d8..37a88edb6d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -724,7 +724,7 @@ int cpu_exec(CPUState *cpu)
 
     /* prepare setjmp context for exception handling */
     if (sigsetjmp(cpu->jmp_env, 0) != 0) {
-#if defined(__clang__) || !QEMU_GNUC_PREREQ(4, 6)
+#if defined(__clang__)
         /* Some compilers wrongly smash all local variables after
          * siglongjmp. There were bug reports for gcc 4.5.0 and clang.
          * Reload essential local variables here for those compilers.
diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 617626bc63..7ac47b564e 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -73,11 +73,9 @@ static void print_int64(int i, int64_t num)
 
 #ifndef SNANF
 /* Signaling NaN macros, if supported.  */
-# if __GNUC_PREREQ(3, 3)
-#  define SNANF (__builtin_nansf (""))
-#  define SNAN (__builtin_nans (""))
-#  define SNANL (__builtin_nansl (""))
-# endif
+# define SNANF (__builtin_nansf (""))
+# define SNAN (__builtin_nans (""))
+# define SNANL (__builtin_nansl (""))
 #endif
 
 float single_numbers[] = { -SNANF,
-- 
2.29.0


