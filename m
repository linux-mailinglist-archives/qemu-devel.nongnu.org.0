Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665A251DA4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 18:55:19 +0200 (CEST)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAcEA-0002ZK-Ia
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 12:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAcD6-0001Fj-GT
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 12:54:12 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAcD4-0003gG-Rk
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 12:54:12 -0400
Received: by mail-pf1-x444.google.com with SMTP id k15so1340716pfc.12
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzrUXWXJ2P4FPb4Z7Y3jIG7wAqzpJKqykSmKTUKfTsk=;
 b=oOHrNjqjLxIlvODn6hHVZ0ptZCsU3Yxnup8VcCLSxqCnxWC+VFFbAMk/oQmjLKUJX2
 qP5Qy2DiUAaTmwhr3DNsOkrl42YNWHJwhCAphi7YbV1JbHWjKKeBsA6tOLArK+qigfb8
 Mmj5zN+ypOwg+7UIn7gJ/p6be3bmnLUM36hEsICpVE4FBFo0jea6mZALSSEvHfirvgsS
 IshkTxESUo8V/kVd0LX+lf9eUPSV9tTogvedZ4sql6iLraDIabRq8pJqcpIZdhA6TxTc
 QqVlBJ77rgRiRAU0hci/BYyPsVcFB+8cJfBkLLy9Qv+T/mNelAV4YQGNyFOhjuW5HTdj
 4q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bzrUXWXJ2P4FPb4Z7Y3jIG7wAqzpJKqykSmKTUKfTsk=;
 b=hC1/2rr6lrDT3NMRRA2wC5JzMaE9HzRCgrkCS90GoakiTLVWYFFDcmGjwuvNDsuQJH
 7DbG3G6iwAcFhKiSqkJRxoVECU36/m4WObi1Rtl3M5tDxZhFOYVdaDiviO2EWE9vPN3B
 nZBk67wxbudeC19M6c87sYecFlwnH+6nMXXFi/KTaodL/y0mp5CRy8+brbNg5KdtRN/O
 S5H6I/Qjb5Oe2SCysFP28qC/SXkE8w53lwPcTJdqELRkBgDOIW9QdWqz9CwPJ1ZiHHWx
 TQyh8eiUyb5T4ygfrmH9/gHiLPcyBsMlsJDKE3O3//fB56VT9vdqY/sPBiHck7rvHGMB
 j3OA==
X-Gm-Message-State: AOAM533NQGvDcU//0a9p177Of3+St6UIhC8obxNUmgoYZR/iGPIL9Dmx
 Oar4vHWtaKmLHVsW/H/cxewSuZq8kUe0awBJTxA=
X-Google-Smtp-Source: ABdhPJw7MMBTBkAMI4hCR53aQrxZ31YCKUkBEAWah2Tfg1yVhwecSp1pQRUbnW/JojZvxtd+0zU5Ng==
X-Received: by 2002:a17:902:e901:: with SMTP id
 k1mr8896107pld.189.1598374448962; 
 Tue, 25 Aug 2020 09:54:08 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id
 193sm15988527pfu.169.2020.08.25.09.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:54:08 -0700 (PDT)
From: luoyonggang@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] configure: Fix include and linkage issue on msys2
Date: Wed, 26 Aug 2020 00:53:41 +0800
Message-Id: <20200825165341.520-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200825165341.520-1-luoyonggang@gmail.com>
References: <20200825165341.520-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=E8=8C=85?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

On msys2, the -I/e/path/to/qemu -L/e/path/to/qemu are not recognized by the compiler
Cause $PWD are result posix style path such as /e/path/to/qemu that can not be recognized
by mingw gcc, and `pwd -W` are result Windows style path such as E:/path/to/qemu that can
be recognized by the mingw gcc. So we replace all $PWD with $build_path that can
building qemu under msys2/mingw environment.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 configure | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index b1e11397a8..3b9e79923d 100755
--- a/configure
+++ b/configure
@@ -13,8 +13,13 @@ export CCACHE_RECACHE=yes
 
 # make source path absolute
 source_path=$(cd "$(dirname -- "$0")"; pwd)
+build_path=$PWD
+if [ "$MSYSTEM" = "MINGW64" -o  "$MSYSTEM" = "MINGW32" ]; then
+source_path=$(cd "$(dirname -- "$0")"; pwd -W)
+build_path=`pwd -W`
+fi
 
-if test "$PWD" = "$source_path"
+if test "$build_path" = "$source_path"
 then
     echo "Using './build' as the directory for build output"
 
@@ -346,7 +351,12 @@ ld_has() {
     $ld --help 2>/dev/null | grep ".$1" >/dev/null 2>&1
 }
 
-if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
+check_valid_build_path="[[:space:]:]"
+if [ "$MSYSTEM" = "MINGW64" -o  "$MSYSTEM" = "MINGW32" ]; then
+check_valid_build_path="[[:space:]]"
+fi
+
+if printf %s\\n "$source_path" "$build_path" | grep -q "$check_valid_build_path";
 then
   error_exit "main directory cannot contain spaces nor colons"
 fi
@@ -942,7 +952,7 @@ Linux)
   linux="yes"
   linux_user="yes"
   kvm="yes"
-  QEMU_INCLUDES="-isystem ${source_path}/linux-headers -I$PWD/linux-headers $QEMU_INCLUDES"
+  QEMU_INCLUDES="-isystem ${source_path}/linux-headers -I${build_path}/linux-headers $QEMU_INCLUDES"
   libudev="yes"
 ;;
 esac
@@ -4283,7 +4293,7 @@ EOF
               symlink "$source_path/dtc/Makefile" "dtc/Makefile"
           fi
           fdt_cflags="-I${source_path}/dtc/libfdt"
-          fdt_ldflags="-L$PWD/dtc/libfdt"
+          fdt_ldflags="-L${build_path}/dtc/libfdt"
           fdt_libs="$fdt_libs"
       elif test "$fdt" = "yes" ; then
           # Not a git build & no libfdt found, prompt for system install
@@ -5268,7 +5278,7 @@ case "$capstone" in
     else
       LIBCAPSTONE=libcapstone.a
     fi
-    capstone_libs="-L$PWD/capstone -lcapstone"
+    capstone_libs="-L${build_path}/capstone -lcapstone"
     capstone_cflags="-I${source_path}/capstone/include"
     ;;
 
@@ -6268,8 +6278,8 @@ case "$slirp" in
       git_submodules="${git_submodules} slirp"
     fi
     mkdir -p slirp
-    slirp_cflags="-I${source_path}/slirp/src -I$PWD/slirp/src"
-    slirp_libs="-L$PWD/slirp -lslirp"
+    slirp_cflags="-I${source_path}/slirp/src -I${build_path}/slirp/src"
+    slirp_libs="-L${build_path}/slirp -lslirp"
     if test "$mingw32" = "yes" ; then
       slirp_libs="$slirp_libs -lws2_32 -liphlpapi"
     fi
@@ -8212,7 +8222,7 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-NINJA=$PWD/ninjatool $meson setup \
+NINJA="${build_path}/ninjatool" $meson setup \
         --prefix "${pre_prefix}$prefix" \
         --libdir "${pre_prefix}$libdir" \
         --libexecdir "${pre_prefix}$libexecdir" \
@@ -8232,7 +8242,7 @@ NINJA=$PWD/ninjatool $meson setup \
 	-Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
 	-Dgettext=$gettext -Dxkbcommon=$xkbcommon \
         $cross_arg \
-        "$PWD" "$source_path"
+        "$build_path" "$source_path"
 
 if test "$?" -ne 0 ; then
     error_exit "meson setup failed"
-- 
2.27.0.windows.1


