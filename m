Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD133404A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:26:35 +0100 (CET)
Received: from localhost ([::1]:42436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJznG-00054H-3d
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lJzlN-00043c-Tm; Wed, 10 Mar 2021 09:24:37 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:35705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lJzlL-0005Ju-Tm; Wed, 10 Mar 2021 09:24:37 -0500
Received: by mail-lj1-x241.google.com with SMTP id a17so25842341ljq.2;
 Wed, 10 Mar 2021 06:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LAfpUdTF0Qe+ggauEVIYuNBLzZDK42PlI5FQBfqRQ/U=;
 b=pmdkrmY1eHBuJycZa660YUu2ZwFoHDg/S5ZpVGn7TDQ8/4dayCwpbhe6nF59PdgInF
 6UW88rQSjSW9iMSBKjTesRV1Uz0nPr2IOwhBi9jNOX5x7QqDHKLN7K7sc39/CcoRnT/n
 M4WqGrHlOjPMRkGm95CdB46q7GhESGl2L0vy4p3ZwAZjE5UTBvF9tT9fmXh4PeZXqPEX
 5iVedWNFMetdbYlF2vXqrClk/R4khCTUo75DC0pOmPkgDtRG47LbFYuA0kXpd1yV6pqB
 VfjXHE/wII7FcZQwjxpMZC5RIGYiwVDWIaAGfKm60awXDAZoXXfN/KyOmaTiAWY4Lssn
 eu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LAfpUdTF0Qe+ggauEVIYuNBLzZDK42PlI5FQBfqRQ/U=;
 b=KMTSDUfK8h2yVRqUjk3UEH06tBJkWPz49HwLfTjXfnEitz9maJU8vAWAWURIlSzP9o
 N4gN5V7j+5tPweSa8AL08MBx7/WJqRWiWh0gG+ElQTGTohav9erwzypTxHy+1pnkteOh
 qtixfuvuD3OclLC+WyVhTz5Kg0l3m66iedOjouF4Z5l8Kp+SviJeZgoFiZn4l6rckEzq
 79g5xKQh82BXLp4xxhd2xziP5sdcakvsfe4Re2+oFhnBbb45sAXLcSikDGxHSym+o9Qd
 jiL/YK2H4l0ySwoSyYcKeQI8nZnmGQtgTgVwJlxZeXKlgxgVHg9iI/55YzDKWOGwi9Rf
 ifbg==
X-Gm-Message-State: AOAM533PggRI6+yRKO907uX1IB68N1/TIcmGaTc5hQRpwFITt7xy8Uxh
 5IqOWo8svXRs04MGoNTEXJkPmb98Hb1OZv3Goi8=
X-Google-Smtp-Source: ABdhPJyDLY4kHoRI1qdQBfne07Jr68zHI1nhvPDjQfTwuuYJwZqFTZGVDMvkyOp9k9+nZ3ofnAtKfl/8pFK/G6S8Vek=
X-Received: by 2002:a2e:9e4f:: with SMTP id g15mr1901229ljk.303.1615386273732; 
 Wed, 10 Mar 2021 06:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20210310114314.1068957-1-philmd@redhat.com>
 <CAGNx5+11ngxmX0CYKL3q_FRsZCQbT15-HfuuFgLd=MyEXo_h9g@mail.gmail.com>
 <a46d49ad-4bb7-e638-7124-2c259bb2ecda@redhat.com>
In-Reply-To: <a46d49ad-4bb7-e638-7124-2c259bb2ecda@redhat.com>
From: Fam Zheng <famforupstream@gmail.com>
Date: Wed, 10 Mar 2021 14:24:23 +0000
Message-ID: <CAGNx5+1rx+gd6ihof7wa4c=zA6--uGkCr2dKELrk+Ri-6AuUKw@mail.gmail.com>
Subject: Re: [PATCH 0/3] block: Introduce the 'zeroes-co' driver to help
 security reports
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000055aa605bd2f6df8"
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=famforupstream@gmail.com; helo=mail-lj1-x241.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000055aa605bd2f6df8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Mar 2021 at 12:38, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> On 3/10/21 1:32 PM, Fam Zheng wrote:
> > On Wed, 10 Mar 2021 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com
> > <mailto:philmd@redhat.com>> wrote:
> >
> >     Hi,
> >
> >     This is an alternative approach to changing null-co driver
> >     default 'read-zeroes' option to true:
> >     https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html
> >     <https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html>
> >
> >     Instead we introduce yet another block driver with an explicit
> >     name: 'zeroes-co'. We then clarify in secure-coding-practices.rst
> >     that security reports have to be sent using this new driver.
> >
> >     The 2nd patch is RFC because I won't spend time converting the
> >     tests until the first patch is discussed, as I already spent enough
> >     time doing that in the previous mentioned series.
> >
> >     Regards,
> >
> >     Phil.
> >
> >     Philippe Mathieu-Daud=C3=A9 (3):
> >       block: Introduce the 'zeroes-co' driver
> >       tests/test-blockjob: Use zeroes-co instead of
> null-co,read-zeroes=3Don
> >       docs/secure-coding-practices: Describe null-co/zeroes-co block
> drivers
> >
> >      docs/devel/secure-coding-practices.rst |   7 +
> >      block/zeroes.c                         | 306
> +++++++++++++++++++++++++
> >
> > Why not add another BlockDriver struct to block/null.c and set the
> > read_zeroes field in the .bdrv_file_open callback? It would make the
> > patch much simpler.
>
> This is the first patch I wrote but then realized you are listed as
> null-co maintainer, so you might be uninterested in having this new
> driver in the same file. And declaring the prototypes public to
> reuse them seemed overkill.
>
>
I posted a patch for block/null.c to add the same interface, just as an
alternative to the first patch.

I think we all agree that both zeroed and non-zeroed read mode will be
supported going forward, the divergence is on approach:

a) -blockdev null-co:// | -blockdev null-co://,read-zeroes=3Doff,

if we make read-zeroes=3Don the default.

b) -blockdev null-co:// | -blockdev zero-co://,

if we keep the current default of null-co://, but introduce zero-co://
which has a clearer interface.

Fam

--000000000000055aa605bd2f6df8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 12:38, Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 3/10/21 1:32 PM, Fam Zheng wrote:<br>
&gt; On Wed, 10 Mar 2021 at 11:44, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">phil=
md@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is an alternative approach to changing null-co=
 driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0default &#39;read-zeroes&#39; option to true:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.mail-archive.com/qemu-block@=
nongnu.org/msg80873.html" rel=3D"noreferrer" target=3D"_blank">https://www.=
mail-archive.com/qemu-block@nongnu.org/msg80873.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.mail-archive.com/qemu-bl=
ock@nongnu.org/msg80873.html" rel=3D"noreferrer" target=3D"_blank">https://=
www.mail-archive.com/qemu-block@nongnu.org/msg80873.html</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Instead we introduce yet another block driver with =
an explicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0name: &#39;zeroes-co&#39;. We then clarify in secur=
e-coding-practices.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0that security reports have to be sent using this ne=
w driver.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The 2nd patch is RFC because I won&#39;t spend time=
 converting the<br>
&gt;=C2=A0 =C2=A0 =C2=A0tests until the first patch is discussed, as I alre=
ady spent enough<br>
&gt;=C2=A0 =C2=A0 =C2=A0time doing that in the previous mentioned series.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phil.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Philippe Mathieu-Daud=C3=A9 (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 block: Introduce the &#39;zeroes-co&#39; dri=
ver<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 tests/test-blockjob: Use zeroes-co instead o=
f null-co,read-zeroes=3Don<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 docs/secure-coding-practices: Describe null-=
co/zeroes-co block drivers<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0docs/devel/secure-coding-practices.rst |=C2=
=A0 =C2=A07 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0block/zeroes.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 306 ++++++++++=
+++++++++++++++<br>
&gt; <br>
&gt; Why not add another BlockDriver struct to block/null.c and set the<br>
&gt; read_zeroes field in the .bdrv_file_open callback? It would make the<b=
r>
&gt; patch much simpler.<br>
<br>
This is the first patch I wrote but then realized you are listed as<br>
null-co maintainer, so you might be uninterested in having this new<br>
driver in the same file. And declaring the prototypes public to<br>
reuse them seemed overkill.<br><br></blockquote><div><br></div><div>I poste=
d a patch for block/null.c to add the same interface, just as an alternativ=
e to the first patch.=C2=A0</div><div><br></div><div>I think we all agree t=
hat both zeroed and non-zeroed read mode will be supported going forward, t=
he divergence is on approach:</div><div><br></div><div>a) -blockdev null-co=
:// | -blockdev null-co://,read-zeroes=3Doff,</div><div><br></div><div>if w=
e make read-zeroes=3Don the default.</div><div><br></div><div>b) -blockdev =
null-co:// | -blockdev zero-co://,</div><div><br></div><div>if we keep the =
current default of null-co://, but introduce zero-co:// which has a clearer=
 interface.</div><div><br></div><div>Fam</div></div></div>

--000000000000055aa605bd2f6df8--

