Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E04CDB22
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:42:01 +0100 (CET)
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBwG-000601-Nb
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:42:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nQB6K-000629-Gz; Fri, 04 Mar 2022 11:48:21 -0500
Received: from [2a00:1450:4864:20::334] (port=40531
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nQB6H-0007ZP-Ms; Fri, 04 Mar 2022 11:48:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so1763982wmb.5; 
 Fri, 04 Mar 2022 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCD9xpPsM8ClPrt/g4doBIcLWawv646LoFmus3j5iVU=;
 b=WbWwfmsTqOJ6Q4a7ODygSAX/qpw3vie07hGKbkJHaiEK9lY5vx7xWrvSq/Mw2JFzfS
 111z7Wt/H0bw4WXuawtgzvJokqf7i/rgHM0lwClJLKUOOBb+odu8lQwdVJO++aYY3WJo
 F8o1lUWOJyxtWNEqUwiOZKrF2mxEXYJ6rQGOJ0AZwDhYBfAqXiVlY4ay6Bidb1dZ8+Yy
 EgRkFpDNsJovpegN8L0yLbTAG6aK4Yxn4AlKMf/Ss8TKIYgAwBpO3w6DOAqjZzuMV/3H
 C0WDpVNtvlbs2cogT/lrQYB2TCrfA7ghNRK2ra552H/i/GZqAWkvD7go8764OjxACpmG
 pkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCD9xpPsM8ClPrt/g4doBIcLWawv646LoFmus3j5iVU=;
 b=22UfCltM96Tm+reaam44xDG2+7fINARRVIfnwmcKp67oYwmlVBFMyovPXwJT2Ky8bb
 y7/DVkVPl1Ef/hlDvczV4b2bTwVGqOI5a2gszs0UEkCM+yfGxX1okUqJRuhoQdd8Kmgp
 Rc8KbThUkVHu6s4svwm8iokJJPlES8NCEdjINRfwQZH8ErhlCwuAs1FHo5A33gnp3z9G
 vexT2PbQ9GzK69qqB913w1jy0O4z4peb/gAAXRuWxIlJACYbsrwlxB4/knFMXTnGdOYC
 op8xMb1weBFAyR0u8SvnazKE05fiooIu6SeMEOxLFaKcsnbPmi7DBhjau0T86WszGPiQ
 vwug==
X-Gm-Message-State: AOAM5336HPBiucYL6RYRTg/N0o5SRDO4K9mJiv4reZLOkDm/JdCkcspG
 kKr3DHdjCJ1zos6d2LrqJBqq6rWyMNKcGiOlolg=
X-Google-Smtp-Source: ABdhPJwl6ECctCQ2UImx6s2hiEIB0jmRUUy+lnEL24OhDMlN+wLLYJdcfvK+wUrauJf1BMD+GzZ3eapU6SdWJ4Q0nH8=
X-Received: by 2002:a05:600c:240b:b0:380:f424:f2be with SMTP id
 11-20020a05600c240b00b00380f424f2bemr8238975wmp.16.1646412494755; Fri, 04 Mar
 2022 08:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-4-marcandre.lureau@redhat.com>
 <259d696c-9492-fb63-a2a4-1a66a8792520@vivier.eu>
In-Reply-To: <259d696c-9492-fb63-a2a4-1a66a8792520@vivier.eu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Mar 2022 20:48:03 +0400
Message-ID: <CAJ+F1CLz63XJ104e5Nyu+KNc+fhvHvbHrqGzRXpUpC4XZqJUzA@mail.gmail.com>
Subject: Re: [PATCH 3/4] Replace qemu_gettimeofday() with g_get_real_time()
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000e75aea05d967476e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Michael Roth <michael.roth@amd.com>, David Hildenbrand <david@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e75aea05d967476e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 4, 2022 at 8:10 PM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 04/03/2022 =C3=A0 16:27, marcandre.lureau@redhat.com a =C3=A9crit :
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > GLib g_get_real_time() is an alternative to gettimeofday().
> >
> > For semihosting, a few bits are lost on POSIX host, but this shouldn't
> > be a big concern.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   blockdev.c                 |  8 ++++----
> >   hw/rtc/m41t80.c            |  6 +++---
> >   hw/virtio/virtio-balloon.c |  9 +--------
> >   qapi/qmp-event.c           | 12 +++++-------
> >   qemu-img.c                 |  8 ++++----
> >   qga/commands-posix.c       | 11 +----------
> >   target/m68k/m68k-semi.c    | 22 ++++++++++------------
> >   target/nios2/nios2-semi.c  | 24 +++++++++++-------------
> >   8 files changed, 39 insertions(+), 61 deletions(-)
> >
> ...
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 75dbaab68ea9..3311a4ca0167 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
> >
> >   int64_t qmp_guest_get_time(Error **errp)
> >   {
> > -   int ret;
> > -   qemu_timeval tq;
> > -
> > -   ret =3D qemu_gettimeofday(&tq);
> > -   if (ret < 0) {
> > -       error_setg_errno(errp, errno, "Failed to get time");
> > -       return -1;
> > -   }
> > -
> > -   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
> > +    return g_get_real_time();
>
> now you return microseconds, before it was nanoseconds.
>
>
my bad, will fix it in v2, thanks for noticing!


> qga/qapi-schema.json:
>
> ##
> # @guest-get-time:
> #
> # Get the information about guest's System Time relative to
> # the Epoch of 1970-01-01 in UTC.
> #
> # Returns: Time in nanoseconds.
> #
> # Since: 1.5
> ##
> { 'command': 'guest-get-time',
>    'returns': 'int' }
>
> Except this problem:
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e75aea05d967476e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 4, 2022 at 8:10 PM Laur=
ent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 04/=
03/2022 =C3=A0 16:27, <a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a> a =C3=A9crit=C2=A0:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; GLib g_get_real_time() is an alternative to gettimeofday().<br>
&gt; <br>
&gt; For semihosting, a few bits are lost on POSIX host, but this shouldn&#=
39;t<br>
&gt; be a big concern.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0blockdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0hw/rtc/m41t80.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +++---<br>
&gt;=C2=A0 =C2=A0hw/virtio/virtio-balloon.c |=C2=A0 9 +--------<br>
&gt;=C2=A0 =C2=A0qapi/qmp-event.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 12 +++++-------<br>
&gt;=C2=A0 =C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0qga/commands-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +-----=
-----<br>
&gt;=C2=A0 =C2=A0target/m68k/m68k-semi.c=C2=A0 =C2=A0 | 22 ++++++++++------=
------<br>
&gt;=C2=A0 =C2=A0target/nios2/nios2-semi.c=C2=A0 | 24 +++++++++++----------=
---<br>
&gt;=C2=A0 =C2=A08 files changed, 39 insertions(+), 61 deletions(-)<br>
&gt; <br>
...<br>
&gt; diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
&gt; index 75dbaab68ea9..3311a4ca0167 100644<br>
&gt; --- a/qga/commands-posix.c<br>
&gt; +++ b/qga/commands-posix.c<br>
&gt; @@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char=
 *mode, Error **errp)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0int64_t qmp_guest_get_time(Error **errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0int ret;<br>
&gt; -=C2=A0 =C2=A0qemu_timeval tq;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0ret =3D qemu_gettimeofday(&amp;tq);<br>
&gt; -=C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;Failed=
 to get time&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;<br>
&gt; +=C2=A0 =C2=A0 return g_get_real_time();<br>
<br>
now you return microseconds, before it was nanoseconds.<br>
<br></blockquote><div><br></div><div>my bad, will fix it in v2, thanks for =
noticing!</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
qga/qapi-schema.json:<br>
<br>
##<br>
# @guest-get-time:<br>
#<br>
# Get the information about guest&#39;s System Time relative to<br>
# the Epoch of 1970-01-01 in UTC.<br>
#<br>
# Returns: Time in nanoseconds.<br>
#<br>
# Since: 1.5<br>
##<br>
{ &#39;command&#39;: &#39;guest-get-time&#39;,<br>
=C2=A0 =C2=A0&#39;returns&#39;: &#39;int&#39; }<br>
<br>
Except this problem:<br>
<br>
Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=
=3D"_blank">laurent@vivier.eu</a>&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e75aea05d967476e--

