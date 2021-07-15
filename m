Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9683CA293
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 18:41:37 +0200 (CEST)
Received: from localhost ([::1]:38090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m44QZ-0006pM-96
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 12:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m44Ox-000638-3t
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:39:55 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m44Ov-0001XN-Ju
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:39:54 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 128-20020a4a11860000b029024b19a4d98eso1681664ooc.5
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gf/NJZvFJ+dAMT/KaaaAxplitFEkARZD6YfOg1gtdj8=;
 b=jZVlfsXsK7NKoyUaw/FOEWwCIwobj4L8HcIxSrXrOz/ZpMb5CDqVJpJpOpPyAsB7Xn
 AvSCv7hOaxK0T669AKOkpzsLNu+7pMMXfQdr9OpUu72vKVdFvBjMOhRG3LfAGWU80j0j
 hyXIYh98S3kIRCPOas4Nhi6EFqUVYMohIZ6vz+S7oyN2OUcl+69DsriroTFbH3q+Raih
 S09QqI2JGVG8QdEMB7PFei9smRMm+2UxBvqD8O0rrI2bKyscJXE0gBT6RjpvY2e0D3XH
 X/o2jVaVQ5pHw9Lj7wOm0kDI7EQb6IkXBnbUexkkSD8pjAWN4S5ZJN56tELkkOAkJttt
 MzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gf/NJZvFJ+dAMT/KaaaAxplitFEkARZD6YfOg1gtdj8=;
 b=OAZs8roQNDqTQu5xB69v/83+I8vmew2kymfEhHl+c2VbMfvbbM1CmI1/Sxs7dhT37e
 lKk1vY0FsqGcHK9cLt/pjZ7FevEikqUgom90UtMyG9o1BywUjmSd+Tfp+M2EEuqDyvBD
 eZW6jZImYllA/HBGuPyFflepsK/k4B1Nv2J3/noiUkXQvT0TSRAuESfpgmVLWA9v6Act
 BEu7Mfir8jaPkm6T/rurIdshgDy/UQ+e1lvfoNZ17kk1kxRinK2OiebeuZeoqHeFnpPT
 7lFWnR0c/N5sErp9cIQdd8t2FyTGIanBzIS/lyHSGSieidayg41ZNrB0+9UMVqeS0yyc
 MNew==
X-Gm-Message-State: AOAM5330F/OboktpUBwyGmK3ksjOOJuho0BajL51GxWQUGX+P2FYMUOz
 NheaiW4gDRPqOamYoU+8t1WO4nY7rVi+zZt4eQs=
X-Google-Smtp-Source: ABdhPJzSbknfJsoME8wWXWY17VaTTqgbaYovYtwjjJOvV0Gmw6SqvNAelHr73ACgfqNXzdkVohja9f2PGNFxtWOdoww=
X-Received: by 2002:a4a:6f0e:: with SMTP id h14mr4095954ooc.9.1626367191893;
 Thu, 15 Jul 2021 09:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
 <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Thu, 15 Jul 2021 11:39:41 -0500
Message-ID: <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bf4c1d05c72c1e04"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oo1-xc32.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bf4c1d05c72c1e04
Content-Type: text/plain; charset="UTF-8"

Oh I didn't know that there was a i386_user_ss in order to see that it was
intended that they were shared that way, so I initially thought that
i386_ss was user only until I saw it in the build.

On Thu, Jul 15, 2021 at 11:35 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 15 Jul 2021 at 17:25, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
> >
> > Well certainly, I know they are different executables. I'm just trying
> to understand how the different targets work.
> >
> > By subsumes, I mean that just looking at the meson.build for i386, you
> can see that there are files added to the i386_ss, but not visibly added to
> the softmmu target. But the softmmu target has those files built whenever
> you configure and build it.
>
> In the meson.build files, i386_ss is files built for both softmmu and user;
> i386_user_ss is files built for usermode only; i386_softmmu_ss is files
> built for softmmu only. target/i386/meson.build sets target_arch,
> target_softmmu_arch and target_user_arch to these sourcesets.
> The top level meson.build adds the relevant target_* sourcesets to the
> set of sources required to build the various executables.
>
> Some source files also use #ifdefs: you can look for ifdefs on
> CONFIG_USER_ONLY and CONFIG_SOFTMMU to find code that's conditionally
> compiled in different ways for the two executables.
>
> -- PMM
>

--000000000000bf4c1d05c72c1e04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh I didn&#39;t know that there was a i386_user_ss=C2=A0in=
 order to see that it was intended that they were shared that way, so I ini=
tially thought that i386_ss was user only until I saw it in the build.</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Jul 15, 2021 at 11:35 AM Peter Maydell &lt;<a href=3D"mailto:peter.mayde=
ll@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, 15 Jul 2021 at 17:25, Kennet=
h Adam Miller<br>
&lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_blank">kennet=
hadammiller@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Well certainly, I know they are different executables. I&#39;m just tr=
ying to understand how the different targets work.<br>
&gt;<br>
&gt; By subsumes, I mean that just looking at the meson.build for i386, you=
 can see that there are files added to the i386_ss, but not visibly added t=
o the softmmu target. But the softmmu target has those files built whenever=
 you configure and build it.<br>
<br>
In the meson.build files, i386_ss is files built for both softmmu and user;=
<br>
i386_user_ss is files built for usermode only; i386_softmmu_ss is files<br>
built for softmmu only. target/i386/meson.build sets target_arch,<br>
target_softmmu_arch and target_user_arch to these sourcesets.<br>
The top level meson.build adds the relevant target_* sourcesets to the<br>
set of sources required to build the various executables.<br>
<br>
Some source files also use #ifdefs: you can look for ifdefs on<br>
CONFIG_USER_ONLY and CONFIG_SOFTMMU to find code that&#39;s conditionally<b=
r>
compiled in different ways for the two executables.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000bf4c1d05c72c1e04--

