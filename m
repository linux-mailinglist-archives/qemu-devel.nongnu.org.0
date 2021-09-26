Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF1418A47
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:09:27 +0200 (CEST)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXeX-0006XW-QN
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXdS-0005rD-1b
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:08:18 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXdQ-0000fR-7z
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:08:17 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id h30so15599963vsq.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+NWqb/AseeUNPDJMAUVLvwFUumlNCnGHNY8WBAIgQU=;
 b=sxAqc0arStsKYTRUPEDbQX2SRmutS/AUOlOW6koke8e/SXOYRutNrE7Rr4m2KOoyDX
 fk4k4x+rpokdt05lpKg1wBFHxOcN8SI8U0aFmYzT6OQKmlQEh03fJMWt2cd6LkIni/21
 JvO/GdgiC6KjwrKXKUu+wUM4ko3V4Jin3VRUJDHMB3RALqYdQet94OVWae0uQZR9F2/E
 8Pfhm+6SXJekNGG/se2CUIOhoLMQo0GiPRSIUhAgBGr8yJ4fBg71tNJPOF8HL3IpBFZ5
 PPKf2YSDMp7s5ojYVEGXq2AkKlGuzp+jNnenCNOwq9cgx4g81XV+6fyJoRURvDQWYga7
 ziGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+NWqb/AseeUNPDJMAUVLvwFUumlNCnGHNY8WBAIgQU=;
 b=x32We2fGXETlHtt4hn8LjC08k7UBv0SkFBj5iiJVGg0yeU4XFA3riMe5VggRY7PYwk
 hFrAYXRB0Voyd7wyFi/tR19qP2M/FTvUf2snw2+p1cV04PxdTInRF611u4sNpnTJATeA
 r76sLyo0/4VoB5FDtzWe1R3/5QLhST0taabhdX2hiqvLR80QqgiituPhqnuXLwMxNFNw
 +YGEyJlZZsiBSzhAxsNzc/KFKUZQLfYa9mohtLg+5Ub3OsjKU1AzHNGfYcupDTPtDCJ6
 YgzNUiQwD0arg+iqfowkfLZzUmPBPEaAeUOKY3QyMnT3lvYjSDLlxiWj5GqBIALv1ZQX
 oeIA==
X-Gm-Message-State: AOAM530mbASB7CySqbG4Ya226aE6K0/lDMMz8gETWr0kGFOi14xOG1FA
 yQDzgLWfov6g3uP/sCcd6fiPagOwp0zB3LVhbaQ7Og==
X-Google-Smtp-Source: ABdhPJw+3nEVvyw+V9UczloX5vVJvFR5mIpTHNudfVisMK7E/+lPP54C8jjnLzst8OlBTh+mhBov9g4G11RHneeHCkE=
X-Received: by 2002:a67:d589:: with SMTP id m9mr16891574vsj.30.1632676094285; 
 Sun, 26 Sep 2021 10:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-8-imp@bsdimp.com>
 <e66d76d0-a463-5a01-e508-bb592c9cce97@linaro.org>
In-Reply-To: <e66d76d0-a463-5a01-e508-bb592c9cce97@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 11:08:03 -0600
Message-ID: <CANCZdfrXJD6X+AiWLYYzQB-mB3uW34r+xe970uMmZz79xA-GqQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a227bc05cce906e4"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2b.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Guy Yur <guyyur@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a227bc05cce906e4
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/21/21 9:56 PM, Warner Losh wrote:
> >           /* no page was there, so we allocate one */
> >           void *p = mmap(host_start, qemu_host_page_size, prot,
> > -                       flags | MAP_ANON, -1, 0);
> > +                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
>
> I don't understand this change, given that the actual fd passed is always
> -1.
>

That's a very good question. I'll have to trace down why that was made
because
I'm having trouble with it as well now that I'm trying to defend it.

Warner


>
> r~
>

--000000000000a227bc05cce906e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 6:00 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/21/21 9:56 PM, Warner Losh wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no page was there, so we al=
locate one */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *p =3D mmap(host_start, q=
emu_host_page_size, prot,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0flags | MAP_ANON, -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0flags | ((fd !=3D -1) ? MAP_ANON : 0), -1, 0);<br>
<br>
I don&#39;t understand this change, given that the actual fd passed is alwa=
ys -1.<br></blockquote><div><br></div><div>That&#39;s a very good question.=
 I&#39;ll have to trace down why that was made because</div><div>I&#39;m ha=
ving trouble with it as well now that I&#39;m trying=C2=A0to defend it.</di=
v><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000a227bc05cce906e4--

