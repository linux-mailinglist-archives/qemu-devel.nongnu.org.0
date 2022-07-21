Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3930657D6EB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 00:33:54 +0200 (CEST)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEejw-0004MO-Pa
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 18:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEeh7-0002f6-1x; Thu, 21 Jul 2022 18:30:57 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:47089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEeh5-0007g2-5g; Thu, 21 Jul 2022 18:30:56 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31e7c4b593fso31497637b3.13; 
 Thu, 21 Jul 2022 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1v/Zu3X4Ykgb9e+40HSmCKNFFlEfwDR3XVAs080v/8=;
 b=Cr9ZCTIBArqMAdDqTUGArkU4zF+Kl+hOMiYRFpIDOqv6nNPpbfXxCYgF90Nm4YBLCL
 vNd2Km7mZdnacXtpMNVG4Ev+XwBbxpR7Vtn4vf4lSSTHXu6NyA73UUWZ08amVKrimVfR
 R6Bl0hoH7MT8/oUGY7JtOhl2+wIuBrGmZDQEaTxcg5FreWQOAELzWW+u5l2LG0pfiwPD
 Y242qZb7ThfgDWR4jK63Yc7pysTepXYYATGS8W52bEX1HHwhtHA3syt2n7FjGrVq52Oc
 ATuMfuy18jIJtEf3iGZ2kl4JMnECLJ8n8m6ihTv3dcr6hDzIYT+Myn5zNgsmZgcWnXgC
 spww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1v/Zu3X4Ykgb9e+40HSmCKNFFlEfwDR3XVAs080v/8=;
 b=EDnD0nXaXxCje+Mw8aJkvhnZh0XM1UlAXxsg8jDWXbM8RbG3vfkTXtD8hLkcpvPYnM
 oDScpW5Xj4Rmdhpx2hGNpuypkM7IQGaUQwhwquMMQzcvCoxCWp0khmxRg0EQ26BNIsPO
 U6/bNk3FfjEhxw2HDZMCTTrYx9bAn0mquSNrWIPOsPyXGKlv1TQtNIdeCQ4OOFy8R2Ua
 jM3ypoUVYDZFwAaWPk1P3FjPw7V7u74swZuOstGWE/wsFyOAKC1HbJQ7WbHkPVeGaZJz
 HEXQeY4NUTEb+HwkxugQM+ZEu5Gh+E3Mi6bXKRIhyiqVri1CgMdc8FkPwwa2JXZzrK0P
 R2XQ==
X-Gm-Message-State: AJIora+HzXNcteQxXOL/FNsnhOwjEE0UDBj/SgURRJtbeb4QE5zfXXng
 AOJ7jD6mPO4+sEeIilcMdrh8HvrJ/qIoA0cvKv8=
X-Google-Smtp-Source: AGRyM1sGumHNufMYm+bxCfMUr3A7H5YFM7qtH7Ud1cJkH6jE0R3cIs1cW/6x79z6v8EAyBqnAFf6KYtvkTjBio8Zeyg=
X-Received: by 2002:a0d:cccd:0:b0:31e:8e94:ddb2 with SMTP id
 o196-20020a0dcccd000000b0031e8e94ddb2mr662233ywd.239.1658442653740; Thu, 21
 Jul 2022 15:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220719075930.315237-1-aik@ozlabs.ru>
 <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
 <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
 <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
 <CAJSP0QWoeyXrzTTrJZu6OPp1DiuyvrecRMSFdLYLvNufxGwwBQ@mail.gmail.com>
 <CAFEAcA88P5JyqTneiVi6c+ya1Q0A+NkuMjsVx=kj0k_BKa=19w@mail.gmail.com>
In-Reply-To: <CAFEAcA88P5JyqTneiVi6c+ya1Q0A+NkuMjsVx=kj0k_BKa=19w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 21 Jul 2022 18:30:41 -0400
Message-ID: <CAJSP0QW4QgktfL=PHiCdyTgZ2q31qfxtY=BUcEmRA+HmTRBRvQ@mail.gmail.com>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel <qemu-devel@nongnu.org>, 
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000041b3d705e458458d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000041b3d705e458458d
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 21, 2022, 14:52 Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 21 Jul 2022 at 19:41, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > The SLOF repo was last synced automatically 6 days ago. I'm unable to
> > start a new sync operation and maybe the current one is stuck (the web
> > interface claims the sync is currently updating...).
> >
> > Peter: are you able to fetch https://github.com/aik/SLOF and push to
> > https://gitlab.com/qemu-project/SLOF to manually sync the repo?
>
> End-of-week for me, but I can look at it on Monday...
>

I will sync it manually tomorrow.

Have a nice weekend!

Stefan

>
> thanks
> -- PMM
>

--00000000000041b3d705e458458d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jul 21, 2022, 14:52 Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Thu, 21 Jul 2022 at 19:41, Ste=
fan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">stefanha@gmail.com</a>&gt; wrote:<br>
&gt; The SLOF repo was last synced automatically 6 days ago. I&#39;m unable=
 to<br>
&gt; start a new sync operation and maybe the current one is stuck (the web=
<br>
&gt; interface claims the sync is currently updating...).<br>
&gt;<br>
&gt; Peter: are you able to fetch <a href=3D"https://github.com/aik/SLOF" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/aik/SLOF<=
/a> and push to<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/SLOF" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://gitlab.com/qemu-project/SLOF</a> to manu=
ally sync the repo?<br>
<br>
End-of-week for me, but I can look at it on Monday...<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">I will sync it manuall=
y tomorrow.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Have a nice =
weekend!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div></div>

--00000000000041b3d705e458458d--

