Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF656BCDAD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 12:12:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclW5-00055T-8L; Thu, 16 Mar 2023 07:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pclW2-00054B-Ce; Thu, 16 Mar 2023 07:11:26 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pclVz-00054L-Vs; Thu, 16 Mar 2023 07:11:26 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d22so690471pgw.2;
 Thu, 16 Mar 2023 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678965082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dN/zq1/jsSZFU3wL04ycVKKN6KUPLyeh5x6fZapM0hU=;
 b=XGkhd8JRK1R0dTNLw2Ie5i6wNkkOQKr5HnFKvg49vNbm/P4tRcbJ+mj/S519n9tEaS
 7hGOcMCGJk2qNDHnxyCRYIFTvqtVY1D69VPOWPLmuj/1RnTqYYHshJypkm7CB2cm1BRL
 nAlw9phJXFzXzIMe0q9wr6OZCmMuv6tGgJx31VxUeicxOY5TwKF0qe8U563STJWyht3e
 5iiP1nZ9BQmnjSqcxPiKyzn56k3c9ButLZ9C9zmz0+KqqxDYkB/f6cA6sr0swVjYzI6k
 edJxo+HiZJeli4iy22SWPkdcazU9KqqgIp0JiJ3zFHr2FBvehNHXmH9rDi76Aqdz4Tpy
 OkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678965082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dN/zq1/jsSZFU3wL04ycVKKN6KUPLyeh5x6fZapM0hU=;
 b=FIRQ8NtOQ7FFcmt9Kol6Qrm/Wduf/bmCiz+ONH9qIlwuCOV7ARmQmcxhOIc48AVcIy
 PRA+RKOFON8sxi+b2K7vKL+jTalunOSE4wZfiKWbeuTnK8mOw7F01tT2bAq1YfRvvyHe
 kOqqWVaaH0sKzDzky+zi1I8n+iOisq/g6qnH/+H6q6/08PDliIwTdm6IhKktHqDg26Vh
 Xlf/XPFDyneDCEcC77lfOBHw/sCfBS2RqfKOGJKfNHO1m3hkczLDlBMrCxiidUkrHh5m
 ZCsXkJsLXymyi9aAY9vlhIAEXiwf5nZB5702Njk1igXDBB00C1maoAbjFTj0ysvaTwU6
 0vuA==
X-Gm-Message-State: AO0yUKUTwKfdT0cWrPXqxUN3aynqdmGCgxjbXEGwVwcmNOKB7mqafqd9
 kmzI0v2dbcKhq6q7VokUMVd6qNYdH5/YkQbidRI=
X-Google-Smtp-Source: AK7set+cSBC6iY6CddfnO8CEx3kcX55EB+XrvUeU1+Da4m0FsW4FuQLAqpnfiqb3JUT5PTYw9XgT5MW99f5xbRn5WbI=
X-Received: by 2002:a65:4184:0:b0:503:7be2:19a7 with SMTP id
 a4-20020a654184000000b005037be219a7mr758653pgq.1.1678965081944; Thu, 16 Mar
 2023 04:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
In-Reply-To: <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 14:11:08 +0300
Message-ID: <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004cb9e005f70285ea"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=randrianasulu@gmail.com; helo=mail-pg1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000004cb9e005f70285ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 14:02 Thomas Huth <thuth=
@redhat.com>:

> On 16/03/2023 11.22, Andrew Randrianasulu wrote:
> >
> >
> > =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 Andrew Randria=
nasulu <randrianasulu@gmail.com
> > <mailto:randrianasulu@gmail.com>>:
> >
> >
> >
> >     =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 11:31 Thomas Hut=
h <thuth@redhat.com
> >     <mailto:thuth@redhat.com>>:
> >
> >         On 16/03/2023 08.36, Philippe Mathieu-Daud=C3=A9 wrote:
> >          > On 16/3/23 08:17, Andrew Randrianasulu wrote:
> >          >>
> >          >> =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Ph=
ilippe Mathieu-Daud=C3=A9
> >         <philmd@linaro.org <mailto:philmd@linaro.org>
> >          >> <mailto:philmd@linaro.org <mailto:philmd@linaro.org>>>:
> >          >>
> >          >>     Hi Andrew,
> >          >>
> >          >>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
> >          >>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
> >         <https://wiki.qemu.org/ChangeLog/8.0>
> >          >>     <https://wiki.qemu.org/ChangeLog/8.0
> >         <https://wiki.qemu.org/ChangeLog/8.0>>
> >          >>      > <https://wiki.qemu.org/ChangeLog/8.0
> >         <https://wiki.qemu.org/ChangeLog/8.0>
> >          >>     <https://wiki.qemu.org/ChangeLog/8.0
> >         <https://wiki.qemu.org/ChangeLog/8.0>>>
> >          >>      >
> >          >>      > =3D=3D=3D
> >          >>      > System emulation on 32-bit x86 and ARM hosts has bee=
n
> >         deprecated.
> >          >>     The
> >          >>      > QEMU project no longer considers 32-bit x86 and ARM
> >         support for
> >          >>     system
> >          >>      > emulation to be an effective use of its limited
> >         resources, and thus
> >          >>      > intends to discontinue.
> >          >>      >
> >          >>      >   =3D=3D
> >          >>      >
> >          >>      > well, I guess arguing from memory-consuption point o=
n
> 32
> >         bit x86
> >          >>     hosts
> >          >>      > (like my machine where I run 32 bit userspace on 64
> bit
> >         kernel)
> >
> >         All current PCs have multiple gigabytes of RAM, so using a 32-b=
it
> >         userspace
> >         to save some few bytes sounds weird.
> >
> >
> >     I think difference more like in 20-30% (on disk and in ram), not *f=
ew
> >     bytes*.
> >
> >
> > I stand (self) corrected on *on disk* binary size, this parameter tend
> to be
> > ~same between bash / php binaries from Slackware 15.0 i586/x86_64. I do
> not
> > have full identical x64 Slackware setup for measuring memory impact.
> >
> >
> > Still, pushing users into endless hw upgrade is no fun:
> >
> >
> https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-=
makes-more-sense-than-recycling/
> >
> >
> > note e-waste and energy consumption
>
> Now you're mixing things quite badly. That would be an argument in the
> years
> before 2010 maybe, when not everybody had a 64-bit processor in their PC
> yet, but it's been now more than 12 years that all recent Desktop
> processors

=3D=3D=3D


Laptops, tablets etc exist.


>
> feature 64-bit mode. So if QEMU stops supporting 32-bit x86 environments,
> this is not forcing you to buy a new hardware, since you're having a
> 64-bit
> hardware already anyway. If someone still has plain 32-bit x86 hardware
> around for their daily use, that's certainly not a piece of hardware you
> want to run QEMU on, since it's older than 12 years already, and thus not
> really strong enough to run a recent emulator in a recent way.
>

Well, current qemu runs quite well, than you very much (modulo all this
twiddling with command line switches). I think very fact it runs well (even
as tcg-only emulator, on integer tasks at least) on 32-bit hosts actually
good, and if 32-bit arm hardware can keep some codeways in working state
for me - even better.

But may be qemu as emulator and qemu as  industrial hypervisor actually
better to live separate lives? I do not know future, just dislike direction
winds are blowing .... since long time, really.



>   Thomas
>
>

--0000000000004cb9e005f70285ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 14:=
02 Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>=
&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On 16/03/2023 11.22, Andrew R=
andrianasulu wrote:<br>
&gt; <br>
&gt; <br>
&gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 Andrew Randri=
anasulu &lt;<a href=3D"mailto:randrianasulu@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">randrianasulu@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:randrianasulu@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">randrianasulu@gmail.com</a>&gt;&gt;:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., =
11:31 Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank"=
 rel=3D"noreferrer">thuth@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:thuth@redhat.com" targ=
et=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 16/03/2023 08.36, Philippe Mathieu=
-Daud=C3=A9 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On 16/3/23 08:17, Andrew Randri=
anasulu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =D1=87=D1=82, 16 =D0=BC=D0=
=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Mathieu-Daud=C3=A9<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:philmd@linaro.o=
rg" target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a> &lt;mailto:<=
a href=3D"mailto:philmd@linaro.org" target=3D"_blank" rel=3D"noreferrer">ph=
ilmd@linaro.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; &lt;mailto:<a href=3D"mailt=
o:philmd@linaro.org" target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org=
</a> &lt;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" rel=
=3D"noreferrer">philmd@linaro.org</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 Hi Andre=
w,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 On 16/3/=
23 01:57, Andrew Randrianasulu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; Looking at <a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.qemu.org/=
ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki=
.qemu.org/ChangeLog/8.0</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a h=
ref=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.qemu.org/=
ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki=
.qemu.org/ChangeLog/8.0</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.qemu.org/=
ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki=
.qemu.org/ChangeLog/8.0</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a h=
ref=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.qemu.org/=
ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki=
.qemu.org/ChangeLog/8.0</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; System emulation on 32-bit x86 and ARM hosts has been<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deprecated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; QEMU project no longer considers 32-bit x86 and ARM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 system<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; emulation to be an effective use of its limited<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resources, and thus<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; intends to discontinue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t;=C2=A0 =C2=A0=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; well, I guess arguing from memory-consuption point on 32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit x86<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 hosts<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &g=
t; (like my machine where I run 32 bit userspace on 64 bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0All current PCs have multiple gigabyt=
es of RAM, so using a 32-bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0userspace<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to save some few bytes sounds weird.<=
br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think difference more like in 20-30% (on disk and=
 in ram), not *few<br>
&gt;=C2=A0 =C2=A0 =C2=A0bytes*. <br>
&gt; <br>
&gt; <br>
&gt; I stand (self) corrected on *on disk* binary size, this parameter tend=
 to be <br>
&gt; ~same between bash / php binaries from Slackware 15.0 i586/x86_64. I d=
o not <br>
&gt; have full identical x64 Slackware setup for measuring memory impact.<b=
r>
&gt; <br>
&gt; <br>
&gt; Still, pushing users into endless hw upgrade is no fun:<br>
&gt; <br>
&gt; <a href=3D"https://hackaday.com/2023/02/28/repurposing-old-smartphones=
-when-reusing-makes-more-sense-than-recycling/" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://hackaday.com/2023/02/28/repurposing-old-smartp=
hones-when-reusing-makes-more-sense-than-recycling/</a> &gt;<br>
&gt; <br>
&gt; note e-waste and energy consumption<br>
<br>
Now you&#39;re mixing things quite badly. That would be an argument in the =
years <br>
before 2010 maybe, when not everybody had a 64-bit processor in their PC <b=
r>
yet, but it&#39;s been now more than 12 years that all recent Desktop proce=
ssors</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">=3D=3D=3D</blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Laptops, tablets etc =
exist.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
feature 64-bit mode. So if QEMU stops supporting 32-bit x86 environments, <=
br>
this is not forcing you to buy a new hardware, since you&#39;re having a 64=
-bit <br>
hardware already anyway. If someone still has plain 32-bit x86 hardware <br=
>
around for their daily use, that&#39;s certainly not a piece of hardware yo=
u <br>
want to run QEMU on, since it&#39;s older than 12 years already, and thus n=
ot <br>
really strong enough to run a recent emulator in a recent way.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well, current=
 qemu runs quite well, than you very much (modulo all this twiddling with c=
ommand line switches). I think very fact it runs well (even as tcg-only emu=
lator, on integer tasks at least) on 32-bit hosts actually good, and if 32-=
bit arm hardware can keep some codeways in working state for me - even bett=
er.</div><div dir=3D"auto"><br></div><div dir=3D"auto">But may be qemu as e=
mulator and qemu as=C2=A0 industrial hypervisor actually better to live sep=
arate lives? I do not know future, just dislike direction winds are blowing=
 .... since long time, really.=C2=A0</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>

--0000000000004cb9e005f70285ea--

