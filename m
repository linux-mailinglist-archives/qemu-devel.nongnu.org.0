Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AF476C3E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:54:12 +0100 (CET)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmWh-0003JH-Su
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:54:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUN-0000Zc-R6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUL-000494-Rm
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYlD6TOFjvCShzjuklplaU9V9dCleRW8qoPWy0G46K4=;
 b=bgVRthDzoq3VRMSzKsBe+A0KhTN3uAioQidsnfnes30anh/yBYMT09k5jKh4fsONcTwzew
 SbLNz8uISGr8/GLP93lx+/kpr3TsnkwZctXYmw67XuKnTGq2jzg1Acft1p907Sq1Zoo7wN
 xHAhctYymqIsHIv5wdrLoMiV8vlNA+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-FFlEGU90PA2jUOF_vl-vHA-1; Thu, 16 Dec 2021 03:51:43 -0500
X-MC-Unique: FFlEGU90PA2jUOF_vl-vHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B804B19253C5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:42 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2592C1AB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] configure: make $targetos lowercase,
 use windows instead of MINGW32
Date: Thu, 16 Dec 2021 09:51:31 +0100
Message-Id: <20211216085139.99682-3-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

targetos is already mostly the same as Meson host_machine.system(),
just in CamelCase.  Adjust Windows, which is different, and switch to
lowercase to match Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 58 ++++++++++++++++++++++++-------------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/configure b/configure
index ba7ab435a6..63438c1900 100755
--- a/configure
+++ b/configure
@@ -502,30 +502,30 @@ EOF
 }
 
 if check_define __linux__ ; then
-  targetos="Linux"
+  targetos=linux
 elif check_define _WIN32 ; then
-  targetos='MINGW32'
+  targetos=windows
 elif check_define __OpenBSD__ ; then
-  targetos='OpenBSD'
+  targetos=openbsd
 elif check_define __sun__ ; then
-  targetos='SunOS'
+  targetos=sunos
 elif check_define __HAIKU__ ; then
-  targetos='Haiku'
+  targetos=haiku
 elif check_define __FreeBSD__ ; then
-  targetos='FreeBSD'
+  targetos=freebsd
 elif check_define __FreeBSD_kernel__ && check_define __GLIBC__; then
-  targetos='GNU/kFreeBSD'
+  targetos=gnu/kfreebsd
 elif check_define __DragonFly__ ; then
-  targetos='DragonFly'
+  targetos=dragonfly
 elif check_define __NetBSD__; then
-  targetos='NetBSD'
+  targetos=netbsd
 elif check_define __APPLE__; then
-  targetos='Darwin'
+  targetos=darwin
 else
   # This is a fatal error, but don't report it yet, because we
   # might be going to just print the --help text, or it might
   # be the result of a missing compiler.
-  targetos='bogus'
+  targetos=bogus
 fi
 
 # Some host OSes need non-standard checks for which CPU to use.
@@ -533,7 +533,7 @@ fi
 # cross-compiling to one of these OSes then you'll need to specify
 # the correct CPU with the --cpu option.
 case $targetos in
-SunOS)
+sunos)
   # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
   if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
     cpu="x86_64"
@@ -624,40 +624,40 @@ fi
 # OS specific
 
 case $targetos in
-MINGW32*)
+windows)
   mingw32="yes"
   plugins="no"
   pie="no"
 ;;
-GNU/kFreeBSD)
+gnu/kfreebsd)
   bsd="yes"
 ;;
-FreeBSD)
+freebsd)
   bsd="yes"
   bsd_user="yes"
   make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
 ;;
-DragonFly)
+dragonfly)
   bsd="yes"
   make="${MAKE-gmake}"
 ;;
-NetBSD)
+netbsd)
   bsd="yes"
   make="${MAKE-gmake}"
 ;;
-OpenBSD)
+openbsd)
   bsd="yes"
   make="${MAKE-gmake}"
 ;;
-Darwin)
+darwin)
   bsd="yes"
   darwin="yes"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
 ;;
-SunOS)
+sunos)
   solaris="yes"
   make="${MAKE-gmake}"
   smbd="${SMBD-/usr/sfw/sbin/smbd}"
@@ -666,11 +666,11 @@ SunOS)
 # needed for TIOCWIN* defines in termios.h
   QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
 ;;
-Haiku)
+haiku)
   pie="no"
   QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
 ;;
-Linux)
+linux)
   linux="yes"
   linux_user="yes"
   vhost_user=${default_feature:-yes}
@@ -3355,8 +3355,8 @@ QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 # Mac OS X ships with a broken assembler
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
-        test "$targetos" != "Darwin" && test "$targetos" != "SunOS" && \
-        test "$targetos" != "Haiku" && test "$softmmu" = yes ; then
+        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
+        test "$targetos" != "haiku" && test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
@@ -3914,15 +3914,7 @@ if test "$skip_meson" = no; then
   if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
-    if test "$mingw32" = "yes" ; then
-        echo "system = 'windows'" >> $cross
-    fi
-    if test "$linux" = "yes" ; then
-        echo "system = 'linux'" >> $cross
-    fi
-    if test "$darwin" = "yes" ; then
-        echo "system = 'darwin'" >> $cross
-    fi
+    echo "system = '$targetos'" >> $cross
     case "$ARCH" in
         i386)
             echo "cpu_family = 'x86'" >> $cross
-- 
2.33.1



