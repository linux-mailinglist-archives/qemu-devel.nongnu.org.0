Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CF3320BD3
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 17:42:56 +0100 (CET)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDrot-0002qr-KC
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 11:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lDrnF-0001pE-5G
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:41:13 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:38048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lDrnB-0000zc-DR
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:41:12 -0500
Received: by mail-qk1-x735.google.com with SMTP id f17so10451189qkl.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 08:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=16BsjIUylT7FUcVWX53DfN99gzv9+xR5CO1DxSwdzvw=;
 b=w2rhynJn60WRm8XBGZtEp3cAQFv6T8EBnEDKDuWg4vA5paRjlaPoq29vxiNlgpM7PQ
 UuERFdzqhu4m6KK1Em+sargpkkVSShNb/lKt+Zp5wACrS0XKYuqdCtKeF2VYxRHt2FjI
 jsmHynobJvTvtMtIF4I71MyzpWDk1rXBfqXLNAXqvNqpgw1waaUk+Im3DDCiuX3mt9Zf
 GdaLQhkKbJ6vaftYEVVa41QBthuCuQEvfmeQmuR6XiY0I4uW88spbhZBNlHzlDf7h2W8
 vf5IrIKZVf3ga5kBVt74N05QK0NOBcyKLPX8n+xfY6Y2TDzCHZ/5XAgOVo2Agi0+k+e4
 RK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=16BsjIUylT7FUcVWX53DfN99gzv9+xR5CO1DxSwdzvw=;
 b=EzqG59foIbr6SCiaAO9iLTAjJB6XuduLxZui523TN5Z9SC9k+t0/FnOjeeRmUIYNE8
 a7LuZFbXmbY7DK0kcpSj1FuT1dzWuFplkDirBshNtlH7NmyfCCdyBdm8BR00DSKs0BbP
 FLOSmnCP9FP46qUtm+VR8uIgqm/EeKMEUgMwZSsqtsgWn2r82v4gcAJ203XfrcSuNJoj
 jiSaY80lTpfZ7+b4DF5m+cRm4XXFmX7syZjQFvqkvjah1/ClusOdSXQ/VHqYPfvdxyyY
 bJ3pFkmWRBeFWpjPDfB1JksGCm/IBzyRj243vOmVKfNdT9x/EXlTuEdJ7fl/Y/uH6ECH
 iMUw==
X-Gm-Message-State: AOAM531uy48SbfqBIlIG1ESLjnqs4oyfbDdjkFfa5lTVImYrDfk0mBLb
 bgMB4unKaiLGfHq2CRMKfSIzSD+VKZ/xlcXHBgsCFA/Iyr9lGw==
X-Google-Smtp-Source: ABdhPJwRiSZb99e6nphp9T07KnAJ5WejqNGhwgob0azwcxRH0Riog6eWdom3Cfy+3c/mjfvQAjxD4d7GjmV36qfuNK0=
X-Received: by 2002:a37:a151:: with SMTP id k78mr17143648qke.359.1613925667594; 
 Sun, 21 Feb 2021 08:41:07 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <871rdbklc9.fsf@linaro.org>
In-Reply-To: <871rdbklc9.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 21 Feb 2021 09:40:54 -0700
Message-ID: <CANCZdfoqHkk1WmX690Z7TrQSj4AfVGQdk36uJ+UtEg0-2+PW0Q@mail.gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001c77e505bbdb5a75"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001c77e505bbdb5a75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 20, 2021 at 4:53 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Does anybody use the ozlabs patchwork install for QEMU patches,
> > either occasionally or on a regular basis ?
> > http://patchwork.ozlabs.org/project/qemu-devel/list/
> > The admins for that system are trying to identify which of
> > the various projects are really using their patchwork instances,
> > so I figured I'd do a quick survey here. We don't use it
> > as an official project tool but it's certainly possible to
> > use it as an individual developer in one way or another.
>

I checked the FreeBSD ports tree and found that its u-boot port was the
only one to be using ozlabs. We've not used it on the bsd-user stuff
either: that's being done in github in a repo I submitted a maintainer
update for recently.

Warner

--0000000000001c77e505bbdb5a75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 20, 2021 at 4:53 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; Does anybody use the ozlabs patchwork install for QEMU patches,<br>
&gt; either occasionally or on a regular basis ?<br>
&gt; <a href=3D"http://patchwork.ozlabs.org/project/qemu-devel/list/" rel=
=3D"noreferrer" target=3D"_blank">http://patchwork.ozlabs.org/project/qemu-=
devel/list/</a><br>
&gt; The admins for that system are trying to identify which of<br>
&gt; the various projects are really using their patchwork instances,<br>
&gt; so I figured I&#39;d do a quick survey here. We don&#39;t use it<br>
&gt; as an official project tool but it&#39;s certainly possible to<br>
&gt; use it as an individual developer in one way or another.<br></blockquo=
te><div><br></div><div>I checked the FreeBSD ports tree and found that its =
u-boot port was the only one to be using ozlabs. We&#39;ve not used it on t=
he bsd-user stuff either: that&#39;s being done in github in a repo I submi=
tted a maintainer update for recently.</div><div><br></div><div>Warner=C2=
=A0</div></div></div>

--0000000000001c77e505bbdb5a75--

