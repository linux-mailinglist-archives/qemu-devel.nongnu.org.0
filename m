Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E831AFC8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 10:07:49 +0100 (CET)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBDNb-0001YD-Rz
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 04:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lBDLr-00010e-LD; Sun, 14 Feb 2021 04:05:59 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lBDLn-0002qT-DF; Sun, 14 Feb 2021 04:05:59 -0500
Received: by mail-ed1-x533.google.com with SMTP id v9so335512edw.8;
 Sun, 14 Feb 2021 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kvRofmg7/YjJn9lYF62NfW0huM3PJn/GGhXb2sVcmi8=;
 b=F+WOzJZdQkixMDuA19OsgTgf7qu+9lmeMcMkx3vczJ1833qCc4BccKCPBbLlgOWXa4
 bQVNbDMebAoftkwOBKkNt6Oj+/7qMRhAI99NMpHw1a5E4pbEyfsTRsQI4m/Gip+qV4pi
 JVnDeIL00UKuXKXdntTqfSUlFZXuZSuSAQ3Fa+ZevaewI9idJp/EAhZ7mtfAI6NQKxZt
 xXSAIxnAl66GzWHv0C5wiK1PvesJ+FGm+bAxUWm46jC6w8ikLXkpKbnJVrVGSG1u3XkG
 2QVYRtjogDmNmBQmQRnDqqhwnvY3Zbf5mtn88uKbX3413OA83hDQ1eYZeOIE17r5wQkS
 Ff+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kvRofmg7/YjJn9lYF62NfW0huM3PJn/GGhXb2sVcmi8=;
 b=qYQcIkyY+lFasiLeGvVdFrrqtjL8Ub2swMbUP04N+7c2P3qG1ButKIx82lrnZcjYb3
 h2VPJFIps6GeK6NzVXIeHdRcfERupMmPCri4zg+pWM7ZvW+9xauGOIfaKgUOCLSuKSJH
 PPVyHXUNPnMKCiLTboZXvLTgzcKx9+E7tcZ2mNTRadIcq6YJxMTjXpR0jFq/NVowqCkY
 tPDl5njsTCPVQkVJb8JA4OUDkoptctP6X8hJS91neFUW+z+sE40b+9sCh7wuYefvhGNh
 j0kx6YMfCWMsT1MSSD5/ApojgznQ5+g61TezgGOBCJovgYd2/fg86XxbGsYLpT5nNo66
 vB7w==
X-Gm-Message-State: AOAM530es26lWzIKtevW1FGuR/O6q4uG4Gpjo1MGuR/vvVtztfiB+wcH
 yu9yiTm7LYxROsbyZIrPDZ86HB9PXMlHb4/Ncrk=
X-Google-Smtp-Source: ABdhPJzCRCSL4SEYI+SJ2Cnu6tXOnMkaHU0QprOqAG00R9c4Udvc3j5vHKeAOfZVLv3bINCa/0CpUM6z2Vo0ISZE00U=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr10761131edc.164.1613293553075; 
 Sun, 14 Feb 2021 01:05:53 -0800 (PST)
MIME-Version: 1.0
References: <5F96915D.2040102@huawei.com>
 <CAJ+F1CJT7SDt63ZyUAVCZhoYJ=Ep4KXF7MbcQJREaDHrTZXBeA@mail.gmail.com>
 <4a7adb06-c911-1d1b-631a-7cb06d39f89d@vivier.eu>
In-Reply-To: <4a7adb06-c911-1d1b-631a-7cb06d39f89d@vivier.eu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 14 Feb 2021 13:05:40 +0400
Message-ID: <CAJ+F1C+HVRieOFBvgU=SbKKDmOfuv0w=56dnt2fesGaXbMo2rQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] qga: Fix some style problems
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="0000000000002649a205bb482d37"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: AlexChen <alex.chen@huawei.com>, qemu trival <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002649a205bb482d37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Feb 14, 2021 at 3:20 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 04/11/2020 =C3=A0 08:46, Marc-Andr=C3=A9 Lureau a =C3=A9crit :
> >
> >
> > On Mon, Oct 26, 2020 at 1:16 PM AlexChen <alex.chen@huawei.com <mailto:
> alex.chen@huawei.com>> wrote:
> >
> >     Fix some error style problems found by checkpatch.pl <
> http://checkpatch.pl>.
> >
> >     alexchen (4):
> >       qga: Add spaces around operator
> >       qga: Delete redundant spaces
> >       qga: Open brace '{' following struct go on the same
> >       qga: switch and case should be at the same indent
> >
> >      qga/channel-win32.c  |  6 ++---
> >      qga/commands-posix.c |  4 +--
> >      qga/commands-win32.c | 28 ++++++++++-----------
> >      qga/commands.c       |  4 +--
> >      qga/main.c           | 59
> ++++++++++++++++++++++----------------------
> >      5 files changed, 50 insertions(+), 51 deletions(-)
> >
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com <mailt=
o:
> marcandre.lureau@redhat.com>>
>
> Where are the patches?
>
> I don't find them in my mailbox and patchew didn't receive them:
>
> https://patchew.org/QEMU/5F96915D.2040102@huawei.com/
>
>
It was received on the mailing list:
https://lists.gnu.org/archive/html/qemu-devel/2020-10/index.html
(I got them in my mailbox as well)

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002649a205bb482d37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 14, 2021 at 3:20 AM Lau=
rent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 04=
/11/2020 =C3=A0 08:46, Marc-Andr=C3=A9 Lureau a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Oct 26, 2020 at 1:16 PM AlexChen &lt;<a href=3D"mailto:alex.ch=
en@huawei.com" target=3D"_blank">alex.chen@huawei.com</a> &lt;mailto:<a hre=
f=3D"mailto:alex.chen@huawei.com" target=3D"_blank">alex.chen@huawei.com</a=
>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Fix some error style problems found by <a href=3D"h=
ttp://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a>=
 &lt;<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">=
http://checkpatch.pl</a>&gt;.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0alexchen (4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 qga: Add spaces around operator<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 qga: Delete redundant spaces<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 qga: Open brace &#39;{&#39; following struct=
 go on the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 qga: switch and case should be at the same i=
ndent<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qga/channel-win32.c=C2=A0 |=C2=A0 6 ++---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qga/commands-posix.c |=C2=A0 4 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qga/commands-win32.c | 28 ++++++++++---------=
--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qga/commands.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 59 ++++++++++++++++++++++----------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A05 files changed, 50 insertions(+), 51 deletio=
ns(-)<br>
&gt; <br>
&gt; <br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> &lt;mail=
to:<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcand=
re.lureau@redhat.com</a>&gt;&gt;<br>
<br>
Where are the patches?<br>
<br>
I don&#39;t find them in my mailbox and patchew didn&#39;t receive them:<br=
>
<br>
<a href=3D"https://patchew.org/QEMU/5F96915D.2040102@huawei.com/" rel=3D"no=
referrer" target=3D"_blank">https://patchew.org/QEMU/5F96915D.2040102@huawe=
i.com/</a><br>
<br></blockquote><div><br></div>It was received on the mailing list: <a hre=
f=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-10/index.html">http=
s://lists.gnu.org/archive/html/qemu-devel/2020-10/index.html</a></div><div =
class=3D"gmail_quote">(I got them in my mailbox as well)<br></div><br>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></di=
v></div>

--0000000000002649a205bb482d37--

