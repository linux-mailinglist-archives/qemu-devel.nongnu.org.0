Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0AF187242
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:26:53 +0100 (CET)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDuRw-0006Db-BD
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jDtXn-0003id-9Y
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jDtXl-0002FC-Vz
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:51 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jDtXk-00022H-Bp
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b2so16053190wrj.10
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0mbXI1FyMLDM5RVM9EU8oKyEvhKwmvfb7Yp7qK5ioM=;
 b=OzCWNNwBak8yE/Fcxhd/ZyQc84pbSqzsgLqCwWEyoTaPSF/6PBsb4TQzTODE9OzSY7
 V0suokH+dKOpBm0HqUyCDx2NtxaTub0xdwffooACl44ZRmYiIr5m23/lbER5HBHsA4Lz
 o9uHtH6Duc/UhaZqYmMO1X2PbaFCVYA8yqMH64eJSS/20b3YrODRLCA8FZU/jHLferkY
 haFwMBHJnjPbdGpdmrNiJxnyj5S52hm0qgGslBnmtfdxPzYA8HAC1ndvCmI0CuTelxBw
 hl4A9AByXeOsugr9EPpGsVl0WLujJuiVdLl0b8xrUYx8k71soKPEuTPawsha1xysJYZN
 O+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0mbXI1FyMLDM5RVM9EU8oKyEvhKwmvfb7Yp7qK5ioM=;
 b=Ohcg4y7K4RHmQtB5n1MEIsYEY1nH3xJwhuQuaoQc2K2T6D6XbUURFBsDsEhfWuuVXY
 VRv70VIhE8v/4QuFUza3lv4lR2O/vW54xHnfkNedf6Zz6GzYZ57MmrrLzErIickA1/EP
 fuwDjHfeI+BVLy+RV5u83r4vjk65kljga6uWm2mxkJToVvUlLD1gN8JFzv3y0ZLdbdEZ
 Vpy9kSI30cjRjOWq0bEx/gLhKW5aYD7bhqIuH0zUe1kO2bGknDoYNPbdnn++xLiefgRp
 uiWwSspO/cSWx6OSIovLtJtmsQfUW3XHHx63mLFsOpUjFV6hdMn/xoxfIi8DEl3aRT9u
 3jAg==
X-Gm-Message-State: ANhLgQ2KF8G+vqbBucDxHL5hhBKlrjAg073zYL7ln2obOhd1w9d0SlUY
 kemDDWtEwQbWqBRI3xwnMYC3Ow==
X-Google-Smtp-Source: ADFU+vsedf7pCBxcX3pKcwKlrigpbFkclCGcCE2ZHjXoceF+3e0pByy6V08kj2Aw81yfb4PutD1kfg==
X-Received: by 2002:adf:f40f:: with SMTP id g15mr431292wro.213.1584379724372; 
 Mon, 16 Mar 2020 10:28:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm818520wrm.30.2020.03.16.10.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 10:28:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 557E01FFAB;
 Mon, 16 Mar 2020 17:21:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 21/28] configure: allow user to specify what gdb to use
Date: Mon, 16 Mar 2020 17:21:48 +0000
Message-Id: <20200316172155.971-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful, especially when testing relatively new gdbstub
features that might not be in distro packages yet.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/configure b/configure
index eb49bb6680c..6724158fde1 100755
--- a/configure
+++ b/configure
@@ -303,6 +303,7 @@ libs_qga=""
 debug_info="yes"
 stack_protector=""
 use_containers="yes"
+gdb_bin=$(command -v "gdb")
 
 if test -e "$source_path/.git"
 then
@@ -1588,6 +1589,8 @@ for opt do
   ;;
   --disable-fuzzing) fuzzing=no
   ;;
+  --with-gdb=*) gdb_bin="$optarg"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1773,6 +1776,7 @@ Advanced options (experts only):
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
+  --with-gdb=GBB-path      gdb to use for gdbstub tests [$gdb_bin]
 
 Optional features, enabled with --enable-FEATURE and
 disabled with --disable-FEATURE, default is enabled if available:
@@ -6734,6 +6738,7 @@ echo "libudev           $libudev"
 echo "default devices   $default_devices"
 echo "plugin support    $plugins"
 echo "fuzzing support   $fuzzing"
+echo "gdb               $gdb_bin"
 
 if test "$supported_cpu" = "no"; then
     echo
@@ -7608,6 +7613,10 @@ if test "$plugins" = "yes" ; then
     fi
 fi
 
+if test -n "$gdb_bin" ; then
+    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+fi
+
 if test "$tcg_interpreter" = "yes"; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
 elif test "$ARCH" = "sparc64" ; then
-- 
2.20.1


