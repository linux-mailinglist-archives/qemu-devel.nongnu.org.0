Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E19518EDF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:34:28 +0200 (CEST)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzE3-0000cT-0K
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWT-0002Gj-7n
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWN-0003cN-6r
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:21 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2886784pjm.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7WEErp9U3fuLYooIL1EDmPgWGgYpjbgO1xt64/VLw3c=;
 b=WpHk3OKdGQadFBQi9LTKD1EOge5zzf+hP5X5uue2tytY9RDaCJWffi+NxFkHRIYdlp
 yqneyb9lVVXhRGn7MA8sWobo5kH+v6vPAyLubXGecnmTIimfR/tOJGirZZa1PGDrvh2a
 uoSUpekIWW1CIsez+pJlw1ZfizbIG/NcNsTIZfdAGDXV5JTrvuDACY0r+JQg2TZDha25
 zUs/Bz2BxooR8wQC0zop2swRYn2CrDB8RtlGxqOovo3g7AzaDfMC/u8XFZYMW13wgVlP
 y3XAse3zhmie6/v51df7vm4ZSdmjYDkSijgaCutZOVDNAMDzllHF9k8r9+5CylitfDwz
 /PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WEErp9U3fuLYooIL1EDmPgWGgYpjbgO1xt64/VLw3c=;
 b=fSfxk+3x12C6kOCOwwnMNBFL/ilM19CYZDn+80Ld5NNAgPJlNIsLAtzfUAR+LCUXOw
 NCXlmV0z95wQNrCPXJxaQHK8yOFhSAQIupob7beTg3YZxXgzcVL5L8SqHl9+nVD7uSRq
 lz2pzgKoUZAhQ7Knm/1kMWGW3pvK/cNsX5tAU8CYG+DvGzAA4/aSI8BI8dvPtU6wGpMo
 RK+cq481v4grZjOs8y5BKbR78TwzaOyNLO5pdVDY4GSK0ySoO/yEILS1Ov8xxiM5XQbf
 /oaG3d5I6S35WR2kOLqvVAbleRSWghDVGdCTxjsKUZUQ3ngpIszgXYfF49DRzjpumU+Y
 27Jw==
X-Gm-Message-State: AOAM531OFF2nmfjruS+2wE0/sycIw9SaI71oKUkt2in6g4qIALuqge8g
 m0nO4UPyjWRZ8qN9knypBVDqV8lpZXAmwg==
X-Google-Smtp-Source: ABdhPJyTuR7WBIf3cPyaEkSKOlS6Q4ITGoJfLuYKatxD1yjcwzzcJEaV74BtHR/wm8DffZlfccKDSg==
X-Received: by 2002:a17:902:ab04:b0:156:1517:411a with SMTP id
 ik4-20020a170902ab0400b001561517411amr18089563plb.128.1651607357204; 
 Tue, 03 May 2022 12:49:17 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/74] semihosting: Create semihost_sys_{stat,fstat}
Date: Tue,  3 May 2022 12:48:01 -0700
Message-Id: <20220503194843.1379101-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

These syscalls will be used by m68k and nios2 semihosting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |   7 ++
 semihosting/syscalls.c         | 137 +++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index c9f9e66be1..ecc97751a9 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -49,6 +49,13 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
                        gdb_syscall_complete_cb flen_cb,
                        int fd, target_ulong fstat_addr);
 
+void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong addr);
+
+void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       target_ulong addr);
+
 void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong fname, target_ulong fname_len);
 
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index b6c395af22..7bc2640512 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -93,6 +93,52 @@ static int errno_for_gdb(void)
 #undef E
 }
 
+/*
+ * TODO: Note that gdb always stores the stat structure big-endian.
+ * So far, that's ok, as the only two targets using this are also
+ * big-endian.  Until we do something with gdb, also produce the
+ * same big-endian result from the host.
+ */
+static int copy_stat_to_user(CPUState *cs, target_ulong addr,
+                             const struct stat *s)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    struct gdb_stat *p;
+
+    if (s->st_dev != (uint32_t)s->st_dev ||
+        s->st_ino != (uint32_t)s->st_ino) {
+        return -GDB_EOVERFLOW;
+    }
+
+    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
+    if (!p) {
+        return -GDB_EFAULT;
+    }
+
+    p->gdb_st_dev = cpu_to_be32(s->st_dev);
+    p->gdb_st_ino = cpu_to_be32(s->st_ino);
+    p->gdb_st_mode = cpu_to_be32(s->st_mode);
+    p->gdb_st_nlink = cpu_to_be32(s->st_nlink);
+    p->gdb_st_uid = cpu_to_be32(s->st_uid);
+    p->gdb_st_gid = cpu_to_be32(s->st_gid);
+    p->gdb_st_rdev = cpu_to_be32(s->st_rdev);
+    p->gdb_st_size = cpu_to_be64(s->st_size);
+#ifdef _WIN32
+    /* Windows stat is missing some fields.  */
+    p->gdb_st_blksize = 0;
+    p->gdb_st_blocks = 0;
+#else
+    p->gdb_st_blksize = cpu_to_be64(s->st_blksize);
+    p->gdb_st_blocks = cpu_to_be64(s->st_blocks);
+#endif
+    p->gdb_st_atime = cpu_to_be32(s->st_atime);
+    p->gdb_st_mtime = cpu_to_be32(s->st_mtime);
+    p->gdb_st_ctime = cpu_to_be32(s->st_ctime);
+
+    unlock_user(p, addr, sizeof(struct gdb_stat));
+    return 0;
+}
+
 /*
  * GDB semihosting syscall implementations.
  */
@@ -163,6 +209,19 @@ static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
 }
 
+static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                     target_ulong fname, target_ulong fname_len,
+                     target_ulong addr)
+{
+    int len = validate_strlen(cs, fname, fname_len);
+    if (len < 0) {
+        complete(cs, -1, -len);
+        return;
+    }
+
+    gdb_do_syscall(complete, "stat,%s,%x", fname, len, addr);
+}
+
 static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                        target_ulong fname, target_ulong fname_len)
 {
@@ -351,6 +410,51 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 }
 
+static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf, target_ulong addr)
+{
+    struct stat buf;
+    int ret;
+
+    ret = fstat(gf->hostfd, &buf);
+    if (ret) {
+        complete(cs, -1, errno_for_gdb());
+        return;
+    }
+    ret = copy_stat_to_user(cs, addr, &buf);
+    complete(cs, ret ? -1 : 0, ret ? -ret : 0);
+}
+
+static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                      target_ulong fname, target_ulong fname_len,
+                      target_ulong addr)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    struct stat buf;
+    char *name;
+    int ret, err;
+
+    ret = validate_lock_user_string(&name, cs, fname, fname_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = stat(name, &buf);
+    if (ret) {
+        err = errno_for_gdb();
+    } else {
+        ret = copy_stat_to_user(cs, addr, &buf);
+        err = 0;
+        if (ret < 0) {
+            err = -ret;
+            ret = -1;
+        }
+    }
+    complete(cs, ret, err);
+    unlock_user(name, fname, 0);
+}
+
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                         target_ulong fname, target_ulong fname_len)
 {
@@ -659,6 +763,39 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
     }
 }
 
+void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong addr)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, GDB_EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_fstat(cs, complete, gf, addr);
+        break;
+    case GuestFDHost:
+        host_fstat(cs, complete, gf, addr);
+        break;
+    case GuestFDStatic:
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       target_ulong addr)
+{
+    if (use_gdb_syscalls()) {
+        gdb_stat(cs, complete, fname, fname_len, addr);
+    } else {
+        host_stat(cs, complete, fname, fname_len, addr);
+    }
+}
+
 void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong fname, target_ulong fname_len)
 {
-- 
2.34.1


