Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87151564070
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:59:29 +0200 (CEST)
Received: from localhost ([::1]:55830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7deh-0000pN-Ps
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc4-0006cD-8S
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:44 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc2-0000Ze-Ly
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:44 -0400
Received: by mail-il1-x130.google.com with SMTP id p9so3022691ilj.7
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrqFubMWK6vYp8ssFg9YAQd4SKhUAEjv/YEPYS2wSqs=;
 b=betM8XKLLnQtL5/PLcQpoO7k2wLHr1EiGZdMUL/HdwhbHLN4k93bhsVPqUWi0wRLRw
 WV78oxEpVPy+6K3qd91KYxG+9MOdVm7GcLuPOazobgu8DReL5utdqQhU4FZH30QJLB9H
 nbBm3tveczs8C+FNJfzRWLWzYxWyI3C7uNEkDsnjZgZjVRXZGn7cjM7mASMsVKusM0d9
 KYLJNCt5eSopLtLREo3IeFsr+gI5JZ5SiVp/5AO7nAqussY5E0mP/DNGOIF/dbZ3GA8M
 tnldq7ojK5HhUKYu4mnX858SEwDwGwgabdPByW28pfSCOdz5sYNIRwHCrSLRbgHyuLyC
 SWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrqFubMWK6vYp8ssFg9YAQd4SKhUAEjv/YEPYS2wSqs=;
 b=75hHPIc4Uyy02/KRprrnLKBtq1bn0kk7iPgXt0CI2JZ0btDTq75sAxpgVkliRmoWnf
 1Qpvxg9ssfH+0rCR05XDIhV5ltuSPK5jmmkDcw31dnKD+6rZe7bVWnd2g8Y7a3Xxzjyi
 FrdflRkmi2NvpAO2PAoCjU42Z/aIuEgEQmmuqNqA90WPIW1Gac2/r9DEabx7BGpqDq7J
 B/N7Sh8D6hyt509DRdcjdayeYwTR5WeGppTnj2h87AKHSfqfNuhTThN6BfHos5xE3Qew
 ZavQYLulC4uS9KWKQqSvEQXgRRo/vxXoR3hqkf2bt+xUJbBn9mnZPzJzyTO/kcsim+XP
 e17g==
X-Gm-Message-State: AJIora+SUa2qJqWjvIac2I+imYLHTwCWOwlCgTsDvSi9H+7CrDFEH6Wj
 zo4vQRrkOMXy3DhlA1jta4vrybf//UfDAA==
X-Google-Smtp-Source: AGRyM1sWyNggBnAXUXp0MSkdDfarnb8hWZOaShjuCX1PNw/JEw5sOArn9qsoXn11ujktAj51t6O4xg==
X-Received: by 2002:a92:2a0a:0:b0:2d9:2571:f57e with SMTP id
 r10-20020a922a0a000000b002d92571f57emr11405854ile.154.1656770200961; 
 Sat, 02 Jul 2022 06:56:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/11] bsd-user: Implement mount, umount and nmount
Date: Sat,  2 Jul 2022 07:56:56 -0600
Message-Id: <20220702135706.73622-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 52 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 13 +++++++++
 2 files changed, 65 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index b2dca586129..a0f03102639 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -549,4 +549,56 @@ static abi_long do_bsd_sync(void)
     return 0;
 }
 
+/* mount(2) */
+static abi_long do_bsd_mount(abi_long arg1, abi_long arg2, abi_long arg3,
+        abi_long arg4)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    /*
+     * XXX arg4 should be locked, but it isn't clear how to do that since it may
+     * be not be a NULL-terminated string.
+     */
+    if (arg4 == 0) {
+        ret = get_errno(mount(p1, p2, arg3, NULL)); /* XXX path(p2)? */
+    } else {
+        ret = get_errno(mount(p1, p2, arg3, g2h_untagged(arg4))); /* XXX path(p2)? */
+    }
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* unmount(2) */
+static abi_long do_bsd_unmount(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(unmount(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* nmount(2) */
+static abi_long do_bsd_nmount(abi_long arg1, abi_long count,
+        abi_long flags)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_READ, arg1, count, 1);
+
+    if (vec != NULL) {
+        ret = get_errno(nmount(vec, count, flags));
+        unlock_iovec(vec, arg1, count, 0);
+    } else {
+        return -TARGET_EFAULT;
+    }
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 2623caf8007..bd4dfa6ddc7 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -33,6 +33,7 @@
 #include "qemu/path.h"
 #include <sys/syscall.h>
 #include <sys/param.h>
+#include <sys/mount.h>
 #include <sys/sysctl.h>
 #include <utime.h>
 
@@ -373,6 +374,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_sync();
         break;
 
+    case TARGET_FREEBSD_NR_mount: /* mount(2) */
+        ret = do_bsd_mount(arg1, arg2, arg3, arg4);
+        break;
+
+    case TARGET_FREEBSD_NR_unmount: /* unmount(2) */
+        ret = do_bsd_unmount(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_nmount: /* nmount(2) */
+        ret = do_bsd_nmount(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


