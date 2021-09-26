Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F7418A3E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 18:48:22 +0200 (CEST)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXK9-0001l5-8t
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 12:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXIt-00015Q-JE
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 12:47:03 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUXIr-0008Bj-He
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 12:47:03 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id z62so15510628vsz.9
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lQr0vRNWyqniKPOtLBbx49E7ec+8RAOjsJqaw2+Br6o=;
 b=svHG9ccy7Ztu1hLySfEyBPR4buPDpVorBkoa8SXHgIvV6fRFlRR6nnF1JT7kCsqGGg
 onmxnbUWC81BYqrkLZz4dDvun/B8H2xtiMjGfFpYSO5R9eqHVUJiPe3ZFDW2NgzK+t9g
 6P96evd+3sOv30u2V9Ijlr4PUSenXz7CtRJQ2n7QDD6PMPXEFzcz+9iGH4J1YMJ0Uj2U
 1/hmKGb4RqAdWDDW8K5JbEg48/qV7uPwsFP612XFdRIK0DXMwm5XR1GzUiuGJSb5KTYY
 htvyebL1EX5a8zUy8wh1Od+eHOvybripitFsuXZBo1yKM0dvLAbW9diJBS0Nehy6x4ce
 pdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lQr0vRNWyqniKPOtLBbx49E7ec+8RAOjsJqaw2+Br6o=;
 b=BzI0rnzhMDxyqNqjTgTxLhZqH2WUXKbPNFHPowbx3MreDBrXzxVLznh6aYznhzp62y
 oPIXB7Mh92222YiHoobCpXSPqnTZ8vu+Q9Eq4KVuI0sovm6Lgn2xl6F0VpOKRBU/T8Wv
 5BI7NFE9WYDioUNKQgV5bi1gDOFYF9VOTBEL4AWzM5M8YKg4mDl0CLdeAuu+4aNOXAat
 kcmdU0I0YTugjaVJOnHiCtkL70JnfjnH19s55pGXlhyx/s6hp+t0CCsyG7qlxBhsBFU1
 eB5BWSOkwipUafSsVoXLy92WnpHm4Al6dUXtVWZyqJ0N+u95OrxgVvlf1dyiXxl0gtV9
 yAkg==
X-Gm-Message-State: AOAM533zXfufcfT2+Y4y8i8cTZ8p2KQFQjGfu7rqRl99pw9XQsF/NiFR
 InpWks6P8NHPmH/kj/CvgDgkkQsItNBIgKBhjpiLxA==
X-Google-Smtp-Source: ABdhPJwCSXAC/ytWrD7fapqVTFTKomS59B+P9PG2BmsXtslDj4Lphg6jhYimIT/rjc40vmxS81LC64ipxfpNOrvua58=
X-Received: by 2002:a67:d589:: with SMTP id m9mr16842279vsj.30.1632674820137; 
 Sun, 26 Sep 2021 09:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-7-imp@bsdimp.com>
 <4f652fbf-89ab-fa90-ad1d-1c612f166444@linaro.org>
In-Reply-To: <4f652fbf-89ab-fa90-ad1d-1c612f166444@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 10:46:49 -0600
Message-ID: <CANCZdfqiyqvnW-BsWfL1-XZCaEtLVzx_O=nz-P_ssKeOuG8FqQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] bsd-user/mmap.c: line wrap change
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b039de05cce8ba63"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2a.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b039de05cce8ba63
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 5:59 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/21/21 9:56 PM, Warner Losh wrote:
> > Keep the shifted expression on one line. It's the same number of lines
> > and easier to read like this.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/mmap.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> > index bafbdacd31..8b763fffc3 100644
> > --- a/bsd-user/mmap.c
> > +++ b/bsd-user/mmap.c
> > @@ -399,8 +399,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
> int prot,
> >                  prot & PROT_WRITE ? 'w' : '-',
> >                  prot & PROT_EXEC ? 'x' : '-');
> >           if (flags & MAP_ALIGNMENT_MASK) {
> > -            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
> > -                    >> MAP_ALIGNMENT_SHIFT);
> > +            printf("MAP_ALIGNED(%u) ",
> > +                   (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
> >           }
> >           if (flags & MAP_GUARD) {
> >               printf("MAP_GUARD ");
> >
>
> I suppose.
>
> If you're touching these lines at all it might be better to convert them
> all to qemu_log,
> protected by CPU_LOG_PAGE.  Then you can drop the ifdefs as well.
>

I'll drop this patch and add one that does that. I was resistant to doing
that, so I
thought I'd give it a few days to mull over. I bit the bullet and saw how
trivial it
really is, so there's nothing really to mull :).

Warner

--000000000000b039de05cce8ba63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 5:59 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 9/21/21 9:56 PM, Warner Losh wrote:<br>
&gt; Keep the shifted expression on one line. It&#39;s the same number of l=
ines<br>
&gt; and easier to read like this.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/mmap.c | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c<br>
&gt; index bafbdacd31..8b763fffc3 100644<br>
&gt; --- a/bsd-user/mmap.c<br>
&gt; +++ b/bsd-user/mmap.c<br>
&gt; @@ -399,8 +399,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong le=
n, int prot,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot &am=
p; PROT_WRITE ? &#39;w&#39; : &#39;-&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot &am=
p; PROT_EXEC ? &#39;x&#39; : &#39;-&#39;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; MAP_ALIGNMENT_=
MASK) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;MAP_ALIGNED(%u=
) &quot;, (flags &amp; MAP_ALIGNMENT_MASK)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &gt;&gt; MAP_ALIGNMENT_SHIFT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;MAP_ALIGNED(%u=
) &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(flags &amp; MAP_ALIGNMENT_MASK) &gt;&gt; MAP_ALIGNMENT_SHIFT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; MAP_GUARD) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;MAP=
_GUARD &quot;);<br>
&gt; <br>
<br>
I suppose.<br>
<br>
If you&#39;re touching these lines at all it might be better to convert the=
m all to qemu_log, <br>
protected by CPU_LOG_PAGE.=C2=A0 Then you can drop the ifdefs as well.<br><=
/blockquote><div><br></div><div>I&#39;ll drop this patch and add one that d=
oes that. I was resistant to doing that, so I</div><div>thought I&#39;d giv=
e it a few days to mull over. I bit the bullet and saw how trivial it</div>=
<div>really is, so there&#39;s nothing really to mull :).</div><div><br></d=
iv><div>Warner</div></div></div>

--000000000000b039de05cce8ba63--

