Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A414A6A82
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:24:47 +0100 (CET)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6GE-00013M-Do
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:24:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF24g-0002rw-4G
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 17:56:34 -0500
Received: from [2607:f8b0:4864:20::936] (port=34594
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF24c-0008E3-TZ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 17:56:33 -0500
Received: by mail-ua1-x936.google.com with SMTP id y4so16024866uad.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 14:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7LMq4VL5oUuhxG22sw29Dv8tlIEyW2QQh0UunsIFRYQ=;
 b=ZBAFWvdxCMUHwZYxTmQFrdwkpzWxkc8pPmAXTinqHyh6nh8HKnsAD7b2NllkKwlRez
 n4GdB18VN9891a7cm8Qkx/QTetEB0wvOFlRMzyZfgleST29ATeGHp2lFhFqeNkf8r/fU
 6zB8uSFSbT0AteaLPrUmuZLaBcQv5UagcaIOY76xZCEwi8yOj1Ceui3WTlQj53BTqRe3
 Ap4H5KwpuD6PLXo/IgmWKcLIb0VgzorSjpofg7gPWPmKsxh6e2m7XEZx/jB1Lil194KJ
 rouxNXYWys2fWlwRalDxOz5tM/RFhkf0xxgm3Cv5BZeHRFspv/QkgfjeHRnyMjfF8TT8
 kgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7LMq4VL5oUuhxG22sw29Dv8tlIEyW2QQh0UunsIFRYQ=;
 b=1im/JklNykEzvs8Qj3tXNvIh0VEuXinoHFFq3a+0GlDz2cfMbE9Oyz5mrXAxEnSx4a
 Hkmq/Vo4z/7fVDke731lBdS6JsndZMUF3ZUsIDCpwxQkCNXVXzYhQ2ZQokVPKUaro0Kn
 AcS6RAst7W+bGKYnFjldt+OY0TotxSIVpi3CaFyRiZ5NsN9ErLg9cckY5XnH2GDQ3VcQ
 lZg11bvO1WwztfL6mV0AgQ9yAHH313hX73mnVe7dPsJZzFWrjc+H6X0DSCPcAig6/YE+
 GO+Kh/KLam6Zra9ilfwugQL49BRy9++0silHKm4itzgD2UXuW2Tn2CZ0XitZjDTHRFQv
 Vmkg==
X-Gm-Message-State: AOAM533rVGzn/UTlLGGPzP8c55M2wHGQqG+T2J8SwiMgrPTf/vuzIrsC
 NNS4oIYglZVhK6GY78wcsRAar/QDBjwJLp10ZgLDIA==
X-Google-Smtp-Source: ABdhPJyO8qzzi+pgo0sacN0s05wCQ3XIiwcdjG2JESnDd6Cfv8LWjJ58Eq1+fwgsyXUy4iNS85HCFdWASS2wh4xTZJQ=
X-Received: by 2002:a67:fac3:: with SMTP id g3mr11800883vsq.6.1643756183219;
 Tue, 01 Feb 2022 14:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20220201212809.59518-1-imp@bsdimp.com>
 <42f97813-b487-d57a-89db-561558f95dc9@linaro.org>
In-Reply-To: <42f97813-b487-d57a-89db-561558f95dc9@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 15:56:12 -0700
Message-ID: <CANCZdfpr1O09Cng4Cq3o_3V99S2uwZnqUhhYL0ve7SHTCKTjxQ@mail.gmail.com>
Subject: Re: [PATCH v2] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006606d305d6fccf31"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006606d305d6fccf31
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 2:40 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/2/22 08:28, Warner Losh wrote:
> > The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
> > define QEMU_SI_CAPSICUM there. Only copy _capsicum when QEMU_SI_CAPSICUM
> > is defined. Default to no info being passed for signals we make no guess
> > about.
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/signal-common.h | 5 +++++
> >   bsd-user/signal.c        | 5 +++++
> >   2 files changed, 10 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

thanks!


> r~
>

--0000000000006606d305d6fccf31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 2:40 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 2/2/22 08:28, Warner Losh wrote:<br>
&gt; The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only=
<br>
&gt; define QEMU_SI_CAPSICUM there. Only copy _capsicum when QEMU_SI_CAPSIC=
UM<br>
&gt; is defined. Default to no info being passed for signals we make no gue=
ss<br>
&gt; about.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/signal-common.h | 5 +++++<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 =C2=A02 files changed, 10 insertions(+)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div>=C2=A0</div><div>thanks!</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--0000000000006606d305d6fccf31--

