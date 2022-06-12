Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C6547C17
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:53:34 +0200 (CEST)
Received: from localhost ([::1]:57268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UaT-0006Nv-NF
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVo-0005Xo-2a
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:44 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVm-00006e-0b
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:43 -0400
Received: by mail-io1-xd35.google.com with SMTP id q11so4286545iod.8
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUNbrVPTpIvjNgmDAlVXpMdOpRXZdd+5qHhwYan9ofo=;
 b=KvALBVkwg4dxKo9Edgc064xw9MtJQbUo2A6MAgjVJbj9dXe3NkOanOEeSoz6dMHI0L
 LfAjXL6Zjz7spLqkYskRgNM81lg63MVZwR9oXYsAgnVBvXapJny3si2wcrO6ReSa5T5/
 byDmntCmWjt+KyFBKftEJ2stTDOMDXrOt6zs0UaVbnSVyT4zx+DgKqIoW+OeNUzNEK83
 1VDMZURhf4Hxa7ZtuXzBtntjERgLGxCXlcg3O2fwN6n/MY+6CXrN2zHlUXsUMETbISu/
 e4/Mz8Mp/EcRUmFYG+I12YR9JHMmyXRg9IFWnogqoQhKubJhxYKgSs9JzBiNblexsWAr
 EnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUNbrVPTpIvjNgmDAlVXpMdOpRXZdd+5qHhwYan9ofo=;
 b=5S7UJcIv0j47z6B71wxDUkZV7MrnvfiTN5BGUIQFBJjwchwrxJL7phpbbbfJaneWHc
 zGl159Hck/aidh8WfQWRdVWH/W0xcJ3TKB1S39j56NMNgpDYGNqOhD1v/Rms2AHlsCkN
 hZMsBld3saAj/8HXK/OxgDgVO5heoe7Bwy88OQ/nbSXRn8iUAvih2X6sX9Cc0pu3/hyy
 TloRszdCzXQtKjf0zH/lGTPUhpsgUC8IeP9m+8jVOFZ+17Uknz43OCS7tn9dhLRzLVDe
 10rNr05aue8t6EPljHAPImeKFEasurkEOErDvmog91e/cLRsqbCtVAzef5oFI/hfJCsY
 QFuw==
X-Gm-Message-State: AOAM532HHnQG2IlvFSA4eEZZ3rjHjKxh8LiW9Dx5KQVr8kfb36CZMBY3
 DLNVEAp2L+TsHfwi5kHzF/1Rm+T/HN/dag==
X-Google-Smtp-Source: ABdhPJyPFu0VbGRbH2Oe3rfIVSVjwfQ8pFtqFNGkTB29bKPqHtUO84XF75P/F4ueGgnMzkwP8uabtA==
X-Received: by 2002:a5d:8582:0:b0:669:835f:48b0 with SMTP id
 f2-20020a5d8582000000b00669835f48b0mr13062884ioj.146.1655066919576; 
 Sun, 12 Jun 2022 13:48:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH 01/11] bsd-user: Implement open, openat and close
Date: Sun, 12 Jun 2022 14:48:41 -0600
Message-Id: <20220612204851.19914-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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

Add the open, openat and close system calls. We need to lock paths, so
implmenent that as well.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 50 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 +++++++++++
 bsd-user/syscall_defs.h       |  4 +++
 3 files changed, 70 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index e9e2c85eb67..fb54905b46f 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -22,11 +22,25 @@
 
 #include "qemu/path.h"
 
+#define LOCK_PATH(p, arg)                   \
+do {                                        \
+    (p) = lock_user_string(arg);            \
+    if ((p) == NULL) {                      \
+        return -TARGET_EFAULT;              \
+    }                                       \
+} while (0)
+
+#define UNLOCK_PATH(p, arg)     unlock_user(p, arg, 0)
+
+
 extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
         int copy);
 extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
         int copy);
 
+int safe_open(const char *path, int flags, mode_t mode);
+int safe_openat(int fd, const char *path, int flags, mode_t mode);
+
 ssize_t safe_read(int fd, void *buf, size_t nbytes);
 ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
 ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);
@@ -190,4 +204,40 @@ static abi_long do_bsd_pwritev(void *cpu_env, abi_long arg1,
     return ret;
 }
 
+/* open(2) */
+static abi_long do_bsd_open(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(safe_open(path(p), target_to_host_bitmask(arg2,
+                fcntl_flags_tbl), arg3));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* openat(2) */
+static abi_long do_bsd_openat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(safe_openat(arg1, path(p),
+                target_to_host_bitmask(arg3, fcntl_flags_tbl), arg4));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
+/* close(2) */
+static inline abi_long do_bsd_close(abi_long arg1)
+{
+
+    return get_errno(close(arg1));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 71aa0d38e03..a824785fee8 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -44,6 +44,10 @@
 #include "bsd-proc.h"
 
 /* I/O */
+safe_syscall3(int, open, const char *, path, int, flags, mode_t, mode);
+safe_syscall4(int, openat, int, fd, const char *, path, int, flags, mode_t,
+    mode);
+
 safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
 safe_syscall4(ssize_t, pread, int, fd, void *, buf, size_t, nbytes, off_t,
     offset);
@@ -257,6 +261,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_pwritev(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
         break;
 
+    case TARGET_FREEBSD_NR_open: /* open(2) */
+        ret = do_bsd_open(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_openat: /* openat(2) */
+        ret = do_bsd_openat(arg1, arg2, arg3, arg4);
+        break;
+
+    case TARGET_FREEBSD_NR_close: /* close(2) */
+        ret = do_bsd_close(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index f5797b28e39..b6d113d24a7 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -226,4 +226,8 @@ type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
     return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4, arg5, arg6); \
 }
 
+/* So far all target and host bitmasks are the same */
+#define target_to_host_bitmask(x, tbl) (x)
+#define host_to_target_bitmask(x, tbl) (x)
+
 #endif /* SYSCALL_DEFS_H */
-- 
2.33.1


