Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892374448D0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 20:15:49 +0100 (CET)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miLjg-00056O-5P
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 15:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miLiM-0004F8-IV
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:14:26 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1miLiK-0004ZE-3K
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:14:26 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id bc10so1834917vkb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7hHpcXnXbnO/Smq2EF0kBP5czLB9Onl/pbFZJwtZ3Ec=;
 b=rSTgjogqkfSIo6KE2ap9b9hjad8/oV1GXxP1s2d4YWT3rV6H9Yaat3VDypkP1JZre0
 yMM4r63jVpNAS6bHGtOpseUnJeClf8Qm51vY3tl06OZ1UzwrkBXLML4hmjgitBZ392Pr
 vHP+SgzFFB1NA956m+bjKWX0JsOR+nES5CBxxeE3ESqG+SeNANrvCRvEugxabic0t0fw
 z4FlpyFVM4D0Z3tOzJrWd0V+7WZ5D5DesZ8mZeF6ibAY9TQdfPAxZn7mnBBe5q9OABs5
 z5rt2cZNBVrn8Ezb7alfyDSnsxDTM2IQarOMgqqHXYt8Ny/yyuMHvpz8Hh06Bpluxt0S
 WCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7hHpcXnXbnO/Smq2EF0kBP5czLB9Onl/pbFZJwtZ3Ec=;
 b=iz/SK+UgMLisoCBcM9Fmv9jfb50QyyRWGy+qoXJg3Ix62dhE7wFIPSDOpqSvtO2Imv
 84+dojDTw4ZBi+/KUvFcqDDdOxDpIXMe2DMHcVEmUFO4uZdGytvy0ozqWS19lN0zeNrq
 oFPlC3HlSUVtq8t3dWcegqoXqzAqFSFA8PO0VZ3mR2pgcoR30ncBnQY7ps0icowDdcnc
 iA7jrsLUBy+a3Bkm1OSdl9SAuzxCWlCl6koXvX6ENT34LNq4hiS1TdeBN84F3IwAjaP3
 cHuUmcH8jJASCP/LPUdRLkeXdRrV3eIsyzGbmG2kfF4dOAq0bR96h6aOy3hQ+6/LovR5
 yF8Q==
X-Gm-Message-State: AOAM531Re5LBqPY9/NfrfWL74Vl6jGlAmbA2LBo23BbAPYHz9drC43US
 VuPY/4/LAUqZZdNjAwOu2AmLQg2PPrOdbDHNvZ372Q==
X-Google-Smtp-Source: ABdhPJz7mAbpNEknN8lHMh0hBtbIEprB1mlcvNK6GZliBjg6/82vlsuveqy3Btv409Rzat3Bqr+C1urewI8EdzgYR5o=
X-Received: by 2002:a05:6122:134f:: with SMTP id
 f15mr18256169vkp.22.1635966862538; 
 Wed, 03 Nov 2021 12:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-23-imp@bsdimp.com>
 <27eae3b8-156b-540b-e88b-0d8c3097ee7e@linaro.org>
In-Reply-To: <27eae3b8-156b-540b-e88b-0d8c3097ee7e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 3 Nov 2021 13:14:11 -0600
Message-ID: <CANCZdfqyK4y2-wqL6rm8LKEa8L0im=hNTqU3W9vG4j-DDokGqw@mail.gmail.com>
Subject: Re: [PATCH v2 22/30] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b4ca1d05cfe7371c"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b4ca1d05cfe7371c
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 9:37 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/2/21 6:52 PM, Warner Losh wrote:
> > +    /*
> > +     * Low bit indicates whether or not we're entering thumb mode.
> > +     */
> > +    cpsr = cpsr_read(env);
> > +    if (ka->_sa_handler & 1) {
> > +        cpsr |= CPSR_T;
> > +    } else {
> > +        cpsr &= ~CPSR_T;
> > +    }
> > +    cpsr_write(env, cpsr, CPSR_T, CPSRWriteByInstr);
>
> Like I said before, you don't need the cpsr_read, because the mask ensures
> that only
> CPSR_T will change:
>
>    cpsr_write(env, (ka->_sa_handler & 1) * CPSR_T, CPSR_T,
> CPSRWriteByInstr);
>
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks. Applied. I'd intended to do this for this round, but it slipped my
mind.

Warner

--000000000000b4ca1d05cfe7371c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 9:37 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/2/21 6:52 PM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Low bit indicates whether or not we&#39;re ente=
ring thumb mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 cpsr =3D cpsr_read(env);<br>
&gt; +=C2=A0 =C2=A0 if (ka-&gt;_sa_handler &amp; 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpsr |=3D CPSR_T;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpsr &amp;=3D ~CPSR_T;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 cpsr_write(env, cpsr, CPSR_T, CPSRWriteByInstr);<br>
<br>
Like I said before, you don&#39;t need the cpsr_read, because the mask ensu=
res that only <br>
CPSR_T will change:<br>
<br>
=C2=A0 =C2=A0cpsr_write(env, (ka-&gt;_sa_handler &amp; 1) * CPSR_T, CPSR_T,=
 CPSRWriteByInstr);<br>
<br>
<br>
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Thanks. Applied. I&#39;d intended to do this for th=
is round, but it slipped my mind.</div><div><br></div><div>Warner</div></di=
v></div>

--000000000000b4ca1d05cfe7371c--

