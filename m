Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED6F3E0095
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:56:22 +0200 (CEST)
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFVV-0003Yj-SF
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mBFTe-0001iU-UK
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:54:26 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mBFTd-0001g9-CX
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:54:26 -0400
Received: by mail-io1-xd2d.google.com with SMTP id r18so2056207iot.4
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+aCiRhRRSya4R3RQCY8CnKJSg2wppdXA/rY8oIBQ58=;
 b=EIkC+Wd5tC/bl1Z/JYR3lVERNjmALOeNN/M1/m3kJVsJfxUwLTbgDNS6RC+dyRKwx/
 rWBVF+S7oQEd8CJoNOrLDHZe7bzQfKNaxcDsIvMGjAgJLgnWz2LGhczPdGFh3W84FQpS
 tI2U0Mqq+GikQQmLtXuoP/WbNfc9mf/XDFDq9D2mC+2WjjEomYwDWXrnarCH053hhTYa
 zoy8luuvxZMMvMEjGkHj4y7ozfBDbRsNBClEuZZK/vGTqzrAolvBgYG8nugBvMi+NPob
 CgDfsWwgK2LkO5gxXEwx6VIHYs8WHQwAhX2+7kHkwfXTuXUqMJ5RNj49sFWiUbwBjhOU
 r6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+aCiRhRRSya4R3RQCY8CnKJSg2wppdXA/rY8oIBQ58=;
 b=SxUrQDc6mhs2mAKNoi/T7dDY7FJ85pyEzSjJxFyCxABAIBkpFbTxKI111CxduUSAog
 6ElB2cCsjvbHVjwyzq3saio5M3LXohuxggNcHLcOriKgUf4XC9FCzIpeGVKBUg1epc8c
 9Wm+/ybQeiektrrnhzEqijdJo5LKIzX5mk1zR9G2nVKN5DYDryn4L9lDDTuNFM7oW8cD
 l7yw1IBdRZp2Bk9dsxWsXr53XWd2qdPhaU7ObY7NW5G7Bzy8DEsMnzrpGZRK9ukK4GOn
 /+jqAcJ30/qQuS2xdbHVZVBf5TdgUx8cFKQdZTqgAMn/2k88JHFx0VeCS6eihbeBxJlZ
 WCKA==
X-Gm-Message-State: AOAM531UpUodK7QlfGU0FOcT/NqA69KIuzP4xCgzqZKafjgOUSzQLlMA
 wawmljmngoeRFMo/C/uf9y06HcMl2O/F6+GTPoM=
X-Google-Smtp-Source: ABdhPJzHn7foFSSHkOtzDG6uTeliXsEv1RDIkGDm1Dhca3lEboh7QMslXc3xzLOg9bdWSEk6YiZdJnunaowyArE2GWU=
X-Received: by 2002:a02:2307:: with SMTP id u7mr19649365jau.28.1628078064147; 
 Wed, 04 Aug 2021 04:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210803151301.123581-1-ma.mandourr@gmail.com>
 <87fsvqfd4b.fsf@linaro.org>
In-Reply-To: <87fsvqfd4b.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 4 Aug 2021 13:54:13 +0200
Message-ID: <CAD-LL6hBoC44T4GythOAvvZBYK1O=WjZhv4KkoNw3QHiAeoMEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] plugins/cache: multicore cache modelling
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ae296305c8ba76cf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2d.google.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ae296305c8ba76cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 3, 2021 at 11:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > Hello,
> >
> > This series introduce multicore cache modelling in
> contrib/plugins/cache.c
> >
> > Multi-core cache modelling is handled such that for full-system
> > emulation, a private L1 cache is maintained to each core available to
> > the system. For multi-threaded userspace emulation, a static number of
> > cores is maintained for the overall system, and every memory access go
> > through one of these, even if the number of fired threads is more than
> > that number.
>
> Queued to plugins/next, thanks.
>
>
From what I can see from your fork, qemu/cache.c at plugins/next =C2=B7
stsquad/qemu =C2=B7 GitHub
<https://github.com/stsquad/qemu/blob/plugins/next/contrib/plugins/cache.c>
,
here, I think you enqueued v4 of the patches


> --
> Alex Benn=C3=A9e
>

--000000000000ae296305c8ba76cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 =
at 11:10 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">=
alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hello,<br>
&gt;<br>
&gt; This series introduce multicore cache modelling in contrib/plugins/cac=
he.c<br>
&gt;<br>
&gt; Multi-core cache modelling is handled such that for full-system<br>
&gt; emulation, a private L1 cache is maintained to each core available to<=
br>
&gt; the system. For multi-threaded userspace emulation, a static number of=
<br>
&gt; cores is maintained for the overall system, and every memory access go=
<br>
&gt; through one of these, even if the number of fired threads is more than=
<br>
&gt; that number.<br>
<br>
Queued to plugins/next, thanks.<br>
<br></blockquote><div><br></div><div>From what I can see from your fork,=C2=
=A0<a href=3D"https://github.com/stsquad/qemu/blob/plugins/next/contrib/plu=
gins/cache.c">qemu/cache.c at plugins/next =C2=B7 stsquad/qemu =C2=B7 GitHu=
b</a>,=C2=A0</div><div>here, I think you enqueued v4 of the patches=C2=A0</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div></div>

--000000000000ae296305c8ba76cf--

