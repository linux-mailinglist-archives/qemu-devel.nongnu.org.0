Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CF21D425
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 12:59:08 +0200 (CEST)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juwAt-0004jj-EE
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 06:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juw7j-0000AC-B1
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:55:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27197
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juw7h-0003xF-4a
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594637748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ft7uHnBsNTLzWbWykuBpe5dyEeEFUTReen4b+OVO4Fc=;
 b=cdxwME94aXrCcpc3tSdr1sMUlVMKNc9o2lWlwqbXFiU1atV0kTxDqxcePxVMtyM+Xb4cB+
 bNBZsl+ONPHI7QenmSJnN2JeJb/bxzCoXfJBrYUfDnyA3/ncUU4jjE6OyQoXxCRoWBNpZk
 73SgqjzQfhDc4pE/xYZLKFHtcBu806M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-Q8QRJpNWOxapJUHbyBbNfA-1; Mon, 13 Jul 2020 06:55:46 -0400
X-MC-Unique: Q8QRJpNWOxapJUHbyBbNfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E1871080;
 Mon, 13 Jul 2020 10:55:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C95A62B6DE;
 Mon, 13 Jul 2020 10:55:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 6/9] Remove the CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE switch
Date: Mon, 13 Jul 2020 12:55:31 +0200
Message-Id: <20200713105534.10872-7-thuth@redhat.com>
In-Reply-To: <20200713105534.10872-1-thuth@redhat.com>
References: <20200713105534.10872-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

GCC supports "#pragma GCC diagnostic" since version 4.6, and
Clang seems to support it, too, since its early versions 3.x.
That means that our minimum required compiler versions all support
this pragma already and we can remove the test from configure and
all the related #ifdefs in the code.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200710045515.25986-1-thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                 | 29 -----------------------------
 include/ui/gtk.h          |  4 ----
 include/ui/qemu-pixman.h  |  4 ----
 scripts/decodetree.py     | 12 ++++--------
 ui/gtk.c                  |  4 ----
 util/coroutine-ucontext.c |  4 ++--
 6 files changed, 6 insertions(+), 51 deletions(-)

diff --git a/configure b/configure
index 69a89113f7..9b6ab9d3ca 100755
--- a/configure
+++ b/configure
@@ -5728,31 +5728,6 @@ if compile_prog "" "" ; then
     linux_magic_h=yes
 fi
 
-########################################
-# check whether we can disable warning option with a pragma (this is needed
-# to silence warnings in the headers of some versions of external libraries).
-# This test has to be compiled with -Werror as otherwise an unknown pragma is
-# only a warning.
-#
-# If we can't selectively disable warning in the code, disable -Werror so that
-# the build doesn't fail anyway.
-
-pragma_disable_unused_but_set=no
-cat > $TMPC << EOF
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wstrict-prototypes"
-#pragma GCC diagnostic pop
-
-int main(void) {
-    return 0;
-}
-EOF
-if compile_prog "-Werror" "" ; then
-    pragma_diagnostic_available=yes
-else
-    werror=no
-fi
-
 ########################################
 # check if we have valgrind/valgrind.h
 
@@ -7689,10 +7664,6 @@ if test "$linux_magic_h" = "yes" ; then
   echo "CONFIG_LINUX_MAGIC_H=y" >> $config_host_mak
 fi
 
-if test "$pragma_diagnostic_available" = "yes" ; then
-  echo "CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE=y" >> $config_host_mak
-fi
-
 if test "$valgrind_h" = "yes" ; then
   echo "CONFIG_VALGRIND_H=y" >> $config_host_mak
 fi
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index d1b230848a..eaeb450f91 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -1,15 +1,11 @@
 #ifndef UI_GTK_H
 #define UI_GTK_H
 
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 /* Work around an -Wstrict-prototypes warning in GTK headers */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wstrict-prototypes"
-#endif
 #include <gtk/gtk.h>
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 #pragma GCC diagnostic pop
-#endif
 
 #include <gdk/gdkkeysyms.h>
 
diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 3b7cf70157..87737a6f16 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -7,14 +7,10 @@
 #define QEMU_PIXMAN_H
 
 /* pixman-0.16.0 headers have a redundant declaration */
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wredundant-decls"
-#endif
 #include <pixman.h>
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 #pragma GCC diagnostic pop
-#endif
 
 /*
  * pixman image formats are defined to be native endian,
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 530d41ca62..694757b6c2 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1327,12 +1327,10 @@ def main():
     # but we can't tell which ones.  Prevent issues from the compiler by
     # suppressing redundant declaration warnings.
     if anyextern:
-        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
-               "# pragma GCC diagnostic push\n",
-               "# pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
-               "# ifdef __clang__\n"
+        output("#pragma GCC diagnostic push\n",
+               "#pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
+               "#ifdef __clang__\n"
                "#  pragma GCC diagnostic ignored \"-Wtypedef-redefinition\"\n",
-               "# endif\n",
                "#endif\n\n")
 
     out_pats = {}
@@ -1347,9 +1345,7 @@ def main():
     output('\n')
 
     if anyextern:
-        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
-               "# pragma GCC diagnostic pop\n",
-               "#endif\n\n")
+        output("#pragma GCC diagnostic pop\n\n")
 
     for n in sorted(formats.keys()):
         f = formats[n]
diff --git a/ui/gtk.c b/ui/gtk.c
index d4b49bd7da..b0cc08ad6d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1996,14 +1996,10 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
              * proper replacement (native opengl support) is only
              * available in 3.16+.  Silence the warning if possible.
              */
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-#endif
             gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 #pragma GCC diagnostic pop
-#endif
             vc->gfx.dcl.ops = &dcl_egl_ops;
         }
     } else
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index fff20aad80..904b375192 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -251,8 +251,8 @@ Coroutine *qemu_coroutine_new(void)
 }
 
 #ifdef CONFIG_VALGRIND_H
-#if defined(CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE) && !defined(__clang__)
 /* Work around an unused variable in the valgrind.h macro... */
+#if !defined(__clang__)
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wunused-but-set-variable"
 #endif
@@ -260,7 +260,7 @@ static inline void valgrind_stack_deregister(CoroutineUContext *co)
 {
     VALGRIND_STACK_DEREGISTER(co->valgrind_stack_id);
 }
-#if defined(CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE) && !defined(__clang__)
+#if !defined(__clang__)
 #pragma GCC diagnostic pop
 #endif
 #endif
-- 
2.18.1


