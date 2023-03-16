Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F16BCD76
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 12:05:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclPb-0000BV-8R; Thu, 16 Mar 2023 07:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pclPY-0000As-7C; Thu, 16 Mar 2023 07:04:44 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pclPW-00088p-3z; Thu, 16 Mar 2023 07:04:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so4939411pjg.4; 
 Thu, 16 Mar 2023 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678964680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HJSkXUug862YBba6ciT9eQH6HlOnhb/oAZaaTJvAyd0=;
 b=q55z1E+Uk3x4E39QrAnu26J5g58eBGNGQHYURv+pJKVNV+G9Fd4LBAhOqfiG/nPqn/
 mHodFQTzMX+uiTyLN/r2ycmcPUMFd8qUL2vlwepM9uPAitvlHoDCCsh3MFShQl/x3Yms
 WfGbT4U0kaGSd5cNswVV4YTaOrLC2Wv6/tL3zkeSt0zxAAgHNjaIGWZf0hTzv7CQ6UPa
 QphwZEWRvKs5xfLkTH3ugOZy7MxbtFR/oNdv24N16XBWlpYu+CoEL94V/tIiS0SKy9YN
 p1aoYzm7RVBmzg06wnzkvFw0rgaOfOvdxL8FT6U/oxCM5vs4+oFRYoEGRbogPlLL31K5
 PSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678964680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HJSkXUug862YBba6ciT9eQH6HlOnhb/oAZaaTJvAyd0=;
 b=S0DxJP9D9tk8lhhqqVGi7zEr0C7CnGOKXdYqp1APZFzL19VFdr/DSr6lC3/NNx4S0k
 OFtCfT1vv7wdvuoeHUka80PaF4KNpSUt0DeMygCdbv2gV5xekRKmYJpjlp4d6qkX2giu
 q1WI8OTbgkqU2U+20offXMNKi+QIDpyiuz44Op+8z4qDY0+EwPfAwitoXQ6JbPHpOXNS
 +hzhSZKrnOqoIcFQ6XoYBiCBWG9kgOFnrWCMehCTIAPYJRm7kWNmKo46SOyGAq+YiJfk
 Zd+wwl+zWStGbLA4z8yNOP6D7rAjFJbB0GVsLyP0LI29rjCmOzERUNdD7/xzBSF2+M2z
 4iTQ==
X-Gm-Message-State: AO0yUKUOdKbYuYDHnYgTXe4M75B6yTMQ+eHQQWBsCQSAOAeUAPG+EPrV
 Y1u0QFFmIKDZsNTwQao1h4w21kURJU4r3hHFYTc=
X-Google-Smtp-Source: AK7set9NKkWMEknBfPTAJ6e6NNxJp2jo5lsucKQPZFjJkbW6Lw8736HjNoi3oUQE7d5t50F/jCKCNEazE1vcdgD0CWg=
X-Received: by 2002:a17:902:e5c4:b0:19f:2aa4:b1e5 with SMTP id
 u4-20020a170902e5c400b0019f2aa4b1e5mr1280232plf.2.1678964680054; Thu, 16 Mar
 2023 04:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <333abd8d-035d-b9c9-a934-26876d33d7d0@linaro.org>
In-Reply-To: <333abd8d-035d-b9c9-a934-26876d33d7d0@linaro.org>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 14:04:26 +0300
Message-ID: <CA+rFky6Gcf0oTT58ZbScm1hfQC9kdHNYE+ABSsKc0=jy31Xvjg@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-discuss@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000585a4405f7026d81"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=randrianasulu@gmail.com; helo=mail-pj1-x1029.google.com
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

--000000000000585a4405f7026d81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 13:56 Philippe Mathieu-D=
aud=C3=A9 <philmd@linaro.org>:

> On 16/3/23 11:22, Andrew Randrianasulu wrote:
> > =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 Andrew Randria=
nasulu <randrianasulu@gmail.com
> > <mailto:randrianasulu@gmail.com>>:
> >     =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 11:31 Thomas Hut=
h <thuth@redhat.com
> >     <mailto:thuth@redhat.com>>:
> >         On 16/03/2023 08.36, Philippe Mathieu-Daud=C3=A9 wrote:
> >          > On 16/3/23 08:17, Andrew Randrianasulu wrote:
> >          >> =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Ph=
ilippe Mathieu-Daud=C3=A9
> >         <philmd@linaro.org <mailto:philmd@linaro.org>
> >          >> <mailto:philmd@linaro.org <mailto:philmd@linaro.org>>>:
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
>
>
> > Still, pushing users into endless hw upgrade is no fun:
> >
> >
> https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-=
makes-more-sense-than-recycling/
> <
> https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-=
makes-more-sense-than-recycling/
> >
> >
> > note e-waste and energy consumption
> >
> > This graph does not make me happy:
> >
> >
> https://ourworldindata.org/grapher/global-energy-substitution?time=3Dearl=
iest..2021
> <
> https://ourworldindata.org/grapher/global-energy-substitution?time=3Dearl=
iest..2021
> >
> >
> > Note this paradox too
> >
> > https://en.m.wikipedia.org/wiki/Jevons_paradox
> > <https://en.m.wikipedia.org/wiki/Jevons_paradox>
>
>
> >          >> [...] I also ran qemu-system-ppc on Huawei Matepad T8 (32
> >         bit Android,
> >          >> too) for emulating old mac os 9. Yes, I can wait 10 min per
> >         guest boot.
> >          >> Fedora 36 armhf boots even slower on emulation!
> >
> >         Yes, but for such scenarios, you can also use older versions of
> >         QEMU, you
> >         don't need the latest and greatest shiny QEMU version.
>
> Thomas answer still applies: if you can use QEMU v8.0.0 to emulate
> macOS 9 on your Huawei Matepad T8 with 32-bit Android, why worry
> about trying to use future QEMU versions?
>

Because Termux (only one currently supported distro for bare Android, as
far as I know, everything else either unsupported or run under it, with
some space penalty due to not using Android's libraries) will update qemu
As Fast As Possible, being rolling release.


Again, I as maintainer/developer (due to our real developer  being dead
from road  incident) of cinelerra-gg I only can recommend to try your
favourite projects in somewhat constrained environment, I tweaked our build
system quite heavily simply because I was forced by device's constrains.

Also, for CI thing may be lessen compiler optimization levels at least for
some runs? And/or tweak ccache compression ....

>

--000000000000585a4405f7026d81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 13:=
56 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 16/3/23 =
11:22, Andrew Randrianasulu wrote:<br>
&gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 Andrew Randri=
anasulu &lt;<a href=3D"mailto:randrianasulu@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">randrianasulu@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:randrianasulu@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">randrianasulu@gmail.com</a>&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., =
11:31 Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank"=
 rel=3D"noreferrer">thuth@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:thuth@redhat.com" targ=
et=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 16/03/2023 08.36, Philippe Mathieu=
-Daud=C3=A9 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On 16/3/23 08:17, Andrew Randri=
anasulu wrote:<br>
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
<br>
<br>
&gt; Still, pushing users into endless hw upgrade is no fun:<br>
&gt; <br>
&gt; <a href=3D"https://hackaday.com/2023/02/28/repurposing-old-smartphones=
-when-reusing-makes-more-sense-than-recycling/" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://hackaday.com/2023/02/28/repurposing-old-smartp=
hones-when-reusing-makes-more-sense-than-recycling/</a> &lt;<a href=3D"http=
s://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-makes-=
more-sense-than-recycling/" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-m=
akes-more-sense-than-recycling/</a>&gt;<br>
&gt; <br>
&gt; note e-waste and energy consumption<br>
&gt; <br>
&gt; This graph does not make me happy:<br>
&gt; <br>
&gt; <a href=3D"https://ourworldindata.org/grapher/global-energy-substituti=
on?time=3Dearliest..2021" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://ourworldindata.org/grapher/global-energy-substitution?time=3Dearlies=
t..2021</a> &lt;<a href=3D"https://ourworldindata.org/grapher/global-energy=
-substitution?time=3Dearliest..2021" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://ourworldindata.org/grapher/global-energy-substitution?t=
ime=3Dearliest..2021</a>&gt;<br>
&gt; <br>
&gt; Note this paradox too<br>
&gt; <br>
&gt; <a href=3D"https://en.m.wikipedia.org/wiki/Jevons_paradox" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://en.m.wikipedia.org/wiki/Jevons=
_paradox</a> <br>
&gt; &lt;<a href=3D"https://en.m.wikipedia.org/wiki/Jevons_paradox" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://en.m.wikipedia.org/wiki/Je=
vons_paradox</a>&gt;<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; [...] I also ran qemu-syste=
m-ppc on Huawei Matepad T8 (32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit Android,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; too) for emulating old mac =
os 9. Yes, I can wait 10 min per<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guest boot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; Fedora 36 armhf boots even =
slower on emulation!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Yes, but for such scenarios, you can =
also use older versions of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU, you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t need the latest and greates=
t shiny QEMU version.<br>
<br>
Thomas answer still applies: if you can use QEMU v8.0.0 to emulate<br>
macOS 9 on your Huawei Matepad T8 with 32-bit Android, why worry<br>
about trying to use future QEMU versions?<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Because Termux (only one currently=
 supported distro for bare Android, as far as I know, everything else eithe=
r unsupported or run under it, with some space penalty due to not using And=
roid&#39;s libraries) will update qemu As Fast As Possible, being rolling r=
elease.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Again, I as maintainer/developer (due to our real developer=C2=
=A0 being dead from road=C2=A0 incident) of cinelerra-gg I only can recomme=
nd to try your favourite projects in somewhat constrained environment, I tw=
eaked our build system quite heavily simply because I was forced by device&=
#39;s constrains.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Also, =
for CI thing may be lessen compiler optimization levels at least for some r=
uns? And/or tweak ccache compression ....</div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000585a4405f7026d81--

