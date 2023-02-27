Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9746A4268
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:17:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdN6-0003yB-6D; Mon, 27 Feb 2023 08:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWdN2-0003xi-Ne; Mon, 27 Feb 2023 08:16:48 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWdN1-0003zK-6E; Mon, 27 Feb 2023 08:16:48 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id m10so10942874vso.4;
 Mon, 27 Feb 2023 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/2zqhk5f+2fYxNnlI8rgl7S5I8y7cwW5f//nOktbPR0=;
 b=MtbRFF+3S28dk4IlwyOyAkkouqTBghfXXWFUQdgKIg9iwE3jIzq4839je99MHAAwdg
 hjL0CeBkcFj+MiIpwAQoLa3+DjCTW0J3kiYYAPSVi30z6vwrNtkcOJT0Owb5potn0U7t
 4tbGvb4WNhWIAdN7DJGphLq1PXMN3iuTuv81zA8fuM0yM4bgd537wacmKI+OtUdwVBlA
 VkMzmDF1EVOm2AQWxaYWqZOOINQfTlQf34oWGAGgV/gstB4Wxlj4uEtc97ZiuTAn/ISe
 0el9xAsM5fJpl3dsVnfEFjRPR/t1cl0xXDLDWlTZfj2sRH64AFhHNeyMsSrJAzVJ+80L
 cMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/2zqhk5f+2fYxNnlI8rgl7S5I8y7cwW5f//nOktbPR0=;
 b=OmDxfHrWIyk/e/sxABG+BPcgEyA7SGD8mj0atNkA/JfW7ib0Pb8VGoHs7wGIlx+lSi
 lNoi78C7gYISUOUzL30QoCzGEjLXS58Y/ompcZnc2LDiWQcKN8NT3o1ZXUIrLv1wHFfj
 m4EGqoadzbekmadr59WiDXxuFzda1k+EVpvQKlrttJoI4wPsqkpubeU83YxFtGpZ0Jhr
 ZqWZu7bgNRPG9Iqc+T43VwmTTr4xGdRQUym/qUd+56M94v3HuG9LYYW97JMnpQQzOhQy
 TRWNDPnAy6DXxqRWjZGSU9nd362fTZqyLZsiC/hu7f88nYqlXMBurmjVwYH6ZJOEK+pk
 rthQ==
X-Gm-Message-State: AO0yUKXvFFCTaKz2Zs2yuF02EXwbK1uSxVDe2cokR5eopzDSKAZRlEoQ
 eQp4ulmCucdSsspFxF4ClwjaXboqlZFyiLKG3SY=
X-Google-Smtp-Source: AK7set8ToKY9k65xW6a6XulOJvE9eewZ6Hx7VY9s0kUCk/Zvv4NhNaap0sA7OtQkb93S1UUbhCzelxQDVzo/+UwF5v8=
X-Received: by 2002:a05:6102:3d9:b0:402:999f:44d8 with SMTP id
 n25-20020a05610203d900b00402999f44d8mr7160483vsq.6.1677503805651; Mon, 27 Feb
 2023 05:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
In-Reply-To: <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Mon, 27 Feb 2023 14:16:31 +0100
Message-ID: <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000072003605f5ae4a8d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2d.google.com
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

--00000000000072003605f5ae4a8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 2:00=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:

> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> > On behalve of Zoltan BALATON:
>
> You don't have to do that and in fact please don't. I'll handle this
> series just reply to the one patch that needs update with only the change=
s
> that were asked by review.
>
> Regards,
> BALATON Zoltan
>

Google seems to agree with me by not letting me send your patches :/

  Sent [PATCH v4 0/7] Pegasos2 fixes and audio output support
  Sent [PATCH v4 1/7] hw/display/sm501: Implement more 2D raster operations
  Sent [PATCH v4 2/7] hw/display/sm501: Add fallbacks to pixman routines
  Sent [PATCH v4 3/7] hw/display/sm501: Add debug property to control
pixman usage
  4.3.0 Mail server temporarily rejected message.
bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222 - gsmtp

As said before I don't want to iterate on the changes of this series. I
can't test them and from my POV they seem unnecessary to me since all the
test cases I can perform still work without the IRQ changes.

Looking at the schematics I get the impression that the PCI IRQs actually
work the other way around: Instead of the INTx lines of the 2nd PCI bus
triggering both the north and the south bridge IRQ controllers, the two PCI
buses of the north bridge both trigger the VT82xx PCI IRQ router. I'm not a
hardware engineer so I could be totally off here. That's why I rather leave
my hands off of this stuff.

Best regards,
Bernhard

--00000000000072003605f5ae4a8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 27, 2023 at 2:00=E2=80=AFPM B=
ALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu<=
/a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Mon, 27 Feb 2023, Bernhard Beschow wrote:<br>
&gt; On behalve of Zoltan BALATON:<br>
<br>
You don&#39;t have to do that and in fact please don&#39;t. I&#39;ll handle=
 this <br>
series just reply to the one patch that needs update with only the changes =
<br>
that were asked by review.<br>
<br>
Regards,<br>
BALATON Zoltan<br></blockquote><div><br></div>Google seems to agree with me=
 by not letting me send your patches :/<br><br>=C2=A0 Sent [PATCH v4 0/7] P=
egasos2 fixes and audio output support<br>=C2=A0 Sent [PATCH v4 1/7] hw/dis=
play/sm501: Implement more 2D raster operations<br>=C2=A0 Sent [PATCH v4 2/=
7] hw/display/sm501: Add fallbacks to pixman routines<br>=C2=A0 Sent [PATCH=
 v4 3/7] hw/display/sm501: Add debug property to control pixman usage<br>=
=C2=A0 4.3.0 Mail server temporarily rejected message. bk4-20020a170906b0c4=
00b008d7a8083dffsm3186414ejb.222 - gsmtp<br><br></div><div class=3D"gmail_q=
uote">As said before I don&#39;t want to iterate on the changes of this ser=
ies. I can&#39;t test them and from my POV they seem unnecessary to me sinc=
e all the test cases I can perform still work  without the IRQ changes.</di=
v><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Looking a=
t the schematics I get the impression that the PCI IRQs actually work the o=
ther way around: Instead of the INTx lines of the 2nd PCI bus triggering bo=
th the north and the south bridge IRQ controllers, the two PCI buses of the=
 north bridge both trigger the VT82xx PCI IRQ router. I&#39;m not a hardwar=
e engineer so I could be totally off here. That&#39;s why I rather leave my=
 hands off of this stuff.</div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">Best regards,</div><div class=3D"gmail_quote">Bernhard<=
br></div></div>

--00000000000072003605f5ae4a8d--

