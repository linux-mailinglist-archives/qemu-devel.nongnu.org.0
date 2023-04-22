Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D286EBAB0
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:29:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH2Z-0006up-57; Sat, 22 Apr 2023 13:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFy0-00023g-7D
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:04 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxw-0007Hp-2z
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b5fca48bcso2776813b3a.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180398; x=1684772398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITt+UCVgKvfDuYsMDU+9rWKh+df6bOSVt/sSZdvwKnQ=;
 b=ldSUBa+GGyCTtCzQhjDubeu5oKVy9W05hH422irCQ+N6tSw12n1MIJ6xW19OdDQIkl
 QpRnRqYgcwlJnm2M1Q8SadqNBJe1l9vLUNXAsgpUEN/DVECg4AHo+nGKIAubxUdgfOg3
 i1tuyweG9hAtZsMbaScmRHnEnDMtB1IhqTTWhrVdFHC0WO+4appJkzNFx+bYecxGj28E
 /DyXhynY0peeCJpU89wEt5Os8FrUlz6XUwsV4RIuEWDw2Ihk4FXQlwJEmzjmPHD5weOm
 nxrqkpHGQocU2qIZjpnfLacngo8r61qcF7wZ14mUzerI7EbYJEB6JKieWpwOsXVvMHZn
 UgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180398; x=1684772398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITt+UCVgKvfDuYsMDU+9rWKh+df6bOSVt/sSZdvwKnQ=;
 b=QDFez6+BXs94NDS1QZ3+oJGVYkL0Q8PbfSldKrvCrYAQZPW0LC9t+wlYVVF9dB8vmo
 lWQRrnuJwmCBryar3LpTxeDp6UzIqwXQ6zutgOWcJWYWhNdhDvQnj8XoJgwS04SVUPO/
 e0FEmuDeqUt/QzF1QuqE3NoxgL7TN2CAaLz4y6VxEj5qgMe9UWaWNuTQwbaOWCSmuA9V
 +l/jC8cXajN1KonbxGQdrmiB2QWDPRL60QXoc8nJV/Sax7+nw52MBGgqC8mjLdxBrcVb
 Gu2g0r3OLX6vraM2xokP+UiRD6+eGlVIGs3Hn2ay9s+TqhPXTZY6LhI4Iup4J1aTwmh1
 nG9g==
X-Gm-Message-State: AAQBX9e4f+eIOpi6BMmU5JttpTNK6uMyKq//b2drZOr8H4XCEeWZUV/2
 jKixZUvpz0g8+s3n9N0kbnE=
X-Google-Smtp-Source: AKy350axvmWzGQPl8udaPbErz+cSbE8dIkub9giSvYOJJU9tDTMb73JMG/58UFj9G1rAJ7EXpppS6A==
X-Received: by 2002:a05:6a21:6d85:b0:f2:ba78:3d50 with SMTP id
 wl5-20020a056a216d8500b000f2ba783d50mr5602548pzb.12.1682180397923; 
 Sat, 22 Apr 2023 09:19:57 -0700 (PDT)
Received: from apple.localdomain ([182.65.27.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a655b8e000000b0051f14839bf3sm4241667pgr.34.2023.04.22.09.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 09:19:57 -0700 (PDT)
From: Ajeets6 <itachis6234@gmail.com>
To: itachis6234@gmail.com,
	qemu-devel@nongnu.org
Cc: imp@bsdimp.com
Subject: [PATCH 6/7] Added case staements for time functions
Date: Sat, 22 Apr 2023 21:49:33 +0530
Message-Id: <20230422161934.2311-6-itachis6234@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230422161934.2311-1-itachis6234@gmail.com>
References: <20230422161934.2311-1-itachis6234@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=itachis6234@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 22 Apr 2023 13:28:49 -0400
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

From: Warner Losh <imp@bsdimp.com>

+Added cases for nanosleep(2),clock_nanosleep(2),clock_gettime(2) and
clock_getres(2)
+Updated meson.build

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ajeets6 <itachis6234@gmail.com>
---
 bsd-user/freebsd/meson.build  |  1 +
 bsd-user/freebsd/os-syscall.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/bsd-user/freebsd/meson.build b/bsd-user/freebsd/meson.build
index f87c788e84..2eb0ed4d96 100644
--- a/bsd-user/freebsd/meson.build
+++ b/bsd-user/freebsd/meson.build
@@ -1,4 +1,5 @@
 bsd_user_ss.add(files(
   'os-sys.c',
   'os-syscall.c',
+  'os-time.c',
 ))
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c8f998ecec..8fd6eb05cb 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -46,6 +46,8 @@
 
 #include "bsd-file.h"
 #include "bsd-proc.h"
+/* *BSD dependent syscall shims */
+#include "os-time.h"
 
 /* I/O */
 safe_syscall3(int, open, const char *, path, int, flags, mode_t, mode);
@@ -507,6 +509,24 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_FREEBSD_NR_sysarch: /* sysarch(2) */
         ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
         break;
+     /*
+         * time related system calls.
+         */
+    case TARGET_FREEBSD_NR_nanosleep: /* nanosleep(2) */
+        ret = do_freebsd_nanosleep(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_clock_nanosleep: /* clock_nanosleep(2) */
+        ret = do_freebsd_clock_nanosleep(arg1, arg2, arg3, arg4);
+        break;
+
+    case TARGET_FREEBSD_NR_clock_gettime: /* clock_gettime(2) */
+        ret = do_freebsd_clock_gettime(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_clock_getres: /* clock_getres(2) */
+        ret = do_freebsd_clock_getres(arg1, arg2);
+        break;
 
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
-- 
2.34.1


