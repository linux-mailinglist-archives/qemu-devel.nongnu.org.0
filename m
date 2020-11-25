Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863BD2C49D8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:27:24 +0100 (CET)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki2Jv-0008CB-JU
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ki2JB-0007lG-SL
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:26:37 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ki2JA-0005lu-DO
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:26:37 -0500
Received: by mail-ej1-x641.google.com with SMTP id k27so5022757ejs.10
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 13:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSioyTnyEBeHbdlWUbYciox0weniPhaznegN+w4gYGs=;
 b=btWcogGrcMrz209kT41UlHIt8RkUP8DuCwPBs9EWAocDOYm8zcTX9TvexyfbNBHSaF
 YKz4RqbRw7Ily22KFE+FC3SZSw6wrMKUESuXU4tUBaaV9odJq2RjguXzCK7r0qJktpIF
 khfa/1TO+mmZJuqbNOqD9HpYvK7HP6aiBTTPo5U5ZAlTMpSwaguOjw+Y47kp7gHh7YsU
 43KkKMiZUK+weh8Sm+g0SJ6nT2B0KysAs5+yHuyJpySY4Bm2lzqDKk1BuF723TqQ6OLT
 5WAWoQ3Uohv/stwDSaYEwy+aEGcirmVgBR41AuGLqSdOf97rq3RnQ76AKHLYJmUXD6UK
 jYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSioyTnyEBeHbdlWUbYciox0weniPhaznegN+w4gYGs=;
 b=AarbY3jdTaMqrc6EIpSj2cKzEKvvaejPoXxls6kL2eSbpftZ6XJsSeHglK54aS413n
 ZMqVhLrBm7sA3y31sJo70/jquzI4S/iaGoZwbsgsKhVRjKF2vZmYr6Kl5/ig7Tf/J7AJ
 wNqMIOLmGrHYVYv9LiLzHz+g3X+n1/nyzovZFPh0Lx4EpWlr3B3U0wab/6g1bF/pVXT6
 EYYgNoStt135L1wd3xHCVnMrg8noguckK9yYw1ckeJKdeSkE9f65kRWX+GvfNrcWfF+b
 KgkyhGVZhjmJb0NVoQ0TNwGrK9v35nYJdZAdkABsS+BHoLKJ3+YeIFDSlozt8Zf6gj4R
 N3yA==
X-Gm-Message-State: AOAM532iYREQ9ULOhrhpTR6ywBjoFmZK6AIhECBzJLSf9kRbDKjS7/YP
 d+udkZII8DQoaP2AqxDcgBTSYokX1oShr5gY/OM=
X-Google-Smtp-Source: ABdhPJze81fIn3WA7396h4rpIRzrSrd096OOmEkF2TDf8czTmR8WierKSKOXZZMncmyXNghE2cumbzlJdLovJIjxBtg=
X-Received: by 2002:a17:906:b0f:: with SMTP id
 u15mr4916441ejg.109.1606339594731; 
 Wed, 25 Nov 2020 13:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20201125191833.964753-1-sw@weilnetz.de>
 <CAFEAcA-oo6M8W=uX=-FSyAkioQtPLQ5fe2V1CUaj1KkiK9efig@mail.gmail.com>
In-Reply-To: <CAFEAcA-oo6M8W=uX=-FSyAkioQtPLQ5fe2V1CUaj1KkiK9efig@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 Nov 2020 01:26:23 +0400
Message-ID: <CAJ+F1CK4nQuheFWT1Bnk6JLczXs6kXTmRZfHh0PuV5KUr137Aw@mail.gmail.com>
Subject: Re: [PATCH for-5.2] nsis: Fix build for 64 bit installer
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000eec7ba05b4f5145d"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eec7ba05b4f5145d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 11:28 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 25 Nov 2020 at 19:23, Stefan Weil <sw@weilnetz.de> wrote:
> >
> > Pass cpu instead of cpu_family to the NSIS installer script.
> >
> > That script checks for "x86_64" which is the cpu value,
> > while cpu_family is "x86".
> >
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >  meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Very unfortunate that this has only surfaced after rc3,
> which should in theory be the cutoff point for 5.2 changes.
>

There is also "[PATCH] qxl: fix segfault" that missed rc3.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000eec7ba05b4f5145d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 11:28 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, 25 Nov 2020 at 19:23, Stefan Weil &lt;<a href=3D"mailto:sw@w=
eilnetz.de" target=3D"_blank">sw@weilnetz.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Pass cpu instead of cpu_family to the NSIS installer script.<br>
&gt;<br>
&gt; That script checks for &quot;x86_64&quot; which is the cpu value,<br>
&gt; while cpu_family is &quot;x86&quot;.<br>
&gt;<br>
&gt; Signed-off-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" targe=
t=3D"_blank">sw@weilnetz.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meson.build | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
Very unfortunate that this has only surfaced after rc3,<br>
which should in theory be the cutoff point for 5.2 changes.<br></blockquote=
><div><br></div><div>There is also &quot;[PATCH] qxl: fix segfault&quot; th=
at missed rc3.</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000eec7ba05b4f5145d--

