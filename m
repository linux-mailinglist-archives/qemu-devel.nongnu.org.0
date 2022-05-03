Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD8517FE3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:41:09 +0200 (CEST)
Received: from localhost ([::1]:40124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlo5k-00034I-Ad
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nlnvn-0005i8-In
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:30:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nlnvk-0002kj-Tz
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651566647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fk0kXtx1yy5ESXt7uuhYQh9Hn2VZHndrTssTIOquqKE=;
 b=ccWulo0yWwzziniZ7y7KaFoejzDmXwm8mBLEa0YMkD6QudbJzmUJGTrKf88JescPgIA1iC
 365HpnQDcji2V6Sxhl6dYtiWlEpBU4B6SJ3Vw4io/TeldcgGidBWVEcHutQ7+64LIdL+pM
 wKhAYFkbSw+6XZB/z6ZJ+x/YZqJgxmY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-9mySmd3uNPm4ijdUE2zUCg-1; Tue, 03 May 2022 04:30:46 -0400
X-MC-Unique: 9mySmd3uNPm4ijdUE2zUCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so1019124wme.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 01:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fk0kXtx1yy5ESXt7uuhYQh9Hn2VZHndrTssTIOquqKE=;
 b=B6fQvhieekdb+pIG4oiPe0papEPniKFE068Kyd72Q4xJfmKAb7e1Om4uQ0s0taP/kT
 QuiNAp7oYcbATSbYWk1yU2lYkREe9cEfGkxi2ccJc2vE1yRShXF2CI+QKMJ3h8WLMP2Y
 OQoqW6Q2Nk8dg3/92YroGZ5kklRWEQ1n/WNnBZiXxpqpMgasiXmaoFRCyevsi+AaGwUo
 gaSepa40JdFIxnI82gg+a3pNOutWADHIeS/JPSjMFGtJDU5rrcmGR2b8OAjdg0SytsG1
 nojA5mi35o+ChW2KfSxcPHqLbQDCr4H/1aNsl4f/wsrNWsMdYZLxh0r8P1rswmTRs+zC
 rzzA==
X-Gm-Message-State: AOAM5305LuWtyef1mqmPOZjAJYTyFe1Rv8CzOJD1ScjtkzfqZ9sntvkg
 YGyiF9u8cl1IlTyfp/q/mjyPmgRd5exHWabtxTfO8wAAWyFouIpBtYCTgCKWFNjxS9q3chpaAC4
 3okxW8P5H/GMuO1g=
X-Received: by 2002:a05:6000:507:b0:20a:a549:d3ab with SMTP id
 a7-20020a056000050700b0020aa549d3abmr11494825wrf.243.1651566645386; 
 Tue, 03 May 2022 01:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/shb6SWHUR2Lh5ugQk8+x+x9PkFOnCRR1S2FaoDxxZvCxz0EuZGtnvh2m8iwSYH8GfeeBZQ==
X-Received: by 2002:a05:6000:507:b0:20a:a549:d3ab with SMTP id
 a7-20020a056000050700b0020aa549d3abmr11494800wrf.243.1651566644963; 
 Tue, 03 May 2022 01:30:44 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b0039429bfebebsm3098329wms.3.2022.05.03.01.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:30:44 -0700 (PDT)
Date: Tue, 3 May 2022 09:30:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Daniel Berrange <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PULL 06/11] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnDoMiV3w1lJ+vmj@work-vm>
References: <20220428144052.263382-1-dgilbert@redhat.com>
 <20220428144052.263382-7-dgilbert@redhat.com>
 <Ymq+5bPaYTyUHF6L@work-vm>
 <CAJ6HWG5Mm_O3NqkNkzBryj0nNhTRZWYxSTXKO_40=WbFUmzXAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ6HWG5Mm_O3NqkNkzBryj0nNhTRZWYxSTXKO_40=WbFUmzXAQ@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Leonardo Bras Soares Passos (lsoaresp@redhat.com) wrote:
> Hello Dave,
> 
> On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Leo:
> >   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
> > one I guess is the simpler one; I think Stefanha managed to find the
> > liburing fix for the __kernel_timespec case, but that looks like a bit
> > more fun!
> >
> > Dave
> 
> About MSG_ZEROCOPY error:
> 
> I tracked down how the test happened, downloaded the same docker image from the
> tests(opensuse-leap-15.2), and took a look at the filesystem for the
> MSG_ZEROCOPY define, which I could not find anywhere.
> 
> Then I took a look into /usr/include/bits/socket.h, which is where RHEL has
> MSG_ZEROCOPY defined. Zypper defines it as been provided by glibc-devel, which
> is versioned at 2.26-lp152.26.12.1.
> 
> I then took a look at https://sourceware.org/git/glibc.git, and found commit
> 78cde19f62 that introduces MSG_ZEROCOPY. The first version that has this commit
> is glibc-2.27.
> 
> So, basically, this means opensuse-leap-15.2 glibc version does not support
> MSG_ZEROCOPY. Based on that, I had a few ideas on how to solve the CI bug:
> 1 - Propose a backport of this patch (few comments +  single define) for
> leap-15.x, wait for them to accept and update the version in qemu CI.
> (TBH I have no idea how the opensuse community works, I just suppose it could
> be a way of tackling this.)
> 2 - include an #ifndef MSG_ZEROCOPY #define MSG_ZEROCOPY 0x4000000 #endif in
> code, which is ugly IMHO, but will be fast and clean.
> 3 - In CI, patch /usr/include/bits/socket.h before building, which will also
> work fine, but defeats the purpose of keeping qemu building on the platform.
> 
> Among the above, I would go with (2), as it seems a reasonable way of dealing
> with this.

Right we need to run on the current set of distros, so we need to do
(2); it's not clear if we need to make trying to enable the feature fail
if the host doesn't support it.

Now, having said that, you might also want to file an Opensuse bug
suggesting they do (1).

Dave

> Does anyone else have any further suggestions, or know how this kind of issue
> is generally solved in qemu?
> 
> Best regards,
> Leo
> 
> 
> >
> >
> > Job #2390848140 ( https://gitlab.com/dagrh/qemu/-/jobs/2390848140/raw )
> > Name: build-system-alpine
> > In file included from /usr/include/linux/errqueue.h:6,
> >                  from ../io/channel-socket.c:29:
> > /usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __kernel_timespec'
> >     7 | struct __kernel_timespec {
> >       |        ^~~~~~~~~~~~~~~~~
> > In file included from /usr/include/liburing.h:19,
> >                  from /builds/dagrh/qemu/include/block/aio.h:18,
> >                  from /builds/dagrh/qemu/include/io/channel.h:26,
> >                  from /builds/dagrh/qemu/include/io/channel-socket.h:24,
> >                  from ../io/channel-socket.c:24:
> > /usr/include/liburing/compat.h:9:8: note: originally defined here
> >     9 | struct __kernel_timespec {
> >       |        ^~~~~~~~~~~~~~~~~
> >
> > ----
> > Name: build-system-opensuse
> >
> > https://gitlab.com/dagrh/qemu/-/jobs/2390848160/raw
> > ../io/channel-socket.c: In function â€˜qio_channel_socket_writevâ€™:
> > ../io/channel-socket.c:578:18: error: â€˜MSG_ZEROCOPYâ€™ undeclared (first use in this function); did you mean â€˜SO_ZEROCOPYâ€™?
> >          sflags = MSG_ZEROCOPY;
> >                   ^~~~~~~~~~~~
> >                   SO_ZEROCOPY
> > ../io/channel-socket.c:578:18: note: each undeclared identifier is reported only once for each function it appears in
> >
> > * Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> > > From: Leonardo Bras <leobras@redhat.com>
> > >
> > > For CONFIG_LINUX, implement the new zero copy flag and the optional callback
> > > io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> > > feature is available in the host kernel, which is checked on
> > > qio_channel_socket_connect_sync()
> > >
> > > qio_channel_socket_flush() was implemented by counting how many times
> > > sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> > > socket's error queue, in order to find how many of them finished sending.
> > > Flush will loop until those counters are the same, or until some error occurs.
> > >
> > > Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> > > 1: Buffer
> > > - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> > > some caution is necessary to avoid overwriting any buffer before it's sent.
> > > If something like this happen, a newer version of the buffer may be sent instead.
> > > - If this is a problem, it's recommended to call qio_channel_flush() before freeing
> > > or re-using the buffer.
> > >
> > > 2: Locked memory
> > > - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> > > unlocked after it's sent.
> > > - Depending on the size of each buffer, and how often it's sent, it may require
> > > a larger amount of locked memory than usually available to non-root user.
> > > - If the required amount of locked memory is not available, writev_zero_copy
> > > will return an error, which can abort an operation like migration,
> > > - Because of this, when an user code wants to add zero copy as a feature, it
> > > requires a mechanism to disable it, so it can still be accessible to less
> > > privileged users.
> > >
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > > Message-Id: <20220426230654.637939-3-leobras@redhat.com>
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  include/io/channel-socket.h |   2 +
> > >  io/channel-socket.c         | 108 ++++++++++++++++++++++++++++++++++--
> > >  2 files changed, 106 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> > > index e747e63514..513c428fe4 100644
> > > --- a/include/io/channel-socket.h
> > > +++ b/include/io/channel-socket.h
> > > @@ -47,6 +47,8 @@ struct QIOChannelSocket {
> > >      socklen_t localAddrLen;
> > >      struct sockaddr_storage remoteAddr;
> > >      socklen_t remoteAddrLen;
> > > +    ssize_t zero_copy_queued;
> > > +    ssize_t zero_copy_sent;
> > >  };
> > >
> > >
> > > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > > index 696a04dc9c..1dd85fc1ef 100644
> > > --- a/io/channel-socket.c
> > > +++ b/io/channel-socket.c
> > > @@ -25,6 +25,10 @@
> > >  #include "io/channel-watch.h"
> > >  #include "trace.h"
> > >  #include "qapi/clone-visitor.h"
> > > +#ifdef CONFIG_LINUX
> > > +#include <linux/errqueue.h>
> > > +#include <bits/socket.h>
> > > +#endif
> > >
> > >  #define SOCKET_MAX_FDS 16
> > >
> > > @@ -54,6 +58,8 @@ qio_channel_socket_new(void)
> > >
> > >      sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
> > >      sioc->fd = -1;
> > > +    sioc->zero_copy_queued = 0;
> > > +    sioc->zero_copy_sent = 0;
> > >
> > >      ioc = QIO_CHANNEL(sioc);
> > >      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> > > @@ -153,6 +159,16 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> > >          return -1;
> > >      }
> > >
> > > +#ifdef CONFIG_LINUX
> > > +    int ret, v = 1;
> > > +    ret = setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> > > +    if (ret == 0) {
> > > +        /* Zero copy available on host */
> > > +        qio_channel_set_feature(QIO_CHANNEL(ioc),
> > > +                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
> > > +    }
> > > +#endif
> > > +
> > >      return 0;
> > >  }
> > >
> > > @@ -533,6 +549,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >      char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
> > >      size_t fdsize = sizeof(int) * nfds;
> > >      struct cmsghdr *cmsg;
> > > +    int sflags = 0;
> > >
> > >      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> > >
> > > @@ -557,15 +574,27 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > >      }
> > >
> > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > +        sflags = MSG_ZEROCOPY;
> > > +    }
> > > +
> > >   retry:
> > > -    ret = sendmsg(sioc->fd, &msg, 0);
> > > +    ret = sendmsg(sioc->fd, &msg, sflags);
> > >      if (ret <= 0) {
> > > -        if (errno == EAGAIN) {
> > > +        switch (errno) {
> > > +        case EAGAIN:
> > >              return QIO_CHANNEL_ERR_BLOCK;
> > > -        }
> > > -        if (errno == EINTR) {
> > > +        case EINTR:
> > >              goto retry;
> > > +        case ENOBUFS:
> > > +            if (sflags & MSG_ZEROCOPY) {
> > > +                error_setg_errno(errp, errno,
> > > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > > +                return -1;
> > > +            }
> > > +            break;
> > >          }
> > > +
> > >          error_setg_errno(errp, errno,
> > >                           "Unable to write to socket");
> > >          return -1;
> > > @@ -659,6 +688,74 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >  }
> > >  #endif /* WIN32 */
> > >
> > > +
> > > +#ifdef CONFIG_LINUX
> > > +static int qio_channel_socket_flush(QIOChannel *ioc,
> > > +                                    Error **errp)
> > > +{
> > > +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> > > +    struct msghdr msg = {};
> > > +    struct sock_extended_err *serr;
> > > +    struct cmsghdr *cm;
> > > +    char control[CMSG_SPACE(sizeof(*serr))];
> > > +    int received;
> > > +    int ret = 1;
> > > +
> > > +    msg.msg_control = control;
> > > +    msg.msg_controllen = sizeof(control);
> > > +    memset(control, 0, sizeof(control));
> > > +
> > > +    while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> > > +        received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > > +        if (received < 0) {
> > > +            switch (errno) {
> > > +            case EAGAIN:
> > > +                /* Nothing on errqueue, wait until something is available */
> > > +                qio_channel_wait(ioc, G_IO_ERR);
> > > +                continue;
> > > +            case EINTR:
> > > +                continue;
> > > +            default:
> > > +                error_setg_errno(errp, errno,
> > > +                                 "Unable to read errqueue");
> > > +                return -1;
> > > +            }
> > > +        }
> > > +
> > > +        cm = CMSG_FIRSTHDR(&msg);
> > > +        if (cm->cmsg_level != SOL_IP &&
> > > +            cm->cmsg_type != IP_RECVERR) {
> > > +            error_setg_errno(errp, EPROTOTYPE,
> > > +                             "Wrong cmsg in errqueue");
> > > +            return -1;
> > > +        }
> > > +
> > > +        serr = (void *) CMSG_DATA(cm);
> > > +        if (serr->ee_errno != SO_EE_ORIGIN_NONE) {
> > > +            error_setg_errno(errp, serr->ee_errno,
> > > +                             "Error on socket");
> > > +            return -1;
> > > +        }
> > > +        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
> > > +            error_setg_errno(errp, serr->ee_origin,
> > > +                             "Error not from zero copy");
> > > +            return -1;
> > > +        }
> > > +
> > > +        /* No errors, count successfully finished sendmsg()*/
> > > +        sioc->zero_copy_sent += serr->ee_data - serr->ee_info + 1;
> > > +
> > > +        /* If any sendmsg() succeeded using zero copy, return 0 at the end */
> > > +        if (serr->ee_code != SO_EE_CODE_ZEROCOPY_COPIED) {
> > > +            ret = 0;
> > > +        }
> > > +    }
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +#endif /* CONFIG_LINUX */
> > > +
> > >  static int
> > >  qio_channel_socket_set_blocking(QIOChannel *ioc,
> > >                                  bool enabled,
> > > @@ -789,6 +886,9 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
> > >      ioc_klass->io_set_delay = qio_channel_socket_set_delay;
> > >      ioc_klass->io_create_watch = qio_channel_socket_create_watch;
> > >      ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
> > > +#ifdef CONFIG_LINUX
> > > +    ioc_klass->io_flush = qio_channel_socket_flush;
> > > +#endif
> > >  }
> > >
> > >  static const TypeInfo qio_channel_socket_info = {
> > > --
> > > 2.35.1
> > >
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


