Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE958CD62
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 20:10:19 +0200 (CEST)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL7Ck-00021O-Ty
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 14:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oL76l-00059P-UV
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:04:13 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oL76g-0002g4-1g
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:04:07 -0400
Received: by mail-ej1-x634.google.com with SMTP id kb8so18028768ejc.4
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8orGnapSv8LJbWikdlNR5YyeXutJKZk0621+rXc3XqI=;
 b=gGIvJ/jEb7LkcggdhKDg7OCRwtFiHAuUiDLGY9egnTGi4fOTHR11dhVzYcCUX3smEV
 i+ziSWXKURclTJ4tcGd+txMjEIWvrSLDyV3SKdMl0WwDLdztIjK0XdIlI4/KPXj+JeGV
 aKfNN/tbnb1yp7sr1zgceBA6S3nTruQdUoSlm9aBB8c2RpXI+Jl3B3I7s7vSXbZ608Az
 ypvakuez/ck7VuH9n4XhJ88s8pbc+5sirIJUHp+Q6XHSWG0nZL//i+X/bRMcER96+bpM
 ZvZga0bxlNcXHHG/A1bZeEU3q9poAzC+W5BkMrgBgzeJyIJdx1OxYQJSsRSIxaoznqQu
 SjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8orGnapSv8LJbWikdlNR5YyeXutJKZk0621+rXc3XqI=;
 b=zcThLOWam1+0e/qU1ko6Qf/f0diCJgKWPfJ0uFrg4HOY9w7pmTeaHUQPDb/3pwUFKY
 L26xx3NTFl9peQHky0UAurQ81tD9YHXR7Tgo7mraas+VK4CFBu2sOfJ6K1sg0aIAe0aF
 2nGgBPI8bEzPzqK9yxF4QMDeuDOyqUwacSqkqt26DaTGL/BiO4ZUusUznDc+2Y7NFOTG
 5neWLyKI/yJ8RoSh92+JVmoaKnKDMPsdCbRo0INmjU8foCpjGja02X2sqSestrIPashj
 6zJYBZxNYz9eSGzJp214X59BPMYqgBGxaAhSHXgmANpc5q+laRGGG5ruV2YmFbfJ9lwV
 QDwQ==
X-Gm-Message-State: ACgBeo1U7UOMmIWR0Wu67rofAitmx1L8M+ITGfecqhlTzl0N55mOqFFT
 Qda4n6Fwo5eNXU3homScyUReIawTFiVh1JEdIrUmbHSpnUUXyD2+
X-Google-Smtp-Source: AA6agR6obVGCH0/5hT6xZBjNzSM2mi6a4kxSYcuqTC39oyyXtK0x31JHaRDROZLZblN0hoipecNS5MIL43z6Oym/6Go=
X-Received: by 2002:a17:907:724b:b0:731:48b3:6fed with SMTP id
 ds11-20020a170907724b00b0073148b36fedmr5829081ejc.405.1659981840060; Mon, 08
 Aug 2022 11:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <877d3jupln.fsf@pond.sub.org> <3206015.kY3CcG7ZbH@silver>
 <7218690.D19hzYb2mh@silver> <87mtcen7bz.fsf@pond.sub.org>
 <CAAJ4Ao9rqmMjR2CGHBUKE8VH3pC0iuAJhUXv5Vqo5koGodt=jw@mail.gmail.com>
In-Reply-To: <CAAJ4Ao9rqmMjR2CGHBUKE8VH3pC0iuAJhUXv5Vqo5koGodt=jw@mail.gmail.com>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Mon, 8 Aug 2022 21:03:49 +0300
Message-ID: <CAAJ4Ao_77mWH34V6GvrCP6suW0FPTV539C2amAm4EXbMyaLK6w@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e92c3705e5bea393"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ej1-x634.google.com
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

--000000000000e92c3705e5bea393
Content-Type: text/plain; charset="UTF-8"

And summing up the discussion about TEMP_FAILURE_RETRY() usage examples,
I've come up with a new patch for TFR() to TEMP_FAILURE_RETRY()
refactoring. I've decided to stick to expression realisation.

From 94217dfacf12b3211cfab6e19d750e57d679e851 Mon Sep 17 00:00:00 2001
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Mon, 8 Aug 2022 20:43:45 +0300
Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()

glibc's unistd.h header provides the same macro with the
subtle difference in type casting. Adjust macro name to the
common standard and define conditionally.

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
---
 block/file-posix.c        | 14 +++++++-------
 chardev/char-fd.c         |  2 +-
 chardev/char-pipe.c       | 12 +++++++++---
 chardev/char-pty.c        |  2 +-
 hw/9pfs/9p-local.c        |  6 ++++--
 include/qemu/osdep.h      | 11 +++++++++--
 net/l2tpv3.c              |  8 +++++---
 net/socket.c              |  4 ++--
 net/tap-bsd.c             |  6 +++---
 net/tap-linux.c           |  2 +-
 net/tap-solaris.c         |  8 ++++----
 net/tap.c                 | 10 ++++++----
 os-posix.c                |  2 +-
 qga/commands-posix.c      |  2 +-
 semihosting/syscalls.c    |  2 +-
 tests/qtest/libqtest.c    | 10 +++++-----
 tests/vhost-user-bridge.c |  4 +++-
 util/main-loop.c          |  2 +-
 util/osdep.c              |  2 +-
 util/vfio-helpers.c       |  8 ++++----
 20 files changed, 69 insertions(+), 48 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 0786cb76f9..28ce649ab9 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1238,8 +1238,8 @@ static int hdev_get_max_segments(int fd, struct stat
*st)
         ret = -errno;
         goto out;
     }
-    TFR(
-        ret = read(sysfd, buf, sizeof(buf) - 1)
+    ret = TEMP_FAILURE_RETRY(
+        read(sysfd, buf, sizeof(buf) - 1)
     );
     if (ret < 0) {
         ret = -errno;
@@ -1388,8 +1388,8 @@ static int handle_aiocb_ioctl(void *opaque)
     RawPosixAIOData *aiocb = opaque;
     int ret;

-    TFR(
-        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
+    ret = TEMP_FAILURE_RETRY(
+        ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
     );
     if (ret == -1) {
         return -errno;
@@ -1472,8 +1472,8 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData
*aiocb)
 {
     ssize_t len;

-    TFR(
-        len = (aiocb->aio_type & QEMU_AIO_WRITE) ?
+    len = TEMP_FAILURE_RETRY(
+        (aiocb->aio_type & QEMU_AIO_WRITE) ?
             qemu_pwritev(aiocb->aio_fildes,
                            aiocb->io.iov,
                            aiocb->io.niov,
@@ -1907,7 +1907,7 @@ static int allocate_first_block(int fd, size_t
max_size)
     buf = qemu_memalign(max_align, write_size);
     memset(buf, 0, write_size);

-    TFR(n = pwrite(fd, buf, write_size, 0));
+    n = TEMP_FAILURE_RETRY(pwrite(fd, buf, write_size, 0));

     ret = (n == -1) ? -errno : 0;

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index cf78454841..1250a63236 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags,
Error **errp)
 {
     int fd = -1;

-    TFR(fd = qemu_open_old(src, flags, 0666));
+    fd = TEMP_FAILURE_RETRY(qemu_open_old(src, flags, 0666));
     if (fd == -1) {
         error_setg_file_open(errp, errno, src);
     }
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 66d3b85091..a59a055c87 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,

     filename_in = g_strdup_printf("%s.in", filename);
     filename_out = g_strdup_printf("%s.out", filename);
-    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
-    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
+    fd_in = TEMP_FAILURE_RETRY(
+        qemu_open_old(filename_in, O_RDWR | O_BINARY)
+    );
+    fd_out = TEMP_FAILURE_RETRY(
+        qemu_open_old(filename_out, O_RDWR | O_BINARY)
+    );
     g_free(filename_in);
     g_free(filename_out);
     if (fd_in < 0 || fd_out < 0) {
@@ -142,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
         if (fd_out >= 0) {
             close(fd_out);
         }
-        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
+        fd_in = fd_out = TEMP_FAILURE_RETRY(
+            qemu_open_old(filename, O_RDWR | O_BINARY)
+        );
         if (fd_in < 0) {
             error_setg_file_open(errp, errno, filename);
             return;
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index b2f490bacf..913a98250b 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -93,7 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)
     pfd.fd = fioc->fd;
     pfd.events = G_IO_OUT;
     pfd.revents = 0;
-    TFR(rc = g_poll(&pfd, 1, 0));
+    rc = TEMP_FAILURE_RETRY(g_poll(&pfd, 1, 0));
     assert(rc >= 0);

     if (pfd.revents & G_IO_HUP) {
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index c90ab947ba..6a3b4fac4a 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -470,7 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
V9fsPath *fs_path,
         if (fd == -1) {
             return -1;
         }
-        TFR(tsize = read(fd, (void *)buf, bufsz));
+        tsize = TEMP_FAILURE_RETRY(read(fd, (void *)buf, bufsz));
         close_preserve_errno(fd);
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
@@ -906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const char
*oldpath,
         }
         /* Write the oldpath (target) to the file. */
         oldpath_size = strlen(oldpath);
-        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
+        write_size = TEMP_FAILURE_RETRY(
+            write(fd, (void *)oldpath, oldpath_size)
+        );
         close_preserve_errno(fd);

         if (write_size != oldpath_size) {
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..6cd0de8e38 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -242,8 +242,15 @@ void QEMU_ERROR("code path is reachable")
 #if !defined(ESHUTDOWN)
 #define ESHUTDOWN 4099
 #endif
-
-#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
+#if !defined(TEMP_FAILURE_RETRY)
+#define TEMP_FAILURE_RETRY(expr) \
+    (__extension__                                          \
+        ({ long int __result;                               \
+           do {                                             \
+                __result = (long int) (expression);         \
+           } while (__result == -1L && errno == EINTR);     \
+           __result; }))
+#endif

 /* time_t may be either 32 or 64 bits depending on the host OS, and
  * can be either signed or unsigned, so we can't just hardcode a
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index adfdbdb84c..cbde9332fe 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -240,7 +240,7 @@ static ssize_t
net_l2tpv3_receive_dgram_iov(NetClientState *nc,
     message.msg_control = NULL;
     message.msg_controllen = 0;
     message.msg_flags = 0;
-    TFR(ret = sendmsg(s->fd, &message, 0));
+    ret = TEMP_FAILURE_RETRY(sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -= s->offset;
     } else if (ret == 0) {
@@ -283,7 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
*nc,
     message.msg_control = NULL;
     message.msg_controllen = 0;
     message.msg_flags = 0;
-    TFR(ret = sendmsg(s->fd, &message, 0));
+    ret = TEMP_FAILURE_RETRY(sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -= s->offset;
     } else if (ret == 0) {
@@ -430,7 +430,9 @@ static void net_l2tpv3_send(void *opaque)

     msgvec = s->msgvec + s->queue_head;
     if (target_count > 0) {
-        TFR(count = recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
NULL));
+        count = TEMP_FAILURE_RETRY(
+            recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT, NULL)
+        );
         if (count < 0) {
             /* Recv error - we still need to flush packets here,
              * (re)set queue head to current position
diff --git a/net/socket.c b/net/socket.c
index a3397660c2..cfb893b183 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -117,8 +117,8 @@ static ssize_t net_socket_receive_dgram(NetClientState
*nc, const uint8_t *buf,
     NetSocketState *s = DO_UPCAST(NetSocketState, nc, nc);
     ssize_t ret;

-    TFR(
-        ret = s->dgram_dst.sin_family != AF_UNIX ?
+    ret = TEMP_FAILURE_RETRY(
+        s->dgram_dst.sin_family != AF_UNIX ?
             sendto(s->fd, buf, size, 0,
                      (struct sockaddr *)&s->dgram_dst,
                      sizeof(s->dgram_dst)) :
diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 005ce05c6e..720090244e 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         } else {
             snprintf(dname, sizeof dname, "/dev/tap%d", i);
         }
-        TFR(fd = open(dname, O_RDWR));
+        fd = TEMP_FAILURE_RETRY(open(dname, O_RDWR));
         if (fd >= 0) {
             break;
         }
@@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int
ifname_size, Error **errp)
     int fd, s, ret;
     struct ifreq ifr;

-    TFR(fd = open(PATH_NET_TAP, O_RDWR));
+    fd = TEMP_FAILURE_RETRY(open(PATH_NET_TAP, O_RDWR));
     if (fd < 0) {
         error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP);
         return -1;
@@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int
*vnet_hdr,
     if (ifname[0] != '\0') {
         char dname[100];
         snprintf(dname, sizeof dname, "/dev/%s", ifname);
-        TFR(fd = open(dname, O_RDWR));
+        fd = TEMP_FAILURE_RETRY(open(dname, O_RDWR));
         if (fd < 0 && errno != ENOENT) {
             error_setg_errno(errp, errno, "could not open %s", dname);
             return -1;
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 304ff45071..bf3ce44329 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
     int len = sizeof(struct virtio_net_hdr);
     unsigned int features;

-    TFR(fd = open(PATH_NET_TUN, O_RDWR));
+    fd = TEMP_FAILURE_RETRY(open(PATH_NET_TUN, O_RDWR));
     if (fd < 0) {
         error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN);
         return -1;
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index a44f8805c2..73e0e9f196 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error
**errp)
     if( ip_fd )
        close(ip_fd);

-    TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
+    ip_fd = TEMP_FAILURE_RETRY(open("/dev/udp", O_RDWR, 0));
     if (ip_fd < 0) {
         error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
         return -1;
     }

-    TFR(tap_fd = open("/dev/tap", O_RDWR, 0));
+    tap_fd = TEMP_FAILURE_RETRY(open("/dev/tap", O_RDWR, 0));
     if (tap_fd < 0) {
         error_setg(errp, "Can't open /dev/tap");
         return -1;
@@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
**errp)
     if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
         error_report("Can't assign new interface");

-    TFR(if_fd = open("/dev/tap", O_RDWR, 0));
+    if_fd = TEMP_FAILURE_RETRY(open("/dev/tap", O_RDWR, 0));
     if (if_fd < 0) {
         error_setg(errp, "Can't open /dev/tap (2)");
         return -1;
@@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
**errp)
     if (ioctl (ip_fd, I_PUSH, "arp") < 0)
         error_report("Can't push ARP module (3)");
     /* Open arp_fd */
-    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
+    arp_fd = TEMP_FAILURE_RETRY(open("/dev/tap", O_RDWR, 0));
     if (arp_fd < 0)
         error_report("Can't open %s", "/dev/tap");

diff --git a/net/tap.c b/net/tap.c
index b047eca8b5..dfd220a184 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -102,7 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
struct iovec *iov, int iovcnt
 {
     ssize_t len;

-    TFR(len = writev(s->fd, iov, iovcnt));
+    len = TEMP_FAILURE_RETRY(writev(s->fd, iov, iovcnt));

     if (len == -1 && errno == EAGAIN) {
         tap_write_poll(s, true);
@@ -575,7 +575,7 @@ static int net_bridge_run_helper(const char *helper,
const char *bridge,

         close(sv[1]);

-        TFR(fd = recv_fd(sv[0]));
+        fd = TEMP_FAILURE_RETRY(recv_fd(sv[0]));
         saved_errno = errno;

         close(sv[0]);
@@ -647,8 +647,10 @@ static int net_tap_init(const NetdevTapOptions *tap,
int *vnet_hdr,
         vnet_hdr_required = 0;
     }

-    TFR(fd = tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
-                      mq_required, errp));
+    fd = TEMP_FAILURE_RETRY(
+        tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_required,
+                      mq_required, errp)
+    );
     if (fd < 0) {
         return -1;
     }
diff --git a/os-posix.c b/os-posix.c
index 321fc4bd13..59cac65585 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -266,7 +266,7 @@ void os_setup_post(void)
             error_report("not able to chdir to /: %s", strerror(errno));
             exit(1);
         }
-        TFR(fd = qemu_open_old("/dev/null", O_RDWR));
+        fd = TEMP_FAILURE_RETRY(qemu_open_old("/dev/null", O_RDWR));
         if (fd == -1) {
             exit(1);
         }
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 90f83aa9b6..feb0fab807 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -68,7 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
**errp)

     *status = 0;

-    TFR(rpid = waitpid(pid, status, 0));
+    rpid = TEMP_FAILURE_RETRY(waitpid(pid, status, 0));

     if (rpid == -1) {
         error_setg_errno(errp, errno, "failed to wait for child (pid: %d)",
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 025c08147a..0cbef7d22b 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -317,7 +317,7 @@ static void host_read(CPUState *cs,
gdb_syscall_complete_cb complete,
         complete(cs, -1, EFAULT);
         return;
     }
-    TFR(ret = read(gf->hostfd, ptr, len));
+    ret = TEMP_FAILURE_RETRY(read(gf->hostfd, ptr, len));
     if (ret == -1) {
         complete(cs, -1, errno);
         unlock_user(ptr, buf, 0);
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d4022966b3..4a12824dc4 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -102,8 +102,8 @@ static int socket_accept(int sock)
     }

     addrlen = sizeof(addr);
-    TFR(
-        ret = accept(sock, (struct sockaddr *)&addr, &addrlen)
+    ret = TEMP_FAILURE_RETRY(
+        accept(sock, (struct sockaddr *)&addr, &addrlen)
     );
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
@@ -140,7 +140,7 @@ void qtest_kill_qemu(QTestState *s)
     /* Skip wait if qtest_probe_child already reaped.  */
     if (pid != -1) {
         kill(pid, SIGTERM);
-        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
+        pid = TEMP_FAILURE_RETRY(waitpid(s->qemu_pid, &s->wstatus, 0));
         assert(pid == s->qemu_pid);
         s->qemu_pid = -1;
     }
@@ -578,8 +578,8 @@ int qtest_socket_server(const char *socket_path)
     addr.sun_family = AF_UNIX;
     snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);

-    TFR(
-        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr))
+    ret = TEMP_FAILURE_RETRY(
+        bind(sock, (struct sockaddr *)&addr, sizeof(addr))
     );
     g_assert_cmpint(ret, !=, -1);
     ret = listen(sock, 1);
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 4d8f933ed5..624a211f3d 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -331,7 +331,9 @@ vubr_backend_recv_cb(int sock, void *ctx)
             .msg_iovlen = num,
             .msg_flags = MSG_DONTWAIT,
         };
-        TFR(ret = recvmsg(vubr->backend_udp_sock, &msg, 0));
+        ret = TEMP_FAILURE_RETRY(
+                recvmsg(vubr->backend_udp_sock, &msg, 0)
+        );

         if (i == 0) {
             iov_restore_front(elem->in_sg, sg, hdrlen);
diff --git a/util/main-loop.c b/util/main-loop.c
index 58e14db2d4..5f65f928bd 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -64,7 +64,7 @@ static void sigfd_handler(void *opaque)
     ssize_t len;

     while (1) {
-        TFR(len = read(fd, &info, sizeof(info)));
+        len = TEMP_FAILURE_RETRY(read(fd, &info, sizeof(info)));

         if (len == -1 && errno == EAGAIN) {
             break;
diff --git a/util/osdep.c b/util/osdep.c
index d35c473ac7..2c287e75e7 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -244,7 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
int64_t len, int fl_type)
         .l_type   = fl_type,
     };
     qemu_probe_lock_ops();
-    TFR(ret = fcntl(fd, fcntl_op_setlk, &fl));
+    ret = TEMP_FAILURE_RETRY(fcntl(fd, fcntl_op_setlk, &fl));
     return ret == -1 ? -errno : 0;
 }

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index c878be1c5f..e1422666eb 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -240,8 +240,8 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState *s,
void *buf,
                                     s->config_region_info.offset,
                                     s->config_region_info.size);
     assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
-    TFR(
-        ret = pread(s->device, buf, size, s->config_region_info.offset +
ofs)
+    ret = TEMP_FAILURE_RETRY(
+        pread(s->device, buf, size, s->config_region_info.offset + ofs)
     );
     return ret == size ? 0 : -errno;
 }
@@ -254,8 +254,8 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState *s,
void *buf, int size, int
                                      s->config_region_info.offset,
                                      s->config_region_info.size);
     assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
-    TFR(
-        ret = pwrite(s->device, buf, size, s->config_region_info.offset +
ofs)
+    ret = TEMP_FAILURE_RETRY(
+        pwrite(s->device, buf, size, s->config_region_info.offset + ofs)
     );
     return ret == size ? 0 : -errno;
 }
-- 
2.37.1


On Mon, Aug 8, 2022 at 9:00 PM Nikita Ivanov <nivanov@cloudlinux.com> wrote:

> Hi!
> During our discussion, I found that I've missed a couple of places where
> TFR() macro could be applied. Here is an updated first patch:
>
> From 8a68f50aac4a8549f416b9350cf339cf0501a712 Mon Sep 17 00:00:00 2001
> From: Nikita Ivanov <nivanov@cloudlinux.com>
> Date: Wed, 3 Aug 2022 12:54:00 +0300
> Subject: [PATCH] error handling: Use TFR() macro where applicable
>
> There is a defined TFR() macro in qemu/osdep.h which
> handles the same while loop.
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  block/file-posix.c        | 39 ++++++++++++++++++---------------------
>  chardev/char-pty.c        |  4 +---
>  hw/9pfs/9p-local.c        |  8 ++------
>  net/l2tpv3.c              | 15 +++------------
>  net/socket.c              | 16 +++++++---------
>  net/tap.c                 |  8 ++------
>  qga/commands-posix.c      |  4 +---
>  semihosting/syscalls.c    |  4 +---
>  tests/qtest/libqtest.c    | 14 +++++++-------
>  tests/vhost-user-bridge.c |  4 +---
>  util/main-loop.c          |  4 +---
>  util/osdep.c              |  4 +---
>  util/vfio-helpers.c       | 12 ++++++------
>  13 files changed, 51 insertions(+), 85 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..0786cb76f9 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1238,9 +1238,9 @@ static int hdev_get_max_segments(int fd, struct stat
> *st)
>          ret = -errno;
>          goto out;
>      }
> -    do {
> -        ret = read(sysfd, buf, sizeof(buf) - 1);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = read(sysfd, buf, sizeof(buf) - 1)
> +    );
>      if (ret < 0) {
>          ret = -errno;
>          goto out;
> @@ -1388,9 +1388,9 @@ static int handle_aiocb_ioctl(void *opaque)
>      RawPosixAIOData *aiocb = opaque;
>      int ret;
>
> -    do {
> -        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd,
> aiocb->ioctl.buf);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
> +    );
>      if (ret == -1) {
>          return -errno;
>      }
> @@ -1472,18 +1472,17 @@ static ssize_t
> handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>  {
>      ssize_t len;
>
> -    do {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> -            len = qemu_pwritev(aiocb->aio_fildes,
> -                               aiocb->io.iov,
> -                               aiocb->io.niov,
> -                               aiocb->aio_offset);
> -         else
> -            len = qemu_preadv(aiocb->aio_fildes,
> -                              aiocb->io.iov,
> -                              aiocb->io.niov,
> -                              aiocb->aio_offset);
> -    } while (len == -1 && errno == EINTR);
> +    TFR(
> +        len = (aiocb->aio_type & QEMU_AIO_WRITE) ?
> +            qemu_pwritev(aiocb->aio_fildes,
> +                           aiocb->io.iov,
> +                           aiocb->io.niov,
> +                           aiocb->aio_offset) :
> +            qemu_preadv(aiocb->aio_fildes,
> +                          aiocb->io.iov,
> +                          aiocb->io.niov,
> +                          aiocb->aio_offset)
> +    );
>
>      if (len == -1) {
>          return -errno;
> @@ -1908,9 +1907,7 @@ static int allocate_first_block(int fd, size_t
> max_size)
>      buf = qemu_memalign(max_align, write_size);
>      memset(buf, 0, write_size);
>
> -    do {
> -        n = pwrite(fd, buf, write_size, 0);
> -    } while (n == -1 && errno == EINTR);
> +    TFR(n = pwrite(fd, buf, write_size, 0));
>
>      ret = (n == -1) ? -errno : 0;
>
> diff --git a/chardev/char-pty.c b/chardev/char-pty.c
> index 53f25c6bbd..b2f490bacf 100644
> --- a/chardev/char-pty.c
> +++ b/chardev/char-pty.c
> @@ -93,9 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)
>      pfd.fd = fioc->fd;
>      pfd.events = G_IO_OUT;
>      pfd.revents = 0;
> -    do {
> -        rc = g_poll(&pfd, 1, 0);
> -    } while (rc == -1 && errno == EINTR);
> +    TFR(rc = g_poll(&pfd, 1, 0));
>      assert(rc >= 0);
>
>      if (pfd.revents & G_IO_HUP) {
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index d42ce6d8b8..c90ab947ba 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> V9fsPath *fs_path,
>          if (fd == -1) {
>              return -1;
>          }
> -        do {
> -            tsize = read(fd, (void *)buf, bufsz);
> -        } while (tsize == -1 && errno == EINTR);
> +        TFR(tsize = read(fd, (void *)buf, bufsz));
>          close_preserve_errno(fd);
>      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> @@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char
> *oldpath,
>          }
>          /* Write the oldpath (target) to the file. */
>          oldpath_size = strlen(oldpath);
> -        do {
> -            write_size = write(fd, (void *)oldpath, oldpath_size);
> -        } while (write_size == -1 && errno == EINTR);
> +        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
>          close_preserve_errno(fd);
>
>          if (write_size != oldpath_size) {
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index af373e5c30..adfdbdb84c 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -240,9 +240,7 @@ static ssize_t
> net_l2tpv3_receive_dgram_iov(NetClientState *nc,
>      message.msg_control = NULL;
>      message.msg_controllen = 0;
>      message.msg_flags = 0;
> -    do {
> -        ret = sendmsg(s->fd, &message, 0);
> -    } while ((ret == -1) && (errno == EINTR));
> +    TFR(ret = sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -= s->offset;
>      } else if (ret == 0) {
> @@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
> *nc,
>      message.msg_control = NULL;
>      message.msg_controllen = 0;
>      message.msg_flags = 0;
> -    do {
> -        ret = sendmsg(s->fd, &message, 0);
> -    } while ((ret == -1) && (errno == EINTR));
> +    TFR(ret = sendmsg(s->fd, &message, 0));
>      if (ret > 0) {
>          ret -= s->offset;
>      } else if (ret == 0) {
> @@ -434,12 +430,7 @@ static void net_l2tpv3_send(void *opaque)
>
>      msgvec = s->msgvec + s->queue_head;
>      if (target_count > 0) {
> -        do {
> -            count = recvmmsg(
> -                s->fd,
> -                msgvec,
> -                target_count, MSG_DONTWAIT, NULL);
> -        } while ((count == -1) && (errno == EINTR));
> +        TFR(count = recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
> NULL));
>          if (count < 0) {
>              /* Recv error - we still need to flush packets here,
>               * (re)set queue head to current position
> diff --git a/net/socket.c b/net/socket.c
> index bfd8596250..a3397660c2 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -117,15 +117,13 @@ static ssize_t
> net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,
>      NetSocketState *s = DO_UPCAST(NetSocketState, nc, nc);
>      ssize_t ret;
>
> -    do {
> -        if (s->dgram_dst.sin_family != AF_UNIX) {
> -            ret = sendto(s->fd, buf, size, 0,
> -                         (struct sockaddr *)&s->dgram_dst,
> -                         sizeof(s->dgram_dst));
> -        } else {
> -            ret = send(s->fd, buf, size, 0);
> -        }
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = s->dgram_dst.sin_family != AF_UNIX ?
> +            sendto(s->fd, buf, size, 0,
> +                     (struct sockaddr *)&s->dgram_dst,
> +                     sizeof(s->dgram_dst)) :
> +            send(s->fd, buf, size, 0)
> +    );
>
>      if (ret == -1 && errno == EAGAIN) {
>          net_socket_write_poll(s, true);
> diff --git a/net/tap.c b/net/tap.c
> index b3ddfd4a74..b047eca8b5 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
> struct iovec *iov, int iovcnt
>  {
>      ssize_t len;
>
> -    do {
> -        len = writev(s->fd, iov, iovcnt);
> -    } while (len == -1 && errno == EINTR);
> +    TFR(len = writev(s->fd, iov, iovcnt));
>
>      if (len == -1 && errno == EAGAIN) {
>          tap_write_poll(s, true);
> @@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper,
> const char *bridge,
>
>          close(sv[1]);
>
> -        do {
> -            fd = recv_fd(sv[0]);
> -        } while (fd == -1 && errno == EINTR);
> +        TFR(fd = recv_fd(sv[0]));
>          saved_errno = errno;
>
>          close(sv[0]);
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 954efed01b..90f83aa9b6 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
> **errp)
>
>      *status = 0;
>
> -    do {
> -        rpid = waitpid(pid, status, 0);
> -    } while (rpid == -1 && errno == EINTR);
> +    TFR(rpid = waitpid(pid, status, 0));
>
>      if (rpid == -1) {
>          error_setg_errno(errp, errno, "failed to wait for child (pid:
> %d)",
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 508a0ad88c..025c08147a 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -317,9 +317,7 @@ static void host_read(CPUState *cs,
> gdb_syscall_complete_cb complete,
>          complete(cs, -1, EFAULT);
>          return;
>      }
> -    do {
> -        ret = read(gf->hostfd, ptr, len);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(ret = read(gf->hostfd, ptr, len));
>      if (ret == -1) {
>          complete(cs, -1, errno);
>          unlock_user(ptr, buf, 0);
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 8c159eacf5..d4022966b3 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -101,10 +101,10 @@ static int socket_accept(int sock)
>          return -1;
>      }
>
> -    do {
> -        addrlen = sizeof(addr);
> -        ret = accept(sock, (struct sockaddr *)&addr, &addrlen);
> -    } while (ret == -1 && errno == EINTR);
> +    addrlen = sizeof(addr);
> +    TFR(
> +        ret = accept(sock, (struct sockaddr *)&addr, &addrlen)
> +    );
>      if (ret == -1) {
>          fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
>      }
> @@ -578,9 +578,9 @@ int qtest_socket_server(const char *socket_path)
>      addr.sun_family = AF_UNIX;
>      snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
>
> -    do {
> -        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr))
> +    );
>      g_assert_cmpint(ret, !=, -1);
>      ret = listen(sock, 1);
>      g_assert_cmpint(ret, !=, -1);
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 9b1dab2f28..4d8f933ed5 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -331,9 +331,7 @@ vubr_backend_recv_cb(int sock, void *ctx)
>              .msg_iovlen = num,
>              .msg_flags = MSG_DONTWAIT,
>          };
> -        do {
> -            ret = recvmsg(vubr->backend_udp_sock, &msg, 0);
> -        } while (ret == -1 && (errno == EINTR));
> +        TFR(ret = recvmsg(vubr->backend_udp_sock, &msg, 0));
>
>          if (i == 0) {
>              iov_restore_front(elem->in_sg, sg, hdrlen);
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..58e14db2d4 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)
>      ssize_t len;
>
>      while (1) {
> -        do {
> -            len = read(fd, &info, sizeof(info));
> -        } while (len == -1 && errno == EINTR);
> +        TFR(len = read(fd, &info, sizeof(info)));
>
>          if (len == -1 && errno == EAGAIN) {
>              break;
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..d35c473ac7 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
> int64_t len, int fl_type)
>          .l_type   = fl_type,
>      };
>      qemu_probe_lock_ops();
> -    do {
> -        ret = fcntl(fd, fcntl_op_setlk, &fl);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(ret = fcntl(fd, fcntl_op_setlk, &fl));
>      return ret == -1 ? -errno : 0;
>  }
>
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 5ba01177bf..c878be1c5f 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -240,9 +240,9 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState *s,
> void *buf,
>                                      s->config_region_info.offset,
>                                      s->config_region_info.size);
>      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> -    do {
> -        ret = pread(s->device, buf, size, s->config_region_info.offset +
> ofs);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = pread(s->device, buf, size, s->config_region_info.offset +
> ofs)
> +    );
>      return ret == size ? 0 : -errno;
>  }
>
> @@ -254,9 +254,9 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState
> *s, void *buf, int size, int
>                                       s->config_region_info.offset,
>                                       s->config_region_info.size);
>      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> -    do {
> -        ret = pwrite(s->device, buf, size, s->config_region_info.offset +
> ofs);
> -    } while (ret == -1 && errno == EINTR);
> +    TFR(
> +        ret = pwrite(s->device, buf, size, s->config_region_info.offset +
> ofs)
> +    );
>      return ret == size ? 0 : -errno;
>  }
>
> --
> 2.37.1
>
>
> On Mon, Aug 8, 2022 at 5:22 PM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
>>
>> > On Montag, 8. August 2022 14:52:28 CEST Christian Schoenebeck wrote:
>> >> On Montag, 8. August 2022 10:05:56 CEST Markus Armbruster wrote:
>> >> > Nikita Ivanov <nivanov@cloudlinux.com> writes:
>> >> > > Summing up the discussion above, I suggest the following patch for
>> TFR()
>> >> > > macro refactoring. (The patch is sequential to the first one I
>> >> > > introduced
>> >> > > in the start of the discussion).
>> >> > >
>> >> > >>From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00
>> 2001
>> >> > >>
>> >> > > From: Nikita Ivanov <nivanov@cloudlinux.com>
>> >> > > Date: Mon, 8 Aug 2022 09:30:34 +0300
>> >> > > Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()
>> >> > >
>> >> > > glibc's unistd.h header provides the same macro with the
>> >> > > subtle difference in type casting. Adjust macro name to the
>> >> > > common standard and define conditionally.
>> >> > >
>> >> > > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
>>
>> [...]
>>
>> >> > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> >> > > index b1c161c035..55f2927d8b 100644
>> >> > > --- a/include/qemu/osdep.h
>> >> > > +++ b/include/qemu/osdep.h
>> >> > > @@ -242,8 +242,10 @@ void QEMU_ERROR("code path is reachable")
>> >> > >
>> >> > >  #if !defined(ESHUTDOWN)
>> >> > >  #define ESHUTDOWN 4099
>> >> > >  #endif
>> >> > >
>> >> > > -
>> >> > > -#define TFR(expr) do { if ((expr) != -1) break; } while (errno ==
>> >> > > EINTR)
>> >> > > +#if !defined(TEMP_FAILURE_RETRY)
>> >> > > +#define TEMP_FAILURE_RETRY(expr) \
>> >> > > +    do { if ((expr) != -1) break; } while (errno == EINTR)
>>
>> To avoid / reduce confusion: this macro expands into a statement, and ...
>>
>> >> > > +#endif
>> >> >
>> >> > GLibc's version is
>> >> >
>> >> >    # define TEMP_FAILURE_RETRY(expression) \
>> >> >      (__extension__
>>             \
>> >> >        ({ long int __result;
>>              \
>> >> >           do __result = (long int) (expression);
>>              \
>> >> >           while (__result == -1L && errno == EINTR);
>>              \
>> >> >           __result; }))
>>
>> ... this one expands into an expression.  It uses GCC's "a compound
>> statement enclosed in parentheses may appear as an expression" extension.
>>
>> >> >
>> >> > The difference isn't just "type casting", it's also statement
>> >> > vs. expression.
>> >> >
>> >> > Is it a good idea to have the macro expand into a statement on some
>> >> > hosts, and into an expression on others?  Sure, CI should catch any
>> uses
>> >> > as expression, but delaying compile errors to CI wastes developer
>> time.
>> >>
>> >> For consistency and simplicity, I would define exactly one version (no
>> >> ifdefs) of the macro with a different macro name than glibc's
>> >> TEMP_FAILURE_RETRY(), and use that QEMU specific macro name in QEMU
>> code
>> >> everywhere.
>>
>> TFR()?  Can't resist closing the circle...
>>
>> >> As for statement vs. expression: The only advantage of the statement
>> version
>> >> is if you'd need __result as an rvalue, which is not needed ATM,
>> right? So
>> >> I would go for the expression version (with cast) for now.
>>
>> The expression-like macro is nicer where the return value matters.
>> Example (stolen from "The GNU C Library Reference Manual"):
>>
>>     nbytes = TEMP_FAILURE_RETRY (write (desc, buffer, count));
>>
>> With the statement-like macro, you have to write
>>
>>     TEMP_FAILURE_RETRY (nbytes = write (desc, buffer, count));
>>
>> >> The glibc history does not reveal why they chose the statement version.
>>
>> The expression version, actually.
>>
>> >> Best regards,
>> >> Christian Schoenebeck
>> >
>> > Sorry: s/rvalue/lvalue/ i.e. if you need the memory address of result
>> or if
>> > you need to take the result value of the last iteration in 'expression'
>> into
>> > account.
>>
>>
>
> --
> Best Regards,
> *Nikita Ivanov* | C developer
> *Telephone:* +79140870696
> *Telephone:* +79015053149
>


-- 
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--000000000000e92c3705e5bea393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And summing up the discussion about TEMP_FAILURE_RETRY() u=
sage examples, I&#39;ve come up with a new patch for TFR() to TEMP_FAILURE_=
RETRY() refactoring. I&#39;ve decided to stick to expression realisation.<b=
r><br>From 94217dfacf12b3211cfab6e19d750e57d679e851 Mon Sep 17 00:00:00 200=
1<br>From: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com">niva=
nov@cloudlinux.com</a>&gt;<br>Date: Mon, 8 Aug 2022 20:43:45 +0300<br>Subje=
ct: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()<br><br>glibc&=
#39;s unistd.h header provides the same macro with the<br>subtle difference=
 in type casting. Adjust macro name to the<br>common standard and define co=
nditionally.<br><br>Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:niva=
nov@cloudlinux.com">nivanov@cloudlinux.com</a>&gt;<br>---<br>=C2=A0block/fi=
le-posix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++-------<br>=C2=A0chardev/=
char-fd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>=C2=A0chardev/char-pi=
pe.c =C2=A0 =C2=A0 =C2=A0 | 12 +++++++++---<br>=C2=A0chardev/char-pty.c =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>=C2=A0hw/9pfs/9p-local.c =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A06 ++++--<br>=C2=A0include/qemu/osdep.h =C2=A0 =C2=
=A0 =C2=A0| 11 +++++++++--<br>=C2=A0net/l2tpv3.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A08 +++++---<br>=C2=A0net/socket.c =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 ++--<br>=C2=A0net/tap-bsd.c=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A06 +++---<br>=C2=A0net/ta=
p-linux.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>=C2=A0net/tap-=
solaris.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A08 ++++----<br>=C2=A0net/tap.c=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++----<br=
>=C2=A0os-posix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A02 +-<br>=C2=A0qga/commands-posix.c =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<b=
r>=C2=A0semihosting/syscalls.c =C2=A0 =C2=A0| =C2=A02 +-<br>=C2=A0tests/qte=
st/libqtest.c =C2=A0 =C2=A0| 10 +++++-----<br>=C2=A0tests/vhost-user-bridge=
.c | =C2=A04 +++-<br>=C2=A0util/main-loop.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A02 +-<br>=C2=A0util/osdep.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A02 +-<br>=C2=A0util/vfio-helpers.c =C2=A0 =C2=A0 =C2=A0=
 | =C2=A08 ++++----<br>=C2=A020 files changed, 69 insertions(+), 48 deletio=
ns(-)<br><br>diff --git a/block/file-posix.c b/block/file-posix.c<br>index =
0786cb76f9..28ce649ab9 100644<br>--- a/block/file-posix.c<br>+++ b/block/fi=
le-posix.c<br>@@ -1238,8 +1238,8 @@ static int hdev_get_max_segments(int fd=
, struct stat *st)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -errno;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>=C2=A0 =C2=A0 =C2=A0}<br>- =
=C2=A0 =C2=A0TFR(<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D read(sysfd, buf, =
sizeof(buf) - 1)<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0read(sysfd, buf, sizeof(buf) - 1)<br>=C2=A0 =C2=A0 =C2=
=A0);<br>=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -errno;<br>@@ -1388,8 +1388,8 @@ static int handle_aiocb_=
ioctl(void *opaque)<br>=C2=A0 =C2=A0 =C2=A0RawPosixAIOData *aiocb =3D opaqu=
e;<br>=C2=A0 =C2=A0 =C2=A0int ret;<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(aiocb-&gt;aio_fildes, aiocb-&gt;io=
ctl.cmd, aiocb-&gt;ioctl.buf)<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(aiocb-&gt;aio_fildes, aiocb-&gt;ioct=
l.cmd, aiocb-&gt;ioctl.buf)<br>=C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=
=A0if (ret =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;=
<br>@@ -1472,8 +1472,8 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIO=
Data *aiocb)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=C2=A0<br>- =
=C2=A0 =C2=A0TFR(<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D (aiocb-&gt;aio_ty=
pe &amp; QEMU_AIO_WRITE) ?<br>+ =C2=A0 =C2=A0len =3D TEMP_FAILURE_RETRY(<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0(aiocb-&gt;aio_type &amp; QEMU_AIO_WRITE) ?<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_pwritev(aiocb-&gt;ai=
o_fildes,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.iov,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 aiocb-&gt;io.niov,<br>@@ -1907,7 +1907,7 @@ static int allocate_firs=
t_block(int fd, size_t max_size)<br>=C2=A0 =C2=A0 =C2=A0buf =3D qemu_memali=
gn(max_align, write_size);<br>=C2=A0 =C2=A0 =C2=A0memset(buf, 0, write_size=
);<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(n =3D pwrite(fd, buf, write_size, 0));<b=
r>+ =C2=A0 =C2=A0n =3D TEMP_FAILURE_RETRY(pwrite(fd, buf, write_size, 0));<=
br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0ret =3D (n =3D=3D -1) ? -errno : 0;<br>=C2=
=A0<br>diff --git a/chardev/char-fd.c b/chardev/char-fd.c<br>index cf784548=
41..1250a63236 100644<br>--- a/chardev/char-fd.c<br>+++ b/chardev/char-fd.c=
<br>@@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int fla=
gs, Error **errp)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0int fd =3D -1;<br>=C2=
=A0<br>- =C2=A0 =C2=A0TFR(fd =3D qemu_open_old(src, flags, 0666));<br>+ =C2=
=A0 =C2=A0fd =3D TEMP_FAILURE_RETRY(qemu_open_old(src, flags, 0666));<br>=
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0error_setg_file_open(errp, errno, src);<br>=C2=A0 =C2=A0 =C2=A0}<br>diff=
 --git a/chardev/char-pipe.c b/chardev/char-pipe.c<br>index 66d3b85091..a59=
a055c87 100644<br>--- a/chardev/char-pipe.c<br>+++ b/chardev/char-pipe.c<br=
>@@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0filename_in =3D g_strdup_printf(&quot;%<a href=
=3D"http://s.in">s.in</a>&quot;, filename);<br>=C2=A0 =C2=A0 =C2=A0filename=
_out =3D g_strdup_printf(&quot;%s.out&quot;, filename);<br>- =C2=A0 =C2=A0T=
FR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BINARY));<br>- =C2=A0 =
=C2=A0TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR | O_BINARY));<br>+ =
=C2=A0 =C2=A0fd_in =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
qemu_open_old(filename_in, O_RDWR | O_BINARY)<br>+ =C2=A0 =C2=A0);<br>+ =C2=
=A0 =C2=A0fd_out =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0qe=
mu_open_old(filename_out, O_RDWR | O_BINARY)<br>+ =C2=A0 =C2=A0);<br>=C2=A0=
 =C2=A0 =C2=A0g_free(filename_in);<br>=C2=A0 =C2=A0 =C2=A0g_free(filename_o=
ut);<br>=C2=A0 =C2=A0 =C2=A0if (fd_in &lt; 0 || fd_out &lt; 0) {<br>@@ -142=
,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (fd_out &gt;=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0close(fd_out);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<b=
r>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd_in =3D fd_out =3D qemu_open_old(filen=
ame, O_RDWR | O_BINARY));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd_in =3D fd_out =
=3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_=
open_old(filename, O_RDWR | O_BINARY)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_in &lt; 0) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_file_open(errp, errno, filename);=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>diff --git a=
/chardev/char-pty.c b/chardev/char-pty.c<br>index b2f490bacf..913a98250b 10=
0644<br>--- a/chardev/char-pty.c<br>+++ b/chardev/char-pty.c<br>@@ -93,7 +9=
3,7 @@ static void pty_chr_update_read_handler(Chardev *chr)<br>=C2=A0 =C2=
=A0 =C2=A0pfd.fd =3D fioc-&gt;fd;<br>=C2=A0 =C2=A0 =C2=A0pfd.events =3D G_I=
O_OUT;<br>=C2=A0 =C2=A0 =C2=A0pfd.revents =3D 0;<br>- =C2=A0 =C2=A0TFR(rc =
=3D g_poll(&amp;pfd, 1, 0));<br>+ =C2=A0 =C2=A0rc =3D TEMP_FAILURE_RETRY(g_=
poll(&amp;pfd, 1, 0));<br>=C2=A0 =C2=A0 =C2=A0assert(rc &gt;=3D 0);<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0if (pfd.revents &amp; G_IO_HUP) {<br>diff --git =
a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>index c90ab947ba..6a3b4fac4a 1=
00644<br>--- a/hw/9pfs/9p-local.c<br>+++ b/hw/9pfs/9p-local.c<br>@@ -470,7 =
+470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_pat=
h,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(tsize =3D read(fd, (void=
 *)buf, bufsz));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tsize =3D TEMP_FAILURE_RET=
RY(read(fd, (void *)buf, bufsz));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clos=
e_preserve_errno(fd);<br>=C2=A0 =C2=A0 =C2=A0} else if ((fs_ctx-&gt;export_=
flags &amp; V9FS_SM_PASSTHROUGH) ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE)) {<br>@@ =
-906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const char *ol=
dpath,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Write the oldpath (target) to the file. */<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0oldpath_size =3D strlen(oldpath);<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0TFR(write_size =3D write(fd, (void *)oldpath, oldpath_size));<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0write_size =3D TEMP_FAILURE_RETRY(<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write(fd, (void *)oldpath, oldpath_si=
ze)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0close_preserve_errno(fd);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (write_size !=3D oldpath_size) {<br>diff --git a/include/qemu/osdep.h=
 b/include/qemu/osdep.h<br>index b1c161c035..6cd0de8e38 100644<br>--- a/inc=
lude/qemu/osdep.h<br>+++ b/include/qemu/osdep.h<br>@@ -242,8 +242,15 @@ voi=
d QEMU_ERROR(&quot;code path is reachable&quot;)<br>=C2=A0#if !defined(ESHU=
TDOWN)<br>=C2=A0#define ESHUTDOWN 4099<br>=C2=A0#endif<br>-<br>-#define TFR=
(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D EINTR)<br>+#if=
 !defined(TEMP_FAILURE_RETRY)<br>+#define TEMP_FAILURE_RETRY(expr) \<br>+ =
=C2=A0 =C2=A0(__extension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0({ long int __=
result; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__result =3D (long int) (expression); =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (__result =3D=3D -1L &amp;&a=
mp; errno =3D=3D EINTR); =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __result; }))<br>+#endif<br>=C2=A0<br>=C2=A0/* time_t may be either =
32 or 64 bits depending on the host OS, and<br>=C2=A0 * can be either signe=
d or unsigned, so we can&#39;t just hardcode a<br>diff --git a/net/l2tpv3.c=
 b/net/l2tpv3.c<br>index adfdbdb84c..cbde9332fe 100644<br>--- a/net/l2tpv3.=
c<br>+++ b/net/l2tpv3.c<br>@@ -240,7 +240,7 @@ static ssize_t net_l2tpv3_re=
ceive_dgram_iov(NetClientState *nc,<br>=C2=A0 =C2=A0 =C2=A0message.msg_cont=
rol =3D NULL;<br>=C2=A0 =C2=A0 =C2=A0message.msg_controllen =3D 0;<br>=C2=
=A0 =C2=A0 =C2=A0message.msg_flags =3D 0;<br>- =C2=A0 =C2=A0TFR(ret =3D sen=
dmsg(s-&gt;fd, &amp;message, 0));<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RE=
TRY(sendmsg(s-&gt;fd, &amp;message, 0));<br>=C2=A0 =C2=A0 =C2=A0if (ret &gt=
; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret -=3D s-&gt;offset;<br>=C2=
=A0 =C2=A0 =C2=A0} else if (ret =3D=3D 0) {<br>@@ -283,7 +283,7 @@ static s=
size_t net_l2tpv3_receive_dgram(NetClientState *nc,<br>=C2=A0 =C2=A0 =C2=A0=
message.msg_control =3D NULL;<br>=C2=A0 =C2=A0 =C2=A0message.msg_controllen=
 =3D 0;<br>=C2=A0 =C2=A0 =C2=A0message.msg_flags =3D 0;<br>- =C2=A0 =C2=A0T=
FR(ret =3D sendmsg(s-&gt;fd, &amp;message, 0));<br>+ =C2=A0 =C2=A0ret =3D T=
EMP_FAILURE_RETRY(sendmsg(s-&gt;fd, &amp;message, 0));<br>=C2=A0 =C2=A0 =C2=
=A0if (ret &gt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret -=3D s-&gt;of=
fset;<br>=C2=A0 =C2=A0 =C2=A0} else if (ret =3D=3D 0) {<br>@@ -430,7 +430,9=
 @@ static void net_l2tpv3_send(void *opaque)<br>=C2=A0<br>=C2=A0 =C2=A0 =
=C2=A0msgvec =3D s-&gt;msgvec + s-&gt;queue_head;<br>=C2=A0 =C2=A0 =C2=A0if=
 (target_count &gt; 0) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(count =3D recv=
mmsg(s-&gt;fd, msgvec, target_count, MSG_DONTWAIT, NULL));<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0count =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0recvmmsg(s-&gt;fd, msgvec, target_count, MSG_DONTWAIT, =
NULL)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (count &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* Recv error - we still need to flush packets here,<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (re)set queue head to current position<br>di=
ff --git a/net/socket.c b/net/socket.c<br>index a3397660c2..cfb893b183 1006=
44<br>--- a/net/socket.c<br>+++ b/net/socket.c<br>@@ -117,8 +117,8 @@ stati=
c ssize_t net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,<=
br>=C2=A0 =C2=A0 =C2=A0NetSocketState *s =3D DO_UPCAST(NetSocketState, nc, =
nc);<br>=C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(<b=
r>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;dgram_dst.sin_family !=3D AF_U=
NIX ?<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s-&gt;dgram_dst.sin_family !=3D AF_UNIX ?<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0sendto(s-&gt;fd, buf, size, 0,<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct soc=
kaddr *)&amp;s-&gt;dgram_dst,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(s-&gt;dgram_dst)) :<br>diff --git=
 a/net/tap-bsd.c b/net/tap-bsd.c<br>index 005ce05c6e..720090244e 100644<br>=
--- a/net/tap-bsd.c<br>+++ b/net/tap-bsd.c<br>@@ -56,7 +56,7 @@ int tap_ope=
n(char *ifname, int ifname_size, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snpri=
ntf(dname, sizeof dname, &quot;/dev/tap%d&quot;, i);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D open(dname, O=
_RDWR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D TEMP_FAILURE_RETRY(open(dna=
me, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>@@ -111,7 +111,7 @@ static int tap_open_clone(char *i=
fname, int ifname_size, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0int fd, s, ret=
;<br>=C2=A0 =C2=A0 =C2=A0struct ifreq ifr;<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(=
fd =3D open(PATH_NET_TAP, O_RDWR));<br>+ =C2=A0 =C2=A0fd =3D TEMP_FAILURE_R=
ETRY(open(PATH_NET_TAP, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;cou=
ld not open %s&quot;, PATH_NET_TAP);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn -1;<br>@@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size=
, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0if (ifname[0] !=3D &#39;\0&#39;) {<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char dname[100];<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0snprintf(dname, sizeof dname, &quot;/dev/%s&quot;, ifname)=
;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D open(dname, O_RDWR));<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fd =3D TEMP_FAILURE_RETRY(open(dname, O_RDWR));<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0 &amp;&amp; errno !=3D ENOEN=
T) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(er=
rp, errno, &quot;could not open %s&quot;, dname);<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>diff --git a/net/tap-linux.c b/net=
/tap-linux.c<br>index 304ff45071..bf3ce44329 100644<br>--- a/net/tap-linux.=
c<br>+++ b/net/tap-linux.c<br>@@ -45,7 +45,7 @@ int tap_open(char *ifname, =
int ifname_size, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0int len =3D sizeof(s=
truct virtio_net_hdr);<br>=C2=A0 =C2=A0 =C2=A0unsigned int features;<br>=C2=
=A0<br>- =C2=A0 =C2=A0TFR(fd =3D open(PATH_NET_TUN, O_RDWR));<br>+ =C2=A0 =
=C2=A0fd =3D TEMP_FAILURE_RETRY(open(PATH_NET_TUN, O_RDWR));<br>=C2=A0 =C2=
=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_=
errno(errp, errno, &quot;could not open %s&quot;, PATH_NET_TUN);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>diff --git a/net/tap-solaris.c b/n=
et/tap-solaris.c<br>index a44f8805c2..73e0e9f196 100644<br>--- a/net/tap-so=
laris.c<br>+++ b/net/tap-solaris.c<br>@@ -84,13 +84,13 @@ static int tap_al=
loc(char *dev, size_t dev_size, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0if( ip=
_fd )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(ip_fd);<br>=C2=A0<br>- =C2=A0 =
=C2=A0TFR(ip_fd =3D open(&quot;/dev/udp&quot;, O_RDWR, 0));<br>+ =C2=A0 =C2=
=A0ip_fd =3D TEMP_FAILURE_RETRY(open(&quot;/dev/udp&quot;, O_RDWR, 0));<br>=
=C2=A0 =C2=A0 =C2=A0if (ip_fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0error_setg(errp, &quot;Can&#39;t open /dev/ip (actually /dev/udp)&quot;)=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=C2=A0 =C2=A0 =C2=A0}<=
br>=C2=A0<br>- =C2=A0 =C2=A0TFR(tap_fd =3D open(&quot;/dev/tap&quot;, O_RDW=
R, 0));<br>+ =C2=A0 =C2=A0tap_fd =3D TEMP_FAILURE_RETRY(open(&quot;/dev/tap=
&quot;, O_RDWR, 0));<br>=C2=A0 =C2=A0 =C2=A0if (tap_fd &lt; 0) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /dev/tap&q=
uot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>@@ -104,7 +104,7 =
@@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)<br>=C2=A0=
 =C2=A0 =C2=A0if ((ppa =3D ioctl (tap_fd, I_STR, &amp;strioc_ppa)) &lt; 0)<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t assign ne=
w interface&quot;);<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(if_fd =3D open(&quot;/d=
ev/tap&quot;, O_RDWR, 0));<br>+ =C2=A0 =C2=A0if_fd =3D TEMP_FAILURE_RETRY(o=
pen(&quot;/dev/tap&quot;, O_RDWR, 0));<br>=C2=A0 =C2=A0 =C2=A0if (if_fd &lt=
; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;=
t open /dev/tap (2)&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;=
<br>@@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Er=
ror **errp)<br>=C2=A0 =C2=A0 =C2=A0if (ioctl (ip_fd, I_PUSH, &quot;arp&quot=
;) &lt; 0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;=
t push ARP module (3)&quot;);<br>=C2=A0 =C2=A0 =C2=A0/* Open arp_fd */<br>-=
 =C2=A0 =C2=A0TFR(arp_fd =3D open (&quot;/dev/tap&quot;, O_RDWR, 0));<br>+ =
=C2=A0 =C2=A0arp_fd =3D TEMP_FAILURE_RETRY(open(&quot;/dev/tap&quot;, O_RDW=
R, 0));<br>=C2=A0 =C2=A0 =C2=A0if (arp_fd &lt; 0)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0error_report(&quot;Can&#39;t open %s&quot;, &quot;/dev/tap&quo=
t;);<br>=C2=A0<br>diff --git a/net/tap.c b/net/tap.c<br>index b047eca8b5..d=
fd220a184 100644<br>--- a/net/tap.c<br>+++ b/net/tap.c<br>@@ -102,7 +102,7 =
@@ static ssize_t tap_write_packet(TAPState *s, const struct iovec *iov, in=
t iovcnt<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=C2=A0<br>- =C2=
=A0 =C2=A0TFR(len =3D writev(s-&gt;fd, iov, iovcnt));<br>+ =C2=A0 =C2=A0len=
 =3D TEMP_FAILURE_RETRY(writev(s-&gt;fd, iov, iovcnt));<br>=C2=A0<br>=C2=A0=
 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno =3D=3D EAGAIN) {<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap_write_poll(s, true);<br>@@ -575,7 +575,7 @@=
 static int net_bridge_run_helper(const char *helper, const char *bridge,<b=
r>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(sv[1]);<br>=C2=A0<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D recv_fd(sv[0]));<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fd =3D TEMP_FAILURE_RETRY(recv_fd(sv[0]));<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0saved_errno =3D errno;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0close(sv[0]);<br>@@ -647,8 +647,10 @@ static int net_tap_i=
nit(const NetdevTapOptions *tap, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vnet_hdr_required =3D 0;<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>- =
=C2=A0 =C2=A0TFR(fd =3D tap_open(ifname, ifname_sz, vnet_hdr, vnet_hdr_requ=
ired,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mq_required, errp));<br>+ =C2=A0 =C2=A0fd =3D TEMP_FAILURE_RET=
RY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tap_open(ifname, ifname_sz, vnet_hdr, v=
net_hdr_required,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0mq_required, errp)<br>+ =C2=A0 =C2=A0);<br>=C2=A0 =
=C2=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -=
1;<br>=C2=A0 =C2=A0 =C2=A0}<br>diff --git a/os-posix.c b/os-posix.c<br>inde=
x 321fc4bd13..59cac65585 100644<br>--- a/os-posix.c<br>+++ b/os-posix.c<br>=
@@ -266,7 +266,7 @@ void os_setup_post(void)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0error_report(&quot;not able to chdir to /: %s&quot;, s=
trerror(errno));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1)=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TF=
R(fd =3D qemu_open_old(&quot;/dev/null&quot;, O_RDWR));<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fd =3D TEMP_FAILURE_RETRY(qemu_open_old(&quot;/dev/null&quot;,=
 O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>diff --git a/qga/commands-posix.c b/qga/commands-posi=
x.c<br>index 90f83aa9b6..feb0fab807 100644<br>--- a/qga/commands-posix.c<br=
>+++ b/qga/commands-posix.c<br>@@ -68,7 +68,7 @@ static void ga_wait_child(=
pid_t pid, int *status, Error **errp)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0*sta=
tus =3D 0;<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(rpid =3D waitpid(pid, status, 0)=
);<br>+ =C2=A0 =C2=A0rpid =3D TEMP_FAILURE_RETRY(waitpid(pid, status, 0));<=
br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (rpid =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;failed to wait for chi=
ld (pid: %d)&quot;,<br>diff --git a/semihosting/syscalls.c b/semihosting/sy=
scalls.c<br>index 025c08147a..0cbef7d22b 100644<br>--- a/semihosting/syscal=
ls.c<br>+++ b/semihosting/syscalls.c<br>@@ -317,7 +317,7 @@ static void hos=
t_read(CPUState *cs, gdb_syscall_complete_cb complete,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0complete(cs, -1, EFAULT);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return;<br>=C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0TFR(ret =3D read(g=
f-&gt;hostfd, ptr, len));<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(read=
(gf-&gt;hostfd, ptr, len));<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complete(cs, -1, errno);<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0unlock_user(ptr, buf, 0);<br>diff --git a/tests/qtest/=
libqtest.c b/tests/qtest/libqtest.c<br>index d4022966b3..4a12824dc4 100644<=
br>--- a/tests/qtest/libqtest.c<br>+++ b/tests/qtest/libqtest.c<br>@@ -102,=
8 +102,8 @@ static int socket_accept(int sock)<br>=C2=A0 =C2=A0 =C2=A0}<br>=
=C2=A0<br>=C2=A0 =C2=A0 =C2=A0addrlen =3D sizeof(addr);<br>- =C2=A0 =C2=A0T=
FR(<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D accept(sock, (struct sockaddr *=
)&amp;addr, &amp;addrlen)<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0accept(sock, (struct sockaddr *)&amp;addr, &am=
p;addrlen)<br>=C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D =
-1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s failed:=
 %s\n&quot;, __func__, strerror(errno));<br>@@ -140,7 +140,7 @@ void qtest_=
kill_qemu(QTestState *s)<br>=C2=A0 =C2=A0 =C2=A0/* Skip wait if qtest_probe=
_child already reaped. =C2=A0*/<br>=C2=A0 =C2=A0 =C2=A0if (pid !=3D -1) {<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill(pid, SIGTERM);<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0TFR(pid =3D waitpid(s-&gt;qemu_pid, &amp;s-&gt;wstatus, 0));<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D TEMP_FAILURE_RETRY(waitpid(s-&gt;qem=
u_pid, &amp;s-&gt;wstatus, 0));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert=
(pid =3D=3D s-&gt;qemu_pid);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qem=
u_pid =3D -1;<br>=C2=A0 =C2=A0 =C2=A0}<br>@@ -578,8 +578,8 @@ int qtest_soc=
ket_server(const char *socket_path)<br>=C2=A0 =C2=A0 =C2=A0addr.sun_family =
=3D AF_UNIX;<br>=C2=A0 =C2=A0 =C2=A0snprintf(addr.sun_path, sizeof(addr.sun=
_path), &quot;%s&quot;, socket_path);<br>=C2=A0<br>- =C2=A0 =C2=A0TFR(<br>-=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D bind(sock, (struct sockaddr *)&amp;addr=
, sizeof(addr))<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bind(sock, (struct sockaddr *)&amp;addr, sizeof(addr))<=
br>=C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, !=3D,=
 -1);<br>=C2=A0 =C2=A0 =C2=A0ret =3D listen(sock, 1);<br>diff --git a/tests=
/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>index 4d8f933ed5..624a2=
11f3d 100644<br>--- a/tests/vhost-user-bridge.c<br>+++ b/tests/vhost-user-b=
ridge.c<br>@@ -331,7 +331,9 @@ vubr_backend_recv_cb(int sock, void *ctx)<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.msg_iovlen =3D num,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.msg_flags =3D MSG_DONTWAIT=
,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0T=
FR(ret =3D recvmsg(vubr-&gt;backend_udp_sock, &amp;msg, 0));<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recvmsg(vubr-&gt;backend_udp_sock, &amp;m=
sg, 0)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (i =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0iov_restore_front(elem-&gt;in_sg, sg, hdrlen);<br>diff --git a/ut=
il/main-loop.c b/util/main-loop.c<br>index 58e14db2d4..5f65f928bd 100644<br=
>--- a/util/main-loop.c<br>+++ b/util/main-loop.c<br>@@ -64,7 +64,7 @@ stat=
ic void sigfd_handler(void *opaque)<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=
=C2=A0<br>=C2=A0 =C2=A0 =C2=A0while (1) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0T=
FR(len =3D read(fd, &amp;info, sizeof(info)));<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0len =3D TEMP_FAILURE_RETRY(read(fd, &amp;info, sizeof(info)));<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno=
 =3D=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;=
<br>diff --git a/util/osdep.c b/util/osdep.c<br>index d35c473ac7..2c287e75e=
7 100644<br>--- a/util/osdep.c<br>+++ b/util/osdep.c<br>@@ -244,7 +244,7 @@=
 static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type=
)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_type =C2=A0 =3D fl_type,<br>=C2=
=A0 =C2=A0 =C2=A0};<br>=C2=A0 =C2=A0 =C2=A0qemu_probe_lock_ops();<br>- =C2=
=A0 =C2=A0TFR(ret =3D fcntl(fd, fcntl_op_setlk, &amp;fl));<br>+ =C2=A0 =C2=
=A0ret =3D TEMP_FAILURE_RETRY(fcntl(fd, fcntl_op_setlk, &amp;fl));<br>=C2=
=A0 =C2=A0 =C2=A0return ret =3D=3D -1 ? -errno : 0;<br>=C2=A0}<br>=C2=A0<br=
>diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c<br>index c878be1c5f=
..e1422666eb 100644<br>--- a/util/vfio-helpers.c<br>+++ b/util/vfio-helpers=
.c<br>@@ -240,8 +240,8 @@ static int qemu_vfio_pci_read_config(QEMUVFIOStat=
e *s, void *buf,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s-&gt;config_region_info.offset,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;config_region_info.size);<br>=C2=A0 =C2=A0 =
=C2=A0assert(QEMU_IS_ALIGNED(s-&gt;config_region_info.offset + ofs, size));=
<br>- =C2=A0 =C2=A0TFR(<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pread(s-&gt=
;device, buf, size, s-&gt;config_region_info.offset + ofs)<br>+ =C2=A0 =C2=
=A0ret =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0pread(s-&gt;=
device, buf, size, s-&gt;config_region_info.offset + ofs)<br>=C2=A0 =C2=A0 =
=C2=A0);<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D size ? 0 : -errno;<br>=C2=
=A0}<br>@@ -254,8 +254,8 @@ static int qemu_vfio_pci_write_config(QEMUVFIOS=
tate *s, void *buf, int size, int<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 s-&gt;config_region_info.offset,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config_region_info.size);<b=
r>=C2=A0 =C2=A0 =C2=A0assert(QEMU_IS_ALIGNED(s-&gt;config_region_info.offse=
t + ofs, size));<br>- =C2=A0 =C2=A0TFR(<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
 =3D pwrite(s-&gt;device, buf, size, s-&gt;config_region_info.offset + ofs)=
<br>+ =C2=A0 =C2=A0ret =3D TEMP_FAILURE_RETRY(<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pwrite(s-&gt;device, buf, size, s-&gt;config_region_info.offset + ofs=
)<br>=C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D size ?=
 0 : -errno;<br>=C2=A0}<br>-- <br>2.37.1<br><br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 8, 2022 at 9:00=
 PM Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com">nivanov@clo=
udlinux.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hi!<br>During our discussion, I found that I&#3=
9;ve missed a couple of places where TFR() macro could be applied. Here is =
an updated first patch:<br><br>From 8a68f50aac4a8549f416b9350cf339cf0501a71=
2 Mon Sep 17 00:00:00 2001<br>From: Nikita Ivanov &lt;<a href=3D"mailto:niv=
anov@cloudlinux.com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>Da=
te: Wed, 3 Aug 2022 12:54:00 +0300<br>Subject: [PATCH] error handling: Use =
TFR() macro where applicable<br><br>There is a defined TFR() macro in qemu/=
osdep.h which<br>handles the same while loop.<br>Resolves: <a href=3D"https=
://gitlab.com/qemu-project/qemu/-/issues/415" target=3D"_blank">https://git=
lab.com/qemu-project/qemu/-/issues/415</a><br><br>Signed-off-by: Nikita Iva=
nov &lt;<a href=3D"mailto:nivanov@cloudlinux.com" target=3D"_blank">nivanov=
@cloudlinux.com</a>&gt;<br>---<br>=C2=A0block/file-posix.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 39 ++++++++++++++++++---------------------<br>=C2=A0chardev/=
char-pty.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0hw/9pfs/9p-lo=
cal.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A08 ++------<br>=C2=A0net/l2tpv3.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++------------<br>=C2=
=A0net/socket.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++++++=
+---------<br>=C2=A0net/tap.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A08 ++------<br>=C2=A0qga/commands-posix.c =C2=A0 =C2=A0 =
=C2=A0| =C2=A04 +---<br>=C2=A0semihosting/syscalls.c =C2=A0 =C2=A0| =C2=A04=
 +---<br>=C2=A0tests/qtest/libqtest.c =C2=A0 =C2=A0| 14 +++++++-------<br>=
=C2=A0tests/vhost-user-bridge.c | =C2=A04 +---<br>=C2=A0util/main-loop.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0util/osdep.c =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0util/v=
fio-helpers.c =C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>=C2=A013 files chan=
ged, 51 insertions(+), 85 deletions(-)<br><br>diff --git a/block/file-posix=
.c b/block/file-posix.c<br>index 48cd096624..0786cb76f9 100644<br>--- a/blo=
ck/file-posix.c<br>+++ b/block/file-posix.c<br>@@ -1238,9 +1238,9 @@ static=
 int hdev_get_max_segments(int fd, struct stat *st)<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D -errno;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out=
;<br>=C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D read(sysfd, buf, sizeof(buf) - 1);<br>- =C2=A0 =C2=A0} while=
 (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D read(sysfd, buf, sizeof(buf) - 1)<br>+ =
=C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D -errno;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0go=
to out;<br>@@ -1388,9 +1388,9 @@ static int handle_aiocb_ioctl(void *opaque=
)<br>=C2=A0 =C2=A0 =C2=A0RawPosixAIOData *aiocb =3D opaque;<br>=C2=A0 =C2=
=A0 =C2=A0int ret;<br>=C2=A0<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D ioctl(aiocb-&gt;aio_fildes, aiocb-&gt;ioctl.cmd, aiocb-&g=
t;ioctl.buf);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno =3D=
=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D =
ioctl(aiocb-&gt;aio_fildes, aiocb-&gt;ioctl.cmd, aiocb-&gt;ioctl.buf)<br>+ =
=C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>=C2=A0 =C2=A0 =C2=A0}<br>@@ -1472=
,18 +1472,17 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aioc=
b)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=C2=A0<br>- =C2=A0 =C2=
=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (aiocb-&gt;aio_type &amp; QEMU_A=
IO_WRITE)<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D qemu_pwrite=
v(aiocb-&gt;aio_fildes,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.io=
v,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.niov,<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 aiocb-&gt;aio_offset);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D qemu_preadv(=
aiocb-&gt;aio_fildes,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.iov,<b=
r>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.niov,<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0aiocb-&gt;aio_offset);<br>- =C2=A0 =C2=A0} while (len =3D=3D -=
1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0len =3D (aiocb-&gt;aio_type &amp; QEMU_AIO_WRITE) ?<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_pwritev(aiocb-&gt;aio_fildes,<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.iov,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.ni=
ov,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;aio_offset) :<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0qemu_preadv(aiocb-&gt;aio_fildes,<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0aiocb-&gt;io.iov,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.niov,<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0aiocb-&gt;aio_offset)<br>+ =C2=A0 =C2=A0);<br>=C2=A0<br>=C2=A0 =C2=A0=
 =C2=A0if (len =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -er=
rno;<br>@@ -1908,9 +1907,7 @@ static int allocate_first_block(int fd, size_=
t max_size)<br>=C2=A0 =C2=A0 =C2=A0buf =3D qemu_memalign(max_align, write_s=
ize);<br>=C2=A0 =C2=A0 =C2=A0memset(buf, 0, write_size);<br>=C2=A0<br>- =C2=
=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D pwrite(fd, buf, write_=
size, 0);<br>- =C2=A0 =C2=A0} while (n =3D=3D -1 &amp;&amp; errno =3D=3D EI=
NTR);<br>+ =C2=A0 =C2=A0TFR(n =3D pwrite(fd, buf, write_size, 0));<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0ret =3D (n =3D=3D -1) ? -errno : 0;<br>=C2=A0<br=
>diff --git a/chardev/char-pty.c b/chardev/char-pty.c<br>index 53f25c6bbd..=
b2f490bacf 100644<br>--- a/chardev/char-pty.c<br>+++ b/chardev/char-pty.c<b=
r>@@ -93,9 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)<b=
r>=C2=A0 =C2=A0 =C2=A0pfd.fd =3D fioc-&gt;fd;<br>=C2=A0 =C2=A0 =C2=A0pfd.ev=
ents =3D G_IO_OUT;<br>=C2=A0 =C2=A0 =C2=A0pfd.revents =3D 0;<br>- =C2=A0 =
=C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D g_poll(&amp;pfd, 1, 0);<b=
r>- =C2=A0 =C2=A0} while (rc =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+=
 =C2=A0 =C2=A0TFR(rc =3D g_poll(&amp;pfd, 1, 0));<br>=C2=A0 =C2=A0 =C2=A0as=
sert(rc &gt;=3D 0);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (pfd.revents &amp; =
G_IO_HUP) {<br>diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>inde=
x d42ce6d8b8..c90ab947ba 100644<br>--- a/hw/9pfs/9p-local.c<br>+++ b/hw/9pf=
s/9p-local.c<br>@@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext=
 *fs_ctx, V9fsPath *fs_path,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =
=3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {=
<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsize =3D read(fd, (void *)b=
uf, bufsz);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (tsize =3D=3D -1 &amp;&=
amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(tsize =3D rea=
d(fd, (void *)buf, bufsz));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_pres=
erve_errno(fd);<br>=C2=A0 =C2=A0 =C2=A0} else if ((fs_ctx-&gt;export_flags =
&amp; V9FS_SM_PASSTHROUGH) ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE)) {<br>@@ -908,9 =
+906,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Write the oldpath (target) to the file. */<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0oldpath_size =3D strlen(oldpath);<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_size =3D wri=
te(fd, (void *)oldpath, oldpath_size);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} wh=
ile (write_size =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0TFR(write_size =3D write(fd, (void *)oldpath, oldpath_size=
));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_preserve_errno(fd);<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (write_size !=3D oldpath_size) =
{<br>diff --git a/net/l2tpv3.c b/net/l2tpv3.c<br>index af373e5c30..adfdbdb8=
4c 100644<br>--- a/net/l2tpv3.c<br>+++ b/net/l2tpv3.c<br>@@ -240,9 +240,7 @=
@ static ssize_t net_l2tpv3_receive_dgram_iov(NetClientState *nc,<br>=C2=A0=
 =C2=A0 =C2=A0message.msg_control =3D NULL;<br>=C2=A0 =C2=A0 =C2=A0message.=
msg_controllen =3D 0;<br>=C2=A0 =C2=A0 =C2=A0message.msg_flags =3D 0;<br>- =
=C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sendmsg(s-&gt;fd,=
 &amp;message, 0);<br>- =C2=A0 =C2=A0} while ((ret =3D=3D -1) &amp;&amp; (e=
rrno =3D=3D EINTR));<br>+ =C2=A0 =C2=A0TFR(ret =3D sendmsg(s-&gt;fd, &amp;m=
essage, 0));<br>=C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret -=3D s-&gt;offset;<br>=C2=A0 =C2=A0 =C2=A0} else if (r=
et =3D=3D 0) {<br>@@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgr=
am(NetClientState *nc,<br>=C2=A0 =C2=A0 =C2=A0message.msg_control =3D NULL;=
<br>=C2=A0 =C2=A0 =C2=A0message.msg_controllen =3D 0;<br>=C2=A0 =C2=A0 =C2=
=A0message.msg_flags =3D 0;<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D sendmsg(s-&gt;fd, &amp;message, 0);<br>- =C2=A0 =C2=A0} w=
hile ((ret =3D=3D -1) &amp;&amp; (errno =3D=3D EINTR));<br>+ =C2=A0 =C2=A0T=
FR(ret =3D sendmsg(s-&gt;fd, &amp;message, 0));<br>=C2=A0 =C2=A0 =C2=A0if (=
ret &gt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret -=3D s-&gt;offset;<b=
r>=C2=A0 =C2=A0 =C2=A0} else if (ret =3D=3D 0) {<br>@@ -434,12 +430,7 @@ st=
atic void net_l2tpv3_send(void *opaque)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0ms=
gvec =3D s-&gt;msgvec + s-&gt;queue_head;<br>=C2=A0 =C2=A0 =C2=A0if (target=
_count &gt; 0) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D recvmmsg(<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;fd,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgvec,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0target_count, MSG_DONTWAIT, NULL);<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0} while ((count =3D=3D -1) &amp;&amp; (errno =3D=3D EINTR)=
);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(count =3D recvmmsg(s-&gt;fd, msgvec,=
 target_count, MSG_DONTWAIT, NULL));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (count &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Re=
cv error - we still need to flush packets here,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 * (re)set queue head to current position<br>diff -=
-git a/net/socket.c b/net/socket.c<br>index bfd8596250..a3397660c2 100644<b=
r>--- a/net/socket.c<br>+++ b/net/socket.c<br>@@ -117,15 +117,13 @@ static =
ssize_t net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,<br=
>=C2=A0 =C2=A0 =C2=A0NetSocketState *s =3D DO_UPCAST(NetSocketState, nc, nc=
);<br>=C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>=C2=A0<br>- =C2=A0 =C2=A0do {<br>=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dgram_dst.sin_family !=3D AF_UNIX) {=
<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sendto(s-&gt;fd, buf=
, size, 0,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (struct sockaddr *)&amp;s-&gt;dgram_dst,<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sizeof(s-&gt;dgram_dst));<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<b=
r>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D send(s-&gt;fd, buf, si=
ze, 0);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0} while (ret =
=3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;dgram_dst.sin_family !=3D AF_UNIX ?<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sendto(s-&gt;fd, buf, size, 0,=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (struct sockaddr *)&amp;s-&gt;dgram_dst,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(s-&gt;dgram_dst)) :<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send(s-&gt;fd, buf, size, 0)<br>+ =
=C2=A0 =C2=A0);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1 &amp;&am=
p; errno =3D=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0net_socket_w=
rite_poll(s, true);<br>diff --git a/net/tap.c b/net/tap.c<br>index b3ddfd4a=
74..b047eca8b5 100644<br>--- a/net/tap.c<br>+++ b/net/tap.c<br>@@ -102,9 +1=
02,7 @@ static ssize_t tap_write_packet(TAPState *s, const struct iovec *io=
v, int iovcnt<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=C2=A0<br>-=
 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D writev(s-&gt;fd,=
 iov, iovcnt);<br>- =C2=A0 =C2=A0} while (len =3D=3D -1 &amp;&amp; errno =
=3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(len =3D writev(s-&gt;fd, iov, iovcnt))=
;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno =3D=
=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap_write_poll(s, true);=
<br>@@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper=
, const char *bridge,<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(=
sv[1]);<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D recv_fd(sv[0]);<br>- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} while (fd =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TFR(fd =3D recv_fd(sv[0]));<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0saved_errno =3D errno;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0close(sv[0]);<br>diff --git a/qga/commands-posix.c b/qga/commands-pos=
ix.c<br>index 954efed01b..90f83aa9b6 100644<br>--- a/qga/commands-posix.c<b=
r>+++ b/qga/commands-posix.c<br>@@ -68,9 +68,7 @@ static void ga_wait_child=
(pid_t pid, int *status, Error **errp)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0*st=
atus =3D 0;<br>=C2=A0<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rpid =3D waitpid(pid, status, 0);<br>- =C2=A0 =C2=A0} while (rpid =3D=3D=
 -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(rpid =3D waitpid(=
pid, status, 0));<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (rpid =3D=3D -1) {<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;fail=
ed to wait for child (pid: %d)&quot;,<br>diff --git a/semihosting/syscalls.=
c b/semihosting/syscalls.c<br>index 508a0ad88c..025c08147a 100644<br>--- a/=
semihosting/syscalls.c<br>+++ b/semihosting/syscalls.c<br>@@ -317,9 +317,7 =
@@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complete(cs, -1, EFAULT);<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return;<br>=C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0=
do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D read(gf-&gt;hostfd, ptr, len);=
<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<b=
r>+ =C2=A0 =C2=A0TFR(ret =3D read(gf-&gt;hostfd, ptr, len));<br>=C2=A0 =C2=
=A0 =C2=A0if (ret =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complet=
e(cs, -1, errno);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_user(ptr, buf=
, 0);<br>diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>in=
dex 8c159eacf5..d4022966b3 100644<br>--- a/tests/qtest/libqtest.c<br>+++ b/=
tests/qtest/libqtest.c<br>@@ -101,10 +101,10 @@ static int socket_accept(in=
t sock)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=C2=A0 =C2=A0 =
=C2=A0}<br>=C2=A0<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ad=
drlen =3D sizeof(addr);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D accept(sock=
, (struct sockaddr *)&amp;addr, &amp;addrlen);<br>- =C2=A0 =C2=A0} while (r=
et =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0addrlen =3D =
sizeof(addr);<br>+ =C2=A0 =C2=A0TFR(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D accept(sock, (struct sockaddr *)&amp;addr, &amp;addrlen)<br>+ =C2=A0 =
=C2=A0);<br>=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s failed: %s\n&quot;, __func__, str=
error(errno));<br>=C2=A0 =C2=A0 =C2=A0}<br>@@ -578,9 +578,9 @@ int qtest_so=
cket_server(const char *socket_path)<br>=C2=A0 =C2=A0 =C2=A0addr.sun_family=
 =3D AF_UNIX;<br>=C2=A0 =C2=A0 =C2=A0snprintf(addr.sun_path, sizeof(addr.su=
n_path), &quot;%s&quot;, socket_path);<br>=C2=A0<br>- =C2=A0 =C2=A0do {<br>=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D bind(sock, (struct sockaddr *)&amp;add=
r, sizeof(addr));<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno=
 =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D bind(sock, (struct sockaddr *)&amp;addr, sizeof(addr))<br>+ =C2=A0 =C2=
=A0);<br>=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, !=3D, -1);<br>=C2=A0 =C2=
=A0 =C2=A0ret =3D listen(sock, 1);<br>=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(r=
et, !=3D, -1);<br>diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user=
-bridge.c<br>index 9b1dab2f28..4d8f933ed5 100644<br>--- a/tests/vhost-user-=
bridge.c<br>+++ b/tests/vhost-user-bridge.c<br>@@ -331,9 +331,7 @@ vubr_bac=
kend_recv_cb(int sock, void *ctx)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.msg_iovlen =3D num,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.msg_flags =3D MSG_DONTWAIT,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};=
<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D recvmsg(vubr-&gt;backend_udp_sock, &amp;msg, 0);<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; (errno =3D=3D EIN=
TR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(ret =3D recvmsg(vubr-&gt;backend_=
udp_sock, &amp;msg, 0));<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(i =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iov_resto=
re_front(elem-&gt;in_sg, sg, hdrlen);<br>diff --git a/util/main-loop.c b/ut=
il/main-loop.c<br>index f00a25451b..58e14db2d4 100644<br>--- a/util/main-lo=
op.c<br>+++ b/util/main-loop.c<br>@@ -64,9 +64,7 @@ static void sigfd_handl=
er(void *opaque)<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0while (1) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D read(fd, &amp;info, sizeof(info))=
;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (len =3D=3D -1 &amp;&amp; errno =
=3D=3D EINTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(len =3D read(fd, &amp;in=
fo, sizeof(info)));<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =
=3D=3D -1 &amp;&amp; errno =3D=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;<br>diff --git a/util/osdep.c b/util/osdep.c<br>i=
ndex 60fcbbaebe..d35c473ac7 100644<br>--- a/util/osdep.c<br>+++ b/util/osde=
p.c<br>@@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start=
, int64_t len, int fl_type)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_type =
=C2=A0 =3D fl_type,<br>=C2=A0 =C2=A0 =C2=A0};<br>=C2=A0 =C2=A0 =C2=A0qemu_p=
robe_lock_ops();<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
 =3D fcntl(fd, fcntl_op_setlk, &amp;fl);<br>- =C2=A0 =C2=A0} while (ret =3D=
=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(ret =3D fcntl(=
fd, fcntl_op_setlk, &amp;fl));<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D -1 =
? -errno : 0;<br>=C2=A0}<br>=C2=A0<br>diff --git a/util/vfio-helpers.c b/ut=
il/vfio-helpers.c<br>index 5ba01177bf..c878be1c5f 100644<br>--- a/util/vfio=
-helpers.c<br>+++ b/util/vfio-helpers.c<br>@@ -240,9 +240,9 @@ static int q=
emu_vfio_pci_read_config(QEMUVFIOState *s, void *buf,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;config_region_info.offset,<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;config_reg=
ion_info.size);<br>=C2=A0 =C2=A0 =C2=A0assert(QEMU_IS_ALIGNED(s-&gt;config_=
region_info.offset + ofs, size));<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D pread(s-&gt;device, buf, size, s-&gt;config_region_in=
fo.offset + ofs);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errno=
 =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D pread(s-&gt;device, buf, size, s-&gt;config_region_info.offset + ofs)<b=
r>+ =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D size ? 0 : -er=
rno;<br>=C2=A0}<br>=C2=A0<br>@@ -254,9 +254,9 @@ static int qemu_vfio_pci_w=
rite_config(QEMUVFIOState *s, void *buf, int size, int<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config_region_info.offset,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config=
_region_info.size);<br>=C2=A0 =C2=A0 =C2=A0assert(QEMU_IS_ALIGNED(s-&gt;con=
fig_region_info.offset + ofs, size));<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D pwrite(s-&gt;device, buf, size, s-&gt;config_re=
gion_info.offset + ofs);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp=
; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret =3D pwrite(s-&gt;device, buf, size, s-&gt;config_region_info.offset =
+ ofs)<br>+ =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D size ?=
 0 : -errno;<br>=C2=A0}<br>=C2=A0<br>-- <br>2.37.1<br><br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 8, 20=
22 at 5:22 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" ta=
rget=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Christian Schoenebeck &lt;<a href=3D"mailt=
o:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt; =
writes:<br>
<br>
&gt; On Montag, 8. August 2022 14:52:28 CEST Christian Schoenebeck wrote:<b=
r>
&gt;&gt; On Montag, 8. August 2022 10:05:56 CEST Markus Armbruster wrote:<b=
r>
&gt;&gt; &gt; Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com" t=
arget=3D"_blank">nivanov@cloudlinux.com</a>&gt; writes:<br>
&gt;&gt; &gt; &gt; Summing up the discussion above, I suggest the following=
 patch for TFR()<br>
&gt;&gt; &gt; &gt; macro refactoring. (The patch is sequential to the first=
 one I<br>
&gt;&gt; &gt; &gt; introduced<br>
&gt;&gt; &gt; &gt; in the start of the discussion).<br>
&gt;&gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt;&gt;From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep=
 17 00:00:00 2001<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt; From: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudl=
inux.com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>
&gt;&gt; &gt; &gt; Date: Mon, 8 Aug 2022 09:30:34 +0300<br>
&gt;&gt; &gt; &gt; Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILU=
RE_RETRY()<br>
&gt;&gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt; glibc&#39;s unistd.h header provides the same macro with=
 the<br>
&gt;&gt; &gt; &gt; subtle difference in type casting. Adjust macro name to =
the<br>
&gt;&gt; &gt; &gt; common standard and define conditionally.<br>
&gt;&gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt; Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivan=
ov@cloudlinux.com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>
<br>
[...]<br>
<br>
&gt;&gt; &gt; &gt; diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h=
<br>
&gt;&gt; &gt; &gt; index b1c161c035..55f2927d8b 100644<br>
&gt;&gt; &gt; &gt; --- a/include/qemu/osdep.h<br>
&gt;&gt; &gt; &gt; +++ b/include/qemu/osdep.h<br>
&gt;&gt; &gt; &gt; @@ -242,8 +242,10 @@ void QEMU_ERROR(&quot;code path is =
reachable&quot;)<br>
&gt;&gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt;=C2=A0 #if !defined(ESHUTDOWN)<br>
&gt;&gt; &gt; &gt;=C2=A0 #define ESHUTDOWN 4099<br>
&gt;&gt; &gt; &gt;=C2=A0 #endif<br>
&gt;&gt; &gt; &gt; <br>
&gt;&gt; &gt; &gt; -<br>
&gt;&gt; &gt; &gt; -#define TFR(expr) do { if ((expr) !=3D -1) break; } whi=
le (errno =3D=3D<br>
&gt;&gt; &gt; &gt; EINTR)<br>
&gt;&gt; &gt; &gt; +#if !defined(TEMP_FAILURE_RETRY)<br>
&gt;&gt; &gt; &gt; +#define TEMP_FAILURE_RETRY(expr) \<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 do { if ((expr) !=3D -1) break; } while (=
errno =3D=3D EINTR)<br>
<br>
To avoid / reduce confusion: this macro expands into a statement, and ...<b=
r>
<br>
&gt;&gt; &gt; &gt; +#endif<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; GLibc&#39;s version is<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt;=C2=A0 =C2=A0 # define TEMP_FAILURE_RETRY(expression) \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 (__extension__=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ({ long int __result;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do __result =3D (long=
 int) (expression);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (__result =3D=
=3D -1L &amp;&amp; errno =3D=3D EINTR);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__result; }))<br>
<br>
... this one expands into an expression.=C2=A0 It uses GCC&#39;s &quot;a co=
mpound<br>
statement enclosed in parentheses may appear as an expression&quot; extensi=
on.<br>
<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; The difference isn&#39;t just &quot;type casting&quot;, it&#3=
9;s also statement<br>
&gt;&gt; &gt; vs. expression.<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; Is it a good idea to have the macro expand into a statement o=
n some<br>
&gt;&gt; &gt; hosts, and into an expression on others?=C2=A0 Sure, CI shoul=
d catch any uses<br>
&gt;&gt; &gt; as expression, but delaying compile errors to CI wastes devel=
oper time.<br>
&gt;&gt; <br>
&gt;&gt; For consistency and simplicity, I would define exactly one version=
 (no<br>
&gt;&gt; ifdefs) of the macro with a different macro name than glibc&#39;s<=
br>
&gt;&gt; TEMP_FAILURE_RETRY(), and use that QEMU specific macro name in QEM=
U code<br>
&gt;&gt; everywhere.<br>
<br>
TFR()?=C2=A0 Can&#39;t resist closing the circle...<br>
<br>
&gt;&gt; As for statement vs. expression: The only advantage of the stateme=
nt version<br>
&gt;&gt; is if you&#39;d need __result as an rvalue, which is not needed AT=
M, right? So<br>
&gt;&gt; I would go for the expression version (with cast) for now.<br>
<br>
The expression-like macro is nicer where the return value matters.<br>
Example (stolen from &quot;The GNU C Library Reference Manual&quot;):<br>
<br>
=C2=A0 =C2=A0 nbytes =3D TEMP_FAILURE_RETRY (write (desc, buffer, count));<=
br>
<br>
With the statement-like macro, you have to write<br>
<br>
=C2=A0 =C2=A0 TEMP_FAILURE_RETRY (nbytes =3D write (desc, buffer, count));<=
br>
<br>
&gt;&gt; The glibc history does not reveal why they chose the statement ver=
sion.<br>
<br>
The expression version, actually.<br>
<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Christian Schoenebeck<br>
&gt;<br>
&gt; Sorry: s/rvalue/lvalue/ i.e. if you need the memory address of result =
or if <br>
&gt; you need to take the result value of the last iteration in &#39;expres=
sion&#39; into <br>
&gt; account.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best Regards,<div><b>Nikita Ivanov</b> | C developer</div=
><div><b>Telephone:</b> +79140870696<br></div><div><div><b>Telephone:</b>=
=C2=A0+79015053149</div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Iva=
nov</b> | C developer</div><div><b>Telephone:</b> +79140870696<br></div><di=
v><div><b>Telephone:</b>=C2=A0+79015053149</div></div></div></div>

--000000000000e92c3705e5bea393--

