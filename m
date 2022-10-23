Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521D609B07
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 09:09:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omlQO-0003wx-Qk
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 20:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1omWvl-0007Ij-Jd
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 05:06:05 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1omWvh-0001sx-PW
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 05:06:04 -0400
Received: by mail-vs1-xe29.google.com with SMTP id 128so5306065vsz.12
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2xmoC1AyykP+Tvub8nCBxJmu8Ca2t9KjBXUFU8JvdN8=;
 b=PhuJSA7qQZdnIYTUqAAuslDbzqEany8sraAdVarM+jfnbHRdb3Uj7692gMi5UztQhO
 yq5hI5FdI8y/ZBlmSi8pFYV5M7J7Adj5Wuu7DxQeTzDigYxByIuIaEt3aAvrN6ikk04+
 0q1EaLCFKc/PhyLvhkEimNu1RaDvcFonmJUuQUkLzQHhc8M7hpIb3fbVWFSPMA3+mvOX
 ViP54stSw840A+imRfUifbeG80BRhu5+6QF5kArEGG1f61wREwBbOmbuabaVpJfyEMBw
 5w1Zck0WAH6INcBU5xK63+Dh9XArjOwMkMoWTjsSWAQUeVCH5KNKsiIKn0xiSvNduLUu
 0Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2xmoC1AyykP+Tvub8nCBxJmu8Ca2t9KjBXUFU8JvdN8=;
 b=ECMgsux6osYjSYhnSSndwR46EEKcF8MvRx15HsOKMzgftmSaa2ZJ5VGa+TfF5+67ft
 kGO6tEL/e/v4HKwudTz29EoKNVydxsY2nfIPeLbiErt/Dupt2rqEYTgUABypNuqL7DS2
 VrokSugxGswsogn0gE8bYkrKwCM3eE6AYkrdoOJm9WLzB+pOQLBTqT17Fqc9JdTEg/m3
 6/0OXLCGqEFVWAOg+H6W8FmaHlsCyjDEUyCDegzv/aO/S+MNcKNSFY5DtYsgnJmqu2pe
 AgJA/4yU3nB5n4WigL9azFlHwIxUuaCdqqlNkpqc3BwFek553spsQEYgVOfvt2hXpsH3
 BdLw==
X-Gm-Message-State: ACrzQf25Vb2RqMQFCgPchOG3oDF/UWPobqP2DvKmc5w8d54c6OLaVr79
 rLau2uHPRetedTDDI7vEpH0KGaWtSnxwWuORtiG+nA==
X-Google-Smtp-Source: AMsMyM4bh4S19VI93E4q4ZaItgJFvXfTElsl6AzWJpIKnn6gdkFZLWK4Eh3qgovsD1P0XbcqrA+fGaYI0vQn0jd+Pj8=
X-Received: by 2002:a05:6102:224d:b0:3a7:710b:33a2 with SMTP id
 e13-20020a056102224d00b003a7710b33a2mr15502489vsb.22.1666515960999; Sun, 23
 Oct 2022 02:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221018084341.16270-1-nivanov@cloudlinux.com>
 <20221018084341.16270-3-nivanov@cloudlinux.com> <238029110.QdEyA1o5jg@silver>
In-Reply-To: <238029110.QdEyA1o5jg@silver>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Sun, 23 Oct 2022 12:05:50 +0300
Message-ID: <CAAJ4Ao8nCZkr=u8G=ABJN_6uW54XAM7O=zfT4_SwO-=X3E8+Dg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] error handling: Use RETRY_ON_EINTR() macro where
 applicable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000de4eda05ebaffbfc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=nivanov@cloudlinux.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000de4eda05ebaffbfc
Content-Type: text/plain; charset="UTF-8"

Hi!
Thanks for clarification! Corrected it in v4.

On Wed, Oct 19, 2022 at 6:24 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Tuesday, October 18, 2022 10:43:41 AM CEST Nikita Ivanov wrote:
> > There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h
> > which handles the same while loop.
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
> >
> > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> > ---
> >  block/file-posix.c        | 37 ++++++++++++++++---------------------
> >  chardev/char-pty.c        |  4 +---
> >  hw/9pfs/9p-local.c        |  8 ++------
> >  net/l2tpv3.c              | 17 +++++------------
> >  net/socket.c              | 16 +++++++---------
> >  net/tap.c                 |  8 ++------
> >  qga/commands-posix.c      |  4 +---
> >  semihosting/syscalls.c    |  4 +---
> >  tests/qtest/libqtest.c    | 12 +++++-------
> >  tests/vhost-user-bridge.c |  4 +---
> >  util/main-loop.c          |  4 +---
> >  util/osdep.c              |  4 +---
> >  util/vfio-helpers.c       | 12 ++++++------
> >  13 files changed, 49 insertions(+), 85 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 23acffb9a4..8f7a22e3e4 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1229,9 +1229,7 @@ static int hdev_get_max_segments(int fd, struct
> stat *st)
> >          ret = -errno;
> >          goto out;
> >      }
> > -    do {
> > -        ret = read(sysfd, buf, sizeof(buf) - 1);
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(read(sysfd, buf, sizeof(buf) - 1));
> >      if (ret < 0) {
> >          ret = -errno;
> >          goto out;
> > @@ -1379,9 +1377,9 @@ static int handle_aiocb_ioctl(void *opaque)
> >      RawPosixAIOData *aiocb = opaque;
> >      int ret;
> >
> > -    do {
> > -        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd,
> aiocb->ioctl.buf);
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(
> > +        ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf)
> > +    );
> >      if (ret == -1) {
> >          return -errno;
> >      }
> > @@ -1463,18 +1461,17 @@ static ssize_t
> handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
> >  {
> >      ssize_t len;
> >
> > -    do {
> > -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> > -            len = qemu_pwritev(aiocb->aio_fildes,
> > -                               aiocb->io.iov,
> > -                               aiocb->io.niov,
> > -                               aiocb->aio_offset);
> > -         else
> > -            len = qemu_preadv(aiocb->aio_fildes,
> > -                              aiocb->io.iov,
> > -                              aiocb->io.niov,
> > -                              aiocb->aio_offset);
> > -    } while (len == -1 && errno == EINTR);
> > +    len = RETRY_ON_EINTR(
> > +        (aiocb->aio_type & QEMU_AIO_WRITE) ?
> > +            qemu_pwritev(aiocb->aio_fildes,
> > +                           aiocb->io.iov,
> > +                           aiocb->io.niov,
> > +                           aiocb->aio_offset) :
> > +            qemu_preadv(aiocb->aio_fildes,
> > +                          aiocb->io.iov,
> > +                          aiocb->io.niov,
> > +                          aiocb->aio_offset)
> > +    );
> >
> >      if (len == -1) {
> >          return -errno;
> > @@ -1899,9 +1896,7 @@ static int allocate_first_block(int fd, size_t
> max_size)
> >      buf = qemu_memalign(max_align, write_size);
> >      memset(buf, 0, write_size);
> >
> > -    do {
> > -        n = pwrite(fd, buf, write_size, 0);
> > -    } while (n == -1 && errno == EINTR);
> > +    n = RETRY_ON_EINTR(pwrite(fd, buf, write_size, 0));
> >
> >      ret = (n == -1) ? -errno : 0;
> >
> > diff --git a/chardev/char-pty.c b/chardev/char-pty.c
> > index 53f25c6bbd..92fd33c854 100644
> > --- a/chardev/char-pty.c
> > +++ b/chardev/char-pty.c
> > @@ -93,9 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr)
> >      pfd.fd = fioc->fd;
> >      pfd.events = G_IO_OUT;
> >      pfd.revents = 0;
> > -    do {
> > -        rc = g_poll(&pfd, 1, 0);
> > -    } while (rc == -1 && errno == EINTR);
> > +    rc = RETRY_ON_EINTR(g_poll(&pfd, 1, 0));
> >      assert(rc >= 0);
> >
> >      if (pfd.revents & G_IO_HUP) {
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index d42ce6d8b8..bb3187244f 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> V9fsPath *fs_path,
> >          if (fd == -1) {
> >              return -1;
> >          }
> > -        do {
> > -            tsize = read(fd, (void *)buf, bufsz);
> > -        } while (tsize == -1 && errno == EINTR);
> > +        tsize = RETRY_ON_EINTR(read(fd, (void *)buf, bufsz));
> >          close_preserve_errno(fd);
> >      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
> >                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > @@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const
> char *oldpath,
> >          }
> >          /* Write the oldpath (target) to the file. */
> >          oldpath_size = strlen(oldpath);
> > -        do {
> > -            write_size = write(fd, (void *)oldpath, oldpath_size);
> > -        } while (write_size == -1 && errno == EINTR);
> > +        write_size = RETRY_ON_EINTR(write(fd, (void *)oldpath,
> oldpath_size));
> >          close_preserve_errno(fd);
> >
> >          if (write_size != oldpath_size) {
> > diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> > index af373e5c30..e0726f5f89 100644
> > --- a/net/l2tpv3.c
> > +++ b/net/l2tpv3.c
> > @@ -240,9 +240,7 @@ static ssize_t
> net_l2tpv3_receive_dgram_iov(NetClientState *nc,
> >      message.msg_control = NULL;
> >      message.msg_controllen = 0;
> >      message.msg_flags = 0;
> > -    do {
> > -        ret = sendmsg(s->fd, &message, 0);
> > -    } while ((ret == -1) && (errno == EINTR));
> > +    ret = RETRY_ON_EINTR(sendmsg(s->fd, &message, 0));
> >      if (ret > 0) {
> >          ret -= s->offset;
> >      } else if (ret == 0) {
> > @@ -285,9 +283,7 @@ static ssize_t
> net_l2tpv3_receive_dgram(NetClientState *nc,
> >      message.msg_control = NULL;
> >      message.msg_controllen = 0;
> >      message.msg_flags = 0;
> > -    do {
> > -        ret = sendmsg(s->fd, &message, 0);
> > -    } while ((ret == -1) && (errno == EINTR));
> > +    ret = RETRY_ON_EINTR(sendmsg(s->fd, &message, 0));
> >      if (ret > 0) {
> >          ret -= s->offset;
> >      } else if (ret == 0) {
> > @@ -434,12 +430,9 @@ static void net_l2tpv3_send(void *opaque)
> >
> >      msgvec = s->msgvec + s->queue_head;
> >      if (target_count > 0) {
> > -        do {
> > -            count = recvmmsg(
> > -                s->fd,
> > -                msgvec,
> > -                target_count, MSG_DONTWAIT, NULL);
> > -        } while ((count == -1) && (errno == EINTR));
> > +        count = RETRY_ON_EINTR(
> > +                recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
> NULL)
> > +        );
> >          if (count < 0) {
> >              /* Recv error - we still need to flush packets here,
> >               * (re)set queue head to current position
> > diff --git a/net/socket.c b/net/socket.c
> > index bfd8596250..00f8a88531 100644
> > --- a/net/socket.c
> > +++ b/net/socket.c
> > @@ -117,15 +117,13 @@ static ssize_t
> net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf,
> >      NetSocketState *s = DO_UPCAST(NetSocketState, nc, nc);
> >      ssize_t ret;
> >
> > -    do {
> > -        if (s->dgram_dst.sin_family != AF_UNIX) {
> > -            ret = sendto(s->fd, buf, size, 0,
> > -                         (struct sockaddr *)&s->dgram_dst,
> > -                         sizeof(s->dgram_dst));
> > -        } else {
> > -            ret = send(s->fd, buf, size, 0);
> > -        }
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(
> > +        s->dgram_dst.sin_family != AF_UNIX ?
> > +            sendto(s->fd, buf, size, 0,
> > +                     (struct sockaddr *)&s->dgram_dst,
> > +                     sizeof(s->dgram_dst)) :
> > +            send(s->fd, buf, size, 0)
> > +    );
> >
> >      if (ret == -1 && errno == EAGAIN) {
> >          net_socket_write_poll(s, true);
> > diff --git a/net/tap.c b/net/tap.c
> > index e090d14203..4c90f70b7e 100644
> > --- a/net/tap.c
> > +++ b/net/tap.c
> > @@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
> struct iovec *iov, int iovcnt
> >  {
> >      ssize_t len;
> >
> > -    do {
> > -        len = writev(s->fd, iov, iovcnt);
> > -    } while (len == -1 && errno == EINTR);
> > +    len = RETRY_ON_EINTR(writev(s->fd, iov, iovcnt));
> >
> >      if (len == -1 && errno == EAGAIN) {
> >          tap_write_poll(s, true);
> > @@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper,
> const char *bridge,
> >
> >          close(sv[1]);
> >
> > -        do {
> > -            fd = recv_fd(sv[0]);
> > -        } while (fd == -1 && errno == EINTR);
> > +        fd = RETRY_ON_EINTR(recv_fd(sv[0]));
> >          saved_errno = errno;
> >
> >          close(sv[0]);
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index eea819cff0..95753f7c96 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status,
> Error **errp)
> >
> >      *status = 0;
> >
> > -    do {
> > -        rpid = waitpid(pid, status, 0);
> > -    } while (rpid == -1 && errno == EINTR);
> > +    rpid = RETRY_ON_EINTR(waitpid(pid, status, 0));
> >
> >      if (rpid == -1) {
> >          error_setg_errno(errp, errno, "failed to wait for child (pid:
> %d)",
> > diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> > index 508a0ad88c..5893c760c5 100644
> > --- a/semihosting/syscalls.c
> > +++ b/semihosting/syscalls.c
> > @@ -317,9 +317,7 @@ static void host_read(CPUState *cs,
> gdb_syscall_complete_cb complete,
> >          complete(cs, -1, EFAULT);
> >          return;
> >      }
> > -    do {
> > -        ret = read(gf->hostfd, ptr, len);
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(read(gf->hostfd, ptr, len));
> >      if (ret == -1) {
> >          complete(cs, -1, errno);
> >          unlock_user(ptr, buf, 0);
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 90648eb8d1..86f1091e78 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -101,10 +101,10 @@ static int socket_accept(int sock)
> >          return -1;
> >      }
> >
> > -    do {
> > -        addrlen = sizeof(addr);
> > -        ret = accept(sock, (struct sockaddr *)&addr, &addrlen);
> > -    } while (ret == -1 && errno == EINTR);
> > +    addrlen = sizeof(addr);
>
> That assignment was intentionally inside the loop, because the 3rd
> argument of
> accept() is a result parameter, so the value of `addrlen` gets modified and
> hence `addrlen` has to be restored in each loop cycle.
>
> > +    ret = RETRY_ON_EINTR(
> > +        accept(sock, (struct sockaddr *)&addr, &addrlen)
> > +    );
> >      if (ret == -1) {
> >          fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
> >      }
> > @@ -574,9 +574,7 @@ int qtest_socket_server(const char *socket_path)
> >      addr.sun_family = AF_UNIX;
> >      snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
> >
> > -    do {
> > -        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(bind(sock, (struct sockaddr *)&addr,
> sizeof(addr)));
> >      g_assert_cmpint(ret, !=, -1);
> >      ret = listen(sock, 1);
> >      g_assert_cmpint(ret, !=, -1);
> > diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> > index fecdf915e7..a5c711b1de 100644
> > --- a/tests/vhost-user-bridge.c
> > +++ b/tests/vhost-user-bridge.c
> > @@ -331,9 +331,7 @@ vubr_backend_recv_cb(int sock, void *ctx)
> >              .msg_iovlen = num,
> >              .msg_flags = MSG_DONTWAIT,
> >          };
> > -        do {
> > -            ret = recvmsg(vubr->backend_udp_sock, &msg, 0);
> > -        } while (ret == -1 && (errno == EINTR));
> > +        ret = RETRY_ON_EINTR(recvmsg(vubr->backend_udp_sock, &msg, 0));
> >
> >          if (i == 0) {
> >              iov_restore_front(elem->in_sg, sg, hdrlen);
> > diff --git a/util/main-loop.c b/util/main-loop.c
> > index f00a25451b..63bd5d123d 100644
> > --- a/util/main-loop.c
> > +++ b/util/main-loop.c
> > @@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)
> >      ssize_t len;
> >
> >      while (1) {
> > -        do {
> > -            len = read(fd, &info, sizeof(info));
> > -        } while (len == -1 && errno == EINTR);
> > +        len = RETRY_ON_EINTR(read(fd, &info, sizeof(info)));
> >
> >          if (len == -1 && errno == EAGAIN) {
> >              break;
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 746d5f7d71..aa358bd65e 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
> int64_t len, int fl_type)
> >          .l_type   = fl_type,
> >      };
> >      qemu_probe_lock_ops();
> > -    do {
> > -        ret = fcntl(fd, fcntl_op_setlk, &fl);
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(fcntl(fd, fcntl_op_setlk, &fl));
> >      return ret == -1 ? -errno : 0;
> >  }
> >
> > diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> > index 5ba01177bf..1a9b338cf9 100644
> > --- a/util/vfio-helpers.c
> > +++ b/util/vfio-helpers.c
> > @@ -240,9 +240,9 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState
> *s, void *buf,
> >                                      s->config_region_info.offset,
> >                                      s->config_region_info.size);
> >      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> > -    do {
> > -        ret = pread(s->device, buf, size, s->config_region_info.offset
> + ofs);
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(
> > +        pread(s->device, buf, size, s->config_region_info.offset + ofs)
> > +    );
> >      return ret == size ? 0 : -errno;
> >  }
> >
> > @@ -254,9 +254,9 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState
> *s, void *buf, int size, int
> >                                       s->config_region_info.offset,
> >                                       s->config_region_info.size);
> >      assert(QEMU_IS_ALIGNED(s->config_region_info.offset + ofs, size));
> > -    do {
> > -        ret = pwrite(s->device, buf, size, s->config_region_info.offset
> + ofs);
> > -    } while (ret == -1 && errno == EINTR);
> > +    ret = RETRY_ON_EINTR(
> > +        pwrite(s->device, buf, size, s->config_region_info.offset + ofs)
> > +    );
> >      return ret == size ? 0 : -errno;
> >  }
> >
> >
>
>
>
>

-- 
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--000000000000de4eda05ebaffbfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br>Thanks for clarification! Corrected it in v4.</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Oct 19, 2022 at 6:24 PM Christian Schoenebeck &lt;<a href=3D"mailto:qemu_=
oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Tuesday, October 18, 2022 10:43=
:41 AM CEST Nikita Ivanov wrote:<br>
&gt; There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h<br>
&gt; which handles the same while loop.<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/415=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/issues/415</a><br>
&gt; <br>
&gt; Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.=
com" target=3D"_blank">nivanov@cloudlinux.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/file-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 +++++++++++++=
+++---------------------<br>
&gt;=C2=A0 chardev/char-pty.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +---<br>
&gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++------=
<br>
&gt;=C2=A0 net/l2tpv3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
7 +++++------------<br>
&gt;=C2=A0 net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
6 +++++++---------<br>
&gt;=C2=A0 net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 8 ++------<br>
&gt;=C2=A0 qga/commands-posix.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +---<br>
&gt;=C2=A0 semihosting/syscalls.c=C2=A0 =C2=A0 |=C2=A0 4 +---<br>
&gt;=C2=A0 tests/qtest/libqtest.c=C2=A0 =C2=A0 | 12 +++++-------<br>
&gt;=C2=A0 tests/vhost-user-bridge.c |=C2=A0 4 +---<br>
&gt;=C2=A0 util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--=
-<br>
&gt;=C2=A0 util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +---<br>
&gt;=C2=A0 util/vfio-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++------<=
br>
&gt;=C2=A0 13 files changed, 49 insertions(+), 85 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block/file-posix.c b/block/file-posix.c<br>
&gt; index 23acffb9a4..8f7a22e3e4 100644<br>
&gt; --- a/block/file-posix.c<br>
&gt; +++ b/block/file-posix.c<br>
&gt; @@ -1229,9 +1229,7 @@ static int hdev_get_max_segments(int fd, struct =
stat *st)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -errno;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D read(sysfd, buf, sizeof(buf) - 1)=
;<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(read(sysfd, buf, sizeof(buf) - 1=
));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -errno;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; @@ -1379,9 +1377,9 @@ static int handle_aiocb_ioctl(void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RawPosixAIOData *aiocb =3D opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(aiocb-&gt;aio_fildes, aiocb=
-&gt;ioctl.cmd, aiocb-&gt;ioctl.buf);<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ioctl(aiocb-&gt;aio_fildes, aiocb-&gt;ioc=
tl.cmd, aiocb-&gt;ioctl.buf)<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -1463,18 +1461,17 @@ static ssize_t handle_aiocb_rw_vector(RawPosix=
AIOData *aiocb)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssize_t len;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aiocb-&gt;aio_type &amp; QEMU_AIO_WRI=
TE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qemu_pwritev(aiocb-=
&gt;aio_fildes,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.iov,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.niov,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;aio_offset);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qemu_preadv(aiocb-&=
gt;aio_fildes,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.iov,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.niov,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;aio_offset);<br>
&gt; -=C2=A0 =C2=A0 } while (len =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 len =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (aiocb-&gt;aio_type &amp; QEMU_AIO_WRITE)=
 ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_pwritev(aiocb-&gt;aio_=
fildes,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.iov,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;io.niov,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0aiocb-&gt;aio_offset) :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_preadv(aiocb-&gt;aio_f=
ildes,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.iov,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;io.niov,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 aiocb-&gt;aio_offset)<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (len =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
&gt; @@ -1899,9 +1896,7 @@ static int allocate_first_block(int fd, size_t m=
ax_size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 buf =3D qemu_memalign(max_align, write_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 memset(buf, 0, write_size);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D pwrite(fd, buf, write_size, 0);<br>
&gt; -=C2=A0 =C2=A0 } while (n =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br=
>
&gt; +=C2=A0 =C2=A0 n =3D RETRY_ON_EINTR(pwrite(fd, buf, write_size, 0));<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D (n =3D=3D -1) ? -errno : 0;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/chardev/char-pty.c b/chardev/char-pty.c<br>
&gt; index 53f25c6bbd..92fd33c854 100644<br>
&gt; --- a/chardev/char-pty.c<br>
&gt; +++ b/chardev/char-pty.c<br>
&gt; @@ -93,9 +93,7 @@ static void pty_chr_update_read_handler(Chardev *chr=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pfd.fd =3D fioc-&gt;fd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pfd.events =3D G_IO_OUT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pfd.revents =3D 0;<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D g_poll(&amp;pfd, 1, 0);<br>
&gt; -=C2=A0 =C2=A0 } while (rc =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<b=
r>
&gt; +=C2=A0 =C2=A0 rc =3D RETRY_ON_EINTR(g_poll(&amp;pfd, 1, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(rc &gt;=3D 0);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (pfd.revents &amp; G_IO_HUP) {<br>
&gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; index d42ce6d8b8..bb3187244f 100644<br>
&gt; --- a/hw/9pfs/9p-local.c<br>
&gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; @@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V=
9fsPath *fs_path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsize =3D read(fd, (void *)=
buf, bufsz);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (tsize =3D=3D -1 &amp;&amp; errno=
 =3D=3D EINTR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tsize =3D RETRY_ON_EINTR(read(fd, (void *=
)buf, bufsz));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_preserve_errno(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if ((fs_ctx-&gt;export_flags &amp; V9FS_SM_=
PASSTHROUGH) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fs_ctx-&=
gt;export_flags &amp; V9FS_SM_NONE)) {<br>
&gt; @@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const =
char *oldpath,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Write the oldpath (target) to the=
 file. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldpath_size =3D strlen(oldpath);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_size =3D write(fd, (v=
oid *)oldpath, oldpath_size);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (write_size =3D=3D -1 &amp;&amp; =
errno =3D=3D EINTR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_size =3D RETRY_ON_EINTR(write(fd, (=
void *)oldpath, oldpath_size));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_preserve_errno(fd);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (write_size !=3D oldpath_size) {<=
br>
&gt; diff --git a/net/l2tpv3.c b/net/l2tpv3.c<br>
&gt; index af373e5c30..e0726f5f89 100644<br>
&gt; --- a/net/l2tpv3.c<br>
&gt; +++ b/net/l2tpv3.c<br>
&gt; @@ -240,9 +240,7 @@ static ssize_t net_l2tpv3_receive_dgram_iov(NetCli=
entState *nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 message.msg_control =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 message.msg_controllen =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 message.msg_flags =3D 0;<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sendmsg(s-&gt;fd, &amp;message, 0=
);<br>
&gt; -=C2=A0 =C2=A0 } while ((ret =3D=3D -1) &amp;&amp; (errno =3D=3D EINTR=
));<br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(sendmsg(s-&gt;fd, &amp;message, =
0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &gt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret -=3D s-&gt;offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (ret =3D=3D 0) {<br>
&gt; @@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientS=
tate *nc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 message.msg_control =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 message.msg_controllen =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 message.msg_flags =3D 0;<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sendmsg(s-&gt;fd, &amp;message, 0=
);<br>
&gt; -=C2=A0 =C2=A0 } while ((ret =3D=3D -1) &amp;&amp; (errno =3D=3D EINTR=
));<br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(sendmsg(s-&gt;fd, &amp;message, =
0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &gt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret -=3D s-&gt;offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (ret =3D=3D 0) {<br>
&gt; @@ -434,12 +430,9 @@ static void net_l2tpv3_send(void *opaque)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 msgvec =3D s-&gt;msgvec + s-&gt;queue_head;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (target_count &gt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D recvmmsg(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fd,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgvec,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_count,=
 MSG_DONTWAIT, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while ((count =3D=3D -1) &amp;&amp; (er=
rno =3D=3D EINTR));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recvmmsg(s-&g=
t;fd, msgvec, target_count, MSG_DONTWAIT, NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (count &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Recv error - we sti=
ll need to flush packets here,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (re)set queue =
head to current position<br>
&gt; diff --git a/net/socket.c b/net/socket.c<br>
&gt; index bfd8596250..00f8a88531 100644<br>
&gt; --- a/net/socket.c<br>
&gt; +++ b/net/socket.c<br>
&gt; @@ -117,15 +117,13 @@ static ssize_t net_socket_receive_dgram(NetClien=
tState *nc, const uint8_t *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NetSocketState *s =3D DO_UPCAST(NetSocketState, nc=
, nc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssize_t ret;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;dgram_dst.sin_family !=3D AF_UN=
IX) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sendto(s-&gt;fd, bu=
f, size, 0,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(struct sockaddr *)&amp;s-&gt;dgram_dst,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0sizeof(s-&gt;dgram_dst));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D send(s-&gt;fd, buf,=
 size, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;dgram_dst.sin_family !=3D AF_UNIX ?=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sendto(s-&gt;fd, buf, size,=
 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(struct sockaddr *)&amp;s-&gt;dgram_dst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sizeof(s-&gt;dgram_dst)) :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send(s-&gt;fd, buf, size, 0=
)<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1 &amp;&amp; errno =3D=3D EAGAIN) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 net_socket_write_poll(s, true);<br>
&gt; diff --git a/net/tap.c b/net/tap.c<br>
&gt; index e090d14203..4c90f70b7e 100644<br>
&gt; --- a/net/tap.c<br>
&gt; +++ b/net/tap.c<br>
&gt; @@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const=
 struct iovec *iov, int iovcnt<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssize_t len;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D writev(s-&gt;fd, iov, iovcnt);<br=
>
&gt; -=C2=A0 =C2=A0 } while (len =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 len =3D RETRY_ON_EINTR(writev(s-&gt;fd, iov, iovcnt));<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (len =3D=3D -1 &amp;&amp; errno =3D=3D EAGAIN) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tap_write_poll(s, true);<br>
&gt; @@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helpe=
r, const char *bridge,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sv[1]);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D recv_fd(sv[0]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (fd =3D=3D -1 &amp;&amp; errno =
=3D=3D EINTR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D RETRY_ON_EINTR(recv_fd(sv[0]));<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_errno =3D errno;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(sv[0]);<br>
&gt; diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
&gt; index eea819cff0..95753f7c96 100644<br>
&gt; --- a/qga/commands-posix.c<br>
&gt; +++ b/qga/commands-posix.c<br>
&gt; @@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Er=
ror **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 *status =3D 0;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpid =3D waitpid(pid, status, 0);<br>
&gt; -=C2=A0 =C2=A0 } while (rpid =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);=
<br>
&gt; +=C2=A0 =C2=A0 rpid =3D RETRY_ON_EINTR(waitpid(pid, status, 0));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (rpid =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;=
failed to wait for child (pid: %d)&quot;,<br>
&gt; diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c<br>
&gt; index 508a0ad88c..5893c760c5 100644<br>
&gt; --- a/semihosting/syscalls.c<br>
&gt; +++ b/semihosting/syscalls.c<br>
&gt; @@ -317,9 +317,7 @@ static void host_read(CPUState *cs, gdb_syscall_co=
mplete_cb complete,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 complete(cs, -1, EFAULT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D read(gf-&gt;hostfd, ptr, len);<br=
>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(read(gf-&gt;hostfd, ptr, len));<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 complete(cs, -1, errno);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(ptr, buf, 0);<br>
&gt; diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
&gt; index 90648eb8d1..86f1091e78 100644<br>
&gt; --- a/tests/qtest/libqtest.c<br>
&gt; +++ b/tests/qtest/libqtest.c<br>
&gt; @@ -101,10 +101,10 @@ static int socket_accept(int sock)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 addrlen =3D sizeof(addr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D accept(sock, (struct sockaddr *)&=
amp;addr, &amp;addrlen);<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 addrlen =3D sizeof(addr);<br>
<br>
That assignment was intentionally inside the loop, because the 3rd argument=
 of<br>
accept() is a result parameter, so the value of `addrlen` gets modified and=
<br>
hence `addrlen` has to be restored in each loop cycle.<br>
<br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 accept(sock, (struct sockaddr *)&amp;addr=
, &amp;addrlen)<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s failed: %s\=
n&quot;, __func__, strerror(errno));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -574,9 +574,7 @@ int qtest_socket_server(const char *socket_path)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 addr.sun_family =3D AF_UNIX;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 snprintf(addr.sun_path, sizeof(addr.sun_path), &qu=
ot;%s&quot;, socket_path);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D bind(sock, (struct sockaddr *)&am=
p;addr, sizeof(addr));<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(bind(sock, (struct sockaddr *)&a=
mp;addr, sizeof(addr)));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(ret, !=3D, -1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D listen(sock, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(ret, !=3D, -1);<br>
&gt; diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c<br>
&gt; index fecdf915e7..a5c711b1de 100644<br>
&gt; --- a/tests/vhost-user-bridge.c<br>
&gt; +++ b/tests/vhost-user-bridge.c<br>
&gt; @@ -331,9 +331,7 @@ vubr_backend_recv_cb(int sock, void *ctx)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_iovlen =3D num,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_flags =3D MSG_DON=
TWAIT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D recvmsg(vubr-&gt;ba=
ckend_udp_sock, &amp;msg, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; (errno =
=3D=3D EINTR));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(recvmsg(vubr-&gt;b=
ackend_udp_sock, &amp;msg, 0));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iov_restore_front(elem=
-&gt;in_sg, sg, hdrlen);<br>
&gt; diff --git a/util/main-loop.c b/util/main-loop.c<br>
&gt; index f00a25451b..63bd5d123d 100644<br>
&gt; --- a/util/main-loop.c<br>
&gt; +++ b/util/main-loop.c<br>
&gt; @@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssize_t len;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 while (1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D read(fd, &amp;info,=
 sizeof(info));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (len =3D=3D -1 &amp;&amp; errno =
=3D=3D EINTR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D RETRY_ON_EINTR(read(fd, &amp;info=
, sizeof(info)));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D -1 &amp;&amp; errno =
=3D=3D EAGAIN) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; diff --git a/util/osdep.c b/util/osdep.c<br>
&gt; index 746d5f7d71..aa358bd65e 100644<br>
&gt; --- a/util/osdep.c<br>
&gt; +++ b/util/osdep.c<br>
&gt; @@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, =
int64_t len, int fl_type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .l_type=C2=A0 =C2=A0=3D fl_type,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_probe_lock_ops();<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fcntl(fd, fcntl_op_setlk, &amp;fl=
);<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(fcntl(fd, fcntl_op_setlk, &amp;f=
l));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret =3D=3D -1 ? -errno : 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c<br>
&gt; index 5ba01177bf..1a9b338cf9 100644<br>
&gt; --- a/util/vfio-helpers.c<br>
&gt; +++ b/util/vfio-helpers.c<br>
&gt; @@ -240,9 +240,9 @@ static int qemu_vfio_pci_read_config(QEMUVFIOState=
 *s, void *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config=
_region_info.offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config=
_region_info.size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(s-&gt;config_region_info.of=
fset + ofs, size));<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D pread(s-&gt;device, buf, size, s-=
&gt;config_region_info.offset + ofs);<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pread(s-&gt;device, buf, size, s-&gt;conf=
ig_region_info.offset + ofs)<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret =3D=3D size ? 0 : -errno;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -254,9 +254,9 @@ static int qemu_vfio_pci_write_config(QEMUVFIOStat=
e *s, void *buf, int size, int<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;=
config_region_info.offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;=
config_region_info.size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(QEMU_IS_ALIGNED(s-&gt;config_region_info.of=
fset + ofs, size));<br>
&gt; -=C2=A0 =C2=A0 do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D pwrite(s-&gt;device, buf, size, s=
-&gt;config_region_info.offset + ofs);<br>
&gt; -=C2=A0 =C2=A0 } while (ret =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<=
br>
&gt; +=C2=A0 =C2=A0 ret =3D RETRY_ON_EINTR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwrite(s-&gt;device, buf, size, s-&gt;con=
fig_region_info.offset + ofs)<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret =3D=3D size ? 0 : -errno;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Iva=
nov</b> | C developer</div><div><b>Telephone:</b> +79140870696<br></div><di=
v><div><b>Telephone:</b>=C2=A0+79015053149</div></div></div></div>

--000000000000de4eda05ebaffbfc--

