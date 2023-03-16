Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858DD6BC6E2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pchsN-0004X1-T5; Thu, 16 Mar 2023 03:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pchs3-0004Vo-5N; Thu, 16 Mar 2023 03:18:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pchs0-00065u-I8; Thu, 16 Mar 2023 03:17:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id i5so788510pla.2;
 Thu, 16 Mar 2023 00:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678951070;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hUFl5VHAItkXHF1ri9Sbhl5o+/hcw/VqNu0akxmF5Lw=;
 b=ncUDEkGI2Y5Rf8UrcWo8FMYge+yQvgrPqGbAa7mas4Z+dWDja6DUUSc/sB5JyOmXSE
 qOQ4emDwtjgu/7PH8vI79zkJMGsNgAMEGGqlL5wH8rTCkARRrTUDBNDRaEg8icAGaHdN
 Jfz1JhUGKHhLusTKhDj6kYXoUXFPezJOXc6SCx8LP15xGLw9qVL7tn4xIuVstZ99Q7do
 BMNCDQKQDghumpHsnXxT6/EeUNOxh6Du4oQksgOcnzVYcroMiunwerV9Jex4EXK3q5Lj
 eXdO9m/Hx3mXKzFygpJPmGE1PlW38dVBHEC6SvAS5IhvlDywr/CijJceeLZ6Qqiz2XHa
 f6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678951070;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hUFl5VHAItkXHF1ri9Sbhl5o+/hcw/VqNu0akxmF5Lw=;
 b=6ojw+NVriqjS83FQ8tHW/KvRfMrbqIsyDB8t0n0yrYkQwDjsoYJtZTqMIKLslmr5Lg
 ltwftK07ojMRKtXo+THx6/2tiGPs7DVVSO05LZD6xYJsyVRQR+NtwjkHX9fnsOk+RnRE
 NavkkX0bWBdTD8a10mLueQ8uapngnBHF2fvhk8XCW6R+Khkn0VEnRqo04/QFZDPsACpn
 l+ZenU5x6opjDfB3yTCuHH8Csea4+QHBjR8ZhQ52+Bcipp1w0wzS0L2eWAipdLwj+cgR
 1mDP7JTjGcqrPZfdTJtKSwk4G1wUQx2AHMXfIKULFcWZrVxl2sZWfVpmZcem0WjoA/er
 V0cg==
X-Gm-Message-State: AO0yUKXibMyOUekSfkceuxU7xlNngcRtyXSLnjPk17hUtKoGHOWFGbmM
 ZUxtEVjLQjWMJjZptIbdDP7SW++khj9mY+fjV7s=
X-Google-Smtp-Source: AK7set8t50OMWAb/NQfnLMeH279kDLsw2Awm/wF9OUyD+qVMGUH69T5DXGzPGqkuiiUpiDjo3ug+a4HGLaLkeMIWkqA=
X-Received: by 2002:a17:90a:af98:b0:23d:385d:df77 with SMTP id
 w24-20020a17090aaf9800b0023d385ddf77mr796622pjq.3.1678951070575; Thu, 16 Mar
 2023 00:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
In-Reply-To: <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 10:17:38 +0300
Message-ID: <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000028309a05f6ff42b3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=randrianasulu@gmail.com; helo=mail-pl1-x633.google.com
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

--00000000000028309a05f6ff42b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Mathieu-D=
aud=C3=A9 <philmd@linaro.org>:

> Hi Andrew,
>
> On 16/3/23 01:57, Andrew Randrianasulu wrote:
> > Looking at https://wiki.qemu.org/ChangeLog/8.0
> > <https://wiki.qemu.org/ChangeLog/8.0>
> >
> > =3D=3D=3D
> > System emulation on 32-bit x86 and ARM hosts has been deprecated. The
> > QEMU project no longer considers 32-bit x86 and ARM support for system
> > emulation to be an effective use of its limited resources, and thus
> > intends to discontinue.
> >
> >   =3D=3D
> >
> > well, I guess arguing from memory-consuption point on 32 bit x86 hosts
> > (like my machine where I run 32 bit userspace on 64 bit kernel) is not
>
> If you use a 64-bit kernel, then your host is 64-bit :)
>


No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 32bit. So,
qemu naturally will be 32-bit binary on my system.



> host: hardware where you run QEMU
> guest: what is run within QEMU
>
> Running 32-bit *guest* on your 64-bit *host* is still supported.
>
> We don't plan to support running 32-bit WinXP x86 (guest) on 32-bit
> Raspberry Pi 2 (host) for example.
>
> > going anywhere, but what about 32bit userspace on Android tablets,
> > either via Limbo emulator or qemu itself in Termux?
>
> *System* emulation [on 32-bit hosts] is deprecated. User emulation
> (such linux-user) is not. For example, you can still run 64-bit x86_64
> Linux binaries on a 32-bit ARM Raspberry Pi.
>


Well, unrooted Android does not allow you to just load some perfectly fine
kernel module, so user-space emulation can't do all things system-level one
can. I also ran qemu-system-ppc on Huawei Matepad T8 (32 bit Android, too)
for emulating old mac os 9. Yes, I can wait 10 min per guest boot. Fedora
36 armhf boots even slower on emulation!


> > At least I hope it will be not *actively* (intentionally) broken, just
> > ...unsupported (so users who know how to run git revert still will get
> > their build for some more time).
>
> Unsupported code almost always unintentionally end bit-rotting...
>


Well, sometimes simple patch restores functionality. I patched for example
olive-editor to run on 32 bit, and before this intel embree (raytracing
kernels for Lux renderer). So, _sometimes_ it really not that costly. While
if this CI thing really runs per-commit and thrown away each result ... may
be letting interested users to build things on their own machines (and
share patches, if they develop them, publicly)  actually good idea.



> I hope this is clearer.
>
> Regards,
>
> Phil.
>

--00000000000028309a05f6ff42b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:=
05 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Andrew,<=
br>
<br>
On 16/3/23 01:57, Andrew Randrianasulu wrote:<br>
&gt; Looking at <a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a=
> <br>
&gt; &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a>&gt;<b=
r>
&gt; <br>
&gt; =3D=3D=3D<br>
&gt; System emulation on 32-bit x86 and ARM hosts has been deprecated. The =
<br>
&gt; QEMU project no longer considers 32-bit x86 and ARM support for system=
 <br>
&gt; emulation to be an effective use of its limited resources, and thus <b=
r>
&gt; intends to discontinue.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=3D=3D<br>
&gt; <br>
&gt; well, I guess arguing from memory-consuption point on 32 bit x86 hosts=
 <br>
&gt; (like my machine where I run 32 bit userspace on 64 bit kernel) is not=
 <br>
<br>
If you use a 64-bit kernel, then your host is 64-bit :)<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all =
32bit. So, qemu naturally will be 32-bit binary on my system.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
host: hardware where you run QEMU<br>
guest: what is run within QEMU<br>
<br>
Running 32-bit *guest* on your 64-bit *host* is still supported.<br>
<br>
We don&#39;t plan to support running 32-bit WinXP x86 (guest) on 32-bit<br>
Raspberry Pi 2 (host) for example.<br>
<br>
&gt; going anywhere, but what about 32bit userspace on Android tablets, <br=
>
&gt; either via Limbo emulator or qemu itself in Termux?<br>
<br>
*System* emulation [on 32-bit hosts] is deprecated. User emulation<br>
(such linux-user) is not. For example, you can still run 64-bit x86_64<br>
Linux binaries on a 32-bit ARM Raspberry Pi.<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Wel=
l, unrooted Android does not allow you to just load some perfectly fine ker=
nel module, so user-space emulation can&#39;t do all things system-level on=
e can. I also ran qemu-system-ppc on Huawei Matepad T8 (32 bit Android, too=
) for emulating old mac os 9. Yes, I can wait 10 min per guest boot. Fedora=
 36 armhf boots even slower on emulation!</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
&gt; At least I hope it will be not *actively* (intentionally) broken, just=
 <br>
&gt; ...unsupported (so users who know how to run git revert still will get=
 <br>
&gt; their build for some more time).<br>
<br>
Unsupported code almost always unintentionally end bit-rotting...<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Well, sometimes simple patch restores functionality. I pa=
tched for example olive-editor to run on 32 bit, and before this intel embr=
ee (raytracing kernels for Lux renderer). So, _sometimes_ it really not tha=
t costly. While if this CI thing really runs per-commit and thrown away eac=
h result ... may be letting interested users to build things on their own m=
achines (and share patches, if they develop them, publicly)=C2=A0 actually =
good idea.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I hope this is clearer.<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div></div></div>

--00000000000028309a05f6ff42b3--

