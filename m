Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A8418D44
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:19:08 +0200 (CEST)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUeMN-0000GM-6o
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUeLN-00081r-S4
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:18:05 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:45037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUeLL-0006r5-PQ
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:18:05 -0400
Received: by mail-vs1-xe30.google.com with SMTP id 66so12251576vsd.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HhwU0jN03K2V2xzLKPxEZc65uKiEvDsq2GkiGrtG7tg=;
 b=oPFSaSMvcIdmhkTLNUoy2uobARwgSm8VQeh/KXF03L3V6J+qsHLcSqsCe8/2gEJrD3
 k0mRk60z818dHapdzkRWazhLr5lHFNh+lJW++sn55uO8X1oJYoCPaZMfa8BF8T5EACPb
 fBdmwmnso8jq5dUuV9g83OG6LErkAS3ebTHCkok2+t2Y879LgVWn0Pkd/j/ExF8vXf2c
 YFQlK+W9pPmf4PYUEa7wNVPofn/9SUifCuIVxPFe31qt8PYPjLSrmV0y498nfgqH3s6K
 GM95OhRAW9a4MjRh9ZphO6ZwPAUNnDc/ti3LBhluAP71yNABRJXSw0VoZ4AtPdxnq3UQ
 xxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HhwU0jN03K2V2xzLKPxEZc65uKiEvDsq2GkiGrtG7tg=;
 b=NthRKJYXBjA/Riyb3HJFvfqwAh0b2VsC5+2oMGHUdMxTl+k7+du6BguSrekCDygrIR
 QvUnMM+Ol52seEGnBk2r5VamsNqSz6ryXzaF9aO2e/lYeWUOmQ46g6A136msnwk+LG91
 57NazeVjNZy+eX4EfCt4drI0sISdrltjHAr0vMkqUq8tsatEhX0iLVD3YYVDLfiHhb4g
 yzUfjcSwAbbXCIHwxVxgZVa7UVwMK0gJ9Ia4aCgDJu0yLVqpqJyk2tLkl5Uo86oJ+dRD
 ycOkBmA+xeMIXM4THGoRV0XfzPvnDf4KTnj8wo52+9mBCMd4SBu1fP4DjeHt8g5ye1Ip
 eihg==
X-Gm-Message-State: AOAM530rb4VVfba84r0hSTXuG6oGcG4WW5FiN0xvXM8Tw5SQprLqpzYS
 CT3h/18GtwRqzml29T6hSvYrppyQKhtYSEkkQs2A3A==
X-Google-Smtp-Source: ABdhPJzeyfWUkRU6rESlvisiDstP2AavdxDzQ4IJfyxkYAtVts0GnmOTIfb3+C4CyBihnZWBt3+bvsf+3RTXtq+9ht0=
X-Received: by 2002:a05:6102:3648:: with SMTP id
 s8mr375927vsu.42.1632701881488; 
 Sun, 26 Sep 2021 17:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-8-imp@bsdimp.com>
 <e66d76d0-a463-5a01-e508-bb592c9cce97@linaro.org>
 <CANCZdfrXJD6X+AiWLYYzQB-mB3uW34r+xe970uMmZz79xA-GqQ@mail.gmail.com>
 <b5d1b686-a6ce-63b0-8655-4918f70efdf6@gmail.com>
In-Reply-To: <b5d1b686-a6ce-63b0-8655-4918f70efdf6@gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 18:17:50 -0600
Message-ID: <CANCZdfp_9V9+yNLFiNdPF=Na+pwfhFcqbBk1jAJHz5Woa0fNHw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Guy Yur <guyyur@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000abaa0f05ccef073e"
Received-SPF: none client-ip=2607:f8b0:4864:20::e30;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe30.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000abaa0f05ccef073e
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 26, 2021 at 1:07 PM Guy Yur <guyyur@gmail.com> wrote:

> On 26/9/21 20:08, Warner Losh wrote:
> >
> >
> > On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >
> >     On 9/21/21 9:56 PM, Warner Losh wrote:
> >     >           /* no page was there, so we allocate one */
> >     >           void *p = mmap(host_start, qemu_host_page_size, prot,
> >     > -                       flags | MAP_ANON, -1, 0);
> >     > +                       flags | ((fd != -1) ? MAP_ANON : 0), -1,
> 0);
> >
> >     I don't understand this change, given that the actual fd passed is
> >     always -1.
> >
> >
> > That's a very good question. I'll have to trace down why that was made
> > because
> > I'm having trouble with it as well now that I'm trying to defend it.
> >
> mmap_frag can be called with a valid fd, if flags doesn't contain one of
> MAP_ANON, MAP_STACK, MAP_GUARD.
> The passed fd to mmap is -1 but if flags contains MAP_GUARD then
> MAP_ANON cannot be added.
>
> * If fd is valid (not -1) we want to map the pages with MAP_ANON.
> * If flags contains MAP_GUARD we don't want to add MAP_ANON because it
> will be rejected.
> https://github.com/freebsd/freebsd-src/blob/master/sys/vm/vm_mmap.c#L302
> * If flags contains MAP_ANON it doesn't matter if we add it or not.
> * If flags contains MAP_STACK, mmap adds MAP_ANON when called so doesn't
> matter if we add it or not either.
> https://github.com/freebsd/freebsd-src/blob/master/sys/vm/vm_mmap.c#L284
>
> The intention was to not pass MAP_ANON for the flags that use fd == -1
> without specifying the flags directly,
> with the assumption that future flags that don't require fd will also
> not require MAP_ANON.
> Changing to !(flags & MAP_GUARD) will also work.
>

Thanks Guy. that fills in the missing pieces for me of the range of
possibilities
for calling. I've added it as a comment since it's tricky enough I've had
to ask
twice and Richard asked as well :). It will be in the next spin of the mmap
series.


> Guy Yur
>
> > Warner
> >
> >
> >     r~
> >
>

--000000000000abaa0f05ccef073e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 26, 2021 at 1:07 PM Guy Y=
ur &lt;<a href=3D"mailto:guyyur@gmail.com">guyyur@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 26/9/21 20:08=
, Warner Losh wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <br>
&gt; &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">=
richard.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 9/21/21 9:56 PM, Warner Losh wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no =
page was there, so we allocate one */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *=
p =3D mmap(host_start, qemu_host_page_size, prot,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | MAP_ANON, -1, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | ((fd !=3D -1) ? MAP_ANON : 0)=
, -1, 0);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t understand this change, given that the =
actual fd passed is<br>
&gt;=C2=A0 =C2=A0 =C2=A0always -1.<br>
&gt;<br>
&gt;<br>
&gt; That&#39;s a very good question. I&#39;ll have to trace down why that =
was made <br>
&gt; because<br>
&gt; I&#39;m having trouble with it as well now that I&#39;m trying=C2=A0to=
 defend it.<br>
&gt;<br>
mmap_frag can be called with a valid fd, if flags doesn&#39;t contain one o=
f <br>
MAP_ANON, MAP_STACK, MAP_GUARD.<br>
The passed fd to mmap is -1 but if flags contains MAP_GUARD then <br>
MAP_ANON cannot be added.<br>
<br>
* If fd is valid (not -1) we want to map the pages with MAP_ANON.<br>
* If flags contains MAP_GUARD we don&#39;t want to add MAP_ANON because it =
<br>
will be rejected.<br>
<a href=3D"https://github.com/freebsd/freebsd-src/blob/master/sys/vm/vm_mma=
p.c#L302" rel=3D"noreferrer" target=3D"_blank">https://github.com/freebsd/f=
reebsd-src/blob/master/sys/vm/vm_mmap.c#L302</a><br>
* If flags contains MAP_ANON it doesn&#39;t matter if we add it or not.<br>
* If flags contains MAP_STACK, mmap adds MAP_ANON when called so doesn&#39;=
t <br>
matter if we add it or not either.<br>
<a href=3D"https://github.com/freebsd/freebsd-src/blob/master/sys/vm/vm_mma=
p.c#L284" rel=3D"noreferrer" target=3D"_blank">https://github.com/freebsd/f=
reebsd-src/blob/master/sys/vm/vm_mmap.c#L284</a><br>
<br>
The intention was to not pass MAP_ANON for the flags that use fd =3D=3D -1 =
<br>
without specifying the flags directly,<br>
with the assumption that future flags that don&#39;t require fd will also <=
br>
not require MAP_ANON.<br>
Changing to !(flags &amp; MAP_GUARD) will also work.<br></blockquote><div><=
br></div><div>Thanks Guy. that fills in the missing pieces for me of the ra=
nge of possibilities</div><div>for calling. I&#39;ve added it as a comment =
since it&#39;s tricky enough I&#39;ve had to ask</div><div>twice and Richar=
d asked as well :). It will be in the next spin of the mmap series.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Guy Yur<br>
<br>
&gt; Warner<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0r~<br>
&gt;<br>
</blockquote></div></div>

--000000000000abaa0f05ccef073e--

