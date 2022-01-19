Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E80493F29
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:38:14 +0100 (CET)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEuS-0000go-NR
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEgv-0001ur-EQ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:24:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAEgt-0000x2-QN
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642613051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR3Q85otsCupnAVVVWaQMLAFjJU9ZnAUaDplDk6xKb4=;
 b=hiYqsDVEBag3ER0JwO/PkkKRINVWq1qMUXGzF+9Cm90b0N4oETmQ4yc1Po9PtgHXJgfxRp
 oPGSAttZ//r1vlpEL6yHBjl+Nrm0d8Rx3aThiRJ2z2uIUdNiLTMPcD0/njEI/iNDjyjtwQ
 p+Vo0W7e6p1wwwldAhprZcB4NpRU+jI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-ZIazyNmePqGPlGia5ofwyw-1; Wed, 19 Jan 2022 12:24:05 -0500
X-MC-Unique: ZIazyNmePqGPlGia5ofwyw-1
Received: by mail-ed1-f69.google.com with SMTP id
 s9-20020aa7d789000000b004021d03e2dfso3212527edq.18
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PR3Q85otsCupnAVVVWaQMLAFjJU9ZnAUaDplDk6xKb4=;
 b=z0MAANT6tfv7ZcjKmiIggLj4qzPaEgGFuHxBy4OwDQd92uIiF2/IL5uN/Ro0xqVBT0
 kotURXFctQpO65Uaz6giWJg5YcTtJ6DCp0JqWgXQ3zgF33B4PtUQrPZP/5KHqbcw9KhJ
 S/EPCwMO28R8fnUaA/2+bbYbuPj58mRjOc5xpR0cz813CXcY/ZQQ6QMYrdM+lL8TmILV
 Qgyv8TgXS9+r2miUXjxLjnTUCzUX7nMXnvHYKRUUkiPJEAnrQTMXUAZPRT7N1WBYjmf9
 61YUp+yX5JiF19TQdvffJZ4u6J8SjNIhYJsBiAOpigkuxV6cOpLCbPewyPovkHPKR58w
 CVkQ==
X-Gm-Message-State: AOAM532FQdU7hmss6jQCHMy+E7xFRYLoeHyiajC++ylJEozZq8avE5dT
 BQG+7UxDc3lKRJwlAR2EUC+KZ22xqSoTe+49VPiKjdfDZ/iVjiaPzHroKLan3vDb/ErutOvmf/B
 r5ttxYcMgezRIuk5jtrvCuLLrFLEjDvA=
X-Received: by 2002:a2e:885a:: with SMTP id z26mr16593995ljj.162.1642613043728; 
 Wed, 19 Jan 2022 09:24:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFjPUD8EctaGFQ5nOuqRNnt0dK1pOkLN2tav3Sk6EwG/nUA/6Mwx9AqDkrJ/NOSgfr1nRZkMV2ThjDLM6bj+M=
X-Received: by 2002:a2e:885a:: with SMTP id z26mr16593981ljj.162.1642613043550; 
 Wed, 19 Jan 2022 09:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local> <Yd/5lhcW6IHlVOBz@redhat.com>
 <YeAAJLYeImjPwW0f@xz-m1.local> <YeACHxbPt1SV9cx8@redhat.com>
 <YeAXGejEayv8V/b/@xz-m1.local>
In-Reply-To: <YeAXGejEayv8V/b/@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Wed, 19 Jan 2022 14:23:52 -0300
Message-ID: <CAJ6HWG5XuXVLXZFoCQQnge2a2PBb=yHWJ1HdFiZcG7wuKUTNiw@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 9:12 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 13, 2022 at 10:42:39AM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Jan 13, 2022 at 06:34:12PM +0800, Peter Xu wrote:
> > > On Thu, Jan 13, 2022 at 10:06:14AM +0000, Daniel P. Berrang=C3=A9 wro=
te:
> > > > On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> > > > > On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > > > > > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(=
QIOChannel *ioc,
> > > > > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > > > > >      }
> > > > > >
> > > > > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > > > > +        sflags =3D MSG_ZEROCOPY;
> > > > > > +    }
> > > > > > +
> > > > > >   retry:
> > > > > > -    ret =3D sendmsg(sioc->fd, &msg, 0);
> > > > > > +    ret =3D sendmsg(sioc->fd, &msg, sflags);
> > > > > >      if (ret <=3D 0) {
> > > > > > -        if (errno =3D=3D EAGAIN) {
> > > > > > +        switch (errno) {
> > > > > > +        case EAGAIN:
> > > > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > > > -        }
> > > > > > -        if (errno =3D=3D EINTR) {
> > > > > > +        case EINTR:
> > > > > >              goto retry;
> > > > > > +        case ENOBUFS:
> > > > > > +            if (sflags & MSG_ZEROCOPY) {
> > > > > > +                error_setg_errno(errp, errno,
> > > > > > +                                 "Process can't lock enough me=
mory for using MSG_ZEROCOPY");
> > > > > > +                return -1;
> > > > > > +            }
> > > > >
> > > > > I have no idea whether it'll make a real differnece, but - should=
 we better add
> > > > > a "break" here?  If you agree and with that fixed, feel free to a=
dd:
> > > > >
> > > > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > > >
> > > > > I also wonder whether you hit ENOBUFS in any of the environments.=
  On Fedora
> > > > > here it's by default unlimited, but just curious when we should k=
eep an eye.
> > > >
> > > > Fedora doesn't allow unlimited locked memory by default
> > > >
> > > > $ grep "locked memory" /proc/self/limits
> > > > Max locked memory         65536                65536               =
 bytes
> > > >
> > > > And  regardless of Fedora defaults, libvirt will set a limit
> > > > for the guest. It will only be unlimited if requiring certain
> > > > things like VFIO.
> > >
> > > Thanks, I obviously checked up the wrong host..
> > >
> > > Leo, do you know how much locked memory will be needed by zero copy? =
 Will
> > > there be a limit?  Is it linear to the number of sockets/channels?
> >
> > IIRC we decided it would be limited by the socket send buffer size, rat=
her
> > than guest RAM, because writes will block once the send buffer is full.
> >
> > This has a default global setting, with per-socket override. On one box=
 I
> > have it is 200 Kb. With multifd you'll need  "num-sockets * send buffer=
".
> >
> > > It'll be better if we can fail at enabling the feature when we detect=
ed that
> > > the specified locked memory limit may not be suffice.
> >
> > Checking this value against available locked memory though will always
> > have an error margin because other things in QEMU can use locked memory
> > too
>
> We could always still allow false positive in this check, so we can fail =
if we
> have a solid clue to know we'll fail later (e.g. minimum locked_vm needed=
 is
> already less than total).  But no strong opinion; we could have this merg=
ed and
> see whether that's needed in real life.  Thanks,

I agree, this is a good approach.

Leo


