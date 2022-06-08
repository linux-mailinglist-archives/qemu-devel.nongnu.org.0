Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC8543E7D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:22:45 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz38W-0001uj-3P
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz337-00018c-Rk
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:10 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:41679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz336-00069r-1e
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:09 -0400
Received: by mail-io1-xd33.google.com with SMTP id q76so15053969iod.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxIt8MZdWae+geLCxbzvUsygKk++by+kW7xZVirZzoE=;
 b=7+LDuxU1qphaZB41wzzvhzWcVwn9q4G48uHBJa6mL+14YCwxiYI+bTLHxgkqhNkAJS
 rnyFcxe3WpjzK662HEFqw3zgF0WxxIGkOvjFwca25RmUpYEyFRLu1T9ZEXOsFkF+aDe7
 R5Jw4UHRS4BVjtjJxUv6/nqGSJaVcFmM7WlDmPckERU1joxUVD9VYZ45NwICuP8VxiJz
 M2Rg7XGzfmwzpdTiq/nmEszauM/Z31qh5lmpZ0bH+h1GUwvptJxbZ7kqw7t1C8FFk3st
 kXUlySdHURRGzei3pbdLhF8SVvLSDZVNxiBrnlDSSMbdXtgjS1kAvCxrAXRcFF+lvRuS
 WqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WxIt8MZdWae+geLCxbzvUsygKk++by+kW7xZVirZzoE=;
 b=eeHqNfJzaS7lZyxCx1rVqHRr8Pv4dUF2Kzk/yo1YpxUgzCLvvaCTsFEgaP9FNP7YQm
 r5zKpKGbU9S7JApCSJbephaZTx9StX8ke6iZhXSA63qNaq4Knd4z8dE621tOM/KXYrF4
 EgZBVNr65FmcosI6eGCSu18NUI4BeHNR/WD4AWkfGD2gVblKqvKtSMC4x0KRffzQQ1yx
 IkGO75h9HkmMM4EQgvbizMuqr18Q+sT+VWyZaG1sWUT8SeThW2cpGGBQpM8Fk+7K0CZC
 l5eIrbLzY8J/MMAlLcKBTCVXVAmCVxzX9zo8O0LqY53W5vUFMVBRWBtC7J2zeDm+IIXj
 dcxA==
X-Gm-Message-State: AOAM531ee1jmLORboKQrVxTnMK7KUTmyV7bDhqB9FnLYqH4ZsQr4Pffa
 4+Tyhk/bYTDCn5miRpuOeLCNM1Cl17S5xg==
X-Google-Smtp-Source: ABdhPJyBlH5TuGMnwP3ALb+8aSOITCsQa1CSWG4+VBhJLV6UNNuXC4OrS1TnvUtKK4010okE9D8XhQ==
X-Received: by 2002:a6b:8f90:0:b0:669:3ad9:9bd with SMTP id
 r138-20020a6b8f90000000b006693ad909bdmr11429970iod.121.1654723026704; 
 Wed, 08 Jun 2022 14:17:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k29-20020a02661d000000b0032ead96ee5csm8418552jac.165.2022.06.08.14.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:17:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 5/6] bsd-user/bsd-file.h: Meat of the write system calls
Date: Wed,  8 Jun 2022 15:17:10 -0600
Message-Id: <20220608211711.56158-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220608211711.56158-1-imp@bsdimp.com>
References: <20220608211711.56158-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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

Implement write, writev, pwrite and pwritev and connect them to the
system call dispatch routine.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 84 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 22 +++++++++
 2 files changed, 106 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 839f8c5c55a..e9e2c85eb67 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -32,6 +32,11 @@ ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
 ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);
 ssize_t safe_preadv(int fd, const struct iovec *iov, int iovcnt, off_t offset);
 
+ssize_t safe_write(int fd, void *buf, size_t nbytes);
+ssize_t safe_pwrite(int fd, void *buf, size_t nbytes, off_t offset);
+ssize_t safe_writev(int fd, const struct iovec *iov, int iovcnt);
+ssize_t safe_pwritev(int fd, const struct iovec *iov, int iovcnt, off_t offset);
+
 /* read(2) */
 static abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_long arg3)
 {
@@ -106,4 +111,83 @@ static abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,
     return ret;
 }
 
+/* write(2) */
+static abi_long do_bsd_write(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long nbytes, ret;
+    void *p;
+
+    /* nbytes < 0 implies that it was larger than SIZE_MAX. */
+    nbytes = arg3;
+    if (nbytes < 0) {
+        return -TARGET_EINVAL;
+    }
+    p = lock_user(VERIFY_READ, arg2, nbytes, 1);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(safe_write(arg1, p, arg3));
+    unlock_user(p, arg2, 0);
+
+    return ret;
+}
+
+/* pwrite(2) */
+static abi_long do_bsd_pwrite(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_READ, arg2, arg3, 1);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg4 = arg5;
+        arg5 = arg6;
+    }
+    ret = get_errno(safe_pwrite(arg1, p, arg3, target_arg64(arg4, arg5)));
+    unlock_user(p, arg2, 0);
+
+    return ret;
+}
+
+/* writev(2) */
+static abi_long do_bsd_writev(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_READ, arg2, arg3, 1);
+
+    if (vec != NULL) {
+        ret = get_errno(safe_writev(arg1, vec, arg3));
+        unlock_iovec(vec, arg2, arg3, 0);
+    } else {
+        ret = -host_to_target_errno(errno);
+    }
+
+    return ret;
+}
+
+/* pwritev(2) */
+static abi_long do_bsd_pwritev(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_READ, arg2, arg3, 1);
+
+    if (vec != NULL) {
+        if (regpairs_aligned(cpu_env) != 0) {
+            arg4 = arg5;
+            arg5 = arg6;
+        }
+        ret = get_errno(safe_pwritev(arg1, vec, arg3, target_arg64(arg4, arg5)));
+        unlock_iovec(vec, arg2, arg3, 0);
+    } else {
+        ret = -host_to_target_errno(errno);
+    }
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 8ca92f29857..3a33d54fa4d 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -50,6 +50,13 @@ safe_syscall3(ssize_t, readv, int, fd, const struct iovec *, iov, int, iovcnt);
 safe_syscall4(ssize_t, preadv, int, fd, const struct iovec *, iov, int, iovcnt,
     off_t, offset);
 
+safe_syscall3(ssize_t, write, int, fd, void *, buf, size_t, nbytes);
+safe_syscall4(ssize_t, pwrite, int, fd, void *, buf, size_t, nbytes, off_t,
+    offset);
+safe_syscall3(ssize_t, writev, int, fd, const struct iovec *, iov, int, iovcnt);
+safe_syscall4(ssize_t, pwritev, int, fd, const struct iovec *, iov, int, iovcnt,
+    off_t, offset);
+
 void target_set_brk(abi_ulong new_brk)
 {
 }
@@ -226,6 +233,21 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
 
     case TARGET_FREEBSD_NR_preadv: /* preadv(2) */
         ret = do_bsd_preadv(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+
+    case TARGET_FREEBSD_NR_write: /* write(2) */
+        ret = do_bsd_write(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_pwrite: /* pwrite(2) */
+        ret = do_bsd_pwrite(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
+    case TARGET_FREEBSD_NR_writev: /* writev(2) */
+        ret = do_bsd_writev(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_pwritev: /* pwritev(2) */
+        ret = do_bsd_pwritev(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
         break;
 
     default:
-- 
2.33.1


