Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0CB6EBAB2
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:30:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH2Y-0006uK-Lc; Sat, 22 Apr 2023 13:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFy0-00023h-7i
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:04 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxw-0007HR-2x
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:02 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b5ce4f069so4061906b3a.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180390; x=1684772390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQ7nCVVeSs6mi7VEnq3MPlZQcrsUsxYhe+Yoh3gzbp8=;
 b=gXSsM0Ghss1wzuQHZ2z6SOjzBJDbWzqYOEzBqgZVuHggsHcX0eqD5pIMwmTHH63ZCU
 OtZz50zcsAn9cDrZlwpuyiv177kW0OJ4WdOBJtYeObrxa1p/eQ9VPbB1BDiRwbeNtBjH
 Ho15mi5lbA+T9Xp/4JZ0Tb1ExssdHBYMglID9b8j+Tc/xmrBrYtupfcozSQ0in4sUHhs
 m39P3GLyBUfiwgGSvcaH/5w1nWyPk6tSMp5Ej5hJcg+t7UxuB4D1qtpdF4LMlhGDBDVE
 jQhCrKDXIs/AYs5J2ZIKUVGQ7X6o6Lj8NZNm8VlF7VIhRDob4jyPszlkuZo0EfoXq+gy
 Oy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180390; x=1684772390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQ7nCVVeSs6mi7VEnq3MPlZQcrsUsxYhe+Yoh3gzbp8=;
 b=LWhtmV8YOxIhNqYeMHqlIOLD/lu+zXkRkTVMmZdsTiR/OFNfxsQ0Upp5GWxX2QCOFt
 Jvvrt/aLAODsMjtERIJJwYV9GhxDLjg4geBkaDPtZz5SU9Z16DBtcRMOWxUZiNe3VaCA
 jhyvWmUykN7FlI9z9T51IhsEPOTHCPcbCzuIOj+KIEenkjlseMWlzVoL/oBHZ7jSBpko
 9s0/8Qhs0qoPdX4EJnMkEs5fhv9A3ZvKmqpxyt+LQAI0NZ/FOppY+47E8n1z1cBh8o28
 e+zS6t+fMp5C15dZDi8aipd6QvV9X3Ypm2Qa51F/KvuXa+B0MBRYfExexWj+PvU0p0RD
 tvBw==
X-Gm-Message-State: AAQBX9fPgojX0/GG8AXa6JCD4qmYK8htwrlHSa4byS7Mlr6MYVd++xOx
 K4DN1syHU5T1V797+QJPFfg=
X-Google-Smtp-Source: AKy350bAhiTd0meE6bVyIEsMYJH1R+0nSKUlAOAGzHp8YH5Z3/2hfVwqC/GjtnKb+S6crOacYBs/sQ==
X-Received: by 2002:a05:6a20:748f:b0:d9:27f7:8c4a with SMTP id
 p15-20020a056a20748f00b000d927f78c4amr11386774pzd.0.1682180390618; 
 Sat, 22 Apr 2023 09:19:50 -0700 (PDT)
Received: from apple.localdomain ([182.65.27.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a655b8e000000b0051f14839bf3sm4241667pgr.34.2023.04.22.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 09:19:50 -0700 (PDT)
From: Ajeets6 <itachis6234@gmail.com>
To: itachis6234@gmail.com,
	qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 2/7] Create os-time.h and modify os-time.c
Date: Sat, 22 Apr 2023 21:49:29 +0530
Message-Id: <20230422161934.2311-2-itachis6234@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230422161934.2311-1-itachis6234@gmail.com>
References: <20230422161934.2311-1-itachis6234@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=itachis6234@gmail.com; helo=mail-pf1-x434.google.com
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

From: Stacey Son <sson@FreeBSD.org>

+add nanosleep(2) in os-time.h
+add t2h_freebsd_timeval and h2t_freebsd_timeval time conversion
functions
-remove t2h_freebsd_timeval in os-time.c
Co-Authored-By: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Ajeets6 <itachis6234@gmail.com>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
---
 bsd-user/freebsd/os-time.c | 29 ++++++++++++++++++-------
 bsd-user/freebsd/os-time.h | 44 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 8 deletions(-)
 create mode 100644 bsd-user/freebsd/os-time.h

diff --git a/bsd-user/freebsd/os-time.c b/bsd-user/freebsd/os-time.c
index ec9f59ded7..e71eed6519 100644
--- a/bsd-user/freebsd/os-time.c
+++ b/bsd-user/freebsd/os-time.c
@@ -20,22 +20,35 @@
 /*
  * FreeBSD time conversion functions
  */
-#include <errno.h>
+#include "qemu/osdep.h"
 #include <time.h>
-#include <sys/types.h>
 #include "qemu.h"
 
 
-abi_long t2h_freebsd_timeval(struct timeval *tv, abi_ulong target_tv_addr)
+abi_long t2h_freebsd_timespec(struct timespec *ts, abi_ulong target_ts_addr)
 {
-    struct target_freebsd_timeval *target_tv;
+    struct target_freebsd_timespec *target_ts;
 
-    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 0)) {
+    if (!lock_user_struct(VERIFY_READ, target_ts, target_ts_addr, 0)) {
         return -TARGET_EFAULT;
     }
-    __get_user(tv->tv_sec, &target_tv->tv_sec);
-    __get_user(tv->tv_usec, &target_tv->tv_usec);
-    unlock_user_struct(target_tv, target_tv_addr, 1);
+    __get_user(ts->tv_sec, &target_ts->tv_sec);
+    __get_user(ts->tv_nsec, &target_ts->tv_nsec);
+    unlock_user_struct(target_ts, target_ts_addr, 1);
+
+    return 0;
+}
+
+abi_long h2t_freebsd_timespec(abi_ulong target_ts_addr, struct timespec *ts)
+{
+    struct target_freebsd_timespec *target_ts;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_ts_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __put_user(ts->tv_sec, &target_ts->tv_sec);
+    __put_user(ts->tv_nsec, &target_ts->tv_nsec);
+    unlock_user_struct(target_ts, target_ts_addr, 1);
 
     return 0;
 }
\ No newline at end of file
diff --git a/bsd-user/freebsd/os-time.h b/bsd-user/freebsd/os-time.h
new file mode 100644
index 0000000000..18c9e1dd12
--- /dev/null
+++ b/bsd-user/freebsd/os-time.h
@@ -0,0 +1,44 @@
+/*
+ *  FreeBSD time related system call shims
+ *
+ *  Copyright (c) 2013-2015 Stacey Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef FREEBSD_OS_TIME_H
+#define FREEBSD_OS_TIME_H
+
+
+#include "qemu.h"
+
+
+
+
+/* nanosleep(2) */
+static inline abi_long do_freebsd_nanosleep(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    struct timespec req, rem;
+
+    ret = t2h_freebsd_timespec(&req, arg1);
+    if (!is_error(ret)) {
+        ret = get_errno(safe_nanosleep(&req, &rem));
+        if (ret == -TARGET_EINTR && arg2) {
+            h2t_freebsd_timespec(arg2, &rem);
+        }
+    }
+
+    return ret;
+}
-- 
2.34.1


