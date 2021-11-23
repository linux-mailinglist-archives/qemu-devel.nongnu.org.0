Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC5459B4E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 05:48:32 +0100 (CET)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpNjL-0004cR-Bx
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 23:48:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mpNhz-0003vv-V8
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 23:47:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mpNhw-00043p-Ev
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 23:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637642823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRcv0hYa39kvftmSZZP3eCnibZksS1+SSYoaCD1saYk=;
 b=O/R6cmKlwBmuhL98pjD/yCush0ZZrzCyu7Ihp+5ULd80clXOnKVf2AI4XJJN8baNFucGmw
 ioNYhZi2FFx/MQeWlRlQ7hlFdK06mSs8FbMs1xz2KT7IW5ire4dg8jFF/mYSD1WloJgZQv
 lSxwn/l0801/iWLRE6Qu7FhIMgsB7JY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-qFpwYwzAOH-YtGxj40Xigw-1; Mon, 22 Nov 2021 23:46:58 -0500
X-MC-Unique: qFpwYwzAOH-YtGxj40Xigw-1
Received: by mail-lf1-f71.google.com with SMTP id
 u20-20020a056512129400b0040373ffc60bso13482697lfs.15
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 20:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SRcv0hYa39kvftmSZZP3eCnibZksS1+SSYoaCD1saYk=;
 b=KDyqPXHrvn/3cD3SN2N+honE/Zh1m09GDa7uh54M17HFlHc2PNHbXfAokKPbKODmFj
 noartCg4adhskOyLikuk2XL6fzm8HlrL0/0UoTkswYE1eJpZIboRkuil7p/ROimugecY
 T0AXEue69e23IT1XxMdprCjFjzRbD9xkptJXwa7cBPw/ztL5qnMx+m8UmsE6FGWvXF0v
 iKsoOYrX2w0NaPQ69K/dSh6iPSrFGj1U5YqlxRYC8nMfONN/tmr0eObueXSCFYLsI48l
 XmP0Y6OQuR0clMG0AHkAR+2qVn1n8BoggnkPETA/xs/QAvZGVGl9wrvQdJoenGN1I0HR
 AzQg==
X-Gm-Message-State: AOAM531TAoNoS2/zHvCNDQ3+NBDHLh7/V1LlXqxcrJgIFv74nZrmkQBv
 wXtn1vLkYdFH7ImRfuzYMVWZfRn5C7/Zu+x/mq93ri2ottllhJBAe43yuqt3UQZ313YvO2HTR1v
 lH0yI3e5u7BJbQi9A4cIbHMEMPsWegDQ=
X-Received: by 2002:a19:614f:: with SMTP id m15mr1810604lfk.187.1637642816378; 
 Mon, 22 Nov 2021 20:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJReoloR9qMzbsocEUmIBIHCJC6Mu3t0VEuH5mZnBSCwNe95nK4aX2BvnKRDv+VaRIJukYZTF0604W9oNbufw=
X-Received: by 2002:a19:614f:: with SMTP id m15mr1810571lfk.187.1637642816010; 
 Mon, 22 Nov 2021 20:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-4-leobras@redhat.com>
 <YY5H2ixqGpfbo5jI@redhat.com>
In-Reply-To: <YY5H2ixqGpfbo5jI@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 23 Nov 2021 01:46:44 -0300
Message-ID: <CAJ6HWG6TczHZC6EFcicG8irVb3XKdhB05bcyOb0ANAZKmRWqZg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Fri, Nov 12, 2021 at 7:54 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
[...]
> > @@ -561,12 +577,15 @@ static ssize_t qio_channel_socket_writev_flags(QI=
OChannel *ioc,
> >   retry:
> >      ret =3D sendmsg(sioc->fd, &msg, flags);
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
>
> Why does ENOBUFS need handling separately instead of letting
> the error_setg_errno below handle it ?
>
> The caller immediately invokes error_setg_errno() again,
> just with different error message.
>
> No code in this series ever looks at QIO_CHANNEL_ERR_NOBUFS
> either, so we don't even need that special error return code
> added AFAICT ?
>

The idea was to add a custom message for ENOBUFS return when sending
with MSG_ZEROCOPY.
I mean, having this message is important for the user to understand
why the migration is failing, but it would
not make any sense to have this message while a non-zerocopy sendmsg()
returns with ENOBUFS.

ENOBUFS : The output queue for a network interface was full.  This
generally indicates that the interface has stopped sending, but may be
caused by transient congestion.

As an alternative, I could add this message inside the switch, inside
an if (flags & MSG_ZEROCOPY) on qio_channel_socket_writev_flags()
instead of in it's caller.
But for me it looks bloated, I mean, dealing with an error for
ZEROCOPY only in the general function.

OTOH, if you think that it's a better idea to deal with every error in
qio_channel_socket_writev_flags() instead of in the caller, I will
change it for v6. Please let me know.

> >          }
> > +
> >          error_setg_errno(errp, errno,
> >                           "Unable to write to socket");
> >          return -1;
> > @@ -670,6 +689,127 @@ static ssize_t qio_channel_socket_writev(QIOChann=
el *ioc,
> >  }
> >  #endif /* WIN32 */
> >
> > +
> > +#ifdef CONFIG_LINUX
> > +
> > +static int qio_channel_socket_poll(QIOChannelSocket *sioc, bool zeroco=
py,
> > +                                   Error **errp)
>
> There's only one caller and it always passes zerocopy=3Dtrue,
> so this parmeter looks pointless.

I did that for possible reuse of this function in the future:
- As of today, this is certainly compiled out, but if at some point
someone wants to use poll for something other
than the reading of an zerocopy errqueue, it could be reused.

But sure, if that's not desirable, I can remove the parameter (and the
if clause for !zerocopy).

>
> > +{
> > +    struct pollfd pfd;
> > +    int ret;
> > +
> > +    pfd.fd =3D sioc->fd;
> > +    pfd.events =3D 0;
> > +
> > + retry:
> > +    ret =3D poll(&pfd, 1, -1);
> > +    if (ret < 0) {
> > +        switch (errno) {
> > +        case EAGAIN:
> > +        case EINTR:
> > +            goto retry;
> > +        default:
> > +            error_setg_errno(errp, errno,
> > +                             "Poll error");
> > +            return ret;
>
>        return -1;
>
> > +        }
> > +    }
> > +
> > +    if (pfd.revents & (POLLHUP | POLLNVAL)) {
> > +        error_setg(errp, "Poll error: Invalid or disconnected fd");
> > +        return -1;
> > +    }
> > +
> > +    if (!zerocopy && (pfd.revents & POLLERR)) {
> > +        error_setg(errp, "Poll error: Errors present in errqueue");
> > +        return -1;
> > +    }
>
> > +
> > +    return ret;
>
>   return 0;

In the idea of future reuse I spoke above, returning zero here would
make this function always look like the poll timed out. Some future
users may want to repeat the waiting if poll() timed out, or if
(return > 0) stop polling.
(That was an earlier approach of this series)

>
> > +}
> > +
> > +static ssize_t qio_channel_socket_writev_zerocopy(QIOChannel *ioc,
> > +                                                  const struct iovec *=
iov,
> > +                                                  size_t niov,
> > +                                                  Error **errp)
> > +{
> > +    QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > +    ssize_t ret;
> > +
> > +    ret =3D qio_channel_socket_writev_flags(ioc, iov, niov, NULL, 0,
> > +                                          MSG_ZEROCOPY, errp);
> > +    if (ret =3D=3D QIO_CHANNEL_ERR_NOBUFS) {
> > +        error_setg_errno(errp, errno,
> > +                         "Process can't lock enough memory for using M=
SG_ZEROCOPY");
>
> This should not be touching errno - the method should be setting the
> errp directly, not leaving it to the caller.
>

Discussed above.
If you think that's a better approach I can change for v6.


> > +        return -1;
> > +    }
> > +
> > +    sioc->zerocopy_queued++;
>
>  if (ret > 0)
>     sio->zerocopy_queued++
>

Nice catch!

> since the kernel doesn't increase the counter if the data sent
> was zero length. A caller shouldn't be passing us a zero length
> iov data element, but it is wise to be cautious

Seems ok to me.

>
> > +    return ret;
> > +}
> > +
> > +static int qio_channel_socket_flush_zerocopy(QIOChannel *ioc,
> > +                                             Error **errp)
> > +{
> > +    QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > +    struct msghdr msg =3D {};
> > +    struct sock_extended_err *serr;
> > +    struct cmsghdr *cm;
> > +    char control[CMSG_SPACE(sizeof(*serr))];
> > +    int ret;
>
> Add
>
>    int rv =3D 0;
>
> > +
> > +    msg.msg_control =3D control;
> > +    msg.msg_controllen =3D sizeof(control);
> > +    memset(control, 0, sizeof(control));
> > +
> > +    while (sioc->zerocopy_sent < sioc->zerocopy_queued) {
> > +        ret =3D recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > +        if (ret < 0) {
> > +            switch (errno) {
> > +            case EAGAIN:
> > +                /* Nothing on errqueue, wait until something is availa=
ble */
> > +                ret =3D qio_channel_socket_poll(sioc, true, errp);
> > +                if (ret < 0) {
> > +                    return -1;
> > +                }
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
> > +                             "Error not from zerocopy");
> > +            return -1;
> > +        }
> > +
> > +        /* No errors, count successfully finished sendmsg()*/
> > +        sioc->zerocopy_sent +=3D serr->ee_data - serr->ee_info + 1;
>
> Here add
>
>
>      if (ee_code =3D=3D  SO_EE_CODE_ZEROCOPY_COPIED)
>         rv =3D 1;
>
> > +    }
> > +    return 0;
>
> return rv;
>
> > +}
>
>

I understand the idea of testing SO_EE_CODE_ZEROCOPY_COPIED to be able
to tell whenever zerocopy fell back to copying for some reason, but I
don't see how this can be helpful here.

Other than that I would do rv++ instead of rv=3D1 here, if I want to
keep track of how many buffers were sent with zerocopy and how many
ended up being copied.

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

Thanks for this feedback Daniel,

Best regards,
Leo


