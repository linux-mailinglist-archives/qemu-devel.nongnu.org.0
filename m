Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A4300D96
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:20:46 +0100 (CET)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32vF-0007mJ-Nf
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mH-000529-2z
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:29 -0500
Received: from mail-pj1-f51.google.com ([209.85.216.51]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mF-0004dN-HB
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:28 -0500
Received: by mail-pj1-f51.google.com with SMTP id x20so4597303pjh.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cjf3zkEzdC7Sji+ngGUJT+yhUPJZ6w/w5ucvRluKxqY=;
 b=P8TkNNVmRno25WfJBJFbT6Ux9PDTKBuxIj3wLGssyhb/8MJAu/1QtFPNg6BZifTglz
 gRsYr+aVRmHZM4yHkFQ6Jieqk8kFTV5sJh4uJA3RyQXM87V+DyYERh9XPe8C+VhGMZ0i
 ew8se/KgV/FJFnxmCcWJN4i8BOC6QGaPUl/aGZCq8qW+b7BNBRCzS7TSsjkzrYtTv9CB
 rzOE4ZCxPceTCxAkB7KmQgLxKadwVbdkBTfJocYNOdcJopWFRVCsUFsZUk+2y6oe/OUj
 J4S7GT+TEaAVEOAwUfO5NnwMFV2e17cUyYbhfO/FHwB/ibMdqpEc4ABhfw3l1XXkvSNA
 Rsrw==
X-Gm-Message-State: AOAM533nJDFF/YnhPsm8raGWvhg+JzNHknRpuY35D/KZ8PWFSwOEf3YB
 g8eBIhYZl5JrAPC5eTC4/T8sq1llXrc=
X-Google-Smtp-Source: ABdhPJzFcl8V6+Owu0LGAT2J5bXXiioKXD8FkUDb0qukZ3F1y1jNtIQAnqSY6bK6AvOkKF+RlqMNQA==
X-Received: by 2002:a17:90a:1182:: with SMTP id
 e2mr7157800pja.152.1611346285901; 
 Fri, 22 Jan 2021 12:11:25 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:25 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/11] darwin: detect CoreAudio for build
Date: Fri, 22 Jan 2021 12:11:12 -0800
Message-Id: <20210122201113.63788-11-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.51; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On iOS there is no CoreAudio, so we should not assume Darwin always
has it.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index f487be3cfe..fb671258e6 100755
--- a/configure
+++ b/configure
@@ -319,6 +319,7 @@ fdt="auto"
 netmap="no"
 sdl="auto"
 sdl_image="auto"
+coreaudio="auto"
 virtiofsd="auto"
 virtfs="auto"
 libudev="auto"
@@ -779,7 +780,7 @@ Darwin)
     QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
     QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
   fi
-  audio_drv_list="coreaudio try-sdl"
+  audio_drv_list="try-coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
@@ -3162,6 +3163,24 @@ EOF
   fi
 fi
 
+##########################################
+# detect CoreAudio
+if test "$coreaudio" != "no" ; then
+  coreaudio_libs="-framework CoreAudio"
+  cat > $TMPC << EOF
+#include <CoreAudio/CoreAudio.h>
+int main(void)
+{
+  return (int)AudioGetCurrentHostTime();
+}
+EOF
+  if compile_prog "" "$coreaudio_libs" ; then
+    coreaudio=yes
+  else
+    coreaudio=no
+  fi
+fi
+
 ##########################################
 # Sound support libraries probe
 
@@ -3218,8 +3237,20 @@ for drv in $audio_drv_list; do
     fi
     ;;
 
-    coreaudio)
+    coreaudio | try-coreaudio)
+    if test "$coreaudio" = "no"; then
+      if test "$drv" = "try-coreaudio"; then
+        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-coreaudio//')
+      else
+        error_exit "$drv check failed" \
+                "Make sure to have the $drv is available."
+      fi
+    else
       coreaudio_libs="-framework CoreAudio"
+      if test "$drv" = "try-coreaudio"; then
+        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-coreaudio/coreaudio/')
+      fi
+    fi
     ;;
 
     dsound)
-- 
2.28.0


