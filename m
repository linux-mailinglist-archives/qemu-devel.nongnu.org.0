Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE451C448
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:52:49 +0200 (CEST)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdmY-0001cD-Mc
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmddA-0008Ef-Gn
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:43:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:43585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmdd7-0004iM-Om
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651765381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7mnP/YWpJ0pguqiwYlD+6Wp5k+ckRfnIXptmpfcTKw=;
 b=RxWcScD7n+fg74y2t6XeTCg/VC4aS81jDX9dwm1oYYvkusDZByW37mXdC2R5lJpNWOqSbR
 Zo+2TijWa+TTQHNhq8tKx1R4ZQCWbJ0Fh4X+Pk5nJH86tZtfV1ig9j3uXDX5plvzmcRkHT
 B2NJXZoK+341aGMFRrDdRO4bwfsg8eE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-Oz4y4MVJNRyMEcdfQKTG0Q-1; Thu, 05 May 2022 11:42:59 -0400
X-MC-Unique: Oz4y4MVJNRyMEcdfQKTG0Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 go17-20020a1709070d9100b006f46e53a2a9so2851902ejc.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 08:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z7mnP/YWpJ0pguqiwYlD+6Wp5k+ckRfnIXptmpfcTKw=;
 b=H0vKXjvnOY9HTcA47RbkT3dhXsCI/yWuA7FXhJCmKn5W5jaxKj5H6d1o0skWLJEsgx
 sFx/5mAPT80civTR8jx4HtNmuCGehF+FVhZ8sDAtZtirJzMTQgdcqq9EldfNsxHcKDLk
 aGyAcM5p1NJpPh8fXfycHooDBZ0Yu/WQQXjCS0ymxNt1sx2hf1DkErPiy9c6qfthwDTL
 DEeWFHOaaqOgVrBrdNY3iRCfOJ74kY6anCEh95H/NS5XlAwkZCpCTXKSBrqxS7+sbbi7
 4emhsBrb6az6+x5NJCQiJ9eqvqgORuczUZTnBNp/bFv35ih6n8/iW41AoLgSCk5Hg/zn
 eWLQ==
X-Gm-Message-State: AOAM532fHLs/Ah1goclmL5n/YFw0vH/dUjkY7KdwS69w/Q8R5A5NUNvC
 lg9ZFXOHyKV3uEDrf93w3BsTdYTciydR9JN7NaCSG9nLpXb20z9NaICJ+BgD7dLEHSuMAZ8I7eZ
 EySkDHpo1XC1xWU0Mq6SouuOT9m5XgW8=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr30612843edb.118.1651765378511; 
 Thu, 05 May 2022 08:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3pyV0NGgs3Al4LobewdloCpCU9+RfzJqECfFEGcuA0fgiCfGHfkFrU2WtsTu6URSs9pB6nj9x1wEPWFdbJQM=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr30612802edb.118.1651765378214; Thu, 05
 May 2022 08:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-3-leobras@redhat.com>
 <YnOFUnA439GftKyQ@redhat.com>
In-Reply-To: <YnOFUnA439GftKyQ@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 5 May 2022 12:42:47 -0300
Message-ID: <CAJ6HWG7ZAPqyszS_ZGA_JH3jvQUpsZD=zQ8ismHtgq_PiSYRgw@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.74; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 5, 2022 at 5:05 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Wed, May 04, 2022 at 04:18:31PM -0300, Leonardo Bras wrote:
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
> > ---
> >  include/io/channel-socket.h |   2 +
> >  io/channel-socket.c         | 120 ++++++++++++++++++++++++++++++++++--
> >  2 files changed, 118 insertions(+), 4 deletions(-)
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
> > index 696a04dc9c..ae756ce166 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -25,9 +25,25 @@
> >  #include "io/channel-watch.h"
> >  #include "trace.h"
> >  #include "qapi/clone-visitor.h"
> > +#ifdef CONFIG_LINUX
> > +#include <linux/errqueue.h>
> > +#include <sys/socket.h>
> > +#endif
> >
> >  #define SOCKET_MAX_FDS 16
> >
> > +/*
> > + * Zero-copy defines bellow are included to avoid breaking builds on s=
ystems
> > + * that don't support MSG_ZEROCOPY, while keeping the functions more r=
eadable
> > + * (without a lot of ifdefs).
> > + */
> > +#ifndef MSG_ZEROCOPY
> > +#define MSG_ZEROCOPY 0x4000000
> > +#endif
> > +#ifndef SO_ZEROCOPY
> > +#define SO_ZEROCOPY 60
> > +#endif
>
> Please put these behind CONFIG_LINUX to make it clear to readers that
> this is entirely Linux specific
>
>
> > +
> >  SocketAddress *
> >  qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
> >                                       Error **errp)
> > @@ -54,6 +70,8 @@ qio_channel_socket_new(void)
> >
> >      sioc =3D QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
> >      sioc->fd =3D -1;
> > +    sioc->zero_copy_queued =3D 0;
> > +    sioc->zero_copy_sent =3D 0;
> >
> >      ioc =3D QIO_CHANNEL(sioc);
> >      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> > @@ -153,6 +171,16 @@ int qio_channel_socket_connect_sync(QIOChannelSock=
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
> > @@ -533,6 +561,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel=
 *ioc,
> >      char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
> >      size_t fdsize =3D sizeof(int) * nfds;
> >      struct cmsghdr *cmsg;
> > +    int sflags =3D 0;
> >
> >      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> >
> > @@ -557,15 +586,27 @@ static ssize_t qio_channel_socket_writev(QIOChann=
el *ioc,
> >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> >      }
> >
> > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > +        sflags =3D MSG_ZEROCOPY;
> > +    }
>
> Also should be behind CONFIG_LINUX


Hello Daniel,

But what if this gets compiled in a Linux system without MSG_ZEROCOPY suppo=
rt?
As qapi will have zero-copy-send as an option we could have this scenario:

- User request migration using zero-copy-send
- multifd_save_setup() will set write_flags =3D QIO_CHANNEL_WRITE_FLAG_ZERO=
_COPY
- In qio_channel_socket_connect_sync(): setsockopt() part will be
compiled-out, so no error here
- above part in qio_channel_socket_writev() will be commented-out,
which means write_flags will be ignored
- sflags will not contain MSG_ZEROCOPY, so sendmsg() will use copy-mode
- migration will succeed

In the above case, the user has all the reason to think migration is
using MSG_ZEROCOPY, but in fact it's quietly falling back to
copy-mode.

That's why I suggested creating a 'global' config usiing SO_ZEROCOPY &
MSG_ZEROCOPY & CONFIG_LINUX so we can use in qapi and have no chance
of even offering zero-copy-send if we don't have it.

Another local option is to do implement your suggestions, and also
change qio_channel_socket_connect_sync() so it returns an error if
MSG_ZEROCOPY && SO_ZEROCOPY is not present, such as:

+#ifdef CONFIG_LINUX
+#if defined(MSG_ZEROCOPY)  && defined(SO_ZEROCOPY)
+    int ret, v =3D 1;
+    ret =3D setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret =3D=3D 0) {
+        /* Zero copy available on host */
+        qio_channel_set_feature(QIO_CHANNEL(ioc),
+                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
+    }
+#else
+    error_setg_errno(errp, errno,"MSG_ZEROCOPY not available");
+    return -1;
+#endif
+#endif

What do you think?

Best regards,
Leo

>
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
>
> And this ENOBUGS case behind CONFIG_LINUX
>


[...]


