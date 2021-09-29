Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9A41CCAA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:33:03 +0200 (CEST)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfK9-0005Ah-SO
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfJ5-0004TW-6G
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfJ0-0003Sz-8T
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632943908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSUoIBNFc1sTbPaMkiX5TSUmeJC+Bd6BTcfo1XdFezs=;
 b=JXp91MbPXHGMxTZwD1TCDNt8cELGRm6mo+EtzDaY3BQSno7n9Osydkm9vN7hhoOBgAFzHp
 c86PagpWlvyV88tUsN/HriDArbEpw0EnwZz2dnwkL1D2Vfx47Bet2g/FnwyqeHA9+dIU5e
 BLibg9Ok/F1/3O0mrJCcy0KyJGRQTEo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-X0l0WoCgOeWGlGC3qMWbTQ-1; Wed, 29 Sep 2021 15:31:41 -0400
X-MC-Unique: X0l0WoCgOeWGlGC3qMWbTQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 i40-20020a0565123e2800b003f53da59009so3322909lfv.16
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aSUoIBNFc1sTbPaMkiX5TSUmeJC+Bd6BTcfo1XdFezs=;
 b=hpsXTFyulLIkYk87fcJkMnucBSw0GDjxXTH1vMITV7+27oZQO9TZLayaMlm6ELCPPv
 m0Gn9izTxliRakzqPEUxmuFCA985V3FoBUGeleT6giZv3sRaK7ZhUckv2zYB1DJ2n5ft
 zzkdrUasdeUpLtU9HwXdfEHghjy4hgY6rVN0R9+RxBEBGkWGLsZmYO3b0VaIJWBZ9mcU
 82jxsxXg5e00PXJhjd9V30YNowatEtBkHNOxht47CmVBGNehalQE/95sQvwR/gi51N84
 mK5imaOiuswgJa0wxYqsVaT3sh06dq6At08zKZCjmjqm2J+mTWMwpOylV73EVvogmeSM
 oOtw==
X-Gm-Message-State: AOAM530fJcDalrEHfzrck0tZlxjEBZEKhk/VWQG73qa+B41NYPGessZX
 EzFRe0K3Yj+UdyEYvTgAQQVRvHbjYR46obPw6jlPZ6zH78BISgzSXulxqX/7dEh70xob9sdsh3+
 acU184BCzRYSQhiQeF3lwcl5DUm6gYUQ=
X-Received: by 2002:a2e:b449:: with SMTP id o9mr1717654ljm.472.1632943900096; 
 Wed, 29 Sep 2021 12:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk0cAkGWee1cK+v212IkC/Ld8NBTmoymp9KejGtW4dICsTQ4hQlSVsEZAZ3BcdmPJDVVSaVSJsggdzg1xtXuE=
X-Received: by 2002:a2e:b449:: with SMTP id o9mr1717619ljm.472.1632943899628; 
 Wed, 29 Sep 2021 12:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-3-leobras@redhat.com>
 <YU4NKmq4KJkbmY97@redhat.com>
In-Reply-To: <YU4NKmq4KJkbmY97@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 29 Sep 2021 16:32:12 -0300
Message-ID: <CAJ6HWG7rWEFwt9zFr3piaCDMBf0sfawdXTqF-03A3SHz-R++sg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] QIOChannelSocket: Implement io_async_write &
 io_async_flush
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Fri, Sep 24, 2021 at 2:38 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
[...]
> > @@ -154,6 +171,19 @@ int qio_channel_socket_connect_sync(QIOChannelSock=
et *ioc,
> >          return -1;
> >      }
> >
> > +#ifdef CONFIG_LINUX
> > +    if (addr->type !=3D SOCKET_ADDRESS_TYPE_INET) {
> > +        return 0;
> > +    }
> > +
> > +    ret =3D qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v)=
);
> > +    if (ret >=3D 0) {
> > +        QIOChannelClass *klass =3D QIO_CHANNEL_GET_CLASS(ioc);
> > +        klass->io_async_writev =3D qio_channel_socket_async_writev;
> > +        klass->io_async_flush =3D qio_channel_socket_async_flush;
> > +    }
> > +#endif
>
> This is not write - the async APIs should not be tied 1:1 to ZEROCOPY
> usage - we should have them take a flag to request ZEROCOPY behaviour.

I agree, but I am not aware of how to do asynchronous send in a socket
without MSG_ZEROCOPY.

I mean, I know of the non-blocking send, but I am not sure how it
checks if everything was sent (i.e. the flush part).
Would it also be using the ERRQUEUE for that?

What would you suggest?

>
> > +
> >      return 0;
> >  }
> >
> > @@ -520,12 +550,13 @@ static ssize_t qio_channel_socket_readv(QIOChanne=
l *ioc,
> >      return ret;
> >  }
> >
> > -static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > -                                         const struct iovec *iov,
> > -                                         size_t niov,
> > -                                         int *fds,
> > -                                         size_t nfds,
> > -                                         Error **errp)
> > +static ssize_t __qio_channel_socket_writev(QIOChannel *ioc,
> > +                                           const struct iovec *iov,
> > +                                           size_t niov,
> > +                                           int *fds,
> > +                                           size_t nfds,
> > +                                           int flags,
> > +                                           Error **errp)
> >  {
> >      QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> >      ssize_t ret;
> > @@ -558,20 +589,145 @@ static ssize_t qio_channel_socket_writev(QIOChan=
nel *ioc,
> >      }
> >
> >   retry:
> > -    ret =3D sendmsg(sioc->fd, &msg, 0);
> > +    ret =3D sendmsg(sioc->fd, &msg, flags);
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
> > +            return QIO_CHANNEL_ERR_NOBUFS;
> >          }
> > +
> >          error_setg_errno(errp, errno,
> >                           "Unable to write to socket");
> >          return -1;
> >      }
> >      return ret;
> >  }
> > +
> > +static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > +                                         const struct iovec *iov,
> > +                                         size_t niov,
> > +                                         int *fds,
> > +                                         size_t nfds,
> > +                                         Error **errp)
> > +{
> > +    return __qio_channel_socket_writev(ioc, iov, niov, fds, nfds, 0, e=
rrp);
> > +}
> > +
> > +static ssize_t qio_channel_socket_async_writev(QIOChannel *ioc,
> > +                                               const struct iovec *iov=
,
> > +                                               size_t niov,
> > +                                               int *fds,
> > +                                               size_t nfds,
> > +                                               Error **errp)
> > +{
> > +    QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > +    ssize_t ret;
> > +
> > +    sioc->async_queued++;
> > +
> > +    ret =3D __qio_channel_socket_writev(ioc, iov, niov, fds, nfds, MSG=
_ZEROCOPY,
> > +                                       errp);
> > +    if (ret =3D=3D QIO_CHANNEL_ERR_NOBUFS) {
> > +        /*
> > +         * Not enough locked memory available to the process.
> > +         * Fallback to default sync callback.
> > +         */
> > +
> > +        if (errp && *errp) {
> > +            warn_reportf_err(*errp,
> > +                             "Process can't lock enough memory for usi=
ng MSG_ZEROCOPY,"
> > +                             "falling back to non-zerocopy");
>
> This is not nice as it hides what is likely mis-configuration error.
> If someone asked for zerocopy, we should honour that or report an
> error back.

Yeah, that makes sense to me.
Thank you for pointing that out.

>
> > +        }
> > +
> > +        QIOChannelClass *klass =3D QIO_CHANNEL_GET_CLASS(ioc);
> > +        klass->io_async_writev =3D NULL;
> > +        klass->io_async_flush =3D NULL;
>
> Clearing the flush callback is wrong. We might have pending async
> writes that haven't been processed that, and the lack of buffers
> may be a transient problem just caused by a backlog of writes.

I agree that it's wrong.
But I think it will be deprecated anyway if we implement ZEROCOPY as
a feature instead of async, and avoid doing fallback to writev when async i=
s
not available.


>
> > +
> > +        /* Re-send current buffer */
> > +        ret =3D qio_channel_socket_writev(ioc, iov, niov, fds, nfds, e=
rrp);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +
> > +static void qio_channel_socket_async_flush(QIOChannel *ioc,
> > +                                           Error **errp)
> > +{
> > +    QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > +    struct msghdr msg =3D {};
> > +    struct pollfd pfd;
> > +    struct sock_extended_err *serr;
> > +    struct cmsghdr *cm;
> > +    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
>
> Err  sizeof(int) * SOCKET_MAX_FDS   doesn't look right. This
> buffer needs to hold 'struct sock_extended_err' instances,
> not 'int', and SOCKET_MAX_FDS is an unrelated limit.

That was a bad mistake,
I got it by reusing code from above functions, and it got past the review I
did before sending the patch.
Sorry about that.

>
> > +    int ret;
> > +
> > +    memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> > +    msg.msg_control =3D control;
> > +    msg.msg_controllen =3D sizeof(control);
> > +
> > +    while (sioc->async_sent < sioc->async_queued) {
> > +        ret =3D recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > +        if (ret < 0) {
> > +            if (errno =3D=3D EAGAIN) {
> > +                /* Nothing on errqueue, wait */
> > +                pfd.fd =3D sioc->fd;
> > +                pfd.events =3D 0;
> > +                ret =3D poll(&pfd, 1, 250);
> > +                if (ret =3D=3D 0) {
> > +                    /*
> > +                     * Timeout : After 250ms without receiving any zer=
ocopy
> > +                     * notification, consider all data as sent.
> > +                     */
>
> This feels very dubious indeed. If some caller needs a guarantee that the
> data was successfully sent, merely waiting 250ms is not going to be relia=
ble
> enough.

That makes sense.
I added this part because at some point in debugging I got an infinite
loop in this part
(I think it was somehow missing some notifications).

>
> A regular non-async + non-zerocopy right will wait as long as is needed
> unless SO_SNDTIMEO has been set on the socket.

So It would be ok to let it loop here?
Maybe the timeout could be only enough to keep the cpu from getting
stuck in here.

>
> At the very least the timeout ought to be a parameter passed in, and the
> return value should indicate whether it timed out, or report how many
> pending writes still aren't processed, so the caller can decide whether
> to call flush again.

That is also makes sense to me.

>
> > +                    break;
> > +                } else if (ret < 0 ||
> > +                           (pfd.revents & (POLLERR | POLLHUP | POLLNVA=
L))) {
> > +                    error_setg_errno(errp, errno,
> > +                                     "Poll error");
> > +                    break;
> > +                } else {
> > +                    continue;
> > +                }
> > +            }
> > +            if (errno =3D=3D EINTR) {
> > +                continue;
> > +            }
> > +
> > +            error_setg_errno(errp, errno,
> > +                             "Unable to read errqueue");
> > +            break;
> > +        }
> > +
> > +        cm =3D CMSG_FIRSTHDR(&msg);
> > +        if (cm->cmsg_level !=3D SOL_IP &&
> > +            cm->cmsg_type !=3D IP_RECVERR) {
> > +            error_setg_errno(errp, EPROTOTYPE,
> > +                             "Wrong cmsg in errqueue");
> > +            break;
> > +        }
> > +
> > +        serr =3D (void *) CMSG_DATA(cm);
> > +        if (serr->ee_errno !=3D SO_EE_ORIGIN_NONE) {
> > +            error_setg_errno(errp, serr->ee_errno,
> > +                             "Error on socket");
> > +            break;
> > +        }
> > +        if (serr->ee_origin !=3D SO_EE_ORIGIN_ZEROCOPY) {
> > +            error_setg_errno(errp, serr->ee_origin,
> > +                             "Error not from zerocopy");
> > +            break;
> > +        }
> > +
> > +        /* No errors, count sent ids*/
> > +        sioc->async_sent +=3D serr->ee_data - serr->ee_info + 1;
> > +    }
> > +}
> > +
> > +
> >  #else /* WIN32 */
> >  static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
> >                                          const struct iovec *iov,
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

Thanks Daniel,

Best regards,
Leonardo Bras


