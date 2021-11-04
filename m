Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C107445927
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:59:19 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mih1C-00049r-6l
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mih0I-0003Eq-2U
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:58:22 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mih0G-00027O-6t
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:58:21 -0400
Received: by mail-ua1-x92f.google.com with SMTP id i6so12417425uae.6
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RJgS0i0nITxMk13nWJS39NdX3wZPjD2Hgy6vob0SZ1Y=;
 b=XYU3fl9EAG6UIaCeVkySLKasRbJtjN2WaEvRlD3sZ4b1GSnjmVioCecrNpHBz4jCs0
 bsjoch5x6IF3fXL6ALztky+PjyrCSE3WYXGbJfMfUhUVLiibjLT5GEVE/173U1FN5RiZ
 +Dl/qK1wZMpmzrSOTMdWod/jqVdEUqDXoLfpjJEVerY4apRjRCbSTvRaZssGZWc8fvFT
 QbtMUohu61NC8EXuvbdH1x7+LHx+n6HabotH5tNkvfV6xmiTxmCZ6XzqCOE6yBBKnBhT
 ma7+/eTB1w5BRb+yqEJNxk9NW+Q/Uu8Ep2LrZi0PSjKHjlatZj8W+PkaG4Pk3/vVnuwv
 lGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RJgS0i0nITxMk13nWJS39NdX3wZPjD2Hgy6vob0SZ1Y=;
 b=HGlael3VXA2bvamln78GY6tFKTd+pWYN5Tdekh4dFeKKs3DMBQaujn4hNR5AyLyUIm
 6eQ1fiMjO9YfrkoyzK8eHkuPbW9QDnHuARiddvZABBO2w06u/8O7jz+8BC0LM6lxt3xI
 nWV+GfsY+jgUszThhq78kKb6vtPQJT3pfjKwA9+2Jv+ySdDwY7vSuXGfMoS4UXpFyobx
 zj5P5uI4q5qr/MRqZwRpI/wm0RZESyKZvAUTQc4LuUpfMPqGR035iq5vkNj8dtE5buhx
 JhsKic0QDj6qt7+gXN3Ravs0KxY7c43HkF9imLFeGnMslc8CScpAFxglNyV158dLeiIh
 4sbg==
X-Gm-Message-State: AOAM532+0AUWBgRh6kgSU0cUtdTm3iFRx6+9pJJveCBXUBrdZS2JJZD2
 rYmdtmCa58cHqlquftKjzpPamZPChln2ytnzgxJ9Jg==
X-Google-Smtp-Source: ABdhPJxnr3QDD/pvy1AsKwe+2Xj5l8aL5zNIUWR9hfr/89N7ANvHZamWr86foe+H3Yf3n//gpWLnVozZ1TzQ2zB2OtA=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr54025450uat.85.1636048698363; 
 Thu, 04 Nov 2021 10:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-20-imp@bsdimp.com>
 <1262504d-1ce4-4720-31e4-e373d74e2b39@linaro.org>
In-Reply-To: <1262504d-1ce4-4720-31e4-e373d74e2b39@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 4 Nov 2021 11:58:07 -0600
Message-ID: <CANCZdfpo_VwtWGrKVM1x=qZrBOMnWy-w6A6PfdswUE0yJH-EcQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/29] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000080685205cffa45cf"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
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

--00000000000080685205cffa45cf
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 11:49 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/4/21 10:05 AM, Warner Losh wrote:
> > +typedef struct target_mcontext {
> > +    uint32_t    __gregs[32];
>
> sys/arm/include/ucontext.h has
>
> #define _NGREG          17
> typedef __greg_t        __gregset_t[_NGREG];
>
> With s/32/17/ here,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Will do.

And I'm going to add compile time asserts for the size of mcontext and
ucontext in a future
patch series. It won't test for layout, but will keep things like this from
happening again by accident.

Warner

--00000000000080685205cffa45cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 4, 2021 at 11:49 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/4/21 10:05 AM, Warner Losh wrote:<br>
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
ngs like this from happening again by accident.</div><div><br></div><div>Wa=
rner=C2=A0<br></div></div></div>

--00000000000080685205cffa45cf--

