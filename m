Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A44671B7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 06:44:18 +0100 (CET)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt1Mn-0006Wr-Fj
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 00:44:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mt1LE-0005q1-9T
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mt1LA-00071x-OU
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638510155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+t76g/fJk+enONzpL5p5nGa4Ozi4qsTq3ORYlXCfbE=;
 b=eDL6PnvD0cbH28wt+r+BvrQZUicfnV7KiNkBqWgL1ekntKEp67MALj0U3TI+vsDmUP47BE
 dxdumt/QTEoeI251hZLpv5JvhCoL5aq/m+mntqoiFuahruVjjWB/zC61E21TT5KZwFCPs6
 a7hy6ukCAxTCxS3R8QthSyda/QTuJbk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-bakt4YurMsC1nYmKZlnZlA-1; Fri, 03 Dec 2021 00:42:32 -0500
X-MC-Unique: bakt4YurMsC1nYmKZlnZlA-1
Received: by mail-lj1-f200.google.com with SMTP id
 d20-20020a05651c111400b00218c6372b7eso686849ljo.16
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 21:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6+t76g/fJk+enONzpL5p5nGa4Ozi4qsTq3ORYlXCfbE=;
 b=AEzMV8+dO/KUapaE7rwjJxMmsS0pxLCfYhs4BlhhcwMViHgUeFELMrstd+iVL6xIq/
 nCG+UAxSVQIWmnDyNa3DGPPIQmF4xGbWhW1JYWu/pOM5IBYBGplEwXL02p9ENnnEOsWM
 FVtZBTl5wDepOH22VzmcOfzwsmyQxQLZbYXjww2ZpPg7TZfH5RWiGRGOK5yP+gr4OJ97
 3BzStGkL2wd3f2w16Yv58DvzrD1BJ3lsrvU/T1qLZKENhYP59FHL3HEfOI6/kl1BYGqz
 IFL6mUpWg8LmsxnaMY7sDioOo9nfyYh+SWbm82Rie32xhQ9rPi0ilm1O15BLg5Jhg7Fu
 yMfg==
X-Gm-Message-State: AOAM530JYHR7scPpxB/lBy2f9u4XqWq14eNDZb4dgo4sC2YMpMCS1Krd
 sukl+/4AiJ+Ea70w9HxmHsLuikyIXfTv9fELidH7CZg6195x6i+froYNSy4jvS5rk581TyzMS0O
 ebjEhKmQWlrqPyYFxgVQE+voMjfQ4clM=
X-Received: by 2002:a05:6512:118a:: with SMTP id
 g10mr15223399lfr.17.1638510151110; 
 Thu, 02 Dec 2021 21:42:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxarFykuQrsD2s3ZGq1ZR4Ukwnu9YOaTYs0WI4yp6omO8vnHEinFTbxISOii57F3Xgc0xoXQfYLmJJTBJQBnDA=
X-Received: by 2002:a05:6512:118a:: with SMTP id
 g10mr15223374lfr.17.1638510150788; 
 Thu, 02 Dec 2021 21:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-4-leobras@redhat.com>
 <YY5H2ixqGpfbo5jI@redhat.com>
 <CAJ6HWG6TczHZC6EFcicG8irVb3XKdhB05bcyOb0ANAZKmRWqZg@mail.gmail.com>
 <YZy6qifB8JNwYEkp@redhat.com>
In-Reply-To: <YZy6qifB8JNwYEkp@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Fri, 3 Dec 2021 02:42:19 -0300
Message-ID: <CAJ6HWG5e5VGW0pt_ek+jMZi+oz4uDOLnC0dHczkqMBBspdLf5A@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Tue, Nov 23, 2021 at 6:56 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Nov 23, 2021 at 01:46:44AM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Daniel,
> >
> > On Fri, Nov 12, 2021 at 7:54 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > [...]
> > > > @@ -561,12 +577,15 @@ static ssize_t qio_channel_socket_writev_flag=
s(QIOChannel *ioc,
> > > >   retry:
> > > >      ret =3D sendmsg(sioc->fd, &msg, flags);
> > > >      if (ret <=3D 0) {
> > > > -        if (errno =3D=3D EAGAIN) {
> > > > +        switch (errno) {
> > > > +        case EAGAIN:
> > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > -        }
> > > > -        if (errno =3D=3D EINTR) {
> > > > +        case EINTR:
> > > >              goto retry;
> > > > +        case ENOBUFS:
> > > > +            return QIO_CHANNEL_ERR_NOBUFS;
> > >
> > > Why does ENOBUFS need handling separately instead of letting
> > > the error_setg_errno below handle it ?
> > >
> > > The caller immediately invokes error_setg_errno() again,
> > > just with different error message.
> > >
> > > No code in this series ever looks at QIO_CHANNEL_ERR_NOBUFS
> > > either, so we don't even need that special error return code
> > > added AFAICT ?
> > >
> >
> > The idea was to add a custom message for ENOBUFS return when sending
> > with MSG_ZEROCOPY.
> > I mean, having this message is important for the user to understand
> > why the migration is failing, but it would
> > not make any sense to have this message while a non-zerocopy sendmsg()
> > returns with ENOBUFS.
> >
> > ENOBUFS : The output queue for a network interface was full.  This
> > generally indicates that the interface has stopped sending, but may be
> > caused by transient congestion.
> >
> > As an alternative, I could add this message inside the switch, inside
> > an if (flags & MSG_ZEROCOPY) on qio_channel_socket_writev_flags()
> > instead of in it's caller.
> > But for me it looks bloated, I mean, dealing with an error for
> > ZEROCOPY only in the general function.
>
> It is perfectly reasonable to check flags in this method.
>
> > OTOH, if you think that it's a better idea to deal with every error in
> > qio_channel_socket_writev_flags() instead of in the caller, I will
> > change it for v6. Please let me know.
>
> Yes, this method is already taking an ERror **errp parameter and
> reporting a user facing error. If we need to report different
> message text for ENOBUFS, it should be done in this method too.
>
> The reason QIO_CHANNEL_ERR_BLOCK is special is because we are
> explicitly not treating it as an error scenario at all.  That's
> different to the ENOBUFS case.
>

Ok, I will change it for v6.

>
> >
> > > >          }
> > > > +
> > > >          error_setg_errno(errp, errno,
> > > >                           "Unable to write to socket");
> > > >          return -1;
> > > > @@ -670,6 +689,127 @@ static ssize_t qio_channel_socket_writev(QIOC=
hannel *ioc,
> > > >  }
> > > >  #endif /* WIN32 */
> > > >
> > > > +
> > > > +#ifdef CONFIG_LINUX
> > > > +
> > > > +static int qio_channel_socket_poll(QIOChannelSocket *sioc, bool ze=
rocopy,
> > > > +                                   Error **errp)
> > >
> > > There's only one caller and it always passes zerocopy=3Dtrue,
> > > so this parmeter looks pointless.
> >
> > I did that for possible reuse of this function in the future:
> > - As of today, this is certainly compiled out, but if at some point
> > someone wants to use poll for something other
> > than the reading of an zerocopy errqueue, it could be reused.
> >
> > But sure, if that's not desirable, I can remove the parameter (and the
> > if clause for !zerocopy).
> >
> > >
> > > > +{
> > > > +    struct pollfd pfd;
> > > > +    int ret;
> > > > +
> > > > +    pfd.fd =3D sioc->fd;
> > > > +    pfd.events =3D 0;
> > > > +
> > > > + retry:
> > > > +    ret =3D poll(&pfd, 1, -1);
> > > > +    if (ret < 0) {
> > > > +        switch (errno) {
> > > > +        case EAGAIN:
> > > > +        case EINTR:
> > > > +            goto retry;
> > > > +        default:
> > > > +            error_setg_errno(errp, errno,
> > > > +                             "Poll error");
> > > > +            return ret;
> > >
> > >        return -1;
> > >
> > > > +        }
> > > > +    }
> > > > +
> > > > +    if (pfd.revents & (POLLHUP | POLLNVAL)) {
> > > > +        error_setg(errp, "Poll error: Invalid or disconnected fd")=
;
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    if (!zerocopy && (pfd.revents & POLLERR)) {
> > > > +        error_setg(errp, "Poll error: Errors present in errqueue")=
;
> > > > +        return -1;
> > > > +    }
> > >
> > > > +
> > > > +    return ret;
> > >
> > >   return 0;
> >
> > In the idea of future reuse I spoke above, returning zero here would
> > make this function always look like the poll timed out. Some future
> > users may want to repeat the waiting if poll() timed out, or if
> > (return > 0) stop polling.
>
> Now that I'm looking again, we should not really use poll() at all,
> as GLib provides us higher level APIs. We in fact already have the
> qio_channel_wait() method as a general purpose helper for waiting
> for an I/O condition to occur.;
>

So you suggest using
qio_channel_wait(sioc, G_IO_IN);
instead of creating the new qio_channel_socket_poll().

Is the above correct? I mean, is it as simple as that?

>
> > I understand the idea of testing SO_EE_CODE_ZEROCOPY_COPIED to be able
> > to tell whenever zerocopy fell back to copying for some reason, but I
> > don't see how this can be helpful here.
> >
> > Other than that I would do rv++ instead of rv=3D1 here, if I want to
> > keep track of how many buffers were sent with zerocopy and how many
> > ended up being copied.
>
> Sure, we could do   "ret > 0 =3D=3D number of buffers that were copied"
> as the API contract, rather than just treating it as a boolean.

Ok, then you suggest the responsibility of checking the number of
writes with SO_EE_CODE_ZEROCOPY_COPIED, comparing with the total
number of writes,  and deciding whether to disable or not zerocopy
should be on the caller.

(Disabling zerocopy on a single SO_EE_CODE_ZEROCOPY_COPIED doesn't
seem a good idea also)

>
>
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

Best regards,
Leo


