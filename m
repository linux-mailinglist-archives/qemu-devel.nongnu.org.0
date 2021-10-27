Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30843C291
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:09:28 +0200 (CEST)
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfc7r-0005ir-Ip
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfc5v-00052N-CQ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfc5p-0001UU-6R
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635314838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iDCOPlPLSTvcN9O8Mwq7Imaz2ADrrMUIuuac5noVI+8=;
 b=KcZyS1yU7RTSD/OJN9drUPlRvn1KNDvJu0ES3JT1BjuDrjuLGdRNhtsjFptefxKcnThH6a
 ybf4q97w9R785uKDp09Ny3q5HpmnSg1PW4lfr6ffmb6l0/3ddt7rnscJ9Rt6XDsP3rn2xs
 Oc+rBw+bi34x3oduo864KzyByYezok0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-UIhDUnTRMIKnEx4BlbhlDQ-1; Wed, 27 Oct 2021 02:07:14 -0400
X-MC-Unique: UIhDUnTRMIKnEx4BlbhlDQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 x7-20020a056512130700b003fd1a7424a8so896855lfu.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDCOPlPLSTvcN9O8Mwq7Imaz2ADrrMUIuuac5noVI+8=;
 b=O5aWMWQeT+kH1Wm96Obu2AZSkhArXfbPw2AzJM7HNNZcLzKYdh8nETX0+3o89s9WRD
 BhGNOuHeBT/GA0Y4zXWDy/gh6Ce9tp/ReA6r8xZZ+yPafqomjWDM4J2FG0gNYpl8EF+t
 YUG73nATSl1uzhBKl/PPIfcR91Pv2/Wu0xS06PXlriafzZC1B87xKb4/z7SqnBxvps9X
 7+5hCQ0PghAVHkIEXo6scMD+NwkrFUj8ZpFYM/qMxWk6gv6sXKw/LzBpQ7tbkdGUrxMC
 0jn6tcFHyT4GUvScFmPnhfZgsrxw4qVJjFZ7/pQ5LZ9fdfFAecvfApG5WixTnnwJvUbP
 8FCw==
X-Gm-Message-State: AOAM5319ZTlwj6hi5K/hv07cviTyB1MICUKVkjWl/3laXkZvTpb4EbJ8
 1EZqx5TcKIm/uSC6J9HhbUnGvOtqB2WN9XdOAwXDZZp8mahaZHRUhq1+jB4HBtwy8nU0UK2XSYB
 OoUo4oCGEQtWtQOKRuyln1nG5uBBuPm0=
X-Received: by 2002:a2e:544b:: with SMTP id y11mr8903649ljd.10.1635314832784; 
 Tue, 26 Oct 2021 23:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhDwNIH5xdyfpLRKtE6+lzKrKTKzpJI4ID2If13umxCIuVRcff74n0SPydghj43E3isuRC2ATOA4tgHo1O/gk=
X-Received: by 2002:a2e:544b:: with SMTP id y11mr8903620ljd.10.1635314832522; 
 Tue, 26 Oct 2021 23:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
 <YWZ3kbsbUmCyr6Ot@t490s> <YWZ9lWKsU83JCZxS@t490s>
In-Reply-To: <YWZ9lWKsU83JCZxS@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Oct 2021 03:07:13 -0300
Message-ID: <CAJ6HWG4pvP7dJ1=kgHKGAa8r=bgOcLT+YsZtSum0SnSLBNc3fg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b0522705cf4f6727"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b0522705cf4f6727
Content-Type: text/plain; charset="UTF-8"

Hello Peter, sorry for the delay.

On Wed, Oct 13, 2021 at 3:33 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Oct 13, 2021 at 02:07:13PM +0800, Peter Xu wrote:
> > On Sat, Oct 09, 2021 at 04:56:11AM -0300, Leonardo Bras wrote:
> > > -int qio_channel_writev_full_all(QIOChannel *ioc,
> > > -                                const struct iovec *iov,
> > > -                                size_t niov,
> > > -                                int *fds, size_t nfds,
> > > -                                Error **errp)
> > > +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> > > +                                      const struct iovec *iov,
> > > +                                      size_t niov,
> > > +                                      int *fds, size_t nfds,
> > > +                                      int flags, Error **errp)
> > >  {
> > >      int ret = -1;
> > >      struct iovec *local_iov = g_new(struct iovec, niov);
> > > @@ -237,8 +250,8 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
> > >
> > >      while (nlocal_iov > 0) {
> > >          ssize_t len;
> > > -        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov,
fds, nfds,
> > > -                                      errp);
> > > +        len = qio_channel_writev_full_flags(ioc, local_iov,
nlocal_iov, fds, nfds,
> > > +                                          flags, errp);
> >
> > IMHO we can keep qio_channel_writev_full() untouched, as it is the
wrapper for
> > io_writev() hook right now (and it allows taking fds).  Then here
instead of
> > adding a new flags into it, we can introduce
qio_channel_writev_zerocopy_full()
> > and directly call here:

Sure, it makes sense.

> >
> >            if (flags & ZEROCOPY) {
> >                assert(fds == NULL && nfds == 0);

Quick question: Why is this assert needed?

> >                qio_channel_writev_zerocopy_full(...[no fds passing in]);
> >            } else {
> >                qio_channel_writev_full(...[with all parameters]);
> >            }
> >
> > Then qio_channel_writev_zerocopy_full() should be simplely the wrapper
for the
> > new io_writev_zerocopy() hook.
>
> Sorry I think the name doesn't need to have "_full" - that should be used
for
> io_writev() when we need to pass in fds.  zerocopy doesn't have that, so I
> think we can just call it qio_channel_writev_zerocopy() as it simply does
what
> writev() does.

Ok, I will make these changes to v5.


>
> >
> > >          if (len == QIO_CHANNEL_ERR_BLOCK) {
> > >              if (qemu_in_coroutine()) {
> > >                  qio_channel_yield(ioc, G_IO_OUT);
> > > @@ -474,6 +487,31 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
> > >  }
> > >
> > >
> > > +ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
> > > +                                    const struct iovec *iov,
> > > +                                    size_t niov,
> > > +                                    Error **errp)
> > > +{
> > > +    return qio_channel_writev_full_flags(ioc, iov, niov, NULL, 0,
> > > +
QIO_CHANNEL_WRITE_FLAG_ZEROCOPY,
> > > +                                         errp);
> > > +}
> >
> > This function is never used, right? qio_channel_writev_all_flags() is
used in
> > patch 3, with proper flags passed in.  Then IMHO we can drop this one.
> >
> > The rest looks good, as long as with Eric's comment addressed.
> >
> > Thanks,

IIUC, this was addressed by your reply above, is that correct?

> >
> > > +
> > > +
> > > +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> > > +                               Error **errp)
> > > +{
> > > +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > > +
> > > +    if (!klass->io_flush_zerocopy ||
> > > +        !qio_channel_has_feature(ioc,
QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    return klass->io_flush_zerocopy(ioc, errp);
> > > +}
> > > +
> > > +
> > >  static void qio_channel_restart_read(void *opaque)
> > >  {
> > >      QIOChannel *ioc = opaque;
> > > --
> > > 2.33.0
> > >
> >
> > --
> > Peter Xu
>
> --
> Peter Xu
>

Best regards,
Leonardo Bras

--000000000000b0522705cf4f6727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Peter, sorry for the delay.<br><br>On Wed, Oct 13, 2=
021 at 3:33 AM Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@red=
hat.com</a>&gt; wrote:<br>&gt;<br>&gt; On Wed, Oct 13, 2021 at 02:07:13PM +=
0800, Peter Xu wrote:<br>&gt; &gt; On Sat, Oct 09, 2021 at 04:56:11AM -0300=
, Leonardo Bras wrote:<br>&gt; &gt; &gt; -int qio_channel_writev_full_all(Q=
IOChannel *ioc,<br>&gt; &gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst struct iovec *iov,<br>&gt; &gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size_t niov,<br>&gt; &gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int *fds, size_t nfds,<br>&gt; &gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Error **errp)<br>&gt; &gt; &gt; +int qio_channel_writev_full_all_=
flags(QIOChannel *ioc,<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct iovec *iov,<br>&gt; &gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t niov,<br>&gt;=
 &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *=
fds, size_t nfds,<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int flags, Error **errp)<br>&gt; &gt; &gt; =C2=A0{<=
br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0int ret =3D -1;<br>&gt; &gt; &gt; =C2=
=A0 =C2=A0 =C2=A0struct iovec *local_iov =3D g_new(struct iovec, niov);<br>=
&gt; &gt; &gt; @@ -237,8 +250,8 @@ int qio_channel_writev_full_all(QIOChann=
el *ioc,<br>&gt; &gt; &gt; <br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0while (nl=
ocal_iov &gt; 0) {<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssiz=
e_t len;<br>&gt; &gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D qio_channel=
_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,<br>&gt; &gt; &gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errp);<br>&gt; &gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D qio_channel_writev_full_flags(ioc=
, local_iov, nlocal_iov, fds, nfds,<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags, errp);<br>&gt=
; &gt;<br>&gt; &gt; IMHO we can keep qio_channel_writev_full() untouched, a=
s it is the wrapper for<br>&gt; &gt; io_writev() hook right now (and it all=
ows taking fds).=C2=A0 Then here instead of<br>&gt; &gt; adding a new flags=
 into it, we can introduce qio_channel_writev_zerocopy_full()<br><div>&gt; =
&gt; and directly call here:</div><div><br></div><div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:small" class=3D"gmail_default">Sure, it mak=
es sense.</div></div><div><br></div>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; ZEROCOPY) {<br><div>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(fds =3D=3D NU=
LL &amp;&amp; nfds =3D=3D 0);</div><div><br></div><div><div style=3D"font-f=
amily:arial,sans-serif;font-size:small" class=3D"gmail_default">Quick quest=
ion: Why is this assert needed?</div></div><div><br></div>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_channel_writev_zerocopy=
_full(...[no fds passing in]);<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0qio_channel_writev_full(...[with all parameters]);<br>&gt; &gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt;<br>&gt; &gt; Then=
 qio_channel_writev_zerocopy_full() should be simplely the wrapper for the<=
br>&gt; &gt; new io_writev_zerocopy() hook.<br>&gt;<br>&gt; Sorry I think t=
he name doesn&#39;t need to have &quot;_full&quot; - that should be used fo=
r<br>&gt; io_writev() when we need to pass in fds. =C2=A0zerocopy doesn&#39=
;t have that, so I<br>&gt; think we can just call it qio_channel_writev_zer=
ocopy() as it simply does what<br><div>&gt; writev() does.</div><div><br></=
div><div><div style=3D"font-family:arial,sans-serif;font-size:small" class=
=3D"gmail_default">Ok, I will make these changes to v5.</div><br></div><div=
><br></div>&gt;<br>&gt; &gt;<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {<br>&gt; &gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qemu_in_coroutine()) {<br>&gt; &g=
t; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_c=
hannel_yield(ioc, G_IO_OUT);<br>&gt; &gt; &gt; @@ -474,6 +487,31 @@ off_t q=
io_channel_io_seek(QIOChannel *ioc,<br>&gt; &gt; &gt; =C2=A0}<br>&gt; &gt; =
&gt; <br>&gt; &gt; &gt; <br>&gt; &gt; &gt; +ssize_t qio_channel_writev_zero=
copy(QIOChannel *ioc,<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const struct iovec *iov,<br>&gt; &gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t niov,<br>&gt; &gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>&gt; &=
gt; &gt; +{<br>&gt; &gt; &gt; + =C2=A0 =C2=A0return qio_channel_writev_full=
_flags(ioc, iov, niov, NULL, 0,<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL_WRITE_FLAG_ZEROCO=
PY,<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 errp);<br>&gt; &gt; &gt; +}<br>&gt; &gt;<br>&gt; &gt; Thi=
s function is never used, right? qio_channel_writev_all_flags() is used in<=
br>&gt; &gt; patch 3, with proper flags passed in.=C2=A0 Then IMHO we can d=
rop this one.<br>&gt; &gt;<br>&gt; &gt; The rest looks good, as long as wit=
h Eric&#39;s comment addressed.<br>&gt; &gt;<br><div>&gt; &gt; Thanks,</div=
><div><br></div><div><div style=3D"font-family:arial,sans-serif;font-size:s=
mall" class=3D"gmail_default">IIUC, this was addressed by your reply above,=
 is that correct?</div></div><br>&gt; &gt;<br>&gt; &gt; &gt; +<br>&gt; &gt;=
 &gt; +<br>&gt; &gt; &gt; +int qio_channel_flush_zerocopy(QIOChannel *ioc,<=
br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>&gt; &gt=
; &gt; +{<br>&gt; &gt; &gt; + =C2=A0 =C2=A0QIOChannelClass *klass =3D QIO_C=
HANNEL_GET_CLASS(ioc);<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; + =C2=A0 =C2=
=A0if (!klass-&gt;io_flush_zerocopy ||<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCO=
PY)) {<br>&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>&gt; &gt=
; &gt; + =C2=A0 =C2=A0}<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; + =C2=A0 =C2=
=A0return klass-&gt;io_flush_zerocopy(ioc, errp);<br>&gt; &gt; &gt; +}<br>&=
gt; &gt; &gt; +<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; =C2=A0static void qio=
_channel_restart_read(void *opaque)<br>&gt; &gt; &gt; =C2=A0{<br>&gt; &gt; =
&gt; =C2=A0 =C2=A0 =C2=A0QIOChannel *ioc =3D opaque;<br>&gt; &gt; &gt; --<b=
r>&gt; &gt; &gt; 2.33.0<br>&gt; &gt; &gt;<br>&gt; &gt;<br>&gt; &gt; --<br>&=
gt; &gt; Peter Xu<br>&gt;<br>&gt; --<br>&gt; Peter Xu<br><div>&gt;</div><di=
v><br></div><div><div style=3D"font-family:arial,sans-serif;font-size:small=
" class=3D"gmail_default">Best regards,</div></div><div><div style=3D"font-=
family:arial,sans-serif;font-size:small" class=3D"gmail_default">Leonardo B=
ras</div><br></div><br></div>

--000000000000b0522705cf4f6727--


