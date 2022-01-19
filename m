Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C1C494154
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:53:08 +0100 (CET)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAH11-0006ur-IK
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nAGqq-0004LA-EO
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:42:36 -0500
Received: from [2607:f8b0:4864:20::335] (port=42654
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nAGqo-0008DZ-B5
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:42:36 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so4563497oti.9
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gWRCl1L10a0BjrKadPsGHNWtFWo7pvpciW5lgcFivlY=;
 b=K1djbya14YzgBJWGHN+Gyg1hLeEuHZIcVCHkILVi8bqpFx4X9FbWrH6KyFLQQop8uF
 ZGAzfd9uzpSUVNBRoTiNRNTLgYU6mt3QilCd1HVquaPpH23XdNQM11Jb64fHJ0Mx/w2Y
 JEXcamI7sc/b38XqEvnbNrCxQ7oE2I/8TNIwkStaY06KiU1CcRazXSgu2rqfI6TMuBQO
 BE8IbkIeM33ThF6lIa+bocsxQBY+6ZA6L9FsAqbq4m6NPz3dPxa8uqwtQoKyIrM7meCp
 RLhEvn6mKHOpIHkRMoBvacrm2pt185XvTJVR1LC1Ieas9OED8cz7QqBKhclBbQ76dznV
 Kd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gWRCl1L10a0BjrKadPsGHNWtFWo7pvpciW5lgcFivlY=;
 b=CCHPK2ZXIQAE/Rz2VhV/zV0yav3vG+uR9uXeCIgP7sFQ9Zc/g0Li1hGg8ZOCYpou49
 PGLuUZAMCve1vRtYeHErYuzQe+lzsYYHymnn4t8EyPwe5LQpFLgmhECMZ9n72Z7vVsEU
 LtsSUznUNimO8cjd69HDktqmI6Gqz6EFChofIB6firy5FOWjXRg1e4gI5MzqGxe5ycu8
 EwdTPbaZFAFEXp1D+ncMjOunUTWR1zgvIGae3gAPeQXTLKFFTO4J5FYRvpGwAFUAIng3
 xTIqVvvFZaNz9ThGF87fzpJO07FFx8acRxJLZVBOv4eDsoUNX6DjNyztuK+NBHT3HIWb
 aHeg==
X-Gm-Message-State: AOAM532JKo8weT6UO8j+TyXlZ0eHQaxCvm0eLRlwEkJw6CKrUmwQdDKT
 XskUwSPaCUtDjp4MDlNKufyrtU6+Ql8We4j4O0w=
X-Google-Smtp-Source: ABdhPJz0qVE1wez33ZUPm+yFeolA3XojTNch/WGn60geURPePclm3vcJvYQM4I+PhU+/z7vGxCBkBVpg2/dEv9ZUTA0=
X-Received: by 2002:a9d:2d81:: with SMTP id g1mr25819814otb.25.1642621352359; 
 Wed, 19 Jan 2022 11:42:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK7rcp9rnggAvaDxRV4m_KcR1afmquJsR+=khKw4B1UG1+V7yw@mail.gmail.com>
 <87czkn8rzp.fsf@linaro.org>
In-Reply-To: <87czkn8rzp.fsf@linaro.org>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Wed, 19 Jan 2022 14:42:21 -0500
Message-ID: <CAK7rcp84B0MXfeGsPnd9oM6cqxGUUSNL0GmLiWYwZzPhLkvfxw@mail.gmail.com>
Subject: Re: Cross Architecture Kernel Modules?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000353bf005d5f4961b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000353bf005d5f4961b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The source for it isn't available in order that it be compiled to the
desired architecture.

What 3rd party forks take this approach?

On Wed, Jan 19, 2022 at 2:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
> > Hello all,
> >
> > I just want to pose the following problem:
> >
> > There is a kernel module for a non-native architecture, say, arch 1. Fo=
r
> performance reasons, the rest of all of the software needs to run
> > natively on a different arch, arch 2. Is there any way to perhaps run
> multiple QEMU instances for the different architectures in such a way
> > to minimize the cross architecture performance penalty? For example, I
> would like the kernel module in one (non-native) QEMU instance to
> > be made available, literally equivalently, in the second (native) QEMU
> instance. Would there be any API or way to map across the QEMU
> > instances so that the non native arch kernel module could be mapped to
> > the native QEMU instance?
>
> What you are describing sounds like heterogeneous system modelling which
> QEMU only supports in a very limited way (all vCPUs must be the same
> base architecture). You can link QEMU's together by way of shared memory
> but there is no other wiring together done in that case although some
> 3rd party forks take this approach.
>
> The kernel module sounds confusing - why would you have a kernel module
> that wasn't the same architecture as the kernel you are running?
>
> --
> Alex Benn=C3=A9e
>

--000000000000353bf005d5f4961b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The source for it isn&#39;t available in order that it be =
compiled to the desired architecture.<br><br>What 3rd party forks take this=
 approach?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, Jan 19, 2022 at 2:06 PM Alex Benn=C3=A9e &lt;<a href=3D"m=
ailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmail.com" targ=
et=3D"_blank">kennethadammiller@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hello all,<br>
&gt;<br>
&gt; I just want to pose the following problem: <br>
&gt;<br>
&gt; There is a kernel module for a non-native architecture, say, arch 1. F=
or performance reasons, the rest of all of the software needs to run<br>
&gt; natively on a different arch, arch 2. Is there any way to perhaps run =
multiple QEMU instances for the different architectures in such a way<br>
&gt; to minimize the cross architecture performance penalty? For example, I=
 would like the kernel module in one (non-native) QEMU instance to<br>
&gt; be made available, literally equivalently, in the second (native) QEMU=
 instance. Would there be any API or way to map across the QEMU<br>
&gt; instances so that the non native arch kernel module could be mapped to=
<br>
&gt; the native QEMU instance?<br>
<br>
What you are describing sounds like heterogeneous system modelling which<br=
>
QEMU only supports in a very limited way (all vCPUs must be the same<br>
base architecture). You can link QEMU&#39;s together by way of shared memor=
y<br>
but there is no other wiring together done in that case although some<br>
3rd party forks take this approach.<br>
<br>
The kernel module sounds confusing - why would you have a kernel module<br>
that wasn&#39;t the same architecture as the kernel you are running?<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--000000000000353bf005d5f4961b--

