Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414E401045
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:36:43 +0200 (CEST)
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMtGE-00068v-Kj
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMtEd-0004rt-2u
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:35:03 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:37377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMtEb-0000wg-Gv
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:35:02 -0400
Received: by mail-vs1-xe32.google.com with SMTP id i23so3462601vsj.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lSqRidT2e2Nfde4yDtlqQH1y0C0s0eB4B+Flys+3908=;
 b=axffd3mZAP1LsRcvD2EZGHlIg8mHqbfnPljukqjY/ZMqlqmii7mxBO7T5z5JAAtI2C
 IMzQq6HO9sU9tb24Zx6NiqXj2Ccjk4q+MY2+8AqwOzWYr6l7JPQnd1vpcKhzw8AAcejs
 T43CSjYA+SdmPJVUnm7iJzYYdX17DLWiJIl3Rv7VphiRtVvP2dIuZfaf0fmKMrRrVfoN
 EuZa2352/I2KA0nLFFoi7cDfg8rGY3rMEVmNE0S1Vt8B1b4yW5hZeiBEjvYvcJAaeCYn
 6RjpH5HiGaknybQ5JPB4t9W3Rj7qgPb2CN3IGdSgm2/aAbtjpD8RtYAx5taHlPY2wJQn
 IKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lSqRidT2e2Nfde4yDtlqQH1y0C0s0eB4B+Flys+3908=;
 b=eHdiOcg9EJAoTUJkL9xcvaHl685gGCXtoEHZRRy/6DIJVvq1k9elqdHXGahoYolO5Y
 eHaKO6hO37CqQuuAM6vD6uKsN7ATj7otolJ9f5oa+HCBvutg/A4TRsd+Yxguk/1tv78u
 VnNvnbcCvKSbEEItUBXbseco3hi6s4UXCUHscYnyU5qXxOb+PcjhULIJ0kbWz9i1m3gR
 lUoeOymHJE43WsPEHSiPk7akEcnEtUGyexCtm9/z9FOB0uwKB45Bebmuiq4gSFxaduHP
 dnbuNsTZDe4cKjufUAp0DaZ7TjUqtGBHJX5AYVwwG74T8Rhx7XPKwuhAY2d2vvczVHHZ
 wwtA==
X-Gm-Message-State: AOAM5318lWISf0RwJviLyGoYUQioe9DS7ig6Mw2tFCLaIHd7qOzaTbcA
 gVmg9OLYDvH/KJL4aGTx096OYm9ZphFWWu7o05wpxQ==
X-Google-Smtp-Source: ABdhPJz4YcwnFBAYFzBmZ88epGtD7dleSyoRYpWkkKq9ChtuzErFqlFx8S+H5CWmdBOY5h/e/Ye8eIP1CGYIEvKTbgY=
X-Received: by 2002:a67:cd84:: with SMTP id r4mr3775884vsl.6.1630852500045;
 Sun, 05 Sep 2021 07:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-28-imp@bsdimp.com>
 <6705436a-0954-31ce-f93b-b2cea448f294@linaro.org>
In-Reply-To: <6705436a-0954-31ce-f93b-b2cea448f294@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 5 Sep 2021 08:34:49 -0600
Message-ID: <CANCZdfqSw=RjKmFoZ8ZYDviF5DNRbq92mHPLVfKABpqkCVG52Q@mail.gmail.com>
Subject: Re: [PATCH v3 27/43] bsd-user: Implement --seed and initialize random
 state
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f2539b05cb406f56"
Received-SPF: none client-ip=2607:f8b0:4864:20::e32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe32.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f2539b05cb406f56
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 5, 2021 at 4:33 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/3/21 1:47 AM, imp@bsdimp.com wrote:
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > Copy --seed implementation (translated from linux-user's newer command
> > line scheme to the older one bsd-user still uses). Initialize the
> > randomness with the glibc if a specific seed is specified or use the
>
> FWIW, it's glib, not glibc.
>

I make that mistake all the time. Thanks!
And while I'm writing: thanks for all the reviews!

Warner


> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>

--000000000000f2539b05cb406f56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 5, 2021 at 4:33 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 9/3/21 1:47 AM, <a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a> wrote:<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Copy --seed implementation (translated from linux-user&#39;s newer com=
mand<br>
&gt; line scheme to the older one bsd-user still uses). Initialize the<br>
&gt; randomness with the glibc if a specific seed is specified or use the<b=
r>
<br>
FWIW, it&#39;s glib, not glibc.<br></blockquote><div><br></div><div>I make =
that mistake all the time. Thanks!</div><div>And while I&#39;m writing: tha=
nks=C2=A0for all the reviews!</div><div><br></div><div>Warner</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000f2539b05cb406f56--

