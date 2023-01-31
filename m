Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8B6834C3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:08:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuzL-0000mJ-S5; Tue, 31 Jan 2023 13:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMuy3-0007gv-2Z
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMuy1-0000xG-04
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675188167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KLdxxr3qSHiOq28ONtW9plm5wXv9Oju859TBaSRrwu0=;
 b=GPOHW9SYfknkh50G3sjN/Dkxg4Xl4fsgtaauzxBg1ONNTn8vK7xVPyx1fOWcW1dRGrzD2F
 ooqspAtjjMhj1gX11uKngHILj96FSuVm4mSgOhbA7qjOAsZFZAdNNB1MI0j2WiEszj+QfB
 QzEtINRpztxskbh8KwwAQqBHuc+tq+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-8ZkvvoGoMCWoXUDUK3rXCw-1; Tue, 31 Jan 2023 13:02:43 -0500
X-MC-Unique: 8ZkvvoGoMCWoXUDUK3rXCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5975885A588;
 Tue, 31 Jan 2023 18:02:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B477D112132C;
 Tue, 31 Jan 2023 18:02:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org,
	anthony.perard@citrix.com,
	berrange@redhat.com
Subject: [PATCH] configure: Bump minimum Clang version to 10.0
Date: Tue, 31 Jan 2023 19:02:39 +0100
Message-Id: <20230131180239.1582302-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Anthony Perard recently reported some problems with Clang v6.0 from
Ubuntu Bionic (with regards to the -Wmissing-braces configure test).
Since we're not officially supporting that version of Ubuntu anymore,
we should better bump our minimum version check in the configure script
instead of using our time to fix problems of unsupported compilers.
According to repology.org, our supported distros ship these versions
of Clang (looking at the highest version only):

              Fedora 36: 14.0.5
      CentOS 8 (RHEL-8): 12.0.1
              Debian 11: 13.0.1
     OpenSUSE Leap 15.4: 13.0.1
       Ubuntu LTS 20.04: 12.0.0
          FreeBSD Ports: 15.0.7
          NetBSD pkgsrc: 15.0.7
               Homebrew: 15.0.7
            MSYS2 mingw: 15.0.7
            Haiku ports: 12.0.1

While it seems like we could update to v12.0.0 from that point of view,
the default version on Ubuntu 20.04 is still v10.0, and we use that for
our CI tests based via the tests/docker/dockerfiles/ubuntu2004.docker
file.

Thus let's make v10.0 our minimum version now (which corresponds to
Apple Clang version v12.0). The -Wmissing-braces check can then be
removed, too, since both our minimum GCC and our minimum Clang version
now handle this correctly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/configure b/configure
index 9e407ce2e3..17732736ca 100755
--- a/configure
+++ b/configure
@@ -1018,7 +1018,7 @@ cat << EOF
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
   safe-stack      SafeStack Stack Smash Protection. Depends on
-                  clang/llvm >= 3.7 and requires coroutine backend ucontext.
+                  clang/llvm and requires coroutine backend ucontext.
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -1138,12 +1138,12 @@ fi
 cat > $TMPC << EOF
 #if defined(__clang_major__) && defined(__clang_minor__)
 # ifdef __apple_build_version__
-#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
-#   error You need at least XCode Clang v10.0 to compile QEMU
+#  if __clang_major__ < 12 || (__clang_major__ == 12 && __clang_minor__ < 0)
+#   error You need at least XCode Clang v12.0 to compile QEMU
 #  endif
 # else
-#  if __clang_major__ < 6 || (__clang_major__ == 6 && __clang_minor__ < 0)
-#   error You need at least Clang v6.0 to compile QEMU
+#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
+#   error You need at least Clang v10.0 to compile QEMU
 #  endif
 # endif
 #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
@@ -1156,7 +1156,7 @@ cat > $TMPC << EOF
 int main (void) { return 0; }
 EOF
 if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)"
+    error_exit "You need at least GCC v7.4 or Clang v10.0 (or XCode Clang v12.0)"
 fi
 
 # Accumulate -Wfoo and -Wno-bar separately.
@@ -1261,19 +1261,6 @@ EOF
   fi
 fi
 
-# Disable -Wmissing-braces on older compilers that warn even for
-# the "universal" C zero initializer {0}.
-cat > $TMPC << EOF
-struct {
-  int a[2];
-} x = {0};
-EOF
-if compile_object "-Werror" "" ; then
-  :
-else
-  QEMU_CFLAGS="$QEMU_CFLAGS -Wno-missing-braces"
-fi
-
 # Our module code doesn't support Windows
 if test "$modules" = "yes" && test "$mingw32" = "yes" ; then
   error_exit "Modules are not available for Windows"
-- 
2.31.1


