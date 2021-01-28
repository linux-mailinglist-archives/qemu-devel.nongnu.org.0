Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39D308055
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 22:15:56 +0100 (CET)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Edv-0002NN-E5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 16:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l5Ecf-0001vy-Ar
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 16:14:37 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l5Ecd-0005St-ET
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 16:14:37 -0500
Received: by mail-qv1-xf31.google.com with SMTP id es14so3528776qvb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8LVUEaadP39ijcAIdciXrrlug7pc/DEvqOLyZeJJwU=;
 b=EeIdGxffmZKXR+95Jv3cKw84cM0En45BdAn7M7OCUuKBDtD/UdLnfKveHXTrpaUnsq
 S9UUA8eF79B1Wvn5uDxVKJUh4casuNoB8+1zikWhoVcP+hewekK9B53hvdDuOtiES+b6
 x8IADLZtiJYYCOfgPGKj874LcISRibhVp5bgkODIZhzhULxc/wXQS8sesO/1rvbXmSak
 pKaMhozA+IWNyrh13SfMlL6q29LfhsM6JJmC7lwOXMerq17p8qucIUlXZoqQiLXKJJYC
 KhOUszche9X0HlMgjX6Yhun1j6LgL1cgOq3v8VQ6xVBlkegyfM0y56C9Sc70RkfczsgU
 w7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8LVUEaadP39ijcAIdciXrrlug7pc/DEvqOLyZeJJwU=;
 b=YnrK8c2K9SFYK7Qu6ZQqqtmH8yzxZs8EGKAtjO1Dc/ceLWTZ/bJThUWnsaOBvOKRGp
 Qg2dvwRkBLBxkUprc2rFAaRNcAAGN1WBMHfOnR16YOymahzCdJgrSz/uo07H2BfcjyxV
 57LAy2QETXfLwMIaJJXsdFtUm1dR9vgdfKgxrB/sNJu68zhH+8AJ3s+r7WmypbvPmQL+
 GqIp8T3fwC7qCebw6waeKNd0gWKuVIKjCOhPWh0rJZviemzBOEOQfqb+oMmLSXqTICVk
 gIV3GrVztA4l6Li/EXlFmVndtQUySyKimuqCktQzmzjUXq3xC2vnF7ZlX7XJViQzp3J6
 BcUw==
X-Gm-Message-State: AOAM5336GiKgpGOzto5X/mPzYJkhAHulWbAoMf1mVzrVfIlzweX9Ga0r
 fi7WE1lrSHqbJoeZX35TaA5DrcjHAtU=
X-Google-Smtp-Source: ABdhPJwGNfIlusc9Lrr9hXtwNBL2BcmQNmVAjX4t/ppVUVjrV+o7X/VxBhMDq11eXse5hYjW8sYXxg==
X-Received: by 2002:a0c:f582:: with SMTP id k2mr1526852qvm.46.1611868473597;
 Thu, 28 Jan 2021 13:14:33 -0800 (PST)
Received: from localhost.localdomain (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id z15sm2178369qti.43.2021.01.28.13.14.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 13:14:32 -0800 (PST)
From: John Arbuckle <programmingkidx@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] Add support for building on ARM Macs
Date: Thu, 28 Jan 2021 16:14:18 -0500
Message-Id: <20210128211419.50052-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf31.google.com
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds support for building QEMU on ARM-based Macintoshes. 
This patch has been tested on an M1 Mac running Mac OS 11.1
and on a 64-bit x86 Mac running Mac OS 10.12.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 configure | 49 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index dcc5ea7d63..f6bcd0ecac 100755
--- a/configure
+++ b/configure
@@ -622,13 +622,40 @@ fi
 # the correct CPU with the --cpu option.
 case $targetos in
 Darwin)
-  # on Leopard most of the system is 32-bit, so we have to ask the kernel if we can
-  # run 64-bit userspace code.
-  # If the user didn't specify a CPU explicitly and the kernel says this is
-  # 64 bit hw, then assume x86_64. Otherwise fall through to the usual detection code.
-  if test -z "$cpu" && test "$(sysctl -n hw.optional.x86_64)" = "1"; then
-    cpu="x86_64"
-  fi
+    # user specified the target cpu with --cpu
+    if test ! -z "$cpu"; then
+        echo "Using user-specified cpu target $cpu"
+
+    # detect the host cpu
+    else
+        raw_value=`sysctl -n hw.cputype`
+        cpu_arch=$((raw_value & 0xff))
+
+        if [[ $"cpu_arch" -eq 12 ]]; then    # if ARM
+            is_64bit=$((raw_value & 0x01000000))
+            if [[ "$is_64bit" -gt 1 ]]; then # if 64-bit
+                cpu="aarch64"
+            else
+                cpu="arm"
+            fi
+
+        elif [[ $"cpu_arch" -eq 7 ]]; then   # if x86
+            is_64bit=`sysctl -n hw.cpu64bit_capable`
+            if [[ "$is_64bit" -eq 1 ]]; then # if 64-bit
+                cpu="x86_64"
+            else
+                cpu="x86"
+            fi
+
+        elif [[ $"cpu_arch" -eq 18 ]]; then  # if PowerPC
+                # Not sure know how to detect 64-bit PowerPC a.k.a. G5
+                cpu="ppc"
+
+        else
+            echo "Unknown target cpu error"
+        fi
+    fi
+
   HOST_DSOSUF=".dylib"
   ;;
 SunOS)
@@ -772,10 +799,12 @@ OpenBSD)
 Darwin)
   bsd="yes"
   darwin="yes"
-  if [ "$cpu" = "x86_64" ] ; then
-    QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
-    QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
+  cpu_arch="$cpu"
+  if [ $cpu == "aarch64" ]; then   # Apple's clang prefers arm64
+    cpu_arch="arm64"
   fi
+  QEMU_CFLAGS="-arch $cpu_arch $QEMU_CFLAGS"
+  QEMU_LDFLAGS="-arch $cpu_arch $QEMU_LDFLAGS"
   audio_drv_list="coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
   QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit $QEMU_LDFLAGS"
-- 
2.24.3 (Apple Git-128)


