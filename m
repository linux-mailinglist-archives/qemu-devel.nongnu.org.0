Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF9228D3
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 22:43:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSSef-0007D0-6X
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 16:43:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSYp-0002k3-Fc
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSYm-0003N1-Tz
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:35 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSSYm-0003MF-Kt
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:32 -0400
Received: by mail-pl1-x641.google.com with SMTP id c5so5690384pll.11
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bfIW3dDz2FoSPZN1vIes2S+TXhduA0I/DLj9+BFzzwg=;
	b=xonhWcZlyONqzYHuOJbZW56Uv8Jd/wIsn0iyyY/7gXe2anegQGmFmnboRAAsBIJ+7R
	fVs25sgKqCGC0Cz+KFUsrNfDG7O+btOo1D0SB60JAG3gZd6YJlV+NuytrbosquJBKqib
	eaOTHKgnMmfuQyaj2TA10QF9vX7Htp9ZMJIEOVShk9V8HlfAX3n+Tfdy7Iix2urFb8X5
	MB+lXsFaaEpFA466wInFbo0YuGGkS5fDM3fZ5xp6ITOaxZfvUpLMe9TrLzO7Tj7etvJY
	u4RJrYZriOOf9QyIcAToMwDMAlw3wsq6JWQUIiAXdXBlrfv60nsuJRlheX1+3ZSdoRMB
	wxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bfIW3dDz2FoSPZN1vIes2S+TXhduA0I/DLj9+BFzzwg=;
	b=sS/2cRIanFf6iOIlq87kQ4jYRY1xyTb8+KwFcaz/FokUtO2/klN9PCExCVYtf0HOHj
	oFnw3ss5e4Uks5iHBQJ/9uIfEUR7WpSRplYjM7zfqLUk/nLNoe6buVk07scoQygTSlDn
	vIln+6FKFVHP1aBSNepsF/ytDJf1HaLNxzoGTfPwnYi1jh1kD/1uVLg26qNAzI5ZhhJN
	SOMG+gdglnh49eF46ctFiqO7+2QqZHT0zqbwS57hzn6KipMFnOOh8krotbgQd4dihNR4
	8odz+WKjAY+whuVz2nIGiIQ4IeGu/K+4eCq1H0lYvdRGvqlm87FL2rdJlYLt8d/W3SuK
	2Wsg==
X-Gm-Message-State: APjAAAUOynJ4Yb0w58jlmadC67rhUHeW8bxux4fF7mzu50PSi29mr9Go
	lkUqekinNihUBnvyh5WmjVaQLoJoEZM=
X-Google-Smtp-Source: APXvYqx+GYK+CURyLbX/XCwUNpyyCwP4XfsSFRrEUDf6MtXLaatDJtSQrixMGuuzPwWj552DRKVfZw==
X-Received: by 2002:a17:902:4e:: with SMTP id 72mr19183869pla.80.1558298250923;
	Sun, 19 May 2019 13:37:30 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	i7sm11397448pfo.19.2019.05.19.13.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:37:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 13:36:14 -0700
Message-Id: <20190519203726.20729-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519203726.20729-1-richard.henderson@linaro.org>
References: <20190519203726.20729-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v7 02/74] linux-user: Split out open, open_at
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the moment, leave a forward declaration for is_proc_myself
until the readlink syscalls are also moved to syscall-file.inc.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall-defs.h     |   5 +
 linux-user/strace.c           |  35 ----
 linux-user/syscall-file.inc.c | 325 ++++++++++++++++++++++++++++++++++
 linux-user/syscall.c          | 288 +-----------------------------
 linux-user/strace.list        |   6 -
 5 files changed, 332 insertions(+), 327 deletions(-)
 create mode 100644 linux-user/syscall-file.inc.c

diff --git a/linux-user/syscall-defs.h b/linux-user/syscall-defs.h
index 8c0490425a..1f3a9c47ab 100644
--- a/linux-user/syscall-defs.h
+++ b/linux-user/syscall-defs.h
@@ -15,3 +15,8 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
+
+#ifdef TARGET_NR_open
+SYSCALL_DEF(open, ARG_STR, ARG_OPENFLAG, ARG_MODEFLAG);
+#endif
+SYSCALL_DEF(openat, ARG_ATDIRFD, ARG_STR, ARG_OPENFLAG, ARG_MODEFLAG);
diff --git a/linux-user/strace.c b/linux-user/strace.c
index 33a5b10c0a..24ef14b5e6 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2228,41 +2228,6 @@ print_mq_open(const struct syscallname *name,
 }
 #endif
 
-#ifdef TARGET_NR_open
-static void
-print_open(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    int is_creat = (arg1 & TARGET_O_CREAT);
-
-    print_syscall_prologue(name);
-    print_string(arg0, 0);
-    print_open_flags(arg1, (is_creat == 0));
-    if (is_creat)
-        print_file_mode(arg2, 1);
-    print_syscall_epilogue(name);
-}
-#endif
-
-#ifdef TARGET_NR_openat
-static void
-print_openat(const struct syscallname *name,
-    abi_long arg0, abi_long arg1, abi_long arg2,
-    abi_long arg3, abi_long arg4, abi_long arg5)
-{
-    int is_creat = (arg2 & TARGET_O_CREAT);
-
-    print_syscall_prologue(name);
-    print_at_dirfd(arg0, 0);
-    print_string(arg1, 0);
-    print_open_flags(arg2, (is_creat == 0));
-    if (is_creat)
-        print_file_mode(arg3, 1);
-    print_syscall_epilogue(name);
-}
-#endif
-
 #ifdef TARGET_NR_mq_unlink
 static void
 print_mq_unlink(const struct syscallname *name,
diff --git a/linux-user/syscall-file.inc.c b/linux-user/syscall-file.inc.c
new file mode 100644
index 0000000000..7974148ccb
--- /dev/null
+++ b/linux-user/syscall-file.inc.c
@@ -0,0 +1,325 @@
+/*
+ *  Linux file-related syscall implementations
+ *  Copyright (c) 2003 Fabrice Bellard
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
+/*
+ * Helpers for do_openat, manipulating /proc/self/foo.
+ */
+
+static int open_self_cmdline(void *cpu_env, int fd)
+{
+    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
+    struct linux_binprm *bprm = ((TaskState *)cpu->opaque)->bprm;
+    int i;
+
+    for (i = 0; i < bprm->argc; i++) {
+        size_t len = strlen(bprm->argv[i]) + 1;
+
+        if (write(fd, bprm->argv[i], len) != len) {
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
+static int open_self_maps(void *cpu_env, int fd)
+{
+    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
+    TaskState *ts = cpu->opaque;
+    FILE *fp;
+    char *line = NULL;
+    size_t len = 0;
+    ssize_t read;
+
+    fp = fopen("/proc/self/maps", "r");
+    if (fp == NULL) {
+        return -1;
+    }
+
+    while ((read = getline(&line, &len, fp)) != -1) {
+        int fields, dev_maj, dev_min, inode;
+        uint64_t min, max, offset;
+        char flag_r, flag_w, flag_x, flag_p;
+        char path[512] = "";
+        fields = sscanf(line, "%"PRIx64"-%"PRIx64" %c%c%c%c %"PRIx64" %x:%x %d"
+                        " %512s", &min, &max, &flag_r, &flag_w, &flag_x,
+                        &flag_p, &offset, &dev_maj, &dev_min, &inode, path);
+
+        if ((fields < 10) || (fields > 11)) {
+            continue;
+        }
+        if (h2g_valid(min)) {
+            int flags = page_get_flags(h2g(min));
+            max = h2g_valid(max - 1) ? max : (uintptr_t)g2h(GUEST_ADDR_MAX) + 1;
+            if (page_check_range(h2g(min), max - min, flags) == -1) {
+                continue;
+            }
+            if (h2g(min) == ts->info->stack_limit) {
+                pstrcpy(path, sizeof(path), "      [stack]");
+            }
+            dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
+                    " %c%c%c%c %08" PRIx64 " %02x:%02x %d %s%s\n",
+                    h2g(min), h2g(max - 1) + 1, flag_r, flag_w,
+                    flag_x, flag_p, offset, dev_maj, dev_min, inode,
+                    path[0] ? "         " : "", path);
+        }
+    }
+
+    free(line);
+    fclose(fp);
+
+    return 0;
+}
+
+static int open_self_stat(void *cpu_env, int fd)
+{
+    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
+    TaskState *ts = cpu->opaque;
+    abi_ulong start_stack = ts->info->start_stack;
+    int i;
+
+    for (i = 0; i < 44; i++) {
+        char buf[128];
+        int len;
+        uint64_t val = 0;
+
+        if (i == 0) {
+            /* pid */
+            val = getpid();
+            snprintf(buf, sizeof(buf), "%"PRId64 " ", val);
+        } else if (i == 1) {
+            /* app name */
+            snprintf(buf, sizeof(buf), "(%s) ", ts->bprm->argv[0]);
+        } else if (i == 27) {
+            /* stack bottom */
+            val = start_stack;
+            snprintf(buf, sizeof(buf), "%"PRId64 " ", val);
+        } else {
+            /* for the rest, there is MasterCard */
+            snprintf(buf, sizeof(buf), "0%c", i == 43 ? '\n' : ' ');
+        }
+
+        len = strlen(buf);
+        if (write(fd, buf, len) != len) {
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
+static int open_self_auxv(void *cpu_env, int fd)
+{
+    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
+    TaskState *ts = cpu->opaque;
+    abi_ulong auxv = ts->info->saved_auxv;
+    abi_ulong len = ts->info->auxv_len;
+    char *ptr;
+
+    /*
+     * Auxiliary vector is stored in target process stack.
+     * read in whole auxv vector and copy it to file
+     */
+    ptr = lock_user(VERIFY_READ, auxv, len, 0);
+    if (ptr != NULL) {
+        while (len > 0) {
+            ssize_t r;
+            r = write(fd, ptr, len);
+            if (r <= 0) {
+                break;
+            }
+            len -= r;
+            ptr += r;
+        }
+        lseek(fd, 0, SEEK_SET);
+        unlock_user(ptr, auxv, len);
+    }
+
+    return 0;
+}
+
+static int is_proc_myself(const char *filename, const char *entry)
+{
+    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
+        filename += strlen("/proc/");
+        if (!strncmp(filename, "self/", strlen("self/"))) {
+            filename += strlen("self/");
+        } else if (*filename >= '1' && *filename <= '9') {
+            char myself[80];
+            snprintf(myself, sizeof(myself), "%d/", getpid());
+            if (!strncmp(filename, myself, strlen(myself))) {
+                filename += strlen(myself);
+            } else {
+                return 0;
+            }
+        } else {
+            return 0;
+        }
+        if (!strcmp(filename, entry)) {
+            return 1;
+        }
+    }
+    return 0;
+}
+
+#if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
+static int is_proc(const char *filename, const char *entry)
+{
+    return strcmp(filename, entry) == 0;
+}
+
+static int open_net_route(void *cpu_env, int fd)
+{
+    FILE *fp;
+    char *line = NULL;
+    size_t len = 0;
+    ssize_t read;
+
+    fp = fopen("/proc/net/route", "r");
+    if (fp == NULL) {
+        return -1;
+    }
+
+    /* read header */
+
+    read = getline(&line, &len, fp);
+    dprintf(fd, "%s", line);
+
+    /* read routes */
+
+    while ((read = getline(&line, &len, fp)) != -1) {
+        char iface[16];
+        uint32_t dest, gw, mask;
+        unsigned int flags, refcnt, use, metric, mtu, window, irtt;
+        int fields;
+
+        fields = sscanf(line,
+                        "%s\t%08x\t%08x\t%04x\t%d\t%d\t%d\t%08x\t%d\t%u\t%u\n",
+                        iface, &dest, &gw, &flags, &refcnt, &use, &metric,
+                        &mask, &mtu, &window, &irtt);
+        if (fields != 11) {
+            continue;
+        }
+        dprintf(fd, "%s\t%08x\t%08x\t%04x\t%d\t%d\t%d\t%08x\t%d\t%u\t%u\n",
+                iface, tswap32(dest), tswap32(gw), flags, refcnt, use,
+                metric, tswap32(mask), mtu, window, irtt);
+    }
+
+    free(line);
+    fclose(fp);
+
+    return 0;
+}
+#endif
+
+static int do_openat(void *cpu_env, int dirfd, const char *pathname,
+                     int flags, mode_t mode)
+{
+    struct fake_open {
+        const char *filename;
+        int (*fill)(void *cpu_env, int fd);
+        int (*cmp)(const char *s1, const char *s2);
+    };
+    const struct fake_open *fake_open;
+    static const struct fake_open fakes[] = {
+        { "maps", open_self_maps, is_proc_myself },
+        { "stat", open_self_stat, is_proc_myself },
+        { "auxv", open_self_auxv, is_proc_myself },
+        { "cmdline", open_self_cmdline, is_proc_myself },
+#if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
+        { "/proc/net/route", open_net_route, is_proc },
+#endif
+        { NULL, NULL, NULL }
+    };
+
+    if (is_proc_myself(pathname, "exe")) {
+        int execfd = qemu_getauxval(AT_EXECFD);
+        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
+    }
+
+    for (fake_open = fakes; fake_open->filename; fake_open++) {
+        if (fake_open->cmp(pathname, fake_open->filename)) {
+            break;
+        }
+    }
+
+    if (fake_open->filename) {
+        const char *tmpdir;
+        char filename[PATH_MAX];
+        int fd, r;
+
+        /* create temporary file to map stat to */
+        tmpdir = getenv("TMPDIR");
+        if (!tmpdir) {
+            tmpdir = "/tmp";
+        }
+        snprintf(filename, sizeof(filename), "%s/qemu-open.XXXXXX", tmpdir);
+        fd = mkstemp(filename);
+        if (fd < 0) {
+            return fd;
+        }
+        unlink(filename);
+
+        r = fake_open->fill(cpu_env, fd);
+        if (r) {
+            int e = errno;
+            close(fd);
+            errno = e;
+            return r;
+        }
+        lseek(fd, 0, SEEK_SET);
+
+        return fd;
+    }
+
+    return safe_openat(dirfd, path(pathname), flags, mode);
+}
+
+#ifdef TARGET_NR_open
+SYSCALL_IMPL(open)
+{
+    char *p = lock_user_string(arg1);
+    abi_long ret;
+
+    if (!p) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(do_openat(cpu_env, AT_FDCWD, p,
+                              target_to_host_bitmask(arg2, fcntl_flags_tbl),
+                              arg3));
+    fd_trans_unregister(ret);
+    unlock_user(p, arg1, 0);
+    return ret;
+}
+#endif
+
+SYSCALL_IMPL(openat)
+{
+    char *p = lock_user_string(arg2);
+    abi_long ret;
+
+    if (!p) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(do_openat(cpu_env, arg1, p,
+                              target_to_host_bitmask(arg3, fcntl_flags_tbl),
+                              arg4));
+    fd_trans_unregister(ret);
+    unlock_user(p, arg2, 0);
+    return ret;
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e27cab34af..fe52ac15c2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6633,272 +6633,7 @@ int host_to_target_waitstatus(int status)
     return status;
 }
 
-static int open_self_cmdline(void *cpu_env, int fd)
-{
-    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
-    struct linux_binprm *bprm = ((TaskState *)cpu->opaque)->bprm;
-    int i;
-
-    for (i = 0; i < bprm->argc; i++) {
-        size_t len = strlen(bprm->argv[i]) + 1;
-
-        if (write(fd, bprm->argv[i], len) != len) {
-            return -1;
-        }
-    }
-
-    return 0;
-}
-
-static int open_self_maps(void *cpu_env, int fd)
-{
-    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
-    TaskState *ts = cpu->opaque;
-    FILE *fp;
-    char *line = NULL;
-    size_t len = 0;
-    ssize_t read;
-
-    fp = fopen("/proc/self/maps", "r");
-    if (fp == NULL) {
-        return -1;
-    }
-
-    while ((read = getline(&line, &len, fp)) != -1) {
-        int fields, dev_maj, dev_min, inode;
-        uint64_t min, max, offset;
-        char flag_r, flag_w, flag_x, flag_p;
-        char path[512] = "";
-        fields = sscanf(line, "%"PRIx64"-%"PRIx64" %c%c%c%c %"PRIx64" %x:%x %d"
-                        " %512s", &min, &max, &flag_r, &flag_w, &flag_x,
-                        &flag_p, &offset, &dev_maj, &dev_min, &inode, path);
-
-        if ((fields < 10) || (fields > 11)) {
-            continue;
-        }
-        if (h2g_valid(min)) {
-            int flags = page_get_flags(h2g(min));
-            max = h2g_valid(max - 1) ? max : (uintptr_t)g2h(GUEST_ADDR_MAX) + 1;
-            if (page_check_range(h2g(min), max - min, flags) == -1) {
-                continue;
-            }
-            if (h2g(min) == ts->info->stack_limit) {
-                pstrcpy(path, sizeof(path), "      [stack]");
-            }
-            dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
-                    " %c%c%c%c %08" PRIx64 " %02x:%02x %d %s%s\n",
-                    h2g(min), h2g(max - 1) + 1, flag_r, flag_w,
-                    flag_x, flag_p, offset, dev_maj, dev_min, inode,
-                    path[0] ? "         " : "", path);
-        }
-    }
-
-    free(line);
-    fclose(fp);
-
-    return 0;
-}
-
-static int open_self_stat(void *cpu_env, int fd)
-{
-    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
-    TaskState *ts = cpu->opaque;
-    abi_ulong start_stack = ts->info->start_stack;
-    int i;
-
-    for (i = 0; i < 44; i++) {
-      char buf[128];
-      int len;
-      uint64_t val = 0;
-
-      if (i == 0) {
-        /* pid */
-        val = getpid();
-        snprintf(buf, sizeof(buf), "%"PRId64 " ", val);
-      } else if (i == 1) {
-        /* app name */
-        snprintf(buf, sizeof(buf), "(%s) ", ts->bprm->argv[0]);
-      } else if (i == 27) {
-        /* stack bottom */
-        val = start_stack;
-        snprintf(buf, sizeof(buf), "%"PRId64 " ", val);
-      } else {
-        /* for the rest, there is MasterCard */
-        snprintf(buf, sizeof(buf), "0%c", i == 43 ? '\n' : ' ');
-      }
-
-      len = strlen(buf);
-      if (write(fd, buf, len) != len) {
-          return -1;
-      }
-    }
-
-    return 0;
-}
-
-static int open_self_auxv(void *cpu_env, int fd)
-{
-    CPUState *cpu = ENV_GET_CPU((CPUArchState *)cpu_env);
-    TaskState *ts = cpu->opaque;
-    abi_ulong auxv = ts->info->saved_auxv;
-    abi_ulong len = ts->info->auxv_len;
-    char *ptr;
-
-    /*
-     * Auxiliary vector is stored in target process stack.
-     * read in whole auxv vector and copy it to file
-     */
-    ptr = lock_user(VERIFY_READ, auxv, len, 0);
-    if (ptr != NULL) {
-        while (len > 0) {
-            ssize_t r;
-            r = write(fd, ptr, len);
-            if (r <= 0) {
-                break;
-            }
-            len -= r;
-            ptr += r;
-        }
-        lseek(fd, 0, SEEK_SET);
-        unlock_user(ptr, auxv, len);
-    }
-
-    return 0;
-}
-
-static int is_proc_myself(const char *filename, const char *entry)
-{
-    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
-        filename += strlen("/proc/");
-        if (!strncmp(filename, "self/", strlen("self/"))) {
-            filename += strlen("self/");
-        } else if (*filename >= '1' && *filename <= '9') {
-            char myself[80];
-            snprintf(myself, sizeof(myself), "%d/", getpid());
-            if (!strncmp(filename, myself, strlen(myself))) {
-                filename += strlen(myself);
-            } else {
-                return 0;
-            }
-        } else {
-            return 0;
-        }
-        if (!strcmp(filename, entry)) {
-            return 1;
-        }
-    }
-    return 0;
-}
-
-#if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
-static int is_proc(const char *filename, const char *entry)
-{
-    return strcmp(filename, entry) == 0;
-}
-
-static int open_net_route(void *cpu_env, int fd)
-{
-    FILE *fp;
-    char *line = NULL;
-    size_t len = 0;
-    ssize_t read;
-
-    fp = fopen("/proc/net/route", "r");
-    if (fp == NULL) {
-        return -1;
-    }
-
-    /* read header */
-
-    read = getline(&line, &len, fp);
-    dprintf(fd, "%s", line);
-
-    /* read routes */
-
-    while ((read = getline(&line, &len, fp)) != -1) {
-        char iface[16];
-        uint32_t dest, gw, mask;
-        unsigned int flags, refcnt, use, metric, mtu, window, irtt;
-        int fields;
-
-        fields = sscanf(line,
-                        "%s\t%08x\t%08x\t%04x\t%d\t%d\t%d\t%08x\t%d\t%u\t%u\n",
-                        iface, &dest, &gw, &flags, &refcnt, &use, &metric,
-                        &mask, &mtu, &window, &irtt);
-        if (fields != 11) {
-            continue;
-        }
-        dprintf(fd, "%s\t%08x\t%08x\t%04x\t%d\t%d\t%d\t%08x\t%d\t%u\t%u\n",
-                iface, tswap32(dest), tswap32(gw), flags, refcnt, use,
-                metric, tswap32(mask), mtu, window, irtt);
-    }
-
-    free(line);
-    fclose(fp);
-
-    return 0;
-}
-#endif
-
-static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags, mode_t mode)
-{
-    struct fake_open {
-        const char *filename;
-        int (*fill)(void *cpu_env, int fd);
-        int (*cmp)(const char *s1, const char *s2);
-    };
-    const struct fake_open *fake_open;
-    static const struct fake_open fakes[] = {
-        { "maps", open_self_maps, is_proc_myself },
-        { "stat", open_self_stat, is_proc_myself },
-        { "auxv", open_self_auxv, is_proc_myself },
-        { "cmdline", open_self_cmdline, is_proc_myself },
-#if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
-        { "/proc/net/route", open_net_route, is_proc },
-#endif
-        { NULL, NULL, NULL }
-    };
-
-    if (is_proc_myself(pathname, "exe")) {
-        int execfd = qemu_getauxval(AT_EXECFD);
-        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
-    }
-
-    for (fake_open = fakes; fake_open->filename; fake_open++) {
-        if (fake_open->cmp(pathname, fake_open->filename)) {
-            break;
-        }
-    }
-
-    if (fake_open->filename) {
-        const char *tmpdir;
-        char filename[PATH_MAX];
-        int fd, r;
-
-        /* create temporary file to map stat to */
-        tmpdir = getenv("TMPDIR");
-        if (!tmpdir)
-            tmpdir = "/tmp";
-        snprintf(filename, sizeof(filename), "%s/qemu-open.XXXXXX", tmpdir);
-        fd = mkstemp(filename);
-        if (fd < 0) {
-            return fd;
-        }
-        unlink(filename);
-
-        if ((r = fake_open->fill(cpu_env, fd))) {
-            int e = errno;
-            close(fd);
-            errno = e;
-            return r;
-        }
-        lseek(fd, 0, SEEK_SET);
-
-        return fd;
-    }
-
-    return safe_openat(dirfd, path(pathname), flags, mode);
-}
+static int is_proc_myself(const char *filename, const char *entry);
 
 #define TIMER_MAGIC 0x0caf0000
 #define TIMER_MAGIC_MASK 0xffff0000
@@ -7083,26 +6818,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 
-#ifdef TARGET_NR_open
-    case TARGET_NR_open:
-        if (!(p = lock_user_string(arg1)))
-            return -TARGET_EFAULT;
-        ret = get_errno(do_openat(cpu_env, AT_FDCWD, p,
-                                  target_to_host_bitmask(arg2, fcntl_flags_tbl),
-                                  arg3));
-        fd_trans_unregister(ret);
-        unlock_user(p, arg1, 0);
-        return ret;
-#endif
-    case TARGET_NR_openat:
-        if (!(p = lock_user_string(arg2)))
-            return -TARGET_EFAULT;
-        ret = get_errno(do_openat(cpu_env, arg1, p,
-                                  target_to_host_bitmask(arg3, fcntl_flags_tbl),
-                                  arg4));
-        fd_trans_unregister(ret);
-        unlock_user(p, arg2, 0);
-        return ret;
 #if defined(TARGET_NR_name_to_handle_at) && defined(CONFIG_OPEN_BY_HANDLE)
     case TARGET_NR_name_to_handle_at:
         ret = do_name_to_handle_at(arg1, arg2, arg3, arg4, arg5);
@@ -11643,6 +11358,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                                 int64_t arg2, int64_t arg3, int64_t arg4, \
                                 int64_t arg5, int64_t arg6)
 
+#include "syscall-file.inc.c"
 
 #undef SYSCALL_IMPL
 #undef SYSCALL_ARGS
diff --git a/linux-user/strace.list b/linux-user/strace.list
index db21ce4177..2c7a595e19 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -677,12 +677,6 @@
 #ifdef TARGET_NR_olduname
 { TARGET_NR_olduname, "olduname" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_open
-{ TARGET_NR_open, "open" , NULL, print_open, NULL },
-#endif
-#ifdef TARGET_NR_openat
-{ TARGET_NR_openat, "openat" , NULL, print_openat, NULL },
-#endif
 #ifdef TARGET_NR_osf_adjtime
 { TARGET_NR_osf_adjtime, "osf_adjtime" , NULL, NULL, NULL },
 #endif
-- 
2.17.1


