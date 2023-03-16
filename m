Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35356BCCA9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckl8-0000zA-IX; Thu, 16 Mar 2023 06:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pckl6-0000yx-5b; Thu, 16 Mar 2023 06:22:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pckl3-00071P-Cx; Thu, 16 Mar 2023 06:22:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id rj10so1155627pjb.4;
 Thu, 16 Mar 2023 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678962171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NDZeBiDBHSKDsckmtVcGzMMdhTYoLv3nsCkmh81whfs=;
 b=QOAc4iXLVbjARjO3sQkm3uQexERc4WDZmzB5J5GKNhPZjtPLuGWTRLndIAqlHjc8WL
 aYe553ewq4TMPldCAgwCI0rP3Ro64C5xy54CeN/THiDvfEDLhNDwUka9ihLtPyDTIxIJ
 hhZIYe9Im09Vun7Qy/pidG+/1FzHTJUl/Gv7U+Ba0f/LNP6g/F+reBAnk6pmXr12Wsfd
 9HFDBxHSN2Gm8HY34df/BuaGjfKaBBQjxiRAhgWOjqkahv1E/M0GuyDyEKzpFJvkIowK
 QVY/ce3Jc8W5NwdGR1CrVT/hPPPS4KGFXkhdzq4CtxCWXgQJDBZkLmzg/k4aicjiEElT
 Ya0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678962171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NDZeBiDBHSKDsckmtVcGzMMdhTYoLv3nsCkmh81whfs=;
 b=WCCm7qNC6Le7R0uTm07PPyo/VcvsiYBm0557YI16v8xxJ1VcypWbM+aL56nGBpbt5R
 jhCQfK1J0/hf7Zq1Ge0ktwrJNhAvrG5Ry1ikBIDsRTRlOpMS+bUIE2IKQUOLimDe4mIU
 ne3pc49ktqqSsBf4FcIHHvCcVIf3KoXgF5XWNPakrgHAS/l+ooFoBUQFVdXSF19YgKlm
 D/e4soVW5lqOZ4k80JJKgCrOH5qNXJIvDp2+TIpjXQyJG+eazEIG015F1mokTJDns/Y+
 aMA8hqgAZRM9Wqy5uC4XUJPr/RDAgJuEEW/hhw8OuBCIHe6NMVR5/pxp11Wi/ocNOhMo
 cIvw==
X-Gm-Message-State: AO0yUKXtnpz9mSPuoEtBPhM8G0x8gQFpNy3g2E/ohdz3WxKU76/V3TCj
 LFUgrnTT7n4wgmhElJk05M6v9uJbCaDFcYChhMY=
X-Google-Smtp-Source: AK7set/NnIicHGptO/eo1qq/kcGaLbGzuoO4hjzwwjrjzjDraSwi/rBHP4nSFwjLvKF8a40/rvqT0SLYxys+KDtousA=
X-Received: by 2002:a17:903:44d:b0:19f:35d3:ed0b with SMTP id
 iw13-20020a170903044d00b0019f35d3ed0bmr1184632plb.2.1678962171279; Thu, 16
 Mar 2023 03:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
In-Reply-To: <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 13:22:38 +0300
Message-ID: <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cf7d4805f701d74f"
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

--000000000000cf7d4805f701d74f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 Andrew Randrianasu=
lu <randrianasulu@gmail.com>:

>
>
> =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 11:31 Thomas Huth <thu=
th@redhat.com>:
>
>> On 16/03/2023 08.36, Philippe Mathieu-Daud=C3=A9 wrote:
>> > On 16/3/23 08:17, Andrew Randrianasulu wrote:
>> >>
>> >> =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Mat=
hieu-Daud=C3=A9 <philmd@linaro.org
>> >> <mailto:philmd@linaro.org>>:
>> >>
>> >>     Hi Andrew,
>> >>
>> >>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
>> >>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
>> >>     <https://wiki.qemu.org/ChangeLog/8.0>
>> >>      > <https://wiki.qemu.org/ChangeLog/8.0
>> >>     <https://wiki.qemu.org/ChangeLog/8.0>>
>> >>      >
>> >>      > =3D=3D=3D
>> >>      > System emulation on 32-bit x86 and ARM hosts has been
>> deprecated.
>> >>     The
>> >>      > QEMU project no longer considers 32-bit x86 and ARM support fo=
r
>> >>     system
>> >>      > emulation to be an effective use of its limited resources, and
>> thus
>> >>      > intends to discontinue.
>> >>      >
>> >>      >   =3D=3D
>> >>      >
>> >>      > well, I guess arguing from memory-consuption point on 32 bit x=
86
>> >>     hosts
>> >>      > (like my machine where I run 32 bit userspace on 64 bit kernel=
)
>>
>> All current PCs have multiple gigabytes of RAM, so using a 32-bit
>> userspace
>> to save some few bytes sounds weird.
>>
>
> I think difference more like in 20-30% (on disk and in ram), not *few
> bytes*.
>

I stand (self) corrected on *on disk* binary size, this parameter tend to
be ~same between bash / php binaries from Slackware 15.0 i586/x86_64. I do
not have full identical x64 Slackware setup for measuring memory impact.


Still, pushing users into endless hw upgrade is no fun:

https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-ma=
kes-more-sense-than-recycling/

note e-waste and energy consumption

This graph does not make me happy:

https://ourworldindata.org/grapher/global-energy-substitution?time=3Dearlie=
st..2021

Note this paradox too

https://en.m.wikipedia.org/wiki/Jevons_paradox

Yes, weirdly or not basically I talk about same thing as "we are running
out of CI  quota". But. With ~all developers following mindlessly into
"upgrade now, think later if at all" whole dependency tree will be heavier
and heavier.


I guess whole move to gitlab also was not from overly good life .... I
wonder of those c:\ paths I saw while looking into build status  are real
and mean CI running on Windows? Or it was just some strange fake thing
..... is Windows cheaper? Is it really better when it comes to containers?



Also, this whole "my program is only one running on user's machine"  is
> flawed.
>
>
>
>> (and in case you're talking about a very old PC that cannot be extened
>> anymore, you're likely better off with an older version of QEMU anyway)
>>
>> >>
>> >>     If you use a 64-bit kernel, then your host is 64-bit :)
>> >>
>> >>
>> >>
>> >> No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all
>> 32bit.
>> >> So, qemu naturally will be 32-bit binary on my system.
>> >
>> > This configuration is still supported!
>> >
>> > Thomas, should we clarify yet again? Maybe adding examples?
>>
>> There are two aspects here:
>>
>> 1) 32-bit KVM support - this won't be supported in the future anymore.
>> Since
>> running a 32-bit QEMU on a 64-bit kernel still uses the 32-bit KVM API,
>> KVM
>> also won't be possible anymore with a QEMU that has been compiled in
>> 32-bit
>> mode.
>>
>> 2) Compiling a 32-bit QEMU binary won't be officially supported anymore.
>> We
>> won't waste any more precious CI minutes on this (which is where we're
>> struggling the most currently), and likely no active support for finding
>> and
>> fixing bugs.
>
>
> Well, does this CI thing reuse build objects (even indirectly, via ccache=
)
> currently?
>
>
> But I guess we won't actively disable this possibility
>> (especially since we did not deprecate the corresponding 32-bit
>> linux-user
>> emulation yet, so the emulation code will mostly still stay around).
>>
>> In the long run, we likely want to get rid of the separate compilation o=
f
>> the qemu-system-i386 binary, too, but that's still to be discussed. E.g.
>> we
>> could add a special run mode to the qemu-system-x86_64 instead that make=
s
>> sure that the guest can only run in 32-bit mode.
>>
>> >>     host: hardware where you run QEMU
>> >>     guest: what is run within QEMU
>> >>
>> >>     Running 32-bit *guest* on your 64-bit *host* is still supported.
>>
>> If the complete userspace is 32-bit, I'd rather consider it a 32-bit hos=
t.
>>
>> >> [...] I also ran qemu-system-ppc on Huawei Matepad T8 (32 bit Android=
,
>> >> too) for emulating old mac os 9. Yes, I can wait 10 min per guest
>> boot.
>> >> Fedora 36 armhf boots even slower on emulation!
>>
>> Yes, but for such scenarios, you can also use older versions of QEMU, yo=
u
>> don't need the latest and greatest shiny QEMU version.
>>
>> >> Well, sometimes simple patch restores functionality. I patched for
>> example
>> >> olive-editor to run on 32 bit, and before this intel embree
>> (raytracing
>> >> kernels for Lux renderer). So, _sometimes_ it really not that costly.
>> >> While if this CI thing really runs per-commit and thrown away each
>> result
>> >> ... may be letting interested users to build things on their own
>> machines
>> >> (and share patches, if they develop them, publicly) actually good ide=
a.
>>
>> The problem is really that we don't have unlimited resources in the QEMU
>> project. Currently we're heavily struggling with the load in the CI, but
>> also pure man power is always very scarce. So at one point in time, you
>> have
>> to decide to say good bye to some old and hardly used features - at leas=
t
>> to
>> stop testing and actively supporting it. If you want to continue testing
>> and
>> fixing bugs for such host systems, that's fine, of course, but don't
>> expect
>> the QEMU developers to do that job in the future.
>>
>>   Thomas
>>
>>

--000000000000cf7d4805f701d74f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:=
17 Andrew Randrianasulu &lt;<a href=3D"mailto:randrianasulu@gmail.com" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">randrianasulu@gmail=
.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><di=
v><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 11:31 Thomas Huth &lt;<a=
 href=3D"mailto:thuth@redhat.com" rel=3D"noreferrer noreferrer noreferrer n=
oreferrer" target=3D"_blank">thuth@redhat.com</a>&gt;:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On 16/03/2023 08.36, Philippe Mathieu-Daud=C3=A9 wrote:=
<br>
&gt; On 16/3/23 08:17, Andrew Randrianasulu wrote:<br>
&gt;&gt;<br>
&gt;&gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" rel=3D"noreferr=
er noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">philmd@li=
naro.org</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:philmd@linaro.org" rel=3D"noreferrer =
noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">philmd@linar=
o.org</a>&gt;&gt;:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Hi Andrew,<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 On 16/3/23 01:57, Andrew Randrianasulu wrote:<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; Looking at <a href=3D"https://wiki.q=
emu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer n=
oreferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0=
</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/=
8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer noreferr=
er" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; &lt;<a href=3D"https://wiki.qemu.org=
/ChangeLog/8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferr=
er noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/=
8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer noreferr=
er" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; =3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; System emulation on 32-bit x86 and A=
RM hosts has been deprecated.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 The<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; QEMU project no longer considers 32-=
bit x86 and ARM support for<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 system<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; emulation to be an effective use of =
its limited resources, and thus<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; intends to discontinue.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; well, I guess arguing from memory-co=
nsuption point on 32 bit x86<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 hosts<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; (like my machine where I run 32 bit =
userspace on 64 bit kernel)<br>
<br>
All current PCs have multiple gigabytes of RAM, so using a 32-bit userspace=
 <br>
to save some few bytes sounds weird.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think difference more like in 20-30=
% (on disk and in ram), not *few bytes*. </div></div></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I stand (self) corrected o=
n *on disk* binary size, this parameter tend to be ~same between bash / php=
 binaries from Slackware 15.0 i586/x86_64. I do not have full identical x64=
 Slackware setup for measuring memory impact.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Still, pushing users into=
 endless hw upgrade is no fun:</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><a href=3D"https://hackaday.com/2023/02/28/repurposing-old-smartphon=
es-when-reusing-makes-more-sense-than-recycling/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://hackaday.com/2023/02/28/repurposing-old-smar=
tphones-when-reusing-makes-more-sense-than-recycling/</a><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">note e-waste and energy consumption</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">This graph does not make =
me happy:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"htt=
ps://ourworldindata.org/grapher/global-energy-substitution?time=3Dearliest.=
.2021">https://ourworldindata.org/grapher/global-energy-substitution?time=
=3Dearliest..2021</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Note this paradox too</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<a href=3D"https://en.m.wikipedia.org/wiki/Jevons_paradox" target=3D"_blank=
" rel=3D"noreferrer">https://en.m.wikipedia.org/wiki/Jevons_paradox</a><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, weirdly or not bas=
ically I talk about same thing as &quot;we are running out of CI=C2=A0 quot=
a&quot;. But. With ~all developers following mindlessly into &quot;upgrade =
now, think later if at all&quot; whole dependency tree will be heavier and =
heavier.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I guess whole move to gitlab also was not from overly good lif=
e .... I wonder of those c:\ paths I saw while looking into build status=C2=
=A0 are real and mean CI running on Windows? Or it was just some strange fa=
ke thing ..... is Windows cheaper? Is it really better when it comes to con=
tainers?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">Also, this whol=
e &quot;my program is only one running on user&#39;s machine&quot;=C2=A0 is=
 flawed.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
(and in case you&#39;re talking about a very old PC that cannot be extened =
<br>
anymore, you&#39;re likely better off with an older version of QEMU anyway)=
<br>
<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 If you use a 64-bit kernel, then your host is 6=
4-bit :)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 3=
2bit. <br>
&gt;&gt; So, qemu naturally will be 32-bit binary on my system.<br>
&gt; <br>
&gt; This configuration is still supported!<br>
&gt; <br>
&gt; Thomas, should we clarify yet again? Maybe adding examples?<br>
<br>
There are two aspects here:<br>
<br>
1) 32-bit KVM support - this won&#39;t be supported in the future anymore. =
Since <br>
running a 32-bit QEMU on a 64-bit kernel still uses the 32-bit KVM API, KVM=
 <br>
also won&#39;t be possible anymore with a QEMU that has been compiled in 32=
-bit <br>
mode.<br>
<br>
2) Compiling a 32-bit QEMU binary won&#39;t be officially supported anymore=
. We <br>
won&#39;t waste any more precious CI minutes on this (which is where we&#39=
;re <br>
struggling the most currently), and likely no active support for finding an=
d <br>
fixing bugs. </blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Well, does this CI thing reuse build objects (even indirectly, vi=
a ccache) currently?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">But I guess we won&#39;t actively disable this possibility <b=
r>
(especially since we did not deprecate the corresponding 32-bit linux-user =
<br>
emulation yet, so the emulation code will mostly still stay around).<br>
<br>
In the long run, we likely want to get rid of the separate compilation of <=
br>
the qemu-system-i386 binary, too, but that&#39;s still to be discussed. E.g=
. we <br>
could add a special run mode to the qemu-system-x86_64 instead that makes <=
br>
sure that the guest can only run in 32-bit mode.<br>
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 host: hardware where you run QEMU<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 guest: what is run within QEMU<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Running 32-bit *guest* on your 64-bit *host* is=
 still supported.<br>
<br>
If the complete userspace is 32-bit, I&#39;d rather consider it a 32-bit ho=
st.<br>
<br>
&gt;&gt; [...] I also ran qemu-system-ppc on Huawei Matepad T8 (32 bit Andr=
oid, <br>
&gt;&gt; too) for emulating old mac os 9. Yes, I can wait 10 min per guest =
boot. <br>
&gt;&gt; Fedora 36 armhf boots even slower on emulation!<br>
<br>
Yes, but for such scenarios, you can also use older versions of QEMU, you <=
br>
don&#39;t need the latest and greatest shiny QEMU version.<br>
<br>
&gt;&gt; Well, sometimes simple patch restores functionality. I patched for=
 example <br>
&gt;&gt; olive-editor to run on 32 bit, and before this intel embree (raytr=
acing <br>
&gt;&gt; kernels for Lux renderer). So, _sometimes_ it really not that cost=
ly. <br>
&gt;&gt; While if this CI thing really runs per-commit and thrown away each=
 result <br>
&gt;&gt; ... may be letting interested users to build things on their own m=
achines <br>
&gt;&gt; (and share patches, if they develop them, publicly) actually good =
idea.<br>
<br>
The problem is really that we don&#39;t have unlimited resources in the QEM=
U <br>
project. Currently we&#39;re heavily struggling with the load in the CI, bu=
t <br>
also pure man power is always very scarce. So at one point in time, you hav=
e <br>
to decide to say good bye to some old and hardly used features - at least t=
o <br>
stop testing and actively supporting it. If you want to continue testing an=
d <br>
fixing bugs for such host systems, that&#39;s fine, of course, but don&#39;=
t expect <br>
the QEMU developers to do that job in the future.<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>
</blockquote></div></div></div>

--000000000000cf7d4805f701d74f--

