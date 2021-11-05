Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40F4466C9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:13:32 +0100 (CET)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1qM-0006Pt-Rk
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj1et-0002wt-IU
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:01:41 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:33650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mj1er-0008Vd-Ba
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:01:39 -0400
Received: by mail-ua1-x929.google.com with SMTP id b17so18083621uas.0
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+C5n5vDcEwMV98Gu+BS5wdWa4q1yyrOPN6/7OL/9MA=;
 b=dJ42gmojheTAZgN02AKNt7VIQw1QIvNEEP9QM8EhbOhu9ftmDAZ+x0uyUI5Bhziv8f
 7lgEPgAxa77gri75uW7MNNu0q0RgSRCYcPjr6qCjWEL2NNnAV5KZjBpEioKcTuz/NmDh
 UJS4tTCIuHExjz0Hcdzab2UW4coUPYWIET2roAi9cPtcB2hYCDpt0h6jLhszBkN5IRLH
 bgn1162XFwqdmet2rXfujtOjqluahysvb8ryPSNO2SairvxTPO8EM6z8+V0oEK63cA70
 4z9NcHxevB6qrcrQyOQUmy9ltg6ljLpZ3RAqa52MaGWaA/Z9rQ6kJ9XjpdY9eE3Lu0c/
 A3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+C5n5vDcEwMV98Gu+BS5wdWa4q1yyrOPN6/7OL/9MA=;
 b=0fWeNVyujnVq9/tZ0vXVlzAmga7/IgRbeIQRCwftsKm+blgBvUVKHWSLywNjStc5i+
 pNFPAF+acTp6lQsU0SaU2NnBAKC5FtOy3R7PNeqpEKhVQXRgVUoznRfGJIB5JMZmAD6Q
 +Z374WI7WrfAk6ycKVDAVazsBexgnnCwWQ2XvKMSdnU7k/DL95CJ4/7qfPcFiX1wF6VY
 ZarNsmrK4/8kdeBECDW6XJAs30utv0QmYbX7RVbdtGaN1tUDPlrGnNglTRvShkWF/45/
 927PJlr4iNX1wMhQ1dhIyOoDVvGxuILBp8FExfs3B62KjvrZrD71GBy+gsLQJJQfOB+O
 wl6w==
X-Gm-Message-State: AOAM532Ht8RLlN34u7sKgAALTSGBUCc+4RTiSCdhCIC0BdKWKc0JcciZ
 KznLfz+TaWNQY5rZGZ8v+KJY0qnd3Xu+7Q6siOaLwg==
X-Google-Smtp-Source: ABdhPJxglwpwHCfrw6sqjfE6O48JGuoFvS/wSwNlKYp8ykQnVpizGoInvpNGCOcMVUr3u+uKTZZWA8K7wWC/K2ge/Dk=
X-Received: by 2002:a05:6102:5f2:: with SMTP id
 w18mr47581960vsf.6.1636128095658; 
 Fri, 05 Nov 2021 09:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-2-imp@bsdimp.com>
 <0901cff3-28ed-4a80-90b2-d2e4966e667a@linaro.org>
In-Reply-To: <0901cff3-28ed-4a80-90b2-d2e4966e667a@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 5 Nov 2021 10:01:24 -0600
Message-ID: <CANCZdfrOsiT25PL02wMw4O6h7Ca=UGAMD0sC4U2evT7TcO-hyA@mail.gmail.com>
Subject: Re: [PATCH v4 01/36] bsd-user/mips*: Remove
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f2fcdd05d00cc113"
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f2fcdd05d00cc113
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:52 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/4/21 11:18 PM, Warner Losh wrote:
> > FreeBSD has dropped support for mips starting with FreeBSD 14. mips
> > support has been removed from the bsd-user fork because updating it for
> > new signal requirements. Remove it here since it is a distraction.
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/mips/target_arch_sysarch.h   | 69 ---------------------------
> >   bsd-user/mips/target_syscall.h        | 52 --------------------
> >   bsd-user/mips64/target_arch_sysarch.h | 69 ---------------------------
> >   bsd-user/mips64/target_syscall.h      | 53 --------------------
> >   4 files changed, 243 deletions(-)
> >   delete mode 100644 bsd-user/mips/target_arch_sysarch.h
> >   delete mode 100644 bsd-user/mips/target_syscall.h
> >   delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
> >   delete mode 100644 bsd-user/mips64/target_syscall.h
> I'm somewhat surprised that sys/mips/mips still exists on the main
> branch?  But anyway,
>

It's a long story, but it's been talked about for several years now. It was
retained
in the tree 18 months ago when it was last discussed to allow a large
customer
to migrate to from doing their research on MIPS to arm and riscv. I have a
branch
in my repo locally to remove it and hope to post the review in the coming
days.
If things go well, it will be gone by the end of the month. I'd planned on
keeping
mips on in the bsd-user fork until we hit a point when it was too much work
to
keep it going, but that time came much sooner than I expected.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks!

Warner


>
> r~
>

--000000000000f2fcdd05d00cc113
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 5, 2021 at 9:52 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/4/21 11:18 PM, Warner Losh wrote:<br>
&gt; FreeBSD has dropped support for mips starting with FreeBSD 14. mips<br=
>
&gt; support has been removed from the bsd-user fork because updating it fo=
r<br>
&gt; new signal requirements. Remove it here since it is a distraction.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/mips/target_arch_sysarch.h=C2=A0 =C2=A0| 69 -----=
----------------------<br>
&gt;=C2=A0 =C2=A0bsd-user/mips/target_syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 52 --------------------<br>
&gt;=C2=A0 =C2=A0bsd-user/mips64/target_arch_sysarch.h | 69 ---------------=
------------<br>
&gt;=C2=A0 =C2=A0bsd-user/mips64/target_syscall.h=C2=A0 =C2=A0 =C2=A0 | 53 =
--------------------<br>
&gt;=C2=A0 =C2=A04 files changed, 243 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 bsd-user/mips/target_arch_sysarch.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 bsd-user/mips/target_syscall.h<br>
&gt;=C2=A0 =C2=A0delete mode 100644 bsd-user/mips64/target_arch_sysarch.h<b=
r>
&gt;=C2=A0 =C2=A0delete mode 100644 bsd-user/mips64/target_syscall.h<br>
I&#39;m somewhat surprised that sys/mips/mips still exists on the main bran=
ch?=C2=A0 But anyway,<br></blockquote><div><br></div><div>It&#39;s a long s=
tory, but it&#39;s been talked about for several years now. It was retained=
</div><div>in the tree 18 months ago when it was last discussed to allow a =
large customer</div><div>to migrate to from doing their research on MIPS to=
 arm and riscv. I have a branch</div><div>in my repo locally to remove it a=
nd hope to post the review in the coming days.</div><div>If things go well,=
 it will be gone by the end of the month. I&#39;d planned on keeping</div><=
div>mips on in the bsd-user fork until we hit a point when it was too much =
work to</div><div>keep it going, but that time came much sooner than I expe=
cted.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro=
.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockquot=
e><div><br></div><div>Thanks!</div><div><br></div><div>Warner</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000f2fcdd05d00cc113--

