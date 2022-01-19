Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF96493F55
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:49:51 +0100 (CET)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAF5i-0008Sa-Ef
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:49:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEfy-0000AT-5V
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEfw-0000su-G3
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642612990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a98wIamrGk+5KGulG6tfgZ91Vs5wH6tcALvWbX1aPtY=;
 b=KTDU3rCA3FdcVIpfWi3iI3txrIQhX4DGPcgAKXVGLrLUoyk5NyRdueko8kDgMh9mAzPhK/
 iOLN9NlxZ+hRV62X8koa+TRNiYlRpTf6zeO7pPUxsb+i/yPD25l6a63nWdz3aLr6NpcnX1
 x5+WUd9l2IB8zzk2SGot+ipisCBMnCs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-5j5RgkVUPuCpy2L3UfEMag-1; Wed, 19 Jan 2022 12:23:09 -0500
X-MC-Unique: 5j5RgkVUPuCpy2L3UfEMag-1
Received: by mail-ed1-f72.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so3244999edb.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a98wIamrGk+5KGulG6tfgZ91Vs5wH6tcALvWbX1aPtY=;
 b=KlBbFu5m9nhfFjBUS6O2kZuaekjKJFCbGWncXHxpWFB6GxwRQ9O/ziGYtAP0xf6EW1
 e8lbUDEO7LXAAPx6fsAxeCW2tLdGHe8P8U7yojSvw2fdnOPerbil5BX6rq8VFV7f+u10
 Zr9okkXW6t03EoG4YSWLKX4o+MrKc29yAmxlDFw+b+rOMPhMtdyid6tTLNFp0UXCHS8s
 Jsf/g/iMdgzB5kyzqUaBDXEHTEzq0OZayIh8oDgrIKRPtMBpGZh/MZiuPLeiKr26BIc7
 GoDftxGSR9meS2MHNqSQT2ls+0fsjmbz/pgKZI0VmLi9K4QYTY0QH54uAoewL7uCWkcw
 khlw==
X-Gm-Message-State: AOAM5329F/lLxw7ot9RXy36Jsw7pUX9UEGh7cD3+HwwvhshpOkntrvU2
 3B1d1lEwJalAkqf/SJ7GNJz5+Ra8UuCXnt4BesiLpIncwoudkztVzeNKe4Z8sxVv4NISzj/fuuQ
 HVFs/xX7aLidbrIF4MiosHrTZIblNwgE=
X-Received: by 2002:a2e:601:: with SMTP id 1mr24937654ljg.442.1642612988143;
 Wed, 19 Jan 2022 09:23:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+WBCma2uIMW8nsxelzuFP/+w0tRC48aqCH9ddN9wRNy9EQwCv3Rb5qOB8r2W21rUkuV33+i/d2U6ZA4UCFKQ=
X-Received: by 2002:a2e:601:: with SMTP id 1mr24937627ljg.442.1642612987834;
 Wed, 19 Jan 2022 09:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local> <Yd/5lhcW6IHlVOBz@redhat.com>
 <YeAAJLYeImjPwW0f@xz-m1.local> <YeACHxbPt1SV9cx8@redhat.com>
In-Reply-To: <YeACHxbPt1SV9cx8@redhat.com>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Wed, 19 Jan 2022 14:22:56 -0300
Message-ID: <CAJ6HWG7R4F4RvsQR-FM5qYyPJL2bzJJ4oADGW0TxDjsATDwkoQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Thu, Jan 13, 2022 at 7:42 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Jan 13, 2022 at 06:34:12PM +0800, Peter Xu wrote:
> > On Thu, Jan 13, 2022 at 10:06:14AM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> > > > On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > > > > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QI=
OChannel *ioc,
> > > > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > > > >      }
> > > > >
> > > > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > > > +        sflags =3D MSG_ZEROCOPY;
> > > > > +    }
> > > > > +
> > > > >   retry:
> > > > > -    ret =3D sendmsg(sioc->fd, &msg, 0);
> > > > > +    ret =3D sendmsg(sioc->fd, &msg, sflags);
> > > > >      if (ret <=3D 0) {
> > > > > -        if (errno =3D=3D EAGAIN) {
> > > > > +        switch (errno) {
> > > > > +        case EAGAIN:
> > > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > > -        }
> > > > > -        if (errno =3D=3D EINTR) {
> > > > > +        case EINTR:
> > > > >              goto retry;
> > > > > +        case ENOBUFS:
> > > > > +            if (sflags & MSG_ZEROCOPY) {
> > > > > +                error_setg_errno(errp, errno,
> > > > > +                                 "Process can't lock enough memo=
ry for using MSG_ZEROCOPY");
> > > > > +                return -1;
> > > > > +            }
> > > >
> > > > I have no idea whether it'll make a real differnece, but - should w=
e better add
> > > > a "break" here?  If you agree and with that fixed, feel free to add=
:
> > > >
> > > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > >
> > > > I also wonder whether you hit ENOBUFS in any of the environments.  =
On Fedora
> > > > here it's by default unlimited, but just curious when we should kee=
p an eye.
> > >
> > > Fedora doesn't allow unlimited locked memory by default
> > >
> > > $ grep "locked memory" /proc/self/limits
> > > Max locked memory         65536                65536                b=
ytes
> > >
> > > And  regardless of Fedora defaults, libvirt will set a limit
> > > for the guest. It will only be unlimited if requiring certain
> > > things like VFIO.
> >
> > Thanks, I obviously checked up the wrong host..
> >
> > Leo, do you know how much locked memory will be needed by zero copy?  W=
ill
> > there be a limit?  Is it linear to the number of sockets/channels?
>
> IIRC we decided it would be limited by the socket send buffer size, rathe=
r
> than guest RAM, because writes will block once the send buffer is full.
>
> This has a default global setting, with per-socket override. On one box I
> have it is 200 Kb. With multifd you'll need  "num-sockets * send buffer".

Oh, I was not aware there is a send buffer size (or maybe I am unable
to recall).
That sure makes things much easier.

>
> > It'll be better if we can fail at enabling the feature when we detected=
 that
> > the specified locked memory limit may not be suffice.

sure

>
> Checking this value against available locked memory though will always
> have an error margin because other things in QEMU can use locked memory
> too

We can get the current limit (before zerocopy) as an error margin:
req_lock_mem =3D num-sockets * send buffer + BASE_LOCKED

Where BASE_LOCKED is the current libvirt value, or so on.

What do you think?

Best regards,
Leo


