Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE537D67BE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 18:53:44 +0200 (CEST)
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK3bL-00071I-GL
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 12:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2qD-0004S0-Rt
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2qB-0007aD-Q6
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:05:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2qB-0007ZU-HS
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:04:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v8so20391790wrt.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KPCJs01lqTl1BmtrsrtRz/4IBpZgWn0Ozwdl4HTNvE4=;
 b=iikDosOQVfwtL9MvFQbpxrPTsbckIK+mlISVRo/X/zXwxrOh6yNg9whsRg6ZA0QSIg
 Xrvnj3ojdzwXjnQVQeYgXm5kFeqxW2VsPi4o3li7EK3eqYiePJ6yuIA2oC1s7IHqTJv2
 bN6AT/OMHjQVaZcm//LjtwHDC3xzraWayxhgV1B75uDH6koswa9d2wzfpGCVjbbPlhUG
 wUm24KznsDtvUzgI9Zg3KeZuKod4dxFCX6zXnpGEVNwktGTFAh6lBsynoX4w+uHjgGuG
 uuKHrlrPMsKq8W5wptITY5xAV/jOwZNjyib8eV+KlvkybVD5a/RJhOiHyOTykiadUb+M
 A7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPCJs01lqTl1BmtrsrtRz/4IBpZgWn0Ozwdl4HTNvE4=;
 b=B/1olhU5RvWt565OQOirif5UJjvPKqMl8WqH0QS3Q4AIrwGBLqfWXuN+TZLfjwkF3W
 c9TIySVbRPjQxFkWucWVF71waLU87SIHdYfghTdlSxbPzW25+fEFsQuFRnuEa4XIgBUx
 xWG1ZwV7yyUT8cg1LaJ4xWtqvQ+gbSbX/+O6JKDWfyWNc3FhLFzWfD4KFggGumxnaouI
 HgvPiAXoxq79MlfzjZ+aVB+Dj8HrU7enRbM+47M4bQcOzJGjyKLqriIGsK2LPbsj6sMT
 NGps+gDTFL6Glqji2d8lGzBgMHGsyiWiWd4CUDa5/o8EOuHTpa4TeSHWeNBDQ4RSBSCu
 QWIw==
X-Gm-Message-State: APjAAAXp65/m3IhYXheNY5rgixr29vEo52zLh/MucQJDIwWtzPLN0a8i
 o3Bi3gTm4094Yytw0r3gUh+jqu1DfCaQSw==
X-Google-Smtp-Source: APXvYqxkXMihaK5WidxJ8gfi36TshpIw8zc4pZJYv46xRxLzrw7xvQOHo0sqa0xfC2LgZ2+wzik/Kw==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr10803086wrp.318.1571069098004; 
 Mon, 14 Oct 2019 09:04:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 5sm18029779wrk.86.2019.10.14.09.04.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 09:04:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/68] target/arm/arm-semi: Make semihosting code hand out its
 own file descriptors
Date: Mon, 14 Oct 2019 17:03:24 +0100
Message-Id: <20191014160404.19553-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014160404.19553-1-peter.maydell@linaro.org>
References: <20191014160404.19553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Currently the Arm semihosting code returns the guest file descriptors
(handles) which are simply the fd values from the host OS or the
remote gdbstub. Part of the semihosting 2.0 specification requires
that we implement special handling of opening a ":semihosting-features"
filename. Guest fds which result from opening the special file
won't correspond to host fds, so to ensure that we don't end up
with duplicate fds we need to have QEMU code control the allocation
of the fd values we give the guest.

Add in an abstraction layer which lets us allocate new guest FD
values, and translate from a guest FD value back to the host one.
This also fixes an odd hole where a semihosting guest could
use the semihosting API to read, write or close file descriptors
that it had never allocated but which were being used by QEMU itself.
(This isn't a security hole, because enabling semihosting permits
the guest to do arbitrary file access to the whole host filesystem,
and so should only be done if the guest is completely trusted.)

Currently the only kind of guest fd is one which maps to a
host fd, but in a following commit we will add one which maps
to the :semihosting-features magic data.

If the guest is migrated with an open semihosting file descriptor
then subsequent attempts to use the fd will all fail; this is
not a change from the previous situation (where the host fd
being used on the source end would not be re-opened on the
destination end).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190916141544.17540-5-peter.maydell@linaro.org
---
 target/arm/arm-semi.c | 232 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 216 insertions(+), 16 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 302529f2278..a4741d7e11b 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -106,6 +106,113 @@ static int open_modeflags[12] = {
     O_RDWR | O_CREAT | O_APPEND | O_BINARY
 };
 
+typedef enum GuestFDType {
+    GuestFDUnused = 0,
+    GuestFDHost = 1,
+} GuestFDType;
+
+/*
+ * Guest file descriptors are integer indexes into an array of
+ * these structures (we will dynamically resize as necessary).
+ */
+typedef struct GuestFD {
+    GuestFDType type;
+    int hostfd;
+} GuestFD;
+
+static GArray *guestfd_array;
+
+/*
+ * Allocate a new guest file descriptor and return it; if we
+ * couldn't allocate a new fd then return -1.
+ * This is a fairly simplistic implementation because we don't
+ * expect that most semihosting guest programs will make very
+ * heavy use of opening and closing fds.
+ */
+static int alloc_guestfd(void)
+{
+    guint i;
+
+    if (!guestfd_array) {
+        /* New entries zero-initialized, i.e. type GuestFDUnused */
+        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
+    }
+
+    for (i = 0; i < guestfd_array->len; i++) {
+        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
+
+        if (gf->type == GuestFDUnused) {
+            return i;
+        }
+    }
+
+    /* All elements already in use: expand the array */
+    g_array_set_size(guestfd_array, i + 1);
+    return i;
+}
+
+/*
+ * Look up the guestfd in the data structure; return NULL
+ * for out of bounds, but don't check whether the slot is unused.
+ * This is used internally by the other guestfd functions.
+ */
+static GuestFD *do_get_guestfd(int guestfd)
+{
+    if (!guestfd_array) {
+        return NULL;
+    }
+
+    if (guestfd < 0 || guestfd >= guestfd_array->len) {
+        return NULL;
+    }
+
+    return &g_array_index(guestfd_array, GuestFD, guestfd);
+}
+
+/*
+ * Associate the specified guest fd (which must have been
+ * allocated via alloc_fd() and not previously used) with
+ * the specified host fd.
+ */
+static void associate_guestfd(int guestfd, int hostfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDHost;
+    gf->hostfd = hostfd;
+}
+
+/*
+ * Deallocate the specified guest file descriptor. This doesn't
+ * close the host fd, it merely undoes the work of alloc_fd().
+ */
+static void dealloc_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDUnused;
+}
+
+/*
+ * Given a guest file descriptor, get the associated struct.
+ * If the fd is not valid, return NULL. This is the function
+ * used by the various semihosting calls to validate a handle
+ * from the guest.
+ * Note: calling alloc_guestfd() or dealloc_guestfd() will
+ * invalidate any GuestFD* obtained by calling this function.
+ */
+static GuestFD *get_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    if (!gf || gf->type == GuestFDUnused) {
+        return NULL;
+    }
+    return gf;
+}
+
 #ifdef CONFIG_USER_ONLY
 static inline uint32_t set_swi_errno(TaskState *ts, uint32_t code)
 {
@@ -207,6 +314,34 @@ static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 #endif
 }
 
+static int arm_semi_open_guestfd;
+
+static void arm_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = cs->opaque;
+#endif
+    if (ret == (target_ulong)-1) {
+#ifdef CONFIG_USER_ONLY
+        ts->swi_errno = err;
+#else
+        syscall_err = err;
+#endif
+        dealloc_guestfd(arm_semi_open_guestfd);
+    } else {
+        associate_guestfd(arm_semi_open_guestfd, ret);
+        ret = arm_semi_open_guestfd;
+    }
+
+    if (is_a64(env)) {
+        env->xregs[0] = ret;
+    } else {
+        env->regs[0] = ret;
+    }
+}
+
 static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
                                     const char *fmt, ...)
 {
@@ -283,6 +418,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 #else
     CPUARMState *ts = env;
 #endif
+    GuestFD *gf;
 
     if (is_a64(env)) {
         /* Note that the syscall number is in W0, not X0 */
@@ -295,6 +431,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
     switch (nr) {
     case TARGET_SYS_OPEN:
+    {
+        int guestfd;
+
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
@@ -308,26 +447,52 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             errno = EINVAL;
             return set_swi_errno(ts, -1);
         }
+
+        guestfd = alloc_guestfd();
+        if (guestfd < 0) {
+            unlock_user(s, arg0, 0);
+            errno = EMFILE;
+            return set_swi_errno(ts, -1);
+        }
+
         if (strcmp(s, ":tt") == 0) {
             int result_fileno = arg1 < 4 ? STDIN_FILENO : STDOUT_FILENO;
+            associate_guestfd(guestfd, result_fileno);
             unlock_user(s, arg0, 0);
-            return result_fileno;
+            return guestfd;
         }
         if (use_gdb_syscalls()) {
-            ret = arm_gdb_syscall(cpu, arm_semi_cb, "open,%s,%x,1a4", arg0,
+            arm_semi_open_guestfd = guestfd;
+            ret = arm_gdb_syscall(cpu, arm_semi_open_cb, "open,%s,%x,1a4", arg0,
                                   (int)arg2+1, gdb_open_modeflags[arg1]);
         } else {
             ret = set_swi_errno(ts, open(s, open_modeflags[arg1], 0644));
+            if (ret == (uint32_t)-1) {
+                dealloc_guestfd(guestfd);
+            } else {
+                associate_guestfd(guestfd, ret);
+                ret = guestfd;
+            }
         }
         unlock_user(s, arg0, 0);
         return ret;
+    }
     case TARGET_SYS_CLOSE:
         GET_ARG(0);
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", arg0);
-        } else {
-            return set_swi_errno(ts, close(arg0));
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
         }
+
+        if (use_gdb_syscalls()) {
+            ret = arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
+        } else {
+            ret = set_swi_errno(ts, close(gf->hostfd));
+        }
+        dealloc_guestfd(arg0);
+        return ret;
     case TARGET_SYS_WRITEC:
         qemu_semihosting_console_outc(env, args);
         return 0xdeadbeef;
@@ -338,17 +503,24 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(1);
         GET_ARG(2);
         len = arg2;
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             arm_semi_syscall_len = len;
             return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
-                                   arg0, arg1, len);
+                                   gf->hostfd, arg1, len);
         } else {
             s = lock_user(VERIFY_READ, arg1, len, 1);
             if (!s) {
                 /* Return bytes not written on error */
                 return len;
             }
-            ret = set_swi_errno(ts, write(arg0, s, len));
+            ret = set_swi_errno(ts, write(gf->hostfd, s, len));
             unlock_user(s, arg1, 0);
             if (ret == (uint32_t)-1) {
                 ret = 0;
@@ -361,10 +533,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         GET_ARG(1);
         GET_ARG(2);
         len = arg2;
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             arm_semi_syscall_len = len;
             return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
-                                   arg0, arg1, len);
+                                   gf->hostfd, arg1, len);
         } else {
             s = lock_user(VERIFY_WRITE, arg1, len, 0);
             if (!s) {
@@ -372,7 +551,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                 return len;
             }
             do {
-                ret = set_swi_errno(ts, read(arg0, s, len));
+                ret = set_swi_errno(ts, read(gf->hostfd, s, len));
             } while (ret == -1 && errno == EINTR);
             unlock_user(s, arg1, len);
             if (ret == (uint32_t)-1) {
@@ -386,31 +565,52 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         return 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", arg0);
+            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
         } else {
-            return isatty(arg0);
+            return isatty(gf->hostfd);
         }
     case TARGET_SYS_SEEK:
         GET_ARG(0);
         GET_ARG(1);
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
-                                   arg0, arg1);
+                                   gf->hostfd, arg1);
         } else {
-            ret = set_swi_errno(ts, lseek(arg0, arg1, SEEK_SET));
+            ret = set_swi_errno(ts, lseek(gf->hostfd, arg1, SEEK_SET));
             if (ret == (uint32_t)-1)
               return -1;
             return 0;
         }
     case TARGET_SYS_FLEN:
         GET_ARG(0);
+
+        gf = get_guestfd(arg0);
+        if (!gf) {
+            errno = EBADF;
+            return set_swi_errno(ts, -1);
+        }
+
         if (use_gdb_syscalls()) {
             return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
-                                   arg0, arm_flen_buf(cpu));
+                                   gf->hostfd, arm_flen_buf(cpu));
         } else {
             struct stat buf;
-            ret = set_swi_errno(ts, fstat(arg0, &buf));
+            ret = set_swi_errno(ts, fstat(gf->hostfd, &buf));
             if (ret == (uint32_t)-1)
                 return -1;
             return buf.st_size;
-- 
2.20.1


