Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D6400FFF
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 15:26:26 +0200 (CEST)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMsAC-00084u-Qu
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 09:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMs8T-0006vk-JJ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 09:24:37 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMs8R-0000Q0-O7
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 09:24:37 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e133so8106849ybh.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wj7FLCgDy9wNX3w7sFYiYluQnMMU09dSaPjM6CFbnJg=;
 b=lcjYQr0fMXekfRtGOSv+jqIgIS3C8c1AjRiCOXW/rOyQ4C1kG+4ILtI56HI9gsqFYo
 DAmmefqW3KzqIGSrOTC+ytzdIaM+SO8KYHZO0mvHtlNvSFGBopgxYC2hkqZ8TavYZ+xF
 qny677yHrhPOc+1tXWxHRt74bNZ6DrP087yHtQdmEJrq87Q06VEApZ9Y3sW7hTjiaj9U
 lXxFDevPOf1V6DcZvBRZNm7zuDrpyRuw0nyygMR0Ey6QJ5f7wCkFqI729LJB1Wq/Fq50
 h0i0m1wevNrK0hQ1GG01euZOZCut/FmNHJmeM9BIuv61GfixkPENUx94dOCzWdNREATs
 fNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wj7FLCgDy9wNX3w7sFYiYluQnMMU09dSaPjM6CFbnJg=;
 b=blhxCeefkVvH9W2vKbVer9Gt4rju94h+wvdg04E9WkZnqCtnomT03+JW4XdUm2yY72
 HM7zmQOHmrv8Gdm5GwugL2BmClT0LH1YdYe9j+9ltlV0orDtmMDaTbNynd7lfkwEbCRD
 LH/G4XXiV4WUJ/dv/EUi6YC11o1iXASMvlyRT+n/OCCkL5JBN1AW7EGkFs6lKUxZE/Hh
 42sX5R1ejqwsOJ3oZXJd2yds0xVH6Nu9g+HV9z7iy9LRSeiJF4izfgYh61EAYc6SYFWo
 oloFqRlHC3kIEwI3vgGkNhOH3gtZ8dndLloV8Rv9dRIirbYgkuNDJ8fKGgYSUHua4V0g
 BLsw==
X-Gm-Message-State: AOAM532woEAXH/bJl3FBIK9gyyxFtIJGj8nr7pBAmGN8SLIQhWTbpuDE
 8Ztpmw70Irw5K7LK5wGF5ofxZdOy0DnoLfqGlRmS+Q==
X-Google-Smtp-Source: ABdhPJw7cn4WTe7todGQ/1RcS/oenNDo3DUelD7nbNDpHelPaTO1CxV7axyv3MJDT7iJSV/EmcrvmfO5GPeXQIWDoqs=
X-Received: by 2002:a5b:142:: with SMTP id c2mr10332521ybp.425.1630848273661; 
 Sun, 05 Sep 2021 06:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <00d401d7a230$56842630$038c7290$@gmail.com>
In-Reply-To: <00d401d7a230$56842630$038c7290$@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Sun, 5 Sep 2021 15:24:22 +0200
Message-ID: <CAFXwXrmt-u9iO_xY3y=ite1rPsvdm77w_s3Fw1G5C=fag0KP1w@mail.gmail.com>
Subject: Re: Virtualizing HP PA-RISC unix station other than B160L
To: thierry.briot@gmail.com
Content-Type: multipart/alternative; boundary="00000000000008d75805cb3f747d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Helge Deller <deller@gmx.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000008d75805cb3f747d
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Sep 2021, 10:30 , <thierry.briot@gmail.com> wrote:

> Hie Richard,
>
>
>
> For my company (Nexter Systems, France), I am using qemu-system-hppa for
> virtualizing HP PA-RISC workstations. That works well. You have made a very
> good job !
>
>
>
> But my machines are other than B160L (for example B180L), and I have to
> completely reinstall HP-UX on each emulated machine.
>
> If I do an iso system disk image of my B180L, this iso isn't bootable on
> qemu-system-hppa.
>
>
>
> Thus, my questions are :
>
>    - Is it planned to emulate other HP unix workstations than B160L (for
>    example B180L) ?
>    - Or, what changes should I make to my iso image to do it usable ? If
>    I replace the /boot filesystem of the B180L image with the B160L one, I get
>    a kernel panic at boot time.
>
> Helge is the one that did all the hw support, I just did the CPU. There
are no real plans to do another machine. I'm not familiar with the specs
between the HP machines to know how much work that would be.

r~

--00000000000008d75805cb3f747d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">On Sun, 5 Se=
p 2021, 10:30 , &lt;<a href=3D"mailto:thierry.briot@gmail.com">thierry.brio=
t@gmail.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div lang=3D"FR" link=3D"#0563C1" vlink=3D"#954F72" style=3D=
"word-wrap:break-word"><div class=3D"m_-5212997147500109512WordSection1"><p=
 class=3D"MsoNormal">Hie Richard,<u></u><u></u></p><p class=3D"MsoNormal"><=
u></u>=C2=A0<u></u></p><p class=3D"MsoNormal">For my company (Nexter System=
s, France), I am using qemu-system-hppa for virtualizing HP PA-RISC worksta=
tions. That works well. You have made a very good job !<u></u><u></u></p><p=
 class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal">But my =
machines are other than B160L (for example B180L), and I have to completely=
 reinstall HP-UX on each emulated machine.<u></u><u></u></p><p class=3D"Mso=
Normal">If I do an iso system disk image of my B180L, this iso isn&#39;t bo=
otable on qemu-system-hppa. <u></u><u></u></p><p class=3D"MsoNormal"><u></u=
>=C2=A0<u></u></p><p class=3D"MsoNormal">Thus, my questions are :<u></u><u>=
</u></p><ul style=3D"margin-top:0cm" type=3D"disc"><li class=3D"m_-52129971=
47500109512MsoListParagraph" style=3D"margin-left:35.25pt">Is it planned to=
 emulate other HP unix workstations than B160L (for example B180L) ?<u></u>=
<u></u></li><li class=3D"m_-5212997147500109512MsoListParagraph" style=3D"m=
argin-left:35.25pt">Or, what changes should I make to my iso image to do it=
 usable ? If I replace the /boot filesystem of the B180L image with the B16=
0L one, I get a kernel panic at boot time.</li></ul></div></div></blockquot=
e></div></div><div dir=3D"auto">Helge is the one that did all the hw suppor=
t, I just did the CPU. There are no real plans to do another machine. I&#39=
;m not familiar with the specs between the HP machines to know how much wor=
k that would be.</div><div dir=3D"auto"><br></div><div dir=3D"auto">r~</div=
></div>

--00000000000008d75805cb3f747d--

