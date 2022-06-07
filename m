Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7A541F00
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:40:53 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhsa-0001zS-Vg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5y-0007h9-3O
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:34 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5w-0001Jp-6V
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:33 -0400
Received: by mail-pl1-x634.google.com with SMTP id b5so15803839plx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b9Wo1kud3FfZ/iyFDZ+Amrek5//uugm/ypgN75Evzkg=;
 b=YcaOKdhZ0kxUeOWuLIT3yDfT7jddHhFmpH0ZNAoqYfMCe3MEYShCNhyfQ1qjH9Pxm5
 +yR0O3fhBFuK0gZ/n0RlM0H6CZBV6K8q65OLrtl+ZWnc6zzin4ZZiqteBiAOrXpabl5y
 oINFBG6rrt+XdR6KRJz9ff8w9wBihSESmfIiQ9C6tGae4Qf1nPbTlt8TlH+fFwB0PSpb
 TxQRCn1eZUrQoUXZLiE8S43bD+7fkK8e5bCtR4CtgJYxU6xzupg4C2/EiOLXPnc6xT+p
 +netiuE+FXUhQQ/Kq4p1RZAe7X3W9srYYr0jc/uNhAD9HcTXdfl6H1Wl3y0qh1c9usYF
 5dtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b9Wo1kud3FfZ/iyFDZ+Amrek5//uugm/ypgN75Evzkg=;
 b=uOuryZ85E6cmiKRcWV6E2upWOEyrg3Hu1s7qpuRFIa9MP0WGhWzNq6+5XPx7uGqUDJ
 HA45mhzE+Z/DKD0glJv217BdkZxsbX3jtInq521xkEg3fnvvZwR2JVt+6i+73mRYgodQ
 cwqEHlr8MhWdBMprM+R76nzdZYdQ5shcFBRI2S5qEETH541Pah+ZKbpFT6LyPIHBH1Pi
 gxi+AvYjpc8a2SB2/g7VAOQ0HPGqqxHNfgEecPXR40z0ce7Pwe3+86OXZJQ1gfnignp7
 ofHyH0jkp+wL8ACukiOK55tjUEUlpxfBojNgOC4IAjHFgDq5D4mZFN0v8AfSsPGwojqC
 AKwQ==
X-Gm-Message-State: AOAM530Btubqzr8foDxCzyk3FWbtxHjz6GaDzYy4Z21FQHDXxcHrOs5E
 CvWXPomyFrszwgR3hDJisVkT7S7WZoh8Lw==
X-Google-Smtp-Source: ABdhPJwunotpeWPNygFNVLocQhtwUT5abv7UROYG02DF4vQDoAauCkW26OogKI7YxhoBiNi2y3epCg==
X-Received: by 2002:a17:90b:4d11:b0:1e8:436b:a9cc with SMTP id
 mw17-20020a17090b4d1100b001e8436ba9ccmr23894035pjb.40.1654634789861; 
 Tue, 07 Jun 2022 13:46:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 34/53] semihosting: Split out semihost_sys_flen
Date: Tue,  7 Jun 2022 13:45:38 -0700
Message-Id: <20220607204557.658541-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The ARM-specific SYS_FLEN isn't really something that can be
reused by other semihosting apis, but there are parts that can
reused for the implementation of semihost_sys_fstat.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  4 ++
 semihosting/arm-compat-semi.c  | 74 ++++++----------------------------
 semihosting/syscalls.c         | 49 ++++++++++++++++++++++
 3 files changed, 66 insertions(+), 61 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index c60ebafb85..1ae5ba6716 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -45,4 +45,8 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
                          int fd);
 
+void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
+                       gdb_syscall_complete_cb flen_cb,
+                       int fd, target_ulong fstat_addr);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 4529c9df06..81dd22e1c5 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -285,44 +285,25 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 }
 
 static void
-common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
+common_semi_flen_fstat_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     if (!err) {
         /* The size is always stored in big-endian order, extract the value. */
         uint64_t size;
-        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
-                            offsetof(struct gdb_stat, gdb_st_size),
-                            &size, 8, 0);
-        ret = be64_to_cpu(size);
+        if (cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
+                                offsetof(struct gdb_stat, gdb_st_size),
+                                &size, 8, 0)) {
+            ret = -1, err = EFAULT;
+        } else {
+            size = be64_to_cpu(size);
+            if (ret != size) {
+                ret = -1, err = EOVERFLOW;
+            }
+        }
     }
     common_semi_cb(cs, ret, err);
 }
 
-/*
- * Types for functions implementing various semihosting calls
- * for specific types of guest file descriptor. These must all
- * do the work and return the required return value to the guest
- * via common_semi_cb.
- */
-typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
-
-static void host_flenfn(CPUState *cs, GuestFD *gf)
-{
-    struct stat buf;
-
-    if (fstat(gf->hostfd, &buf)) {
-        common_semi_cb(cs, -1, errno);
-    } else {
-        common_semi_cb(cs, buf.st_size, 0);
-    }
-}
-
-static void gdb_flenfn(CPUState *cs, GuestFD *gf)
-{
-    gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
-                   gf->hostfd, common_semi_flen_buf(cs));
-}
-
 #define SHFB_MAGIC_0 0x53
 #define SHFB_MAGIC_1 0x48
 #define SHFB_MAGIC_2 0x46
@@ -340,27 +321,6 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
-{
-    common_semi_cb(cs, gf->staticfile.len, 0);
-}
-
-typedef struct GuestFDFunctions {
-    sys_flenfn *flenfn;
-} GuestFDFunctions;
-
-static const GuestFDFunctions guestfd_fns[] = {
-    [GuestFDHost] = {
-        .flenfn = host_flenfn,
-    },
-    [GuestFDGDB] = {
-        .flenfn = gdb_flenfn,
-    },
-    [GuestFDStatic] = {
-        .flenfn = staticfile_flenfn,
-    },
-};
-
 /*
  * Do a semihosting call.
  *
@@ -379,7 +339,6 @@ void do_common_semihosting(CPUState *cs)
     char * s;
     int nr;
     uint32_t ret;
-    GuestFD *gf;
     int64_t elapsed;
 
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -492,12 +451,8 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_FLEN:
         GET_ARG(0);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].flenfn(cs, gf);
+        semihost_sys_flen(cs, common_semi_flen_fstat_cb, common_semi_cb,
+                          arg0, common_semi_flen_buf(cs));
         break;
 
     case TARGET_SYS_TMPNAM:
@@ -819,9 +774,6 @@ void do_common_semihosting(CPUState *cs)
         cpu_dump_state(cs, stderr, 0);
         abort();
 
-    do_badf:
-        common_semi_cb(cs, -1, EBADF);
-        break;
     do_fault:
         common_semi_cb(cs, -1, EFAULT);
         break;
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 1f1baf7e2d..fff9550c89 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -127,6 +127,12 @@ static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "isatty,%x", (target_ulong)gf->hostfd);
 }
 
+static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, target_ulong addr)
+{
+    gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -259,6 +265,18 @@ static void host_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
     complete(cs, ret, ret ? 0 : errno);
 }
 
+static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf)
+{
+    struct stat buf;
+
+    if (fstat(gf->hostfd, &buf) < 0) {
+        complete(cs, -1, errno);
+    } else {
+        complete(cs, buf.st_size, 0);
+    }
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -311,6 +329,12 @@ static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 }
 
+static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
+                            GuestFD *gf)
+{
+    complete(cs, gf->staticfile.len, 0);
+}
+
 /*
  * Syscall entry points.
  */
@@ -473,3 +497,28 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
         g_assert_not_reached();
     }
 }
+
+void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
+                       gdb_syscall_complete_cb flen_cb, int fd,
+                       target_ulong fstat_addr)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        flen_cb(cs, -1, EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_fstat(cs, fstat_cb, gf, fstat_addr);
+        break;
+    case GuestFDHost:
+        host_flen(cs, flen_cb, gf);
+        break;
+    case GuestFDStatic:
+        staticfile_flen(cs, flen_cb, gf);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


