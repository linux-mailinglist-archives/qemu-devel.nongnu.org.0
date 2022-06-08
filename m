Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E00543E7B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:22:32 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz38J-0001hL-A7
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz336-00018O-Pu
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:10 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz335-00069a-76
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:08 -0400
Received: by mail-io1-xd29.google.com with SMTP id n11so390791iod.4
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymFzIaVTUtQ9q6k+TDbLX45RQahUqiFZ+XgERpQYRk8=;
 b=UWdsI06Bsz0KPxs51pWDJoJtzAoiD0dqE2gScAmn5ftKv4lxCttzL3bOdt9cehcYGP
 aXRUBnhfd1uNJL6mdu9e+ngplZdZP2HQm5btBGNgfBNlOcTIKOpTqzDLYNRO2jvQE7Za
 MjvnGQ2fAtbET7JYEqLME8lOCkQO5K1vKBVTVqqPtDY3B0654dZa+j/RkPjT0VPjX5mn
 Cil+6wKLnpi3Lq3HOwZBJ/w2hPz3Df3OemIwE/d6vCo9BK8wy1el2ozVVDTCRzJj4UOP
 pxDFu6Ay7BTPS5ibpwhvJvi2BorgWnFMGBbnbL7/wXDyeoPx+0EC4gWxk5dFR4Iz+72W
 5qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymFzIaVTUtQ9q6k+TDbLX45RQahUqiFZ+XgERpQYRk8=;
 b=XvfrcrwgaTtqcfY6+htCuv++a720BqeJZeFhfLANhJ6hz46b3ySuH6DuSGpC3MnLJr
 lYDczc4ZK3+1pWgBwlTOaM1RkCNEMd0GWMC1lL3LYQoF8PQOOvlstcHLOgysa52Oy+Nz
 xF8K5hyBvKxRDgb385eNkTlLde7kA966URBatgtQWALJMIjY/XKF+yv5QVUfz0MILuUr
 oJSKf+T8MkTP4O2l3I5fWwsyTc9k6Gz4sBngBAdjxcRii0lT5m+smVCV+dUc1bHSbqqm
 FDP1RvqpqQd/cUHI8xl195Iz6+LCgbT2VELehSw7Dycvh2EOElD/KASqmKewHXgmidsv
 rkFg==
X-Gm-Message-State: AOAM530qUi8YbSfMle0IVHn3NCTaEJbQCgrkfYFGlN7cVJ+utNNioJBJ
 icHX6713B4Pkplo580o+vqV0xUfjVj/+XQ==
X-Google-Smtp-Source: ABdhPJw0V6DxfEhpnO9Ra9ASkR3mwAFg0JyiGdG5PZzzF25IXdLrXLvsSIFAKcCs4aU+01rxYgo2YQ==
X-Received: by 2002:a05:6638:1411:b0:331:ac08:5ae3 with SMTP id
 k17-20020a056638141100b00331ac085ae3mr9806955jad.162.1654723025911; 
 Wed, 08 Jun 2022 14:17:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k29-20020a02661d000000b0032ead96ee5csm8418552jac.165.2022.06.08.14.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:17:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 4/6] bsd-user/bsd-file.h: Add implementations for read,
 pread, readv and preadv
Date: Wed,  8 Jun 2022 15:17:09 -0600
Message-Id: <20220608211711.56158-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220608211711.56158-1-imp@bsdimp.com>
References: <20220608211711.56158-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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

Implement do_bsd_{read,pread,readv,preadv}. Connect them to the system
call table.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 79 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 28 +++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index a6bff3b8c26..839f8c5c55a 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -27,4 +27,83 @@ extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
 extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
         int copy);
 
+ssize_t safe_read(int fd, void *buf, size_t nbytes);
+ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
+ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);
+ssize_t safe_preadv(int fd, const struct iovec *iov, int iovcnt, off_t offset);
+
+/* read(2) */
+static abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(safe_read(arg1, p, arg3));
+    unlock_user(p, arg2, ret);
+
+    return ret;
+}
+
+/* pread(2) */
+static abi_long do_bsd_pread(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg4 = arg5;
+        arg5 = arg6;
+    }
+    ret = get_errno(safe_pread(arg1, p, arg3, target_arg64(arg4, arg5)));
+    unlock_user(p, arg2, ret);
+
+    return ret;
+}
+
+/* readv(2) */
+static abi_long do_bsd_readv(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 0);
+
+    if (vec != NULL) {
+        ret = get_errno(safe_readv(arg1, vec, arg3));
+        unlock_iovec(vec, arg2, arg3, 1);
+    } else {
+        ret = -host_to_target_errno(errno);
+    }
+
+    return ret;
+}
+
+/* preadv(2) */
+static abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 1);
+
+    if (vec != NULL) {
+        if (regpairs_aligned(cpu_env) != 0) {
+            arg4 = arg5;
+            arg5 = arg6;
+        }
+        ret = get_errno(safe_preadv(arg1, vec, arg3, target_arg64(arg4, arg5)));
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
index 1c4c9983f1a..8ca92f29857 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -42,6 +42,14 @@
 
 #include "bsd-file.h"
 
+/* I/O */
+safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
+safe_syscall4(ssize_t, pread, int, fd, void *, buf, size_t, nbytes, off_t,
+    offset);
+safe_syscall3(ssize_t, readv, int, fd, const struct iovec *, iov, int, iovcnt);
+safe_syscall4(ssize_t, preadv, int, fd, const struct iovec *, iov, int, iovcnt,
+    off_t, offset);
+
 void target_set_brk(abi_ulong new_brk)
 {
 }
@@ -200,6 +208,26 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     abi_long ret;
 
     switch (num) {
+
+        /*
+         * File system calls.
+         */
+    case TARGET_FREEBSD_NR_read: /* read(2) */
+        ret = do_bsd_read(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_pread: /* pread(2) */
+        ret = do_bsd_pread(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
+    case TARGET_FREEBSD_NR_readv: /* readv(2) */
+        ret = do_bsd_readv(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_preadv: /* preadv(2) */
+        ret = do_bsd_preadv(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


