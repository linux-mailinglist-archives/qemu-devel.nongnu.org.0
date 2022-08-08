Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402E658C3E6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 09:23:59 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKx7G-0004xm-5U
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 03:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oKx35-0003EJ-VQ
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:19:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oKx32-0003Yo-MK
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:19:39 -0400
Received: by mail-ed1-x536.google.com with SMTP id b96so10259531edf.0
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 00:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=rWzzeQCKXoj+TEIZiiahX7Ul2cdPpb7I9NGpjlg55NE=;
 b=PYM3bsMwBYWt3tcy/S3v9bHjPjzfLHEriGEELoDpBnrWfUMcSMzcP9ukOTzxTUNV6r
 A3gl3smhkmkqeMmtq1CFAcHVOHZbyJsFlU3ArCOEVRXFO8CA7cLbCvu2XRt6girctnpO
 T+sfNOFex13+Bi/bWJTSg8zzPKZdUNa4alvDvQVxOSZwfe8sph5Ad7pxjwsJWmG9UoLD
 ZAhsTNoXiPe7YsA1yi4xEuSrLIGZy+S1mJ1QbZIlLNHJOCCNkGY/KYg0c6S9Lp4m8K22
 157rlLvYbj6cegtHta9u++kd5frWfzF84qKTsHlBILq/fu+IGwK66dgBFjGlO1WjL7uN
 OR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=rWzzeQCKXoj+TEIZiiahX7Ul2cdPpb7I9NGpjlg55NE=;
 b=5q2UST+6gH1zPHENxdmpXXKei+M4X1OMmS2c4W7XrW1/vF+TRj2ysrn1KKgDFAMXmA
 vuEMi/cVYiu9U5TekjmCa/88OLxhKa9VNlrL8qDuAcWste27c4Z777H9LBRCSAcKDV49
 EFTxciUBlwSHACEmT/HghCOLdJHTMgqOytHlsyCjfLTipvxvWzbLHx8gzAIwAplu8Ct8
 mqpqDvRhaHhURxwIOLJqgSkqvYuA7D88/W9Pd7AfystSlZ9i/L2XT4taQYYUvwNaVJBM
 HtAu1ky6VkgZbKa+slCpnM1VK7tvlnj6rFoJBWp0wbV5fRwRSF9GweKyDRloG0Z9PVa3
 gnoQ==
X-Gm-Message-State: ACgBeo3zVV2E3BBdSKe+ZuOlyPNQrm4G8njTWN+JlZne2qYou4OckDyI
 9SnfVJs+X02YtvgdLMlLyw3mOTOfniyGbbi1fMo80NblQR+cTg==
X-Google-Smtp-Source: AA6agR7j1P4WYT4G/D3JtjHP1oJ6jVMJCFXnuey/sooGn9QIJ91B+fwuffqTajZ7yBMm/Zauz4GXZVsWhDqCIWr2ies=
X-Received: by 2002:a05:6402:378a:b0:431:6d8d:9023 with SMTP id
 et10-20020a056402378a00b004316d8d9023mr16908443edb.98.1659943172955; Mon, 08
 Aug 2022 00:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <4561100.0A2huPDW8y@silver>
 <CAMxuvayecf4pzKmjqB1AACD9OAc+5XY_88g=A9hm4qUq2SUm1A@mail.gmail.com>
 <CAFEAcA-ApDzJvYoWMP9un1p+bgNNe6g+J09QPfxUv4Ee=WMyeQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-ApDzJvYoWMP9un1p+bgNNe6g+J09QPfxUv4Ee=WMyeQ@mail.gmail.com>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Mon, 8 Aug 2022 10:19:22 +0300
Message-ID: <CAAJ4Ao-P3ZUuvzEkqOrUuw9qUWtmf3JWmvxVqMs4+z4pdqz6qw@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002bf8cf05e5b5a3a3"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--0000000000002bf8cf05e5b5a3a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Summing up the discussion above, I suggest the following patch for TFR()
macro refactoring. (The patch is sequential to the first one I introduced
in the start of the discussion).

From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00 2001
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Mon, 8 Aug 2022 09:30:34 +0300
Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()

glibc's unistd.h header provides the same macro with the
subtle difference in type casting. Adjust macro name to the
common standard and define conditionally.

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
---
 chardev/char-fd.c      |  2 +-
 chardev/char-pipe.c    | 12 +++++++++---
 hw/9pfs/9p-local.c     |  6 ++++--
 include/qemu/osdep.h   |  6 ++++--
 net/l2tpv3.c           |  8 +++++---
 net/tap-linux.c        |  2 +-
 net/tap.c              | 10 ++++++----
 os-posix.c             |  2 +-
 qga/commands-posix.c   |  2 +-
 tests/qtest/libqtest.c |  2 +-
 util/main-loop.c       |  2 +-
 util/osdep.c           |  2 +-
 12 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index cf78454841..7f5ed9aba3 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags,
Error **errp)
 {
     int fd =3D -1;

-    TFR(fd =3D qemu_open_old(src, flags, 0666));
+    TEMP_FAILURE_RETRY(fd =3D qemu_open_old(src, flags, 0666));
     if (fd =3D=3D -1) {
         error_setg_file_open(errp, errno, src);
     }
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 66d3b85091..aed97e306b 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,

     filename_in =3D g_strdup_printf("%s.in", filename);
     filename_out =3D g_strdup_printf("%s.out", filename);
-    TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY));
-    TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY));
+    TEMP_FAILURE_RETRY(
+        fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY)
+    );
+    TEMP_FAILURE_RETRY(
+        fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY)
+    );
     g_free(filename_in);
     g_free(filename_out);
     if (fd_in < 0 || fd_out < 0) {
@@ -142,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
         if (fd_out >=3D 0) {
             close(fd_out);
         }
-        TFR(fd_in =3D fd_out =3D qemu_open_old(filename, O_RDWR | O_BINARY=
));
+        TEMP_FAILURE_RETRY(
+            fd_in =3D fd_out =3D qemu_open_old(filename, O_RDWR | O_BINARY=
)
+        );
         if (fd_in < 0) {
             error_setg_file_open(errp, errno, filename);
             return;
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index c90ab947ba..e803c05d0c 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -470,7 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
V9fsPath *fs_path,
         if (fd =3D=3D -1) {
             return -1;
         }
-        TFR(tsize =3D read(fd, (void *)buf, bufsz));
+        TEMP_FAILURE_RETRY(tsize =3D read(fd, (void *)buf, bufsz));
         close_preserve_errno(fd);
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
@@ -906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const char
*oldpath,
         }
         /* Write the oldpath (target) to the file. */
         oldpath_size =3D strlen(oldpath);
-        TFR(write_size =3D write(fd, (void *)oldpath, oldpath_size));
+        TEMP_FAILURE_RETRY(
+            write_size =3D write(fd, (void *)oldpath, oldpath_size)
+        );
         close_preserve_errno(fd);

         if (write_size !=3D oldpath_size) {
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..55f2927d8b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -242,8 +242,10 @@ void QEMU_ERROR("code path is reachable")
 #if !defined(ESHUTDOWN)
 #define ESHUTDOWN 4099
 #endif
-
-#define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D EI=
NTR)
+#if !defined(TEMP_FAILURE_RETRY)
+#define TEMP_FAILURE_RETRY(expr) \
+    do { if ((expr) !=3D -1) break; } while (errno =3D=3D EINTR)
+#endif

 /* time_t may be either 32 or 64 bits depending on the host OS, and
  * can be either signed or unsigned, so we can't just hardcode a
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index adfdbdb84c..9594047ddb 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -240,7 +240,7 @@ static ssize_t
net_l2tpv3_receive_dgram_iov(NetClientState *nc,
     message.msg_control =3D NULL;
     message.msg_controllen =3D 0;
     message.msg_flags =3D 0;
-    TFR(ret =3D sendmsg(s->fd, &message, 0));
+    TEMP_FAILURE_RETRY(ret =3D sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -=3D s->offset;
     } else if (ret =3D=3D 0) {
@@ -283,7 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
*nc,
     message.msg_control =3D NULL;
     message.msg_controllen =3D 0;
     message.msg_flags =3D 0;
-    TFR(ret =3D sendmsg(s->fd, &message, 0));
+    TEMP_FAILURE_RETRY(ret =3D sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -=3D s->offset;
     } else if (ret =3D=3D 0) {
@@ -430,7 +430,9 @@ static void net_l2tpv3_send(void *opaque)

     msgvec =3D s->msgvec + s->queue_head;
     if (target_count > 0) {
-        TFR(count =3D recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
NULL));
+        TEMP_FAILURE_RETRY(
+            count =3D recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
NULL)
+        );
         if (count < 0) {
             /* Recv error - we still need to flush packets here,
              * (re)set queue head to current position
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 304ff45071..e1a10c77af 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr=
,
     int len =3D sizeof(struct virtio_net_hdr);
     unsigned int features;

-    TFR(fd =3D open(PATH_NET_TUN, O_RDWR));
+    TEMP_FAILURE_RETRY(fd =3D open(PATH_NET_TUN, O_RDWR));
     if (fd < 0) {
         error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN);
         return -1;
diff --git a/net/tap.c b/net/tap.c
index b047eca8b5..9fa0a8fa21 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -102,7 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
struct iovec *iov, int iovcnt
 {
     ssize_t len;

-    TFR(len =3D writev(s->fd, iov, iovcnt));
+    TEMP_FAILURE_RETRY(len =3D writev(s->fd, iov, iovcnt));

     if (len =3D=3D -1 && errno =3D=3D EAGAIN) {
         tap_write_poll(s, true);
@@ -575,7 +575,7 @@ static int net_bridge_run_helper(const char *helper,
const char *bridge,

         close(sv[1]);

-        TFR(fd =3D recv_fd(sv[0]));
+        TEMP_FAILURE_RETRY(fd =3D recv_fd(sv[0]));
         saved_errno =3D errno;

         close(sv[0]);
@@ -647,8 +647,10 @@ static int net_tap_init(const NetdevTapOptions *tap,
int *vnet_hdr,
         vnet_hdr_required =3D 0;
     }

-    TFR(fd =3D tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
-                      mq_required, errp));
+    TEMP_FAILURE_RETRY(
+        fd =3D tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
+                      mq_required, errp)
+    );
     if (fd < 0) {
         return -1;
     }
diff --git a/os-posix.c b/os-posix.c
index 321fc4bd13..e9918b9788 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -266,7 +266,7 @@ void os_setup_post(void)
             error_report("not able to chdir to /: %s", strerror(errno));
             exit(1);
         }
-        TFR(fd =3D qemu_open_old("/dev/null", O_RDWR));
+        TEMP_FAILURE_RETRY(fd =3D qemu_open_old("/dev/null", O_RDWR));
         if (fd =3D=3D -1) {
             exit(1);
         }
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 90f83aa9b6..5dd2c4a3e5 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -68,7 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
**errp)

     *status =3D 0;

-    TFR(rpid =3D waitpid(pid, status, 0));
+    TEMP_FAILURE_RETRY(rpid =3D waitpid(pid, status, 0));

     if (rpid =3D=3D -1) {
         error_setg_errno(errp, errno, "failed to wait for child (pid: %d)"=
,
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 8c159eacf5..031f71cbba 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
     /* Skip wait if qtest_probe_child already reaped.  */
     if (pid !=3D -1) {
         kill(pid, SIGTERM);
-        TFR(pid =3D waitpid(s->qemu_pid, &s->wstatus, 0));
+        TEMP_FAILURE_RETRY(pid =3D waitpid(s->qemu_pid, &s->wstatus, 0));
         assert(pid =3D=3D s->qemu_pid);
         s->qemu_pid =3D -1;
     }
diff --git a/util/main-loop.c b/util/main-loop.c
index 58e14db2d4..3a21f39792 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -64,7 +64,7 @@ static void sigfd_handler(void *opaque)
     ssize_t len;

     while (1) {
-        TFR(len =3D read(fd, &info, sizeof(info)));
+        TEMP_FAILURE_RETRY(len =3D read(fd, &info, sizeof(info)));

         if (len =3D=3D -1 && errno =3D=3D EAGAIN) {
             break;
diff --git a/util/osdep.c b/util/osdep.c
index d35c473ac7..e5d2225738 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -244,7 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
int64_t len, int fl_type)
         .l_type   =3D fl_type,
     };
     qemu_probe_lock_ops();
-    TFR(ret =3D fcntl(fd, fcntl_op_setlk, &fl));
+    TEMP_FAILURE_RETRY(ret =3D fcntl(fd, fcntl_op_setlk, &fl));
     return ret =3D=3D -1 ? -errno : 0;
 }

--=20
2.37.1


On Fri, Aug 5, 2022 at 2:40 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 5 Aug 2022 at 12:27, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> > On Fri, Aug 5, 2022 at 3:11 PM Christian Schoenebeck
> > <qemu_oss@crudebyte.com> wrote:
> > > I was thinking the same as Marc-Andr=C3=A9 before:
> > >
> > > commit 1dacd88ddcf33eb6ed044c4080e3ef5e3de4b6b6
> > > Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > Date:   Wed Mar 23 19:57:27 2022 +0400
> > >
> > >     include: move TFR to osdep.h
> > >
> > >     The macro requires EINTR, which has its header included in osdep.=
h.
> > >
> > >     (Not sure what TFR stands for, perhaps "Test For Retry". Rename i=
t
> ?)
> > >
> > >     Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> > >     Message-Id: <20220323155743.1585078-17-marcandre.lureau@redhat.co=
m
> >
> > >     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > >
> > > Wouldn't it make sense to first rename TFR() to something like
> > > RETRY_ON_EINTR() and then doing this consolidation here on top?
> >
> > Apparently TFR often stands for "Temp Failure Retry" (looking at
> > github code search)
> >
> > LOOP_WHILE_EINTR ?
>
> At the risk of getting into bikeshedding, since glibc's unistd.h
> defines a TEMP_FAILURE_RETRY() macro for this purpose, maybe we
> should use that, with a thing in osdep.h for "provide this macro
> if the system headers don't [ie musl, BSDs, Windows, etc]" ?
>
> (There is a subtle difference between our TFR() and the glibc
> TEMP_FAILURE_RETRY(): TEMP_FAILURE_RETRY() casts the result
> of the expr to 'long int' before comparing for equality with -1.)
>
> More generally, I think we should either use this macro rather
> more widely, or get rid of it entirely. The current situation
> where we use it in some of the net/tap code and a few chardevs
> and basically nowhere else is not very satisfactory.
>
> thanks
> -- PMM
>


--=20
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--0000000000002bf8cf05e5b5a3a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Summing up the discussion above, I suggest the following p=
atch for TFR() macro refactoring. (The patch is sequential to the first one=
 I introduced in the start of the discussion).<br><br>From 6318bee052900aa9=
3bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00 2001<br>From: Nikita Ivanov &l=
t;<a href=3D"mailto:nivanov@cloudlinux.com" target=3D"_blank">nivanov@cloud=
linux.com</a>&gt;<br>Date: Mon, 8 Aug 2022 09:30:34 +0300<br>Subject: [PATC=
H] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()<br><br>glibc&#39;s uni=
std.h header provides the same macro with the<br>subtle difference in type =
casting. Adjust macro name to the<br>common standard and define conditional=
ly.<br><br>Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloud=
linux.com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>---<br>=C2=
=A0chardev/char-fd.c =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>=C2=A0chardev/char=
-pipe.c =C2=A0 =C2=A0| 12 +++++++++---<br>=C2=A0hw/9pfs/9p-local.c =C2=A0 =
=C2=A0 | =C2=A06 ++++--<br>=C2=A0include/qemu/osdep.h =C2=A0 | =C2=A06 ++++=
--<br>=C2=A0net/l2tpv3.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A08 +++++=
---<br>=C2=A0net/tap-linux.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>=C2=
=A0net/tap.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++---=
-<br>=C2=A0os-posix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +=
-<br>=C2=A0qga/commands-posix.c =C2=A0 | =C2=A02 +-<br>=C2=A0tests/qtest/li=
bqtest.c | =C2=A02 +-<br>=C2=A0util/main-loop.c =C2=A0 =C2=A0 =C2=A0 | =C2=
=A02 +-<br>=C2=A0util/osdep.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 =
+-<br>=C2=A012 files changed, 35 insertions(+), 21 deletions(-)<br><br>diff=
 --git a/chardev/char-fd.c b/chardev/char-fd.c<br>index cf78454841..7f5ed9a=
ba3 100644<br>--- a/chardev/char-fd.c<br>+++ b/chardev/char-fd.c<br>@@ -198=
,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags, Error *=
*errp)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0int fd =3D -1;<br>=C2=A0<br>- =C2=
=A0 =C2=A0TFR(fd =3D qemu_open_old(src, flags, 0666));<br>+ =C2=A0 =C2=A0TE=
MP_FAILURE_RETRY(fd =3D qemu_open_old(src, flags, 0666));<br>=C2=A0 =C2=A0 =
=C2=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_f=
ile_open(errp, errno, src);<br>=C2=A0 =C2=A0 =C2=A0}<br>diff --git a/charde=
v/char-pipe.c b/chardev/char-pipe.c<br>index 66d3b85091..aed97e306b 100644<=
br>--- a/chardev/char-pipe.c<br>+++ b/chardev/char-pipe.c<br>@@ -131,8 +131=
,12 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>=C2=A0<br>=C2=A0 =C2=
=A0 =C2=A0filename_in =3D g_strdup_printf(&quot;%<a href=3D"http://s.in" ta=
rget=3D"_blank">s.in</a>&quot;, filename);<br>=C2=A0 =C2=A0 =C2=A0filename_=
out =3D g_strdup_printf(&quot;%s.out&quot;, filename);<br>- =C2=A0 =C2=A0TF=
R(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY));<br>- =C2=A0 =C2=
=A0TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY));<br>+ =C2=
=A0 =C2=A0TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd_in =3D qem=
u_open_old(filename_in, O_RDWR | O_BINARY)<br>+ =C2=A0 =C2=A0);<br>+ =C2=A0=
 =C2=A0TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd_out =3D qemu_=
open_old(filename_out, O_RDWR | O_BINARY)<br>+ =C2=A0 =C2=A0);<br>=C2=A0 =
=C2=A0 =C2=A0g_free(filename_in);<br>=C2=A0 =C2=A0 =C2=A0g_free(filename_ou=
t);<br>=C2=A0 =C2=A0 =C2=A0if (fd_in &lt; 0 || fd_out &lt; 0) {<br>@@ -142,=
7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (fd_out &gt;=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0close(fd_out);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<b=
r>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd_in =3D fd_out =3D qemu_open_old(filen=
ame, O_RDWR | O_BINARY));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TEMP_FAILURE_RETR=
Y(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd_in =3D fd_out =3D qemu_=
open_old(filename, O_RDWR | O_BINARY)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_in &lt; 0) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_file_open(errp, errno, filename);=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>diff --git a=
/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>index c90ab947ba..e803c05d0c 10=
0644<br>--- a/hw/9pfs/9p-local.c<br>+++ b/hw/9pfs/9p-local.c<br>@@ -470,7 +=
470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path=
,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(tsize =3D read(fd, (void *)=
buf, bufsz));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TEMP_FAILURE_RETRY(tsize =3D =
read(fd, (void *)buf, bufsz));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_p=
reserve_errno(fd);<br>=C2=A0 =C2=A0 =C2=A0} else if ((fs_ctx-&gt;export_fla=
gs &amp; V9FS_SM_PASSTHROUGH) ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE)) {<br>@@ -90=
6,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpa=
th,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Write the oldpath (target) to the file. */<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0oldpath_size =3D strlen(oldpath);<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0TFR(write_size =3D write(fd, (void *)oldpath, oldpath_size));<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0write_size =3D write(fd, (void *)oldpath, oldpath_size)=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cl=
ose_preserve_errno(fd);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
write_size !=3D oldpath_size) {<br>diff --git a/include/qemu/osdep.h b/incl=
ude/qemu/osdep.h<br>index b1c161c035..55f2927d8b 100644<br>--- a/include/qe=
mu/osdep.h<br>+++ b/include/qemu/osdep.h<br>@@ -242,8 +242,10 @@ void QEMU_=
ERROR(&quot;code path is reachable&quot;)<br>=C2=A0#if !defined(ESHUTDOWN)<=
br>=C2=A0#define ESHUTDOWN 4099<br>=C2=A0#endif<br>-<br>-#define TFR(expr) =
do { if ((expr) !=3D -1) break; } while (errno =3D=3D EINTR)<br>+#if !defin=
ed(TEMP_FAILURE_RETRY)<br>+#define TEMP_FAILURE_RETRY(expr) \<br>+ =C2=A0 =
=C2=A0do { if ((expr) !=3D -1) break; } while (errno =3D=3D EINTR)<br>+#end=
if<br>=C2=A0<br>=C2=A0/* time_t may be either 32 or 64 bits depending on th=
e host OS, and<br>=C2=A0 * can be either signed or unsigned, so we can&#39;=
t just hardcode a<br>diff --git a/net/l2tpv3.c b/net/l2tpv3.c<br>index adfd=
bdb84c..9594047ddb 100644<br>--- a/net/l2tpv3.c<br>+++ b/net/l2tpv3.c<br>@@=
 -240,7 +240,7 @@ static ssize_t net_l2tpv3_receive_dgram_iov(NetClientStat=
e *nc,<br>=C2=A0 =C2=A0 =C2=A0message.msg_control =3D NULL;<br>=C2=A0 =C2=
=A0 =C2=A0message.msg_controllen =3D 0;<br>=C2=A0 =C2=A0 =C2=A0message.msg_=
flags =3D 0;<br>- =C2=A0 =C2=A0TFR(ret =3D sendmsg(s-&gt;fd, &amp;message, =
0));<br>+ =C2=A0 =C2=A0TEMP_FAILURE_RETRY(ret =3D sendmsg(s-&gt;fd, &amp;me=
ssage, 0));<br>=C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret -=3D s-&gt;offset;<br>=C2=A0 =C2=A0 =C2=A0} else if (r=
et =3D=3D 0) {<br>@@ -283,7 +283,7 @@ static ssize_t net_l2tpv3_receive_dgr=
am(NetClientState *nc,<br>=C2=A0 =C2=A0 =C2=A0message.msg_control =3D NULL;=
<br>=C2=A0 =C2=A0 =C2=A0message.msg_controllen =3D 0;<br>=C2=A0 =C2=A0 =C2=
=A0message.msg_flags =3D 0;<br>- =C2=A0 =C2=A0TFR(ret =3D sendmsg(s-&gt;fd,=
 &amp;message, 0));<br>+ =C2=A0 =C2=A0TEMP_FAILURE_RETRY(ret =3D sendmsg(s-=
&gt;fd, &amp;message, 0));<br>=C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret -=3D s-&gt;offset;<br>=C2=A0 =C2=A0 =C2=
=A0} else if (ret =3D=3D 0) {<br>@@ -430,7 +430,9 @@ static void net_l2tpv3=
_send(void *opaque)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0msgvec =3D s-&gt;msgve=
c + s-&gt;queue_head;<br>=C2=A0 =C2=A0 =C2=A0if (target_count &gt; 0) {<br>=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(count =3D recvmmsg(s-&gt;fd, msgvec, targe=
t_count, MSG_DONTWAIT, NULL));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TEMP_FAILURE=
_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D recvmmsg(s-=
&gt;fd, msgvec, target_count, MSG_DONTWAIT, NULL)<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; 0) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Recv error - we still need =
to flush packets here,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
* (re)set queue head to current position<br>diff --git a/net/tap-linux.c b/=
net/tap-linux.c<br>index 304ff45071..e1a10c77af 100644<br>--- a/net/tap-lin=
ux.c<br>+++ b/net/tap-linux.c<br>@@ -45,7 +45,7 @@ int tap_open(char *ifnam=
e, int ifname_size, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0int len =3D sizeo=
f(struct virtio_net_hdr);<br>=C2=A0 =C2=A0 =C2=A0unsigned int features;<br>=
=C2=A0<br>- =C2=A0 =C2=A0TFR(fd =3D open(PATH_NET_TUN, O_RDWR));<br>+ =C2=
=A0 =C2=A0TEMP_FAILURE_RETRY(fd =3D open(PATH_NET_TUN, O_RDWR));<br>=C2=A0 =
=C2=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_se=
tg_errno(errp, errno, &quot;could not open %s&quot;, PATH_NET_TUN);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>diff --git a/net/tap.c b/net/t=
ap.c<br>index b047eca8b5..9fa0a8fa21 100644<br>--- a/net/tap.c<br>+++ b/net=
/tap.c<br>@@ -102,7 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, =
const struct iovec *iov, int iovcnt<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize=
_t len;<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(len =3D writev(s-&gt;fd, iov, iovcn=
t));<br>+ =C2=A0 =C2=A0TEMP_FAILURE_RETRY(len =3D writev(s-&gt;fd, iov, iov=
cnt));<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno =
=3D=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap_write_poll(s, tru=
e);<br>@@ -575,7 +575,7 @@ static int net_bridge_run_helper(const char *hel=
per, const char *bridge,<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clo=
se(sv[1]);<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D recv_fd(sv[=
0]));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TEMP_FAILURE_RETRY(fd =3D recv_fd(sv[=
0]));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_errno =3D errno;<br>=C2=A0=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(sv[0]);<br>@@ -647,8 +647,10 @@=
 static int net_tap_init(const NetdevTapOptions *tap, int *vnet_hdr,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnet_hdr_required =3D 0;<br>=C2=A0 =C2=A0 =
=C2=A0}<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(fd =3D tap_open(ifname, ifname_sz, =
vnet_hdr, vnet_hdr_required,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mq_required, errp));<br>+ =C2=A0 =C2=A0T=
EMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D tap_open(ifname, =
ifname_sz, vnet_hdr, vnet_hdr_required,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mq_required, errp)<br>+ =C2=
=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return -1;<br>=C2=A0 =C2=A0 =C2=A0}<br>diff --git a/os-pos=
ix.c b/os-posix.c<br>index 321fc4bd13..e9918b9788 100644<br>--- a/os-posix.=
c<br>+++ b/os-posix.c<br>@@ -266,7 +266,7 @@ void os_setup_post(void)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;not able=
 to chdir to /: %s&quot;, strerror(errno));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0exit(1);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D qemu_open_old(&quot;/dev/null&quot;, =
O_RDWR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TEMP_FAILURE_RETRY(fd =3D qemu_op=
en_old(&quot;/dev/null&quot;, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
xit(1);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>diff --git a/qga/commands=
-posix.c b/qga/commands-posix.c<br>index 90f83aa9b6..5dd2c4a3e5 100644<br>-=
-- a/qga/commands-posix.c<br>+++ b/qga/commands-posix.c<br>@@ -68,7 +68,7 @=
@ static void ga_wait_child(pid_t pid, int *status, Error **errp)<br>=C2=A0=
<br>=C2=A0 =C2=A0 =C2=A0*status =3D 0;<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(rpid=
 =3D waitpid(pid, status, 0));<br>+ =C2=A0 =C2=A0TEMP_FAILURE_RETRY(rpid =
=3D waitpid(pid, status, 0));<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (rpid =3D=
=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno=
, &quot;failed to wait for child (pid: %d)&quot;,<br>diff --git a/tests/qte=
st/libqtest.c b/tests/qtest/libqtest.c<br>index 8c159eacf5..031f71cbba 1006=
44<br>--- a/tests/qtest/libqtest.c<br>+++ b/tests/qtest/libqtest.c<br>@@ -1=
40,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)<br>=C2=A0 =C2=A0 =C2=A0/=
* Skip wait if qtest_probe_child already reaped. =C2=A0*/<br>=C2=A0 =C2=A0 =
=C2=A0if (pid !=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill(pid, SIG=
TERM);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(pid =3D waitpid(s-&gt;qemu_pid, =
&amp;s-&gt;wstatus, 0));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TEMP_FAILURE_RETRY=
(pid =3D waitpid(s-&gt;qemu_pid, &amp;s-&gt;wstatus, 0));<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0assert(pid =3D=3D s-&gt;qemu_pid);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<br>=C2=A0 =C2=A0 =C2=A0}<br>diff --=
git a/util/main-loop.c b/util/main-loop.c<br>index 58e14db2d4..3a21f39792 1=
00644<br>--- a/util/main-loop.c<br>+++ b/util/main-loop.c<br>@@ -64,7 +64,7=
 @@ static void sigfd_handler(void *opaque)<br>=C2=A0 =C2=A0 =C2=A0ssize_t =
len;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0while (1) {<br>- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0TFR(len =3D read(fd, &amp;info, sizeof(info)));<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0TEMP_FAILURE_RETRY(len =3D read(fd, &amp;info, sizeof(info)));=
<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp=
; errno =3D=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>diff --git a/util/osdep.c b/util/osdep.c<br>index d35c473ac7..=
e5d2225738 100644<br>--- a/util/osdep.c<br>+++ b/util/osdep.c<br>@@ -244,7 =
+244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, in=
t fl_type)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_type =C2=A0 =3D fl_type,=
<br>=C2=A0 =C2=A0 =C2=A0};<br>=C2=A0 =C2=A0 =C2=A0qemu_probe_lock_ops();<br=
>- =C2=A0 =C2=A0TFR(ret =3D fcntl(fd, fcntl_op_setlk, &amp;fl));<br>+ =C2=
=A0 =C2=A0TEMP_FAILURE_RETRY(ret =3D fcntl(fd, fcntl_op_setlk, &amp;fl));<b=
r>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D -1 ? -errno : 0;<br>=C2=A0}<br>=C2=
=A0<br>-- <br>2.37.1<br><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Aug 5, 2022 at 2:40 PM Peter Maydell =
&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.may=
dell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Fri, 5 Aug 2022 at 12:27, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br>
&gt; On Fri, Aug 5, 2022 at 3:11 PM Christian Schoenebeck<br>
&gt; &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_o=
ss@crudebyte.com</a>&gt; wrote:<br>
&gt; &gt; I was thinking the same as Marc-Andr=C3=A9 before:<br>
&gt; &gt;<br>
&gt; &gt; commit 1dacd88ddcf33eb6ed044c4080e3ef5e3de4b6b6<br>
&gt; &gt; Author: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt; Date:=C2=A0 =C2=A0Wed Mar 23 19:57:27 2022 +0400<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0include: move TFR to osdep.h<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The macro requires EINTR, which has its header=
 included in osdep.h.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(Not sure what TFR stands for, perhaps &quot;T=
est For Retry&quot;. Rename it ?)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a h=
ref=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lure=
au@redhat.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Message-Id: &lt;<a href=3D"mailto:202203231557=
43.1585078-17-marcandre.lureau@redhat.com" target=3D"_blank">20220323155743=
.1585078-17-marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Paolo Bonzini &lt;<a href=3D"ma=
ilto:pbonzini@redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Wouldn&#39;t it make sense to first rename TFR() to something lik=
e<br>
&gt; &gt; RETRY_ON_EINTR() and then doing this consolidation here on top?<b=
r>
&gt;<br>
&gt; Apparently TFR often stands for &quot;Temp Failure Retry&quot; (lookin=
g at<br>
&gt; github code search)<br>
&gt;<br>
&gt; LOOP_WHILE_EINTR ?<br>
<br>
At the risk of getting into bikeshedding, since glibc&#39;s unistd.h<br>
defines a TEMP_FAILURE_RETRY() macro for this purpose, maybe we<br>
should use that, with a thing in osdep.h for &quot;provide this macro<br>
if the system headers don&#39;t [ie musl, BSDs, Windows, etc]&quot; ?<br>
<br>
(There is a subtle difference between our TFR() and the glibc<br>
TEMP_FAILURE_RETRY(): TEMP_FAILURE_RETRY() casts the result<br>
of the expr to &#39;long int&#39; before comparing for equality with -1.)<b=
r>
<br>
More generally, I think we should either use this macro rather<br>
more widely, or get rid of it entirely. The current situation<br>
where we use it in some of the net/tap code and a few chardevs<br>
and basically nowhere else is not very satisfactory.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best Regards,<div><b>Nikita Ivanov</b> | C developer</div=
><div><b>Telephone:</b> +79140870696<br></div><div><div><b>Telephone:</b>=
=C2=A0+79015053149</div></div></div></div>

--0000000000002bf8cf05e5b5a3a3--

