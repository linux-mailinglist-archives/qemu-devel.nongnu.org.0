Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E905159DD
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 04:42:14 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkd3k-0003gH-Vk
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 22:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nkd2e-00030m-Ke
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 22:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nkd2a-0002AI-G1
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 22:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651286458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y07EjQsSYnNJL7A6GvkJcy7yk48zcHiTjBeo2BJZEnY=;
 b=b3SpatrC3CDXbu5BF4aMAEXSWfyALYXr7U3+rLZnhCZGiWU+UecgdASRJ0/6bGxG7TyvOr
 e800HMA2hpA6QFT2xGvR3/prw/OJvz/Fq3t7q04DMuPP3o5ZgDG58CkGxdgoUqKiZ2Ilnu
 Q/iDzewU8SPZMBvadjONkfcdIyI0L4k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-3hMZfdrPP0aOhAhyYggENA-1; Fri, 29 Apr 2022 22:40:57 -0400
X-MC-Unique: 3hMZfdrPP0aOhAhyYggENA-1
Received: by mail-ed1-f72.google.com with SMTP id
 dn26-20020a05640222fa00b00425e4b8efa9so5431954edb.1
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 19:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y07EjQsSYnNJL7A6GvkJcy7yk48zcHiTjBeo2BJZEnY=;
 b=tLR8sEiFvWI4GYdLZSnSfOrU6rNZQufdl4CiOj1cp7ZQaf4gp6Bev/k+gKcIEiUsuq
 /Xb1/9haUWMz/d7bs5qFomZwhoXyjPBtfyc2xDB1uE43xkIKoQEKm8kDFwvQCklAk3Iw
 qFWkwvEnUr7OZ2ThESTZaYfbXI2U3Vc95xX4EZZdXqvFYDtWOT541Sqg4HSMV1wfnKzN
 j5/6Jv2/QhnbM/8B87jH0MK1ic+ZMQ6Tsb69x5NyGJtl1ONFwdwCA4RKd1PnYUZ7QN3r
 FmU9ceOph9T8d9MeOsiCsRH2O8bvr93VE/Nc6wBmhEXnUqJ7tRn1jscQ9aEKyDj5AmSA
 9low==
X-Gm-Message-State: AOAM530CRg0X5yainLxU991ISyUcipptjOVoIa0oouuaJXq7CBoMJvLv
 evHDaL5z9Wb7Ff64jppKJQNzmUZAVILJ9eS9V3p3MrPv7TQOcYnGHA+9CkBedqeFbSqBT8jf1ux
 j93MSqMSBe0Zb21xXXGxpKJRZnuNut9w=
X-Received: by 2002:a17:907:8689:b0:6f3:de80:dc02 with SMTP id
 qa9-20020a170907868900b006f3de80dc02mr2045992ejc.331.1651286455865; 
 Fri, 29 Apr 2022 19:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqSGX9irGh0kYV5a0Gebk2EwKH9WkdPAxdf/IiatpZrdPgeLeowEAVaDvF8XCiXhhbycswvBAkU2zhR21RzD8=
X-Received: by 2002:a17:907:8689:b0:6f3:de80:dc02 with SMTP id
 qa9-20020a170907868900b006f3de80dc02mr2045974ejc.331.1651286455586; Fri, 29
 Apr 2022 19:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220428144052.263382-1-dgilbert@redhat.com>
 <20220428144052.263382-7-dgilbert@redhat.com>
 <Ymq+5bPaYTyUHF6L@work-vm>
In-Reply-To: <Ymq+5bPaYTyUHF6L@work-vm>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Fri, 29 Apr 2022 23:40:44 -0300
Message-ID: <CAJ6HWG5Mm_O3NqkNkzBryj0nNhTRZWYxSTXKO_40=WbFUmzXAQ@mail.gmail.com>
Subject: Re: [PULL 06/11] QIOChannelSocket: Implement io_writev zero copy flag
 & io_flush for CONFIG_LINUX
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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
Cc: Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Dave,

On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> Leo:
>   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
> one I guess is the simpler one; I think Stefanha managed to find the
> liburing fix for the __kernel_timespec case, but that looks like a bit
> more fun!
>
> Dave

About MSG_ZEROCOPY error:

I tracked down how the test happened, downloaded the same docker image from=
 the
tests(opensuse-leap-15.2), and took a look at the filesystem for the
MSG_ZEROCOPY define, which I could not find anywhere.

Then I took a look into /usr/include/bits/socket.h, which is where RHEL has
MSG_ZEROCOPY defined. Zypper defines it as been provided by glibc-devel, wh=
ich
is versioned at 2.26-lp152.26.12.1.

I then took a look at https://sourceware.org/git/glibc.git, and found commi=
t
78cde19f62 that introduces MSG_ZEROCOPY. The first version that has this co=
mmit
is glibc-2.27.

So, basically, this means opensuse-leap-15.2 glibc version does not support
MSG_ZEROCOPY. Based on that, I had a few ideas on how to solve the CI bug:
1 - Propose a backport of this patch (few comments +  single define) for
leap-15.x, wait for them to accept and update the version in qemu CI.
(TBH I have no idea how the opensuse community works, I just suppose it cou=
ld
be a way of tackling this.)
2 - include an #ifndef MSG_ZEROCOPY #define MSG_ZEROCOPY 0x4000000 #endif i=
n
code, which is ugly IMHO, but will be fast and clean.
3 - In CI, patch /usr/include/bits/socket.h before building, which will als=
o
work fine, but defeats the purpose of keeping qemu building on the platform=
.

Among the above, I would go with (2), as it seems a reasonable way of deali=
ng
with this.

Does anyone else have any further suggestions, or know how this kind of iss=
ue
is generally solved in qemu?

Best regards,
Leo


>
>
> Job #2390848140 ( https://gitlab.com/dagrh/qemu/-/jobs/2390848140/raw )
> Name: build-system-alpine
> In file included from /usr/include/linux/errqueue.h:6,
>                  from ../io/channel-socket.c:29:
> /usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __ker=
nel_timespec'
>     7 | struct __kernel_timespec {
>       |        ^~~~~~~~~~~~~~~~~
> In file included from /usr/include/liburing.h:19,
>                  from /builds/dagrh/qemu/include/block/aio.h:18,
>                  from /builds/dagrh/qemu/include/io/channel.h:26,
>                  from /builds/dagrh/qemu/include/io/channel-socket.h:24,
>                  from ../io/channel-socket.c:24:
> /usr/include/liburing/compat.h:9:8: note: originally defined here
>     9 | struct __kernel_timespec {
>       |        ^~~~~~~~~~~~~~~~~
>
> ----
> Name: build-system-opensuse
>
> https://gitlab.com/dagrh/qemu/-/jobs/2390848160/raw
> ../io/channel-socket.c: In function =C3=A2=E2=82=AC=CB=9Cqio_channel_sock=
et_writev=C3=A2=E2=82=AC=E2=84=A2:
> ../io/channel-socket.c:578:18: error: =C3=A2=E2=82=AC=CB=9CMSG_ZEROCOPY=
=C3=A2=E2=82=AC=E2=84=A2 undeclared (first use in this function); did you m=
ean =C3=A2=E2=82=AC=CB=9CSO_ZEROCOPY=C3=A2=E2=82=AC=E2=84=A2?
>          sflags =3D MSG_ZEROCOPY;
>                   ^~~~~~~~~~~~
>                   SO_ZEROCOPY
> ../io/channel-socket.c:578:18: note: each undeclared identifier is report=
ed only once for each function it appears in
>
> * Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> > From: Leonardo Bras <leobras@redhat.com>
> >
> > For CONFIG_LINUX, implement the new zero copy flag and the optional cal=
lback
> > io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> > feature is available in the host kernel, which is checked on
> > qio_channel_socket_connect_sync()
> >
> > qio_channel_socket_flush() was implemented by counting how many times
> > sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> > socket's error queue, in order to find how many of them finished sendin=
g.
> > Flush will loop until those counters are the same, or until some error =
occurs.
> >
> > Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> > 1: Buffer
> > - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid=
 copying,
> > some caution is necessary to avoid overwriting any buffer before it's s=
ent.
> > If something like this happen, a newer version of the buffer may be sen=
t instead.
> > - If this is a problem, it's recommended to call qio_channel_flush() be=
fore freeing
> > or re-using the buffer.
> >
> > 2: Locked memory
> > - When using MSG_ZERCOCOPY, the buffer memory will be locked after queu=
ed, and
> > unlocked after it's sent.
> > - Depending on the size of each buffer, and how often it's sent, it may=
 require
> > a larger amount of locked memory than usually available to non-root use=
r.
> > - If the required amount of locked memory is not available, writev_zero=
_copy
> > will return an error, which can abort an operation like migration,
> > - Because of this, when an user code wants to add zero copy as a featur=
e, it
> > requires a mechanism to disable it, so it can still be accessible to le=
ss
> > privileged users.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > Message-Id: <20220426230654.637939-3-leobras@redhat.com>
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  include/io/channel-socket.h |   2 +
> >  io/channel-socket.c         | 108 ++++++++++++++++++++++++++++++++++--
> >  2 files changed, 106 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> > index e747e63514..513c428fe4 100644
> > --- a/include/io/channel-socket.h
> > +++ b/include/io/channel-socket.h
> > @@ -47,6 +47,8 @@ struct QIOChannelSocket {
> >      socklen_t localAddrLen;
> >      struct sockaddr_storage remoteAddr;
> >      socklen_t remoteAddrLen;
> > +    ssize_t zero_copy_queued;
> > +    ssize_t zero_copy_sent;
> >  };
> >
> >
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index 696a04dc9c..1dd85fc1ef 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -25,6 +25,10 @@
> >  #include "io/channel-watch.h"
> >  #include "trace.h"
> >  #include "qapi/clone-visitor.h"
> > +#ifdef CONFIG_LINUX
> > +#include <linux/errqueue.h>
> > +#include <bits/socket.h>
> > +#endif
> >
> >  #define SOCKET_MAX_FDS 16
> >
> > @@ -54,6 +58,8 @@ qio_channel_socket_new(void)
> >
> >      sioc =3D QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
> >      sioc->fd =3D -1;
> > +    sioc->zero_copy_queued =3D 0;
> > +    sioc->zero_copy_sent =3D 0;
> >
> >      ioc =3D QIO_CHANNEL(sioc);
> >      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> > @@ -153,6 +159,16 @@ int qio_channel_socket_connect_sync(QIOChannelSock=
et *ioc,
> >          return -1;
> >      }
> >
> > +#ifdef CONFIG_LINUX
> > +    int ret, v =3D 1;
> > +    ret =3D setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> > +    if (ret =3D=3D 0) {
> > +        /* Zero copy available on host */
> > +        qio_channel_set_feature(QIO_CHANNEL(ioc),
> > +                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
> > +    }
> > +#endif
> > +
> >      return 0;
> >  }
> >
> > @@ -533,6 +549,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel=
 *ioc,
> >      char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
> >      size_t fdsize =3D sizeof(int) * nfds;
> >      struct cmsghdr *cmsg;
> > +    int sflags =3D 0;
> >
> >      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> >
> > @@ -557,15 +574,27 @@ static ssize_t qio_channel_socket_writev(QIOChann=
el *ioc,
> >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> >      }
> >
> > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > +        sflags =3D MSG_ZEROCOPY;
> > +    }
> > +
> >   retry:
> > -    ret =3D sendmsg(sioc->fd, &msg, 0);
> > +    ret =3D sendmsg(sioc->fd, &msg, sflags);
> >      if (ret <=3D 0) {
> > -        if (errno =3D=3D EAGAIN) {
> > +        switch (errno) {
> > +        case EAGAIN:
> >              return QIO_CHANNEL_ERR_BLOCK;
> > -        }
> > -        if (errno =3D=3D EINTR) {
> > +        case EINTR:
> >              goto retry;
> > +        case ENOBUFS:
> > +            if (sflags & MSG_ZEROCOPY) {
> > +                error_setg_errno(errp, errno,
> > +                                 "Process can't lock enough memory for=
 using MSG_ZEROCOPY");
> > +                return -1;
> > +            }
> > +            break;
> >          }
> > +
> >          error_setg_errno(errp, errno,
> >                           "Unable to write to socket");
> >          return -1;
> > @@ -659,6 +688,74 @@ static ssize_t qio_channel_socket_writev(QIOChanne=
l *ioc,
> >  }
> >  #endif /* WIN32 */
> >
> > +
> > +#ifdef CONFIG_LINUX
> > +static int qio_channel_socket_flush(QIOChannel *ioc,
> > +                                    Error **errp)
> > +{
> > +    QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > +    struct msghdr msg =3D {};
> > +    struct sock_extended_err *serr;
> > +    struct cmsghdr *cm;
> > +    char control[CMSG_SPACE(sizeof(*serr))];
> > +    int received;
> > +    int ret =3D 1;
> > +
> > +    msg.msg_control =3D control;
> > +    msg.msg_controllen =3D sizeof(control);
> > +    memset(control, 0, sizeof(control));
> > +
> > +    while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> > +        received =3D recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > +        if (received < 0) {
> > +            switch (errno) {
> > +            case EAGAIN:
> > +                /* Nothing on errqueue, wait until something is availa=
ble */
> > +                qio_channel_wait(ioc, G_IO_ERR);
> > +                continue;
> > +            case EINTR:
> > +                continue;
> > +            default:
> > +                error_setg_errno(errp, errno,
> > +                                 "Unable to read errqueue");
> > +                return -1;
> > +            }
> > +        }
> > +
> > +        cm =3D CMSG_FIRSTHDR(&msg);
> > +        if (cm->cmsg_level !=3D SOL_IP &&
> > +            cm->cmsg_type !=3D IP_RECVERR) {
> > +            error_setg_errno(errp, EPROTOTYPE,
> > +                             "Wrong cmsg in errqueue");
> > +            return -1;
> > +        }
> > +
> > +        serr =3D (void *) CMSG_DATA(cm);
> > +        if (serr->ee_errno !=3D SO_EE_ORIGIN_NONE) {
> > +            error_setg_errno(errp, serr->ee_errno,
> > +                             "Error on socket");
> > +            return -1;
> > +        }
> > +        if (serr->ee_origin !=3D SO_EE_ORIGIN_ZEROCOPY) {
> > +            error_setg_errno(errp, serr->ee_origin,
> > +                             "Error not from zero copy");
> > +            return -1;
> > +        }
> > +
> > +        /* No errors, count successfully finished sendmsg()*/
> > +        sioc->zero_copy_sent +=3D serr->ee_data - serr->ee_info + 1;
> > +
> > +        /* If any sendmsg() succeeded using zero copy, return 0 at the=
 end */
> > +        if (serr->ee_code !=3D SO_EE_CODE_ZEROCOPY_COPIED) {
> > +            ret =3D 0;
> > +        }
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +#endif /* CONFIG_LINUX */
> > +
> >  static int
> >  qio_channel_socket_set_blocking(QIOChannel *ioc,
> >                                  bool enabled,
> > @@ -789,6 +886,9 @@ static void qio_channel_socket_class_init(ObjectCla=
ss *klass,
> >      ioc_klass->io_set_delay =3D qio_channel_socket_set_delay;
> >      ioc_klass->io_create_watch =3D qio_channel_socket_create_watch;
> >      ioc_klass->io_set_aio_fd_handler =3D qio_channel_socket_set_aio_fd=
_handler;
> > +#ifdef CONFIG_LINUX
> > +    ioc_klass->io_flush =3D qio_channel_socket_flush;
> > +#endif
> >  }
> >
> >  static const TypeInfo qio_channel_socket_info =3D {
> > --
> > 2.35.1
> >
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>


