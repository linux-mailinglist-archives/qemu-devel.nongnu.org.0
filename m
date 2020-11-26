Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486ED2C5308
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:33:46 +0100 (CET)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFWz-0005Mj-9q
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFT6-0002zV-NB
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:29:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFT0-0006BL-5I
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvXy6fMA3vnxysjVAMTnksBKZrrzhKQ3Qd/G/ALPoNY=;
 b=cEI2VoR1MBbsBCyLXrEQQATmiLJtMOQ2wtYjgCcoA+D4vvvLNujrSKwRYM48iHZh7UB7LJ
 HadKHyOVueY+XHtrBp3KEDHdQtc6BaXomABAdCegohUZhykwzEeJNjbqbOln5tV3zDuFLG
 qN7Klc4A304nn45hDWZhSMsaRyrTGTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-EyWBCdzdMgu3wMLMG3NB3w-1; Thu, 26 Nov 2020 06:29:33 -0500
X-MC-Unique: EyWBCdzdMgu3wMLMG3NB3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FDD2100C662;
 Thu, 26 Nov 2020 11:29:32 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96AC85D6AD;
 Thu, 26 Nov 2020 11:29:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/13] compiler.h: replace QEMU_GNUC_PREREQ macro
Date: Thu, 26 Nov 2020 15:29:03 +0400
Message-Id: <20201126112915.525285-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-1-marcandre.lureau@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Replace it with glib G_GNUC_CHECK_VERSION.

Available since 2.42, the macro received a small correction in
2.55.1 (glib d44afbadda8a "macros: make G_GNUC_CHECK_VERSION()
portable" which was apparently harmless).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/atomic.h      |  2 +-
 include/qemu/compiler.h    | 15 +++------------
 scripts/cocci-macro-file.h |  1 -
 accel/tcg/cpu-exec.c       |  2 +-
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index c1d211a351..c409257c11 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -248,7 +248,7 @@
  * 4.3 (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36793).
  */
 #if defined(__i386__) || defined(__x86_64__)
-#if !QEMU_GNUC_PREREQ(4, 4)
+#if !G_GNUC_CHECK_VERSION(4, 4)
 #if defined __x86_64__
 #define smp_mb()    ({ asm volatile("mfence" ::: "memory"); (void)0; })
 #else
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c76281f354..cf044bab4a 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -7,21 +7,12 @@
 #ifndef COMPILER_H
 #define COMPILER_H
 
+#include "glib-compat.h"
+
 #if defined __clang_analyzer__ || defined __COVERITY__
 #define QEMU_STATIC_ANALYSIS 1
 #endif
 
-/*----------------------------------------------------------------------------
-| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C compiler.
-| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.
-*----------------------------------------------------------------------------*/
-#if defined(__GNUC__) && defined(__GNUC_MINOR__)
-# define QEMU_GNUC_PREREQ(maj, min) \
-         ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-#else
-# define QEMU_GNUC_PREREQ(maj, min) 0
-#endif
-
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
@@ -104,7 +95,7 @@
                                    sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
 
 #if defined __GNUC__
-# if !QEMU_GNUC_PREREQ(4, 4)
+# if !G_GNUC_CHECK_VERSION(4, 4)
    /* gcc versions before 4.4.x don't support gnu_printf, so use printf. */
 #  define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
 # else
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index c6bbc05ba3..20eea6b708 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -19,7 +19,6 @@
  */
 
 /* From qemu/compiler.h */
-#define QEMU_GNUC_PREREQ(maj, min) 1
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define QEMU_SENTINEL __attribute__((sentinel))
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 58aea605d8..21a46d2e85 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -724,7 +724,7 @@ int cpu_exec(CPUState *cpu)
 
     /* prepare setjmp context for exception handling */
     if (sigsetjmp(cpu->jmp_env, 0) != 0) {
-#if defined(__clang__) || !QEMU_GNUC_PREREQ(4, 6)
+#if defined(__clang__) || !G_GNUC_CHECK_VERSION(4, 6)
         /* Some compilers wrongly smash all local variables after
          * siglongjmp. There were bug reports for gcc 4.5.0 and clang.
          * Reload essential local variables here for those compilers.
-- 
2.29.0


