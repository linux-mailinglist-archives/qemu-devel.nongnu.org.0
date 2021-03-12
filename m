Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A322E339193
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:41:19 +0100 (CET)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjug-0002uH-Le
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lKjVH-0000JZ-Mf
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:15:04 -0500
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:49456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lKjVA-0000zq-JV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:15:02 -0500
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0540B2E1272;
 Fri, 12 Mar 2021 18:14:49 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 L8rHV3b9D2-EmxOOd4C; Fri, 12 Mar 2021 18:14:48 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615562088; bh=sWgY2IorjWfgXHXoGtVkTNeoM2IYDvKadmZFYHR8Mn4=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=ZclobAIw9zDekAlEMy0aW2gzJrMHWl7lizyP0FMcEXzqpg3mRFYXv6huTiWM9XpSH
 sSqQOfoHTlUdWAodEN7NOo+HPAQVCxribzAcVQMeX++/8Ev5EHSMHNqw3LB21TKkTk
 wUiao2OSN8bSH5368R4aZt8pGRY7Bmfr/f6Nh3CE=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8818::1:17])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ewObFGrD0u-EmoWmCT8; Fri, 12 Mar 2021 18:14:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] configure: add option to implicitly enable/disable libgio
Date: Fri, 12 Mar 2021 18:14:40 +0300
Message-Id: <20210312151440.405776-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, philmd@redhat.com, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now, compilation of util/dbus is implicit and depends
on libgio presence on the building host.
The patch adds options to manage libgio dependencies explicitly.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 configure | 60 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index 34fccaa2bae6..23eed988be81 100755
--- a/configure
+++ b/configure
@@ -465,6 +465,7 @@ fuse_lseek="auto"
 multiprocess="auto"
 
 malloc_trim="auto"
+gio="$default_feature"
 
 # parse CC options second
 for opt do
@@ -1560,6 +1561,10 @@ for opt do
   ;;
   --disable-multiprocess) multiprocess="disabled"
   ;;
+  --enable-gio) gio=yes
+  ;;
+  --disable-gio) gio=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1913,6 +1918,7 @@ disabled with --disable-FEATURE, default is enabled if available
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
   multiprocess    Out of process device emulation support
+  gio             libgio support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -3319,17 +3325,19 @@ if test "$static" = yes && test "$mingw32" = yes; then
     glib_cflags="-DGLIB_STATIC_COMPILATION $glib_cflags"
 fi
 
-if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
-    gio_cflags=$($pkg_config --cflags gio-2.0)
-    gio_libs=$($pkg_config --libs gio-2.0)
-    gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
-    if [ ! -x "$gdbus_codegen" ]; then
-        gdbus_codegen=
-    fi
-    # Check that the libraries actually work -- Ubuntu 18.04 ships
-    # with pkg-config --static --libs data for gio-2.0 that is missing
-    # -lblkid and will give a link error.
-    cat > $TMPC <<EOF
+if ! test "$gio" = "no"; then
+    pass=no
+    if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
+        gio_cflags=$($pkg_config --cflags gio-2.0)
+        gio_libs=$($pkg_config --libs gio-2.0)
+        gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
+        if [ ! -x "$gdbus_codegen" ]; then
+            gdbus_codegen=
+        fi
+        # Check that the libraries actually work -- Ubuntu 18.04 ships
+        # with pkg-config --static --libs data for gio-2.0 that is missing
+        # -lblkid and will give a link error.
+        cat > $TMPC <<EOF
 #include <gio/gio.h>
 int main(void)
 {
@@ -3337,18 +3345,28 @@ int main(void)
     return 0;
 }
 EOF
-    if compile_prog "$gio_cflags" "$gio_libs" ; then
-        gio=yes
-    else
-        gio=no
+        if compile_prog "$gio_cflags" "$gio_libs" ; then
+            pass=yes
+        else
+            pass=no
+        fi
+
+        if test "$pass" = "yes" &&
+            $pkg_config --atleast-version=$glib_req_ver gio-unix-2.0; then
+            gio_cflags="$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
+            gio_libs="$gio_libs $($pkg_config --libs gio-unix-2.0)"
+        fi
     fi
-else
-    gio=no
-fi
 
-if $pkg_config --atleast-version=$glib_req_ver gio-unix-2.0; then
-    gio_cflags="$gio_cflags $($pkg_config --cflags gio-unix-2.0)"
-    gio_libs="$gio_libs $($pkg_config --libs gio-unix-2.0)"
+    if test "$pass" = "no"; then
+        if test "$gio" = "yes"; then
+            feature_not_found "gio" "Install libgio >= 2.0"
+        else
+            gio=no
+        fi
+    else
+        gio=yes
+    fi
 fi
 
 # Sanity check that the current size_t matches the
-- 
2.25.1


