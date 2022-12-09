Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE606487EA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3hQp-0008EB-R8; Fri, 09 Dec 2022 12:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p3hQl-0008CF-Kq
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:45:03 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p3hQj-0001qQ-6i
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:45:02 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3bf4ade3364so61772007b3.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CVzO5gPR0O8O4Xf/gPCLAGxDrmmJ3VW0YUE5p1HzYFw=;
 b=Lp6WTwmQsSP+fc30If+F9Nb4sWi4mcB9ecHMx1AoMesC8kiQAAqF+vDG6F7/cy1cF/
 KTpnx3Mf93pQX4+Ua3Cwilv/feiu1n0TSxsKs0Tk57oyQFbadoNVsnc5l4Mk4IyDtcGE
 VFYL1KYKWWlPh2WQeLa+0Bs2VD99TZ1wJUuLKe2zunsvgPt3hsmN/TP7oXvbV1S61ADa
 6Vk8B3D9kOg5ke2XT6uJbnKbmmj8ndwmUOfgbGMgG9wruVtRkv/t9EdjYONOvzzIQ9ey
 4o8kMCdAE5IlfvClnb8Kie+v7bV7Tfd+UkfHJllG3GEu7VzbwBF5sTBZMbDKCThcEDx3
 YKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CVzO5gPR0O8O4Xf/gPCLAGxDrmmJ3VW0YUE5p1HzYFw=;
 b=pNRnwYd4aZrKBZ5A7HynyKQH9CQk7pByY1nUiGMGSEhuurvUX01lZrTIoGd7yBsbiO
 4SDPxwW/WuYCxTRs3IlpioAbtot8pTdmmAxNbaZ3FnXQp72+Yfaon5kqD3mOCUJa6VJa
 dq2xOdwUaNYQ/3mB4G2vUH5bHAmYNOnK3WTeGuppvyotshqaKay9PDMCALEK7yls3k2C
 gEZqNx3n/a1isvZLwOlonucPY3AXDFcZhKWljh5WoeMOG11vIbz8AJvD0caKLu5pzKxA
 22vqyigMOJmftd6swbHuogTcD1powjpBrs9nRsXsDjvGajqkU44/JIchLWgb6ONHusrM
 u2zg==
X-Gm-Message-State: ANoB5pkYBpER1ugct95Z9REk1oYlZZelnV/o7xlcmuGWIplEY8mMJaWy
 OpmToPxPX62ibCQVqpF3sGtXW7YslJga5nOKtbql6A==
X-Google-Smtp-Source: AA0mqf4obnQjA05Jlxg56epLVDDd1gadHRakakrW/JB4RmlEl9VJt/SZQf3/rjihQGXZ2phGvHwCMSaEM5vJy2t3HCk=
X-Received: by 2002:a0d:d401:0:b0:3d7:65c:576b with SMTP id
 w1-20020a0dd401000000b003d7065c576bmr33819357ywd.8.1670607894201; Fri, 09 Dec
 2022 09:44:54 -0800 (PST)
MIME-Version: 1.0
References: <CAG7Es24cbb24S1k7=XyA+N7uXCghQT6mt_QkJW4zcO7_usbmjw@mail.gmail.com>
 <F0A77EF0-ED2D-43E0-91D7-B4D70B9E575F@flygoat.com>
In-Reply-To: <F0A77EF0-ED2D-43E0-91D7-B4D70B9E575F@flygoat.com>
From: Christopher Wrogg <cwrogg@umich.edu>
Date: Fri, 9 Dec 2022 12:44:43 -0500
Message-ID: <CAG7Es25r-pY2y+V2GP6Hba4qPos5uN5oeBKQ81gaWctt-jd4Rg@mail.gmail.com>
Subject: Re: CVMSEG Emulation
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000017e70305ef68b65a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=cwrogg@umich.edu; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000017e70305ef68b65a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried both.

Option 1
    What I did:
        #undef TARGET_VIRT_ADDR_SPACE_BITS and #define
TARGET_VIRT_ADDR_SPACE_BITS 64
    The Result:
        perror reports "Cannot allocate memory"
Option 2:
    What I did:
        TARGET_VIRT_ADDR_SPACE_BITS for me is 30 so I masked by 0x3FFFFFFF
    The Result:
        The segfault persists and gdb reports the memory as inaccessible.

On Thu, Dec 8, 2022 at 4:55 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

>
> Hi,
>
> This address range is located in KSEG3=E2=80=A6 Doesn=E2=80=99t seems to =
be a good location
> for userspace program.
>
> I think you have two options to make target_mmap work, the first would be
> rising
> TARGET_VIRT_ADDR_SPACE_BITS to 64 bit. That may break some user space
> applications storing pointer tags on higher bits.
>
> The second would be mask CVMSEG base with TARGET_VIRT_ADDR_SPACE_BITS
> before mmap, As higher VM address bits will be dropped when addressing
> guest VM,
> that should provide a similar behaviour. Though you=E2=80=99ll have multi=
ple alias
> for CVMSEG in
> memory and application will be able to access CVMSEG with bits higher tha=
n
> TARGET_VIRT_ADDR_SPACE_BITS set to any value. Don=E2=80=99t know if it wi=
ll break
> anything,
> AFAIK normal applications won't use this range.
>
> Thanks
> - Jiaxun
>
>
> > 2022=E5=B9=B412=E6=9C=888=E6=97=A5 15:08=EF=BC=8CChristopher Wrogg <cwr=
ogg@umich.edu> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > In userspace emulation how do I make a set of addresses always valid an=
d
> initialized to 0 even though the process does not map it in? In particula=
r
> I want to map the CVMSEG for Cavium qemu-mips64 and qemu-mipsn32. The
> addresses would be 0xFFFFFFFFFFFF8000 - 0xFFFFFFFFFFFFBFFF. I've looked a=
t
> target_mmap but it can't handle addresses that large. The lack of an
> emulated mmu for 64 bit guests is going to be a problem.
>
>

--00000000000017e70305ef68b65a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I tried both.<br><br></div>Option 1 <br><div>=C2=
=A0=C2=A0=C2=A0 What I did:</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 #undef TARGET_VIRT_ADDR_SPACE_BITS and #define TARGET_VIRT_ADDR_SPAC=
E_BITS 64<br></div><div>=C2=A0=C2=A0=C2=A0 The Result:</div><div>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror reports &quot;Cannot allocate memo=
ry&quot;<br></div></div>Option 2: <br><div>=C2=A0=C2=A0=C2=A0 What I did:</=
div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TARGET_VIRT_ADDR_SPACE_=
BITS for me is 30 so I masked by 0x3FFFFFFF<br></div><div>=C2=A0=C2=A0=C2=
=A0 The Result:</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The se=
gfault persists and gdb reports the memory as inaccessible.</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, De=
c 8, 2022 at 4:55 PM Jiaxun Yang &lt;<a href=3D"mailto:jiaxun.yang@flygoat.=
com">jiaxun.yang@flygoat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><br>
Hi,<br>
<br>
This address range is located in KSEG3=E2=80=A6 Doesn=E2=80=99t seems to be=
 a good location<br>
for userspace program.<br>
<br>
I think you have two options to make target_mmap work, the first would be r=
ising<br>
TARGET_VIRT_ADDR_SPACE_BITS to 64 bit. That may break some user space<br>
applications storing pointer tags on higher bits.<br>
<br>
The second would be mask CVMSEG base with TARGET_VIRT_ADDR_SPACE_BITS<br>
before mmap, As higher VM address bits will be dropped when addressing gues=
t VM,<br>
that should provide a similar behaviour. Though you=E2=80=99ll have multipl=
e alias for CVMSEG in<br>
memory and application will be able to access CVMSEG with bits higher than<=
br>
TARGET_VIRT_ADDR_SPACE_BITS set to any value. Don=E2=80=99t know if it will=
 break anything,<br>
AFAIK normal applications won&#39;t use this range.<br>
<br>
Thanks<br>
- Jiaxun <br>
<br>
<br>
&gt; 2022=E5=B9=B412=E6=9C=888=E6=97=A5 15:08=EF=BC=8CChristopher Wrogg &lt=
;<a href=3D"mailto:cwrogg@umich.edu" target=3D"_blank">cwrogg@umich.edu</a>=
&gt; =E5=86=99=E9=81=93=EF=BC=9A<br>
&gt; <br>
&gt; In userspace emulation how do I make a set of addresses always valid a=
nd initialized to 0 even though the process does not map it in? In particul=
ar I want to map the CVMSEG for Cavium qemu-mips64 and qemu-mipsn32. The ad=
dresses would be 0xFFFFFFFFFFFF8000 - 0xFFFFFFFFFFFFBFFF. I&#39;ve looked a=
t target_mmap but it can&#39;t handle addresses that large. The lack of an =
emulated mmu for 64 bit guests is going to be a problem.<br>
<br>
</blockquote></div>

--00000000000017e70305ef68b65a--

