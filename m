Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314854750E
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 15:57:36 +0200 (CEST)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o01cM-00015p-OO
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 09:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a2-0006g4-31
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:10 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a0-0003fP-Cu
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:09 -0400
Received: by mail-io1-xd31.google.com with SMTP id e80so1697104iof.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDCDikbK+UpGPr1ge2ks5QcyEZLLDVVWAIfJzK+cOk0=;
 b=a9zu9EPgEPaCCe9yHulmldrgARhqPLY414aPzR11UONWyMuST+JZZCFMiu2k8epMU6
 CXeedewMlbV+7bpy11IPdXnJLSdBkW7SWZOcwh5Jys3TACaYY0fsVSNhwYzy7rULX8Pr
 eQc3ORU7iJ92oV8/yyyKO1+YInkZ3UfjUggyoCiWQtZLFRKCWZzBUKMfpICqHNLEo4Ze
 g46FshwHSnlLg35Ab+EfhXY47Ct/zsAVXvaeH2AT9YqMe4QhIVMCyMOPeDkdxLPvdcr1
 ed+9q+mqxg3B3Qccu+HbFd4wH1OD2Tnh6fkBE7XXQkSC2/zvNv1+cw7qZeCvs0Qan4kq
 /3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDCDikbK+UpGPr1ge2ks5QcyEZLLDVVWAIfJzK+cOk0=;
 b=6p166YlfKsOuGhOZRjgORerO88cOx/IBkBeljbxS03mgr8z1P9Xx5OSBbSLvFLBny1
 h+68ivV6UelW7aCYavc8Pkp36yCjCERz8K7yEKoDKJM3syJGqcoVCqEVH9/jpdTmVkEf
 HXBwbGnO0z0j/PbGYf/c0tvqdPo2GRMXN1uGgo+NZJHXTUYDdHU7lPm/ya+RzWssNf1o
 JwrWWkAtv4Ejh2Fwhx8VQIGlIGHJhJ0Xvqtxna+tvtHIyg6O+Q1++U3FKJ5bpkJQMyZH
 snkyCmnXKdEmix17q7ZjuvJwcn9d0PPpRXY5GH0Zm79j/lU/n7gEdP3zUMYrwGkk0W8m
 0GAw==
X-Gm-Message-State: AOAM533xbNA0fvnB5obb/THk2XTTGBi6C5heDmzY8EjNE+RE3WenxJAe
 omLNmq9BeYeTMY0vnppd6F79Hw3GVWpZuw==
X-Google-Smtp-Source: ABdhPJz79eXmX3RVQl4LST1Wa8fWtBEBvsLxIg2MmwaJfRk/1F3md9Jd38ctrH1sVMt3sd8eHcufaQ==
X-Received: by 2002:a05:6638:24d6:b0:332:2087:d58c with SMTP id
 y22-20020a05663824d600b003322087d58cmr3450182jat.226.1654955706971; 
 Sat, 11 Jun 2022 06:55:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 13-20020a056e0211ad00b002d781cc0875sm1023578ilj.29.2022.06.11.06.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:55:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: def@freebsd.org, arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, jrtc27@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 5/6] bsd-user/bsd-file.h: Meat of the write system calls
Date: Sat, 11 Jun 2022 07:55:13 -0600
Message-Id: <20220611135514.92882-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220611135514.92882-1-imp@bsdimp.com>
References: <20220611135514.92882-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


