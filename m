Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C2493EFF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:24:59 +0100 (CET)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEhe-0000b1-C8
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:24:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEZm-0001ct-NY
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEZk-0008QB-Vx
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642612608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iL7lJZ6oC8KHSsFimdnPH2/OtGW/TipfRYiPkOeK/Yc=;
 b=RYhsVSJXkHpelULE0FBUQGhBvPkjMuBa5390lXL0JifXWb8qx993WLXwpWKtri5js2S+cS
 iq3oIlBayjbPsZHrC+alRSsBYMLx52fA4g4Ghb2ePDOYvBW5tXo+PGCU6RHk/NelShwSyK
 Gvp30BixMZygBjj8+quNGbl6VYWauII=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-iZ0SBvdEOQqKkSNY0ieLEA-1; Wed, 19 Jan 2022 12:16:47 -0500
X-MC-Unique: iZ0SBvdEOQqKkSNY0ieLEA-1
Received: by mail-ed1-f71.google.com with SMTP id
 t11-20020aa7d70b000000b004017521782dso3157358edq.19
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iL7lJZ6oC8KHSsFimdnPH2/OtGW/TipfRYiPkOeK/Yc=;
 b=IEyPPvIsrsZOI2WVSZBDlF3mvF4VOdwIvq+i9d2wLm0RAtiLejyu7ALBYgDtjH1ejS
 m0rJZNKHwziEj8HRucuyG1zhGVlosxMmGEz8SPbKVNwFoHPJPun7EOatdTPboEAgyuVE
 6Fg25HRVg7mUL0lbfgI3L7W1ZvPSKAtX6cXPX8FBVmTDEDoJeiVF2rjVHvOwMxdlirYB
 w9x7SgaUwuOS/Is7R0Lfe2H6xC1BDmYZZBLZA1EYA5lL5QJnygJG7q++9/bfN8YsKjIA
 dsdv5Q4CBvBmGU8iCLNw96m0QBx7PNAs/phw4CCE9O/96GrCXJQRJ/Gyq3q6tGrD5ZWL
 wNKg==
X-Gm-Message-State: AOAM533Gs5gMicJfVeutZmIwjPZVm0Oc0AqQjtde75GyTjxMu8wtrYFk
 Px3PD3ir4kxlFXKalyJEHvCWiWZjHT5PhLLTbD8Y3cCHnFdJkqm860W7wg9iirvwImDTZgoDQce
 l1VPyyQ4X6Gy1cg8zotOoKQfDwhmLypE=
X-Received: by 2002:a05:651c:1207:: with SMTP id
 i7mr16866938lja.10.1642612605986; 
 Wed, 19 Jan 2022 09:16:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqW9bnLewrRZp1xmYLAGmOLQITOigjnOKmOgoamwXlJM82VX/8LXG6td1SCqPgo1qRTugdp526dr9N209ySFk=
X-Received: by 2002:a05:651c:1207:: with SMTP id
 i7mr16866906lja.10.1642612605653; 
 Wed, 19 Jan 2022 09:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local> <Yd/5lhcW6IHlVOBz@redhat.com>
 <YeAAJLYeImjPwW0f@xz-m1.local>
In-Reply-To: <YeAAJLYeImjPwW0f@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Wed, 19 Jan 2022 14:16:33 -0300
Message-ID: <CAJ6HWG5dDYxi0sdpFNjUpvs60zBbNQo-8fxoqu=2FLeRhLDz0Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 7:34 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 13, 2022 at 10:06:14AM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> > > On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > > > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOC=
hannel *ioc,
> > > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > > >      }
> > > >
> > > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > > +        sflags =3D MSG_ZEROCOPY;
> > > > +    }
> > > > +
> > > >   retry:
> > > > -    ret =3D sendmsg(sioc->fd, &msg, 0);
> > > > +    ret =3D sendmsg(sioc->fd, &msg, sflags);
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
> > > > +            if (sflags & MSG_ZEROCOPY) {
> > > > +                error_setg_errno(errp, errno,
> > > > +                                 "Process can't lock enough memory=
 for using MSG_ZEROCOPY");
> > > > +                return -1;
> > > > +            }
> > >
> > > I have no idea whether it'll make a real differnece, but - should we =
better add
> > > a "break" here?  If you agree and with that fixed, feel free to add:
> > >
> > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > >
> > > I also wonder whether you hit ENOBUFS in any of the environments.  On=
 Fedora
> > > here it's by default unlimited, but just curious when we should keep =
an eye.
> >
> > Fedora doesn't allow unlimited locked memory by default
> >
> > $ grep "locked memory" /proc/self/limits
> > Max locked memory         65536                65536                byt=
es
> >
> > And  regardless of Fedora defaults, libvirt will set a limit
> > for the guest. It will only be unlimited if requiring certain
> > things like VFIO.
>
> Thanks, I obviously checked up the wrong host..
>
> Leo, do you know how much locked memory will be needed by zero copy?  Wil=
l
> there be a limit?  Is it linear to the number of sockets/channels?

It depends on the number of channels, of course, but there are
influencing factors, like network bandwidth & usage, and cpu speed &
usage, network queue size, VM pagesize and so on.

A simple exemple:
If the cpu is free/fast, but there are other applications using the
network, we may enqueue a lot of stuff for sending, and end up needing
a lot of locked memory.

I don't think it's easy to calculate a good reference value for locked
memory here.

>
> It'll be better if we can fail at enabling the feature when we detected t=
hat
> the specified locked memory limit may not be suffice.

I agree it's a good idea. But having this reference value calculated
is not much simple, IIUC.

>
> --
> Peter Xu
>


