Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAEB38F288
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:50:49 +0200 (CEST)
Received: from localhost ([::1]:50118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEj2-0000cF-4E
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llEhW-0007aN-5D
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:49:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llEhT-0001ef-Qa
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:49:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id p7so25687820wru.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=UU071JWugG/wj1MQEk1vAjkpgG43EtESxvs6DTZX5iE=;
 b=lkgZFydK0Rm+3GTasJmIIofV6VzHbYTnaZorG9OZ+JYGrn8LHCayj0yKagGDpZg4LB
 xhtO6G1ktZUIPd8ZwDVEX5WOuBUoQOtZrL6FBRyhQ4slgThF4UfcdDr1O2oOHvh12TGy
 FsZFa5WK9F+LDk0zVsjl2jss5V4Y2wvwe5JhvjwhAOYlOQlE06UFOOrnqTdqM+cfrxci
 hvDCNrH+jIL46lmOKgZ8WcYKzwMUi1lkZXA0t0cHYqBiscV42qVkDDDPY+1VW4aPuRrg
 ezRw7fRgWmci2gbdv1EcRvsgor9xEHs03B4Bk80QHSqLW7fxzuUAI56Z0uySWRyi1WTY
 hrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=UU071JWugG/wj1MQEk1vAjkpgG43EtESxvs6DTZX5iE=;
 b=eGKarxubFLtuJUI7VdzHvYIkauYBzCRVfugKhWP7ZwcbB+VdBSF7xqGvtuOQ7fmyDO
 iQ/+rC6hV/hq1bcOtNZSTzwHo0A8Ze68NrmzMqG4bOyd8ooA3w4L5oJIR//I+OtOQd5t
 5WH0FGS95BQMWrewQlimm0lVy4STnFrdwyPesCOxvs3M81HTfarBPBizK39laaM6SrWI
 25kfZw0YZ6LYeiC8vnFSddTFrJyGvvUThOqAigEZTY1J+tFaS9JkbD3Zi6jyewNBNZ0j
 NYWi5Jyiknvun3I7wGB3Kz47oPmGbfCths0zmRCPAKmhYtvXjq6plrHMBuRnqZ7ur0ti
 DSSw==
X-Gm-Message-State: AOAM530zW85YeZS3qMR1w/fYsiMe66RA74+FuY6ItkJkL2INTm4lp1DJ
 2jsW8g9zUHDf/cue8hISnmUtcw==
X-Google-Smtp-Source: ABdhPJyt0AXX0anknc5el03gOJhus8Svvj5MHzjPJVJZ0x5xtLRCIf2mwIxRrbshiKa2IF2gFt74lg==
X-Received: by 2002:adf:fc44:: with SMTP id e4mr23296428wrs.23.1621878549974; 
 Mon, 24 May 2021 10:49:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i1sm13023978wrp.51.2021.05.24.10.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 10:49:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 761331FF7E;
 Mon, 24 May 2021 18:49:07 +0100 (BST)
References: <20210524045412.15152-1-yamamoto@midokura.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: YAMAMOTO Takashi <yamamoto@midokura.com>
Subject: Re: [PATCH 0/5] linux-user changes to run docker
Date: Mon, 24 May 2021 18:45:18 +0100
In-reply-to: <20210524045412.15152-1-yamamoto@midokura.com>
Message-ID: <87cztg3tv0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-=-=
Content-Type: text/plain


YAMAMOTO Takashi <yamamoto@midokura.com> writes:

> These patches, along with a few more hacks [1] I didn't include
> in this patchset, allowed me to run arm64 and armv7 version of
> dind image on amd64.
>
> [1] https://github.com/yamt/qemu/tree/linux-user-for-docker

Might be worth posting those patches next time (even if they have a RFC
or !MERGE in the title for now). I had a little noodle around with
testing and quickly found a few holes. It would be nice if we could have
a unit test to cover these various bits as I fear it will easily break
again. Feel free to use the following as a basis if you want:


--=-=-=
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: inline;
 filename=0001-tests-tcg-simple-test-for-proc-self-behaviour.patch
Content-Transfer-Encoding: quoted-printable
Content-Description: /proc/self test

From 5d331e84f3e8763921a619647a46bc8b4c9f3207 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>
Date: Mon, 24 May 2021 10:49:55 +0100
Subject: [PATCH 1/2] tests/tcg: simple test for /proc/self behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/self.c | 114 +++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 tests/tcg/multiarch/self.c

diff --git a/tests/tcg/multiarch/self.c b/tests/tcg/multiarch/self.c
new file mode 100644
index 0000000000..f6ea145d16
--- /dev/null
+++ b/tests/tcg/multiarch/self.c
@@ -0,0 +1,114 @@
+/*
+ * /proc/self checks
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define _GNU_SOURCE
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <assert.h>
+#include <fcntl.h>
+
+static void error1(const char *filename, int line, const char *fmt, ...)
+{
+    va_list ap;
+    va_start(ap, fmt);
+    fprintf(stderr, "%s:%d: ", filename, line);
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, "\n");
+    va_end(ap);
+    exit(1);
+}
+
+static int __chk_error(const char *filename, int line, int ret)
+{
+    if (ret < 0) {
+        error1(filename, line, "%m (ret=3D%d, errno=3D%d/%s)",
+               ret, errno, strerror(errno));
+    }
+    return ret;
+}
+
+#define error(fmt, ...) error1(__FILE__, __LINE__, fmt, ## __VA_ARGS__)
+
+#define chk_error(ret) __chk_error(__FILE__, __LINE__, (ret))
+
+#define PATH_MAX 1024
+
+static void check_self_exe(struct stat *self)
+{
+    struct stat statbuf;
+    struct stat linkbuf;
+    chk_error(stat("/proc/self/exe", &statbuf));
+    chk_error(lstat("/proc/self/exe", &linkbuf));
+    assert(statbuf.st_ino !=3D linkbuf.st_ino);
+    assert(statbuf.st_ino =3D=3D self->st_ino);
+}
+
+static void check_mypid(struct stat *self)
+{
+    pid_t me =3D getpid();
+    char path[PATH_MAX];
+    struct stat statbuf;
+    struct stat linkbuf;
+
+    snprintf(&path[0], PATH_MAX, "/proc/%d/exe", me);
+
+    chk_error(stat(path, &statbuf));
+    chk_error(lstat(path, &linkbuf));
+    assert(statbuf.st_ino !=3D linkbuf.st_ino);
+    assert(statbuf.st_ino =3D=3D self->st_ino);
+}
+
+static void check_noncanon(struct stat *self)
+{
+    struct stat statbuf;
+    int fd_slash, fd_dot;
+
+    fd_slash =3D openat(AT_FDCWD, "/proc///self/exe", O_PATH);
+    chk_error(fstat(fd_slash, &statbuf));
+    assert(statbuf.st_ino =3D=3D self->st_ino);
+    close(fd_slash);
+
+    fd_dot =3D openat(AT_FDCWD, "/proc/./self/exe", O_PATH);
+    chk_error(fstat(fd_dot, &statbuf));
+    assert(statbuf.st_ino =3D=3D self->st_ino);
+    close(fd_dot);
+}
+
+int main(int argc, char **argv)
+{
+    struct stat self;
+
+    chk_error(stat(argv[0], &self));
+    printf("I am %s (%d/%lu)\n", argv[0], argc,
+           (long unsigned int) self.st_ino);
+
+    check_self_exe(&self);
+    check_mypid(&self);
+    check_noncanon(&self);
+
+#if 0
+    if (argc =3D=3D 2) {
+        printf("I think I execve'd myself\n");
+    } else {
+        char *new_argv[3] =3D { argv[0], "again", NULL };
+        chk_error(execve("/proc/self/exe", new_argv, NULL));
+        /* should never return */
+        return -1;
+    }
+#endif
+
+    return 0;
+}

base-commit: d36f3ecdc70af8941053cca8347daca757be2865
--=20
2.20.1


--=-=-=
Content-Type: text/plain



> You can find my test setup here:
> https://github.com/yamt/garbage/tree/master/binfmt-aarch64-install
>
> YAMAMOTO Takashi (5):
>   linux-user: handle /proc/self/exe for execve
>   linux-uesr: make exec_path realpath
>   linux-user: Fix the execfd case of /proc/self/exe open
>   linux-user: dup the execfd on start up
>   linux-user: Implement pivot_root
>
>  linux-user/main.c    | 14 +++++++++++++-
>  linux-user/qemu.h    |  2 ++
>  linux-user/syscall.c | 43 ++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 55 insertions(+), 4 deletions(-)

I also had a go at cleaning up is_proc_self and Daniel greatly
simplified it.


--=-=-=
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: inline;
 filename=0002-linux-user-glib-ify-is_proc_myself.patch
Content-Transfer-Encoding: quoted-printable
Content-Description: glib-ify is_proc_self

From fe342309661e3fe8b9e192e6df6ef84267207dac Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>
Date: Mon, 24 May 2021 12:19:18 +0100
Subject: [PATCH 2/2] linux-user: glib-ify is_proc_myself
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

For the cost of a couple of heap allocations we can reduce the code
complexity to a couple of string compares. While we are at it make the
function a bool return and fixup the fake_open function prototypes.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

---
v2
  - use danpb's suggestion
---
 linux-user/syscall.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e739921e86..8af48b5f1f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7987,33 +7987,16 @@ static int open_self_auxv(void *cpu_env, int fd)
     return 0;
 }
=20
-static int is_proc_myself(const char *filename, const char *entry)
-{
-    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
-        filename +=3D strlen("/proc/");
-        if (!strncmp(filename, "self/", strlen("self/"))) {
-            filename +=3D strlen("self/");
-        } else if (*filename >=3D '1' && *filename <=3D '9') {
-            char myself[80];
-            snprintf(myself, sizeof(myself), "%d/", getpid());
-            if (!strncmp(filename, myself, strlen(myself))) {
-                filename +=3D strlen(myself);
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
+static bool is_proc_myself(const char *filename, const char *entry)
+{
+    g_autofree char *procself =3D g_strdup_printf("/proc/self/%s", entry);
+    g_autofree char *procpid =3D g_strdup_printf("/proc/%d/%s", getpid(), =
entry);
+    return g_str_equal(filename, procself) || g_str_equal(filename, procpi=
d);
 }
=20
 #if defined(HOST_WORDS_BIGENDIAN) !=3D defined(TARGET_WORDS_BIGENDIAN) || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
-static int is_proc(const char *filename, const char *entry)
+static bool is_proc(const char *filename, const char *entry)
 {
     return strcmp(filename, entry) =3D=3D 0;
 }
@@ -8097,7 +8080,7 @@ static int do_openat(void *cpu_env, int dirfd, const =
char *pathname, int flags,
     struct fake_open {
         const char *filename;
         int (*fill)(void *cpu_env, int fd);
-        int (*cmp)(const char *s1, const char *s2);
+        bool (*cmp)(const char *s1, const char *s2);
     };
     const struct fake_open *fake_open;
     static const struct fake_open fakes[] =3D {
--=20
2.20.1


--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



--=20
Alex Benn=C3=A9e

--=-=-=--

