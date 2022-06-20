Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1C5522E4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:46:17 +0200 (CEST)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LTc-00080d-6u
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPh-0005Cr-Ps
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:13 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPg-00082F-2X
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:13 -0400
Received: by mail-il1-x12d.google.com with SMTP id o13so2506609ilt.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcJsu926ojREEMFrSsx5nEuKvNWjOE/4L6qk23IhBSw=;
 b=ph91WBEaadofKnwUdrXaSiJK6ZW5q3rSen/ExGRvyUU01NgJ35199V5LqDzHAb8aS9
 AyWB99XrVXcg2+jYquLggIM4Us/B5SrNmgiCkeap8iLlXvj5CQMS/5//F8JRbr3vMRnk
 XEIQU+LGTIR1HRYmaUPqdlBfuj6WWfqGAcDwrvUBQw7jFGsMYA6JDzxdz4l1KOqtDK04
 0tVsE7JAYnUwqLU/L7fgdGui01/Q3XXu99TxBKxiuoXCzJVeRLlu2JpIpH54jdQQYIez
 yuaOtoAxxtVRXJLGkFiJXZ0cl05vdkNkFOQ1+QTCj6Sv5ltdWeTK5kp9ijqbGk7FiBMH
 c/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qcJsu926ojREEMFrSsx5nEuKvNWjOE/4L6qk23IhBSw=;
 b=ORTBXMHTKVWVp4qraO3ncWDCO+aQv13rhwq8YRX5+r0z108dP0jXNcQeLCWxSAun81
 1M1U2agp8z+IjcPhP/APr0umLfxwc9CQITHZzO/dW9v2wVQgXP7BWm8ft/pBB6UlCgyu
 xayjQbl/GykYmjJtYEumNf0iwmJHrkNr5Pu4Qjj/cG5Ta0X1QEh3Ncj5sUqK33TlCY/O
 wxWwH7Dxz5HgyJ0qFC9b4xgTU9QV7SDJVylBRTjLztyshRkUQEE7z2DPjmBsX4ifF987
 z9F4+hb2JhAVMeL3+8iAOMI6h2U1Ppbt3sy47XLwZQuVjZQq+BYr3+9lBDZr+Lk5iZiq
 3Dpw==
X-Gm-Message-State: AJIora8t42QS+qos8ZFhYO7yhafO56/oXEdmiWL6cnNCe/QfKQP0grnu
 6NOujEGkXwbu5SOs0BCPvbiDYxZ5PKeMYA==
X-Google-Smtp-Source: AGRyM1s/Q9o0fwXrCqTXw9qzpXkc41uBZH6ErHbGwg+DKimPA9NQ0tu5DjhqxZMWcjiCyT0avKdA3g==
X-Received: by 2002:a92:d309:0:b0:2d8:e639:4e02 with SMTP id
 x9-20020a92d309000000b002d8e6394e02mr9544749ila.313.1655746930663; 
 Mon, 20 Jun 2022 10:42:10 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Michal Meloun <mmel@FreeBSD.org>
Subject: [PATCH 04/10] bsd-user: Implement freebsd11_mknod,
 freebsd11_mknodat and mknodat
Date: Mon, 20 Jun 2022 11:42:14 -0600
Message-Id: <20220620174220.22179-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These implement both the old-pre INO64 mknod variations, as well as the
now current INO64 variant. To implement the old stuff, we use some
linker magic to bind to the old versions of these functions.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Michal Meloun <mmel@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 59 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 15 +++++++++
 2 files changed, 74 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 0585f6a2a40..3be832b2a74 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -51,6 +51,16 @@ do {                                        \
     unlock_user(p1, arg1, 0);               \
 } while (0)
 
+#ifndef BSD_HAVE_INO64
+#define freebsd11_mknod         mknod
+#define freebsd11_mknodat       mknodat
+#else
+int freebsd11_mknod(char *path, mode_t mode, uint32_t dev);
+__sym_compat(mknod, freebsd11_mknod, FBSD_1.0);
+int freebsd11_mknodat(int fd, char *path, mode_t mode, uint32_t dev);
+__sym_compat(mknodat, freebsd11_mknodat, FBSD_1.1);
+#endif
+
 extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
         int copy);
 extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
@@ -722,4 +732,53 @@ static abi_long do_bsd_fchmodat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* pre-ino64 mknod(2) */
+static abi_long do_bsd_freebsd11_mknod(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(freebsd11_mknod(p, arg2, arg3)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* pre-ino64 mknodat(2) */
+static abi_long do_bsd_freebsd11_mknodat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(freebsd11_mknodat(arg1, p, arg3, arg4));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
+#ifdef BSD_HAVE_INO64
+/* post-ino64 mknodat(2) */
+static abi_long do_bsd_mknodat(void *cpu_env, abi_long arg1,
+        abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
+        abi_long arg6)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+       /* 32-bit arch's use two 32 registers for 64 bit return value */
+    if (regpairs_aligned(cpu_env) != 0) {
+        ret = get_errno(mknodat(arg1, p, arg3, target_arg64(arg5, arg6)));
+    } else {
+        ret = get_errno(mknodat(arg1, p, arg3, target_arg64(arg4, arg5)));
+    }
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+#endif
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index b33d548a4b6..fea6a857b78 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -32,6 +32,7 @@
 #include "qemu/cutils.h"
 #include "qemu/path.h"
 #include <sys/syscall.h>
+#include <sys/cdefs.h>
 #include <sys/param.h>
 #include <sys/mount.h>
 #include <sys/sysctl.h>
@@ -418,6 +419,20 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fchmodat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_freebsd11_mknod: /* mknod(2) */
+        ret = do_bsd_freebsd11_mknod(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_freebsd11_mknodat: /* mknodat(2) */
+        ret = do_bsd_freebsd11_mknodat(arg1, arg2, arg3, arg4);
+        break;
+
+#ifdef BSD_HAVE_INO64
+    case TARGET_FREEBSD_NR_mknodat: /* mknodat(2) */
+        ret = do_bsd_mknodat(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


