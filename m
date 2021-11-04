Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF654445B61
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 21:58:18 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mijoQ-0001zY-0G
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 16:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mijmn-0000cN-Sx
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:56:37 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mijml-0002kD-UK
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:56:37 -0400
Received: by mail-ua1-x92d.google.com with SMTP id b17so13515164uas.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rOaGt4SYBEDUG5BCrAb4T9+k2UA00TPCvwBhAoJrGM=;
 b=bgl/txwUCIp1OeIBlEZJx2AIHtjwL9bLYQuAgBy+t5k0aCsIRqUWdZvPmvUzI1ZZYA
 4t4nR8mZIqs/3AMWMiajxZKt90MreSzVwvANq/l91353/HtFqX3qL4rK5Akm0Vm7O+5o
 pHwb5V9kVJH41BP6H7MhZ9GribYF9RtTMBVFgWFlOiUYZvW+8bIjTGk5zKJ4ixcHhYe8
 x+EOZSYHvql8t4WtmxhVvrFInCANszE04xLXoadgDOYZjKhae4i7fZJCu7jRbWjZtIuu
 e/mP4uPLuUoxadWtT/5XHsRTFzDKaFssmW1zEnVu3fAW2ZFOZiObeNzQAVL5XPyfme6L
 lGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rOaGt4SYBEDUG5BCrAb4T9+k2UA00TPCvwBhAoJrGM=;
 b=cLp2ieEJxVIwJL66Jyh4gXrY0sTrwh6V3/LOAoKyo1T2WUybWT1jAjv3+3hdgGvqcf
 X/fQUBqGtEsKEL+LskQigwAKbk/e6b+bDWYlzI4eiUpbyCrbub93S3Bdohok7wt/2YL1
 7Y/OQzENs/ITkS4LCfgItO7vtsclD1iIIf7ToPyewZllPP1rXluWAnuA/zy/Bo63VUzu
 5OZ96iZZX9sVYUzWUdhvOSo+CfEqyPJosIdP9x0u/l+N4fn0Pa+DPUhnd4Av7ktDSVU2
 WpV5uo3tXCbdV4y3eMe5cDti52ZtZVTuIDxYRA+sXiidmwmi3VEZw0jPxzRrx1jxcnnY
 5LMA==
X-Gm-Message-State: AOAM531nsNt5mI+p/o+bisTTgKzfkToxLHMZbk7Q72qXBcQwOEZhNNs7
 hafpz+TvPYVfqpehtUdxvGtQ1bH/bMm4awI67RzfNg==
X-Google-Smtp-Source: ABdhPJxvVBdK/t95VKWN5cwgv3xEPE1t1xMMH92fr++zJBZdxOtwg5rRGC+Lwu77tU+PcDRwDOZKebuwFT0flVzPz0Q=
X-Received: by 2002:a05:6102:10c7:: with SMTP id
 t7mr50573177vsr.44.1636059394645; 
 Thu, 04 Nov 2021 13:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-20-imp@bsdimp.com>
 <1262504d-1ce4-4720-31e4-e373d74e2b39@linaro.org>
 <CANCZdfpo_VwtWGrKVM1x=qZrBOMnWy-w6A6PfdswUE0yJH-EcQ@mail.gmail.com>
In-Reply-To: <CANCZdfpo_VwtWGrKVM1x=qZrBOMnWy-w6A6PfdswUE0yJH-EcQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 4 Nov 2021 14:56:23 -0600
Message-ID: <CANCZdfozm_gxB0exs6u7QGxgPGcaymxhAhOaXqPP8u1URUtLhA@mail.gmail.com>
Subject: Re: [PATCH v3 19/29] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000cb3f005cffcc341"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000cb3f005cffcc341
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 11:58 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Thu, Nov 4, 2021 at 11:49 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 11/4/21 10:05 AM, Warner Losh wrote:
>> > +typedef struct target_mcontext {
>> > +    uint32_t    __gregs[32];
>>
>> sys/arm/include/ucontext.h has
>>
>> #define _NGREG          17
>> typedef __greg_t        __gregset_t[_NGREG];
>>
>> With s/32/17/ here,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>
> Will do.
>
> And I'm going to add compile time asserts for the size of mcontext and
> ucontext in a future
> patch series. It won't test for layout, but will keep things like this
> from happening again by accident.
>

So I added a G_STATIC_ASSERT and found I used a host's pointer instead of
the target's pointer for the vfp stuff.
Easy enough to  fix... But it means using functions that aren't yet defined
when this is included, which means I'll
have to restructure things... shuffling the includes is likely out of the
question, so I'll have to create an arch/signal.c
to hold the now-inlined functions.

All because I wanted to catch errors like this before I made them again in
public... :)  So thanks for inspiring me
to do something that detected the error, but a good natured harumph at the
work I have to do now...

Warner

--0000000000000cb3f005cffcc341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 4, 2021 at 11:58 AM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Nov 4, 2021 at 11:49 AM Richard Henderson &lt=
;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 11/4/21 10:05 AM, Warner Losh wrote:<br>
&gt; +typedef struct target_mcontext {<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __gregs[32];<br>
<br>
sys/arm/include/ucontext.h has<br>
<br>
#define _NGREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 17<br>
typedef __greg_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 __gregset_t[_NGREG];<br>
<br>
With s/32/17/ here,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Will do.</div><div><br></div><div>And I&#39;m going=
 to add compile time asserts for the size of mcontext and ucontext in a fut=
ure</div><div>patch series. It won&#39;t test for layout, but will keep thi=
ngs like this from happening again by accident.</div></div></div></blockquo=
te><div><br></div><div>So I added a G_STATIC_ASSERT and found I used a host=
&#39;s pointer instead of the target&#39;s pointer for the vfp stuff.</div>=
<div>Easy enough to=C2=A0 fix... But it means using functions that aren&#39=
;t yet defined when this is included, which means I&#39;ll</div><div>have t=
o restructure things... shuffling the includes is likely out of the questio=
n, so I&#39;ll have to create an arch/signal.c</div><div>to hold the now-in=
lined functions.</div><div><br></div><div>All because I wanted to catch err=
ors like this before I made them again in public... :)=C2=A0 So thanks for =
inspiring me</div><div>to do something that detected the error, but a good =
natured harumph at the work I have to do now...</div><div><br></div><div>Wa=
rner</div><div><br></div><div><br></div><div><br></div></div></div>

--0000000000000cb3f005cffcc341--

