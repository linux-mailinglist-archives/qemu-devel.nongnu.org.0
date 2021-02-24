Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB72324479
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:17:24 +0100 (CET)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzf1-0006ZP-Ap
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lEzan-0004r8-JR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:13:01 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lEzal-0000l9-EC
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:13:01 -0500
Received: by mail-io1-xd2c.google.com with SMTP id f6so3171516iop.11
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xfiVyc8vLZlUtw5+RcmYYtSq0mS0cEWzxOlUuGUuMXE=;
 b=I8MWxcwQ538A2DkMv0+Dx2Z9n5e+r8K8VHuB/3f+txvsHw6gfDKmPQJWVJXAZMf3EH
 /MEeIS/jHlHB4NdMKopi9GwV2nOWe/w2ZxE6imXuxNlkyNxuqfp76nSpNu8zEM8m4TKc
 amf16hHFUxqRMRuPr54vqK5KUxp7ZFgK5gq2wdjL3Zht5AZSM2Gh7ZCVPelavLg8/PUH
 mQlapTCazezJGi+7iI83T2zjAGbRI4St1Tf2/9AuX8+7tJtVXemmJVYSFLLSARws4xvM
 vjtaKdYfAAlTiJB0Vx1o1QsEQilG7vRSHHSEnqBoGzOLBu5h8JdCgNPBPtZECrdAXMmc
 WqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfiVyc8vLZlUtw5+RcmYYtSq0mS0cEWzxOlUuGUuMXE=;
 b=qEgizGJAmmwmPwG/++VT0lFlx+6FKH7ZKZAilEPKtHxJLC3IuupRDP/M2bKBeVOPfZ
 ugzWHx4W3J0PPi5eIF8hyFQflBp0dOzI20vNGUxb7Eu2YWJQfRzk/liQbIN9FxGkfiDZ
 rHuM8XrrsOkYWlbXmIiE0gqIAwn8rIKVciEg2xZ8/Q7YHzzfgDtC892s+WougzCRrpxs
 ge22daKW9pH/UCwNJRqSIwwHQRBRKDKMUajBiz0226yRhmOTHWo27ZfdUoovrptTnjuo
 1o+FF9WmtCtAKSjUJmX/9t8ubt9JQVtJ/teQFrV/00yNU4QlmYyd2wjbB0Lj/w+P29Wo
 uu1w==
X-Gm-Message-State: AOAM532sNvylmd2147pXuw+0HanlRpLqXfmzqACD79mQa40rRzlxnIJB
 eXurd+FmnE97nOpjoIZDtRdqFI5KiCGYt9VMVx0=
X-Google-Smtp-Source: ABdhPJwNq1KftKfY0HHbow4hyQXO4/RNXOdkOkfJ3Ad+bj5rD1pfanfhwYtI/ECDk6Cviocg/3CmHbBP4kG34DiWpSk=
X-Received: by 2002:a05:6638:bcf:: with SMTP id
 g15mr33976854jad.58.1614193978275; 
 Wed, 24 Feb 2021 11:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20210224154901.23901-1-koalinux@gmail.com>
 <4436341.rU913LdL3d@silver>
 <CANWZPg+agYD3bXBPsEYG8txZqV6UwT3piJY0kbKy4t0+8vutZA@mail.gmail.com>
 <10027779.MNeJ0xqg2j@silver>
In-Reply-To: <10027779.MNeJ0xqg2j@silver>
From: =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= <koalinux@gmail.com>
Date: Wed, 24 Feb 2021 21:12:47 +0200
Message-ID: <CANWZPgJj+wuftBrVigBoD5pGxfZLRBbdBc=WUmFPJ_L42g3oLw@mail.gmail.com>
Subject: Re: [PATCH] Autoconnect jack ports by default
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000ac7bf405bc19d29a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=koalinux@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Geoffrey McRae <geoff@hostfission.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ac7bf405bc19d29a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Feb 2021 at 19:29, Christian Schoenebeck <qemu_oss@crudebyte.com=
>
wrote:

> On Mittwoch, 24. Februar 2021 17:47:03 CET Jos=C3=A9 Ram=C3=B3n Mu=C3=B1o=
z Pekkarinen
> wrote:
> > On Wed, 24 Feb 2021 at 18:40, Christian Schoenebeck <
> qemu_oss@crudebyte.com>
> > wrote:
> > > On Mittwoch, 24. Februar 2021 17:16:58 CET Jos=C3=A9 Ram=C3=B3n Mu=C3=
=B1oz Pekkarinen
> > >
> > > wrote:
> > > > On Wed, 24 Feb 2021 at 17:49, Jos=C3=A9 Pekkarinen <koalinux@gmail.=
com>
> > >
> > > wrote:
> > > > > This patch provides a default value to connect
> > > > > jack ports when the user don't specify connect-ports.
> > > > >
> > > > > Buglink: https://bugs.launchpad.net/qemu/+bug/1908832
> > > > >
> > > > > Signed-off-by: Jos=C3=A9 Pekkarinen <koalinux@gmail.com>
> > > > > ---
> > > > >
> > > > >  audio/jackaudio.c | 15 ++++++++++++---
> > > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> > > > > index 3031c4e29b..a29b1ccba2 100644
> > > > > --- a/audio/jackaudio.c
> > > > > +++ b/audio/jackaudio.c
> > > > > @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, voi=
d
> > >
> > > *buf,
> > >
> > > > > size_t len)
> > > > >
> > > > >  static void qjack_client_connect_ports(QJackClient *c)
> > > > >  {
> > > > >
> > > > > -    if (!c->connect_ports || !c->opt->connect_ports) {
> > > > > +    if (!c->connect_ports) {
> > > > >
> > > > >          return;
> > > > >
> > > > >      }
> > > > >
> > > > >      c->connect_ports =3D false;
> > > > >      const char **ports;
> > > > >
> > > > > -    ports =3D jack_get_ports(c->client, c->opt->connect_ports, N=
ULL,
> > > > > -        c->out ? JackPortIsInput : JackPortIsOutput);
> > > > > +    if (c->out) {
> > > > > +        ports =3D jack_get_ports(c->client,
> > > > > +            c->opt->connect_ports ? "system:capture_.*"
> > > > > +                : c->opt->connect_ports,
> > >
> > > I think that should be the other way around:
> > >         c->opt->connect_ports ? c->opt->connect_ports :
> > >         "system:capture_.*"
> >
> >     I was thinking exactly the same when I was reading
> > the patch, but in the way you hint it doesn't make it, so
> > somewhere we may be taking the logic inverted.
>
> I guess that's because the RegEx patterns are interchanged as well. Try:
>
> if (c->out) {
>         ...
>         c->opt->connect_ports ? c->opt->connect_ports :
> "system:playback_.*"
>         ...
> } else {
>         ...
>         c->opt->connect_ports ? c->opt->connect_ports : "system:capture_.=
*"
>         ...
> }
>

    Very right here, I'll be resending the patch soon,
thanks for the revision!

    Jos=C3=A9.

--000000000000ac7bf405bc19d29a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Feb 2021 at 19:29, Christi=
an Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crude=
byte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mittwoch, 24. Februar 2021 17:47:03 CET Jos=C3=A9 Ram=C3=B3n Mu=
=C3=B1oz Pekkarinen wrote:<br>
&gt; On Wed, 24 Feb 2021 at 18:40, Christian Schoenebeck &lt;<a href=3D"mai=
lto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt=
;<br>
&gt; wrote:<br>
&gt; &gt; On Mittwoch, 24. Februar 2021 17:16:58 CET Jos=C3=A9 Ram=C3=B3n M=
u=C3=B1oz Pekkarinen<br>
&gt; &gt; <br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; On Wed, 24 Feb 2021 at 17:49, Jos=C3=A9 Pekkarinen &lt;<a hr=
ef=3D"mailto:koalinux@gmail.com" target=3D"_blank">koalinux@gmail.com</a>&g=
t;<br>
&gt; &gt; <br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; This patch provides a default value to connect<br>
&gt; &gt; &gt; &gt; jack ports when the user don&#39;t specify connect-port=
s.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bu=
g/1908832" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/=
qemu/+bug/1908832</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mail=
to:koalinux@gmail.com" target=3D"_blank">koalinux@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 audio/jackaudio.c | 15 ++++++++++++---<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 12 insertions(+), 3 deletions(-)<=
br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/audio/jackaudio.c b/audio/jackaudio.c<br>
&gt; &gt; &gt; &gt; index 3031c4e29b..a29b1ccba2 100644<br>
&gt; &gt; &gt; &gt; --- a/audio/jackaudio.c<br>
&gt; &gt; &gt; &gt; +++ b/audio/jackaudio.c<br>
&gt; &gt; &gt; &gt; @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceI=
n *hw, void<br>
&gt; &gt; <br>
&gt; &gt; *buf,<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; size_t len)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 static void qjack_client_connect_ports(QJackClien=
t *c)<br>
&gt; &gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 if (!c-&gt;connect_ports || !c-&gt;opt-&=
gt;connect_ports) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (!c-&gt;connect_ports) {<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 c-&gt;connect_ports =3D false;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 const char **ports;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 ports =3D jack_get_ports(c-&gt;client, c=
-&gt;opt-&gt;connect_ports, NULL,<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;out ? JackPortIsInpu=
t : JackPortIsOutput);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (c-&gt;out) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports =3D jack_get_ports(c=
-&gt;client,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;opt-&g=
t;connect_ports ? &quot;system:capture_.*&quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 : c-&gt;opt-&gt;connect_ports,<br>
&gt; &gt; <br>
&gt; &gt; I think that should be the other way around:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c-&gt;opt-&gt;connect_ports ? c-=
&gt;opt-&gt;connect_ports :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;system:capture_.*&quot;<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I was thinking exactly the same when I was reading<=
br>
&gt; the patch, but in the way you hint it doesn&#39;t make it, so<br>
&gt; somewhere we may be taking the logic inverted.<br>
<br>
I guess that&#39;s because the RegEx patterns are interchanged as well. Try=
:<br>
<br>
if (c-&gt;out) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;opt-&gt;connect_ports ? c-&gt;opt-&gt;con=
nect_ports : &quot;system:playback_.*&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;opt-&gt;connect_ports ? c-&gt;opt-&gt;con=
nect_ports : &quot;system:capture_.*&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
}<br></blockquote><div><br></div><div>=C2=A0 =C2=A0 Very right here, I&#39;=
ll be resending the patch soon,</div><div>thanks for the revision!</div><di=
v><br></div><div>=C2=A0 =C2=A0 Jos=C3=A9.</div></div></div>

--000000000000ac7bf405bc19d29a--

