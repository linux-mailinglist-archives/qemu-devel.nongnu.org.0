Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A846D6918
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:41:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjhX-0005Y8-4G; Tue, 04 Apr 2023 12:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucasvr@gmail.com>)
 id 1pjjhR-0005WX-TR; Tue, 04 Apr 2023 12:40:01 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucasvr@gmail.com>)
 id 1pjjhG-0000KT-Hw; Tue, 04 Apr 2023 12:39:54 -0400
Received: by mail-lf1-x130.google.com with SMTP id g19so29993357lfr.9;
 Tue, 04 Apr 2023 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680626375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CWx++STIfnsrWbzImbjeqPerko8wjTJ94jHMi935Dzs=;
 b=V0VrQ2Nlu0Y37CNNEr6Rap9c19N20We28sEE/N0m+9HybafFWPATL8xtEeBfC7oNcp
 C0Xduvv8El9fAXC0f6cBmZadwbMd4eOeVEoMAZERgVH5/y8iiKMJb60s0cv236WJCbwy
 AWzf0z02pCduyoryLtDWIm6ixZPkrlhUkJmfswtFSm85ZeWBvFYNsEW4GsAK0oSxqqB4
 0d/WIKnDOpXQX4OZbR9BpuQm4ogGfsZ5EXy0N63KWZdFDDm55y5MNE/UOqrcjfi7/uW/
 wNIVEWgDJkJfa9RqzBHMvVL3BdHawNVbSmZ8rVpkcbA1ItTPoMlCSkGEzkYyvLK6nUHk
 5fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680626375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWx++STIfnsrWbzImbjeqPerko8wjTJ94jHMi935Dzs=;
 b=rg2W0QfIPBAR1wU9yq6Ql9uIzmLHqpbwjhh6vIp6VlMkmI43yu3XGWdqtHl9Z1BjDo
 xJuDnGQqFrmiwqmt73+laz/VrWXDs33mhvRiyTGhkbmrIMZa7FEpECnRb2n2qY1GosUK
 dFIYaF2gL7hbcTB5kt5C1/ZwmknDqlUro+hrMa0axBeyYyoHYMG6T/ZeGHyNR8/mk/4t
 C4qnCBETwagqJceH/39xMByyqRNTfP0Alp1sHXzq6ERuLu6Jp3iTD1nBKXKsXtIxaXNr
 w0JpWx8EaGNOYVRp7WNTmFxPOi81KmFgnlb3U8IJ2Iu2VPmjxLykV1QAnbXuzVIedy36
 WXLQ==
X-Gm-Message-State: AAQBX9d04lAtZ4ra7HZmIqFN8bmjB8hgQ7iJR9jeOLeSvorXccD0uMIQ
 nZerN8Y8m8XqS/BHaVKermM8x1j3KjhRtlLZOtw=
X-Google-Smtp-Source: AKy350akyz8opqNheIyB2lJlMijeXWnXuyn1K8xc6IL+wX4xmcDffl9v/IOChQ5aGx5yuaS585SR8WKXJuf/KNFxCdc=
X-Received: by 2002:a19:740f:0:b0:4e9:c027:5be6 with SMTP id
 v15-20020a19740f000000b004e9c0275be6mr927976lfe.12.1680626374861; Tue, 04 Apr
 2023 09:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230403121537.71320-1-lucas@osdyne.com>
 <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
 <CAL+Dfo6ysWqeKCR5p4_JMazjgdwqq5+kdYxTXVpHE0oZNMVpOQ@mail.gmail.com>
 <3c2d07b5-ef07-998a-df15-9dc38a4e474e@crans.org>
In-Reply-To: <3c2d07b5-ef07-998a-df15-9dc38a4e474e@crans.org>
From: "Lucas C. Villa Real" <lucasvr@gmail.com>
Date: Tue, 4 Apr 2023 13:39:23 -0300
Message-ID: <CAAvzgtbP4+fLqMdo=Q_QboOPznVnJhuoihdjyARG7V=JCmj+hw@mail.gmail.com>
Subject: Re: [PATCH] stm32vldiscovery: allow overriding of RAM size
To: Alexandre IOOSS <erdnaxe@crans.org>
Cc: "Lucas C. Villa Real" <lucas@osdyne.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000012e8e605f8855263"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=lucasvr@gmail.com; helo=mail-lf1-x130.google.com
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

--00000000000012e8e605f8855263
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 3:23=E2=80=AFAM Alexandre IOOSS <erdnaxe@crans.org> =
wrote:

> On 4/3/23 16:48, Lucas C. Villa Real wrote:
> > On Mon, Apr 3, 2023 at 10:54=E2=80=AFAM Peter Maydell <peter.maydell@li=
naro.org
> > <mailto:peter.maydell@linaro.org>> wrote:
> >
> >     On Mon, 3 Apr 2023 at 13:51, Lucas Villa Real <lucasvr@gmail.com
> >     <mailto:lucasvr@gmail.com>> wrote:
> >      >
> >      > stm32vldiscovery comes with 8KB of SRAM, which may be too low wh=
en
> >      > running some workloads on QEMU. The command line argument "-m
> >     mem_size"
> >      > is not recognized by the current implementation, though, so one
> >     cannot
> >      > easily override the default memory size.
> >      >
> >      > This patch fixes that by adding a memory subregion according to
> the
> >      > value provided on that command line argument. If absent, the
> default
> >      > value of 8KB still applies.
> >      >
> >      > Signed-off-by: Lucas Villa Real <lucas@osdyne.com
> >     <mailto:lucas@osdyne.com>>
> >
> >     Does the real hardware have (options for) more than 8K of SRAM here=
 ?
> >
> >     thanks
> >     -- PMM
> >
> >
> > Yes, it's possible to add more (p)SRAM via the STM32F10xxx's FSMC
> > (flexible static memory controller). The new memory is mapped to FSMC
> > bank 1 at 0x6000_0000, though (as opposed to the embedded SRAM's fixed
> > address at 0x2000_0000), as I have now realized. I'm happy to send an
> > updated patch so that "-m mem_size" creates a memory subregion at
> > 0x6000_0000 instead.
> >
> > Best regards,
> > Lucas
> >
>
> Looking at the STM32F100xx reference manual page 494
> (
> https://www.st.com/resource/en/reference_manual/rm0041-stm32f100xx-advanc=
ed-armbased-32bit-mcus-stmicroelectronics.pdf),
>
> FSMC is only present on high-density value line devices only. This is
> not the case of the STM32VLDISCOVERY which uses a STM32F100RB
> (low/medium-density value line).
>
> Correct me if I'm wrong, but I believe you cannot buy a STM32VLDISCOVERY
> that could support FSMC or have more than 8KB of on-chip SRAM.
>
> However, could it be a good idea to implement a generic STM32F100xx
> machine in QEMU that is "high-density" by default and that could be
> configured using command line options ? This could cover a wide range of
> cases with a single machine.
>

Oh, you're right: FSMC is only featured on high-density STM32F100xx
devices. Since I'm mostly dealing with QEMU (i.e., no real hardware) at
this point in time I wasn't aware of that limitation. Thanks for the heads
up.

Given that the current STM32 port doesn't implement many devices, I presume
that adding support for a "high-density" machine would come down to making
changes to the flash and register boundary addresses, mostly? If that's the
case, then it makes sense to support such a generic machine. I've limited
time to work on that, but I can give it a kick start and we can coordinate
offline if that's OK with you.

Lucas

--00000000000012e8e605f8855263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Tue, Apr 4, 2023 at 3:23=E2=80=AFAM Alexandre IOOSS &lt;<a=
 href=3D"mailto:erdnaxe@crans.org">erdnaxe@crans.org</a>&gt; wrote:</div></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 4/3/23 16:48, Lucas C. Villa Real wrote:<br>
&gt; On Mon, Apr 3, 2023 at 10:54=E2=80=AFAM Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org<=
/a> <br>
&gt; &lt;mailto:<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blan=
k">peter.maydell@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, 3 Apr 2023 at 13:51, Lucas Villa Real &lt;<=
a href=3D"mailto:lucasvr@gmail.com" target=3D"_blank">lucasvr@gmail.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:lucasvr@gmail.com" tar=
get=3D"_blank">lucasvr@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; stm32vldiscovery comes with 8KB of SRAM, whic=
h may be too low when<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; running some workloads on QEMU. The command l=
ine argument &quot;-m<br>
&gt;=C2=A0 =C2=A0 =C2=A0mem_size&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; is not recognized by the current implementati=
on, though, so one<br>
&gt;=C2=A0 =C2=A0 =C2=A0cannot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; easily override the default memory size.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; This patch fixes that by adding a memory subr=
egion according to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; value provided on that command line argument.=
 If absent, the default<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; value of 8KB still applies.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Lucas Villa Real &lt;<a href=
=3D"mailto:lucas@osdyne.com" target=3D"_blank">lucas@osdyne.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:lucas@osdyne.com" targ=
et=3D"_blank">lucas@osdyne.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Does the real hardware have (options for) more than=
 8K of SRAM here ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- PMM<br>
&gt; <br>
&gt; <br>
&gt; Yes, it&#39;s possible to add more (p)SRAM via the STM32F10xxx&#39;s F=
SMC <br>
&gt; (flexible static memory controller). The new memory is mapped to FSMC =
<br>
&gt; bank 1 at 0x6000_0000, though (as opposed to the embedded SRAM&#39;s f=
ixed <br>
&gt; address at 0x2000_0000), as I have now realized. I&#39;m happy to send=
 an <br>
&gt; updated patch so that &quot;-m mem_size&quot; creates a memory subregi=
on at <br>
&gt; 0x6000_0000 instead.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; Lucas<br>
&gt; <br>
<br>
Looking at the STM32F100xx reference manual page 494 <br>
(<a href=3D"https://www.st.com/resource/en/reference_manual/rm0041-stm32f10=
0xx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf" rel=3D"noreferrer"=
 target=3D"_blank">https://www.st.com/resource/en/reference_manual/rm0041-s=
tm32f100xx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf</a>), <br>
FSMC is only present on high-density value line devices only. This is <br>
not the case of the STM32VLDISCOVERY which uses a STM32F100RB <br>
(low/medium-density value line).<br>
<br>
Correct me if I&#39;m wrong, but I believe you cannot buy a STM32VLDISCOVER=
Y <br>
that could support FSMC or have more than 8KB of on-chip SRAM.<br>
<br>
However, could it be a good idea to implement a generic STM32F100xx <br>
machine in QEMU that is &quot;high-density&quot; by default and that could =
be <br>
configured using command line options ? This could cover a wide range of <b=
r>
cases with a single machine.<br></blockquote><div>=C2=A0</div><div style=3D=
"font-size:small" class=3D"gmail_default">Oh, you&#39;re right: FSMC is onl=
y featured on high-density STM32F100xx devices. Since I&#39;m mostly dealin=
g with QEMU (i.e., no real hardware) at this point in time I wasn&#39;t awa=
re of that limitation. Thanks for the heads up.</div><div style=3D"font-siz=
e:small" class=3D"gmail_default"><br></div><div style=3D"font-size:small" c=
lass=3D"gmail_default">Given that the current STM32 port doesn&#39;t implem=
ent many devices, I presume that adding support for a &quot;high-density&qu=
ot; machine would come down to making changes to the flash and register bou=
ndary addresses, mostly? If that&#39;s the case, then it  makes sense to su=
pport such a generic machine. I&#39;ve limited time to work on that, but I =
can give it a kick start and we can coordinate offline if that&#39;s OK wit=
h you.</div><div style=3D"font-size:small" class=3D"gmail_default"><br></di=
v><div style=3D"font-size:small" class=3D"gmail_default">Lucas<br></div><di=
v style=3D"font-size:small" class=3D"gmail_default"><br></div><div style=3D=
"font-size:small" class=3D"gmail_default"><br></div><div style=3D"font-size=
:small" class=3D"gmail_default"><br></div><div style=3D"font-size:small" cl=
ass=3D"gmail_default"><br></div><br></div></div>

--00000000000012e8e605f8855263--

