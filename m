Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF375F653C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:31:24 +0200 (CEST)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogP63-0008Nm-RH
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogP1c-0002cC-1j
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:26:48 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:41764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogP1Z-0007hR-NW
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:26:47 -0400
Received: by mail-lj1-x22c.google.com with SMTP id j23so1747312lji.8
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5UHMTqcb22SnraLTPGDXGZI5S6FTD6Ci0UIML/12oCY=;
 b=aL1OiXJJ5wR8/N9WoG2egtl1zZ8WJaZfPXd4DUWqyxCJkfZr3l5mU2FQc3KiHziosM
 rEOWIXy6U0vrqw9dWzY4x5sPUOYxD1XyflN6l0u10WHCRo/WvUWK5OBiMYtByvwqFDyx
 XHqX/Gj9axu0oRBISPlNug36oxEvtAoyu/TxBCopDTxcBEKAvSKLf1Frpphz09ZIXmu8
 5iWH3OjV7VHOsHT1NsgZvDkQi/x6Z9oUEwfJiHjVYTEIPqnTikWGunAgh0I9sR+1iREj
 c5Ubu4BRse/n4j8S6mX32Hze0iDZmuJ/bJlYolHpCdIqP7XZdwbBftIXbroKlwtdoDup
 iGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5UHMTqcb22SnraLTPGDXGZI5S6FTD6Ci0UIML/12oCY=;
 b=emVjT5Z/Cz1oGRWiZ6cDGo9CuqYNywkBmKS2BmvwNuivSt+oK7OrVrsQioaijHINbz
 HRUx7Row5DE2MrVlBj+N0aVN3xvHT9W77GfPhewwybfkVXfFnYM10fFPDQmrsujCI2U7
 2bREsoLGCKIiT0z+YenMN5X1/RVdMMvGPa9MjfpiqsXelSfF5UvTxd3JdnqoBAaajzna
 h5gYxaS4QuzKqtex8/gSGy4gSHQZBKczd+B4zv8c5w1WZXqjtTvUe3iYRbGg9+ynRdJa
 SB+lvQrQfu8g691cR5RKwlPVZLUDK9dkZ9UwkiDwhOAOn9HiMXn4h9BIDEUgxMgqEFrl
 M+9A==
X-Gm-Message-State: ACrzQf11EjKkZv5cHlrp4+72ZiubLHncxN1l5P53aCVZjZK6Fb7H29ut
 MuYcZkPjiF01FWHAG067affd8gFYpkQlEu51aeU=
X-Google-Smtp-Source: AMsMyM4bVkSYhrnMCBNU7iazC4SIDioXocVxvgwEllvWY3yoZBlTEQA1RKk71unjSgCxYnPh5V1dCU1Le3txJ2Twc8s=
X-Received: by 2002:a2e:7c12:0:b0:26d:fc11:d35f with SMTP id
 x18-20020a2e7c12000000b0026dfc11d35fmr1521903ljc.449.1665055603275; Thu, 06
 Oct 2022 04:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
 <20221006081222.2606746-6-marcandre.lureau@redhat.com>
 <Yz6U7GXKg+Ctb3t0@redhat.com>
 <CAMxuvawpOSiGYFnGgmh4mb7jKbbKvd5UD_QP6FMZZh8gUAzVBQ@mail.gmail.com>
 <Yz6YPR+MGo72TOAF@redhat.com>
In-Reply-To: <Yz6YPR+MGo72TOAF@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 Oct 2022 15:26:31 +0400
Message-ID: <CAJ+F1CLJrXLPtpqt8oG-Ob5hmG8Sg5ZaCdLbNGjJ=B3ZfMqECQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] tests/unit: make test-io-channel-command work on
 win32
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c3bbff05ea5bf765"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c3bbff05ea5bf765
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 6, 2022 at 2:14 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Thu, Oct 06, 2022 at 12:46:17PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Oct 6, 2022 at 12:42 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> wrote:
> > >
> > > On Thu, Oct 06, 2022 at 12:12:22PM +0400, marcandre.lureau@redhat.com
> wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > >
> > > > This has been tested under msys2 & windows 11. I haven't tried to
> make
> > > > it work with other environments yet, but that should be enough to
> > > > validate the channel-command implementation anyway.
> > > >
> > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > > ---
> > > >  tests/unit/test-io-channel-command.c | 32
> ++++++++++++----------------
> > > >  tests/unit/meson.build               |  2 +-
> > > >  2 files changed, 15 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/tests/unit/test-io-channel-command.c
> b/tests/unit/test-io-channel-command.c
> > > > index aa09c559cd..be98c3452a 100644
> > > > --- a/tests/unit/test-io-channel-command.c
> > > > +++ b/tests/unit/test-io-channel-command.c
> > > > @@ -24,29 +24,27 @@
> > > >  #include "qapi/error.h"
> > > >  #include "qemu/module.h"
> > > >
> > > > -#ifndef WIN32
> > > > +#define TEST_PATH "test-io-channel-command.fifo"
> > > > +
> > > > +#define SOCAT_SRC "PIPE:" TEST_PATH ",wronly"
> > > > +#define SOCAT_DST "PIPE:" TEST_PATH ",rdonly"
> > > > +
> > > >  static void test_io_channel_command_fifo(bool async)
> > > >  {
> > > > -#define TEST_FIFO "tests/test-io-channel-command.fifo"
> > > >      QIOChannel *src, *dst;
> > > >      QIOChannelTest *test;
> > > > -    const char *srcfifo =3D "PIPE:" TEST_FIFO ",wronly";
> > > > -    const char *dstfifo =3D "PIPE:" TEST_FIFO ",rdonly";
> > > >      const char *srcargv[] =3D {
> > > > -        "/bin/socat", "-", srcfifo, NULL,
> > > > +        g_getenv("SOCAT"), "-", SOCAT_SRC, NULL,
> > >
> > > Please don't rely on env variables, as it complicates the ability to
> > > invoke the test directly, without the meson harness. Either pass the
> > > path from meson at compile time in config-host.h, or make this code
> > > use an unqualified path, so it honours $PATH at runtime.
> >
> > I tried to pass it through config-host.h, but I dont see a way to
> > escape the \ is the paths.
>
> This must be possible, as we have lots of strings in config-host.h
> that are paths - eg many CONFIG_QEMU_xxxDIR variables
>

Those paths, generated by meson I believe, use /-dir separators. But
find_program() returns \-seperated paths.. Maybe the solution is to replace
\ with / ? (hopefully the path is not quoted already...)

There is a proposal for to_quoted():
https://github.com/mesonbuild/meson/issues/10417

I found another solution, using g_find_program_in_path(). See v3.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c3bbff05ea5bf765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 2:14 PM Daniel P. Berr=
ang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berr=
ange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Thu, Oct 06, 2022 at 12:46:17PM +0400, Marc-Andr=C3=A9 Lu=
reau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Thu, Oct 6, 2022 at 12:42 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Oct 06, 2022 at 12:12:22PM +0400, <a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> w=
rote:<br>
&gt; &gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This has been tested under msys2 &amp; windows 11. I haven&#=
39;t tried to make<br>
&gt; &gt; &gt; it work with other environments yet, but that should be enou=
gh to<br>
&gt; &gt; &gt; validate the channel-command implementation anyway.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com<=
/a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 tests/unit/test-io-channel-command.c | 32 ++++++++++++=
----------------<br>
&gt; &gt; &gt;=C2=A0 tests/unit/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 15 insertions(+), 19 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/tests/unit/test-io-channel-command.c b/tests/un=
it/test-io-channel-command.c<br>
&gt; &gt; &gt; index aa09c559cd..be98c3452a 100644<br>
&gt; &gt; &gt; --- a/tests/unit/test-io-channel-command.c<br>
&gt; &gt; &gt; +++ b/tests/unit/test-io-channel-command.c<br>
&gt; &gt; &gt; @@ -24,29 +24,27 @@<br>
&gt; &gt; &gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt; &gt; &gt;=C2=A0 #include &quot;qemu/module.h&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -#ifndef WIN32<br>
&gt; &gt; &gt; +#define TEST_PATH &quot;test-io-channel-command.fifo&quot;<=
br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define SOCAT_SRC &quot;PIPE:&quot; TEST_PATH &quot;,wronly=
&quot;<br>
&gt; &gt; &gt; +#define SOCAT_DST &quot;PIPE:&quot; TEST_PATH &quot;,rdonly=
&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 static void test_io_channel_command_fifo(bool async)<b=
r>
&gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; -#define TEST_FIFO &quot;tests/test-io-channel-command.fifo&=
quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 QIOChannel *src, *dst;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 QIOChannelTest *test;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 const char *srcfifo =3D &quot;PIPE:&quot; TES=
T_FIFO &quot;,wronly&quot;;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 const char *dstfifo =3D &quot;PIPE:&quot; TES=
T_FIFO &quot;,rdonly&quot;;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 const char *srcargv[] =3D {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/bin/socat&quot;, &quot;-=
&quot;, srcfifo, NULL,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_getenv(&quot;SOCAT&quot;), &q=
uot;-&quot;, SOCAT_SRC, NULL,<br>
&gt; &gt;<br>
&gt; &gt; Please don&#39;t rely on env variables, as it complicates the abi=
lity to<br>
&gt; &gt; invoke the test directly, without the meson harness. Either pass =
the<br>
&gt; &gt; path from meson at compile time in config-host.h, or make this co=
de<br>
&gt; &gt; use an unqualified path, so it honours $PATH at runtime.<br>
&gt; <br>
&gt; I tried to pass it through config-host.h, but I dont see a way to<br>
&gt; escape the \ is the paths.<br>
<br>
This must be possible, as we have lots of strings in config-host.h<br>
that are paths - eg many CONFIG_QEMU_xxxDIR variables<br></blockquote><div>=
<br></div><div>Those paths, generated by meson I believe, use /-dir separat=
ors. But find_program() returns \-seperated paths.. Maybe the solution is t=
o replace \ with / ? (hopefully the path is not quoted already...)<br></div=
></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Ther=
e is a proposal for to_quoted(): <a href=3D"https://github.com/mesonbuild/m=
eson/issues/10417" target=3D"_blank">https://github.com/mesonbuild/meson/is=
sues/10417</a></div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">I found another solution, using g_find_program_in_path(). See v3.<=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">thanks=
<br></div><div class=3D"gmail_quote"><br></div>-- <br><div dir=3D"ltr">Marc=
-Andr=C3=A9 Lureau<br></div></div>

--000000000000c3bbff05ea5bf765--

