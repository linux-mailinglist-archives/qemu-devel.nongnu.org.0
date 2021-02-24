Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA1324283
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:51:12 +0100 (CET)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExNX-0006F2-6L
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lExJr-0004SO-Rm
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:47:24 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:38125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lExJo-0003SK-Ea
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:47:23 -0500
Received: by mail-io1-xd29.google.com with SMTP id k17so2677598ioc.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zS+oboiFzc+4rQLGwEiebQtfX0DekkK7FDxHmYsWheE=;
 b=URb4Ge7K6EH+fyRcBGKhlyffcjyUZd27ZcSe5uR5GwA9AiNkXZngbuLU3hYtLFqttk
 cTch0cARwdVM7/I62XpbtS7WhK8U0pk/Lo9aiL/e0+rnHgP1DZrFEtDH0jiPT9V+DTzm
 wF6Mc+P+llYcYZEMUcat5cxxtgzAhUVxWhv+q1QOzk6D2mNR7seqWMK9T6JL97AO3ALo
 MfT6C1JTUCTBokYzMl/sYB2Nj/FE2qFP7BNXFlPWMEw9wVfaXIBMn9WTyU/KY0xwY7BH
 tyeVV+U9cdBJwoGDgwZItEvB+MnLpa9Cct8pLlDvDRRTkBmA7ae/ATqhFakwPUlq1S9O
 9xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zS+oboiFzc+4rQLGwEiebQtfX0DekkK7FDxHmYsWheE=;
 b=E0lzWPZ207Cp8fqfFV9yO3t7HUXJlolwnHh6MQ279HXQ93phFkqBNRWwxxPrRZzp5d
 hQETeGABzUW+kcDgBqw+XQHLdgB7DX8H1jXSnbeArRkllAfaCP63wigSM5uZTlhcjgCm
 Dii3S9lFkM62Smy9Fd/15HtQcfWbfCHpJCIwneGGBNOdZCeGG7jKUt1SI8Q1yRuoVnFG
 J8eB4hIaktTvtQ4JQjCZgEzwD7G6i8Kpw0mlpit7bknjR9zpj5Uyh5oa/81kaorn4OOm
 uotRWxdo9++zQPA1RnJprL1lf58t1oqZuQtqJwShWYny4uwx3wKa6M1o4PpXCtzEik9z
 awWA==
X-Gm-Message-State: AOAM532/Y/gVXlfOkgjKDXNwF/l441J54tFEwldgsw0JpXxaBI2zg0Eg
 1uIFD1hU14TDGHmdQxd4nHSgJfSZj/AgYKNe5Qg=
X-Google-Smtp-Source: ABdhPJxY0kR1w9LV47qV3vs0hEDtS0A+pC0vkwWQo7TBFb7Ur1HXye8pMaJbGmbXxY4AY9cONvJAXhDrsp1KtOtvNIs=
X-Received: by 2002:a5e:8345:: with SMTP id y5mr17606437iom.58.1614185239064; 
 Wed, 24 Feb 2021 08:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20210224154901.23901-1-koalinux@gmail.com>
 <CANWZPgLxUNM3tPg6wxCt=v7Z-d+DN3J9EyTSV3dwv=uzWMnY0Q@mail.gmail.com>
 <4436341.rU913LdL3d@silver>
In-Reply-To: <4436341.rU913LdL3d@silver>
From: =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= <koalinux@gmail.com>
Date: Wed, 24 Feb 2021 18:47:03 +0200
Message-ID: <CANWZPg+agYD3bXBPsEYG8txZqV6UwT3piJY0kbKy4t0+8vutZA@mail.gmail.com>
Subject: Re: [PATCH] Autoconnect jack ports by default
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000c6b33405bc17c90d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=koalinux@gmail.com; helo=mail-io1-xd29.google.com
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

--000000000000c6b33405bc17c90d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Feb 2021 at 18:40, Christian Schoenebeck <qemu_oss@crudebyte.com=
>
wrote:

> On Mittwoch, 24. Februar 2021 17:16:58 CET Jos=C3=A9 Ram=C3=B3n Mu=C3=B1o=
z Pekkarinen
> wrote:
> > On Wed, 24 Feb 2021 at 17:49, Jos=C3=A9 Pekkarinen <koalinux@gmail.com>
> wrote:
> > > This patch provides a default value to connect
> > > jack ports when the user don't specify connect-ports.
> > >
> > > Buglink: https://bugs.launchpad.net/qemu/+bug/1908832
> > >
> > > Signed-off-by: Jos=C3=A9 Pekkarinen <koalinux@gmail.com>
> > > ---
> > >
> > >  audio/jackaudio.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> > > index 3031c4e29b..a29b1ccba2 100644
> > > --- a/audio/jackaudio.c
> > > +++ b/audio/jackaudio.c
> > > @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void
> *buf,
> > > size_t len)
> > >
> > >  static void qjack_client_connect_ports(QJackClient *c)
> > >  {
> > >
> > > -    if (!c->connect_ports || !c->opt->connect_ports) {
> > > +    if (!c->connect_ports) {
> > >
> > >          return;
> > >
> > >      }
> > >
> > >      c->connect_ports =3D false;
> > >      const char **ports;
> > >
> > > -    ports =3D jack_get_ports(c->client, c->opt->connect_ports, NULL,
> > > -        c->out ? JackPortIsInput : JackPortIsOutput);
> > > +    if (c->out) {
> > > +        ports =3D jack_get_ports(c->client,
> > > +            c->opt->connect_ports ? "system:capture_.*"
> > > +                : c->opt->connect_ports,
>
> I think that should be the other way around:
>
>         c->opt->connect_ports ? c->opt->connect_ports : "system:capture_.=
*"
>

    I was thinking exactly the same when I was reading
the patch, but in the way you hint it doesn't make it, so
somewhere we may be taking the logic inverted.

    Best regards.

    Jos=C3=A9.

--000000000000c6b33405bc17c90d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Feb 2021 at 18:40, Christi=
an Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crude=
byte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mittwoch, 24. Februar 2021 17:16:58 CET Jos=C3=A9 Ram=C3=B3n Mu=
=C3=B1oz Pekkarinen wrote:<br>
&gt; On Wed, 24 Feb 2021 at 17:49, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mail=
to:koalinux@gmail.com" target=3D"_blank">koalinux@gmail.com</a>&gt; wrote:<=
br>
&gt; &gt; This patch provides a default value to connect<br>
&gt; &gt; jack ports when the user don&#39;t specify connect-ports.<br>
&gt; &gt; <br>
&gt; &gt; Buglink: <a href=3D"https://bugs.launchpad.net/qemu/+bug/1908832"=
 rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/=
1908832</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:koalinu=
x@gmail.com" target=3D"_blank">koalinux@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 audio/jackaudio.c | 15 ++++++++++++---<br>
&gt; &gt;=C2=A0 1 file changed, 12 insertions(+), 3 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/audio/jackaudio.c b/audio/jackaudio.c<br>
&gt; &gt; index 3031c4e29b..a29b1ccba2 100644<br>
&gt; &gt; --- a/audio/jackaudio.c<br>
&gt; &gt; +++ b/audio/jackaudio.c<br>
&gt; &gt; @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, voi=
d *buf,<br>
&gt; &gt; size_t len)<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 static void qjack_client_connect_ports(QJackClient *c)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; <br>
&gt; &gt; -=C2=A0 =C2=A0 if (!c-&gt;connect_ports || !c-&gt;opt-&gt;connect=
_ports) {<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!c-&gt;connect_ports) {<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 c-&gt;connect_ports =3D false;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 const char **ports;<br>
&gt; &gt; <br>
&gt; &gt; -=C2=A0 =C2=A0 ports =3D jack_get_ports(c-&gt;client, c-&gt;opt-&=
gt;connect_ports, NULL,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;out ? JackPortIsInput : JackPo=
rtIsOutput);<br>
&gt; &gt; +=C2=A0 =C2=A0 if (c-&gt;out) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports =3D jack_get_ports(c-&gt;clien=
t,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;opt-&gt;connect_=
ports ? &quot;system:capture_.*&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : c-&gt;=
opt-&gt;connect_ports,<br>
<br>
I think that should be the other way around:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 c-&gt;opt-&gt;connect_ports ? c-&gt;opt-&gt;con=
nect_ports : &quot;system:capture_.*&quot;<br></blockquote><div><br></div><=
div>=C2=A0 =C2=A0 I was thinking exactly the same when I was reading</div><=
div>the patch, but in the way you hint it doesn&#39;t make it, so</div><div=
>somewhere we may be taking the logic inverted.</div><div><br></div><div>=
=C2=A0 =C2=A0 Best regards.</div><div><br></div><div>=C2=A0 =C2=A0 Jos=C3=
=A9.</div></div></div>

--000000000000c6b33405bc17c90d--

