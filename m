Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9864E4A5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 00:24:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5xZ9-00055o-G7; Thu, 15 Dec 2022 18:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5xYy-00055X-2c
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 18:22:52 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5xYv-0004rG-MS
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 18:22:51 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z92so1434191ede.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 15:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yQp/ENNYnK8jU5Zf6KvBnFjBzyoPQFtI5r2jZrr6yHc=;
 b=T0qlGb7B7sLgEqvDt8SQBeSPX3KK3GWsZuTBDb5DKxjOR+IfNkA6NNRNt0+mTWCqH0
 ULaU9RWyaIRYR6rYrsRVaqTnCDdjvWClqJ6yAbcGHLfyN7D+48yyIJ6Oze9/uEg1b9sO
 oFzQQ2NUmjsd0u5eSTqGuCZK+6a7i3V+5MAjcXkaeF27HLS7ibk4puE6BUPXEt8XyYWE
 hJdMLeIEj21xmOhPm+TT1HneieYK0CnMVWijFyDhBKgTcA64YPTlZt9tNoeUvHgTUdxJ
 LOOavl26DuD3nIYC9BV/C+12Q7zMxx3cYP7iE7mj6bxuciCT6A5aS9lv2oW3nSFwa9j8
 dONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yQp/ENNYnK8jU5Zf6KvBnFjBzyoPQFtI5r2jZrr6yHc=;
 b=pMtR/2RSUN/jl0qIOGIC/OsNfsFLznIpxjeT25Dqq2flcCncb5EFPR+h4yrKnIYg/X
 57kQeuCnWN2lTiaBAMJvXBsNCiPPdiA6RWTAfuUWsfBwIeeb1Y1GujvwzAzKh2hyRL6v
 jp3v+xdrrRdKY3SNhlgV/8R8ZIKZEZmE41PR2uogeRMai6XPgCmyWdsO/FM4+tH2z0Pg
 g+i0z2fW2kyR3p2U44ejHUEH3m3V9ZIoG+r9wTysdMrY73lnt/7gi1mA9fOYDid27GKi
 8fUh+oTsHxJiQy+LONc9VDt4gTp0GBekpHdkt7N/9A/FiURiOoabDB6K6ZPfWtAXH/UH
 uX1g==
X-Gm-Message-State: ANoB5pkYpkpmqqOhPdYC2qa5LelgIQJ9Hmyl0F/zuf+zkeCMKyC7i6+x
 DpEXLIjfRMgRL+gIwbnK/02KNM+7rS5UoyAqLLJCnQ==
X-Google-Smtp-Source: AA0mqf43lRhzlavy6sMfTkaCdUgqBJRArLVYb21l8Vs9isisNSTBLFctYwxxiDO2opai8I3y5g5+Cm03R1eI2NibkD4=
X-Received: by 2002:aa7:c398:0:b0:46f:a70d:fef7 with SMTP id
 k24-20020aa7c398000000b0046fa70dfef7mr2237442edq.265.1671146567611; Thu, 15
 Dec 2022 15:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20221004195241.46491-1-richard.henderson@linaro.org>
 <20221004195241.46491-20-richard.henderson@linaro.org>
 <752b9f2a-0276-2685-8e28-821aaf626437@msgid.tls.msk.ru>
In-Reply-To: <752b9f2a-0276-2685-8e28-821aaf626437@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Thu, 15 Dec 2022 15:22:36 -0800
Message-ID: <CAFXwXrm1-1gSmTWQgzv5gMfk4rz8Hpm4qPu+2nAbSGrnB+5Ptg@mail.gmail.com>
Subject: Re: [PULL 19/20] tcg/ppc: Optimize 26-bit jumps
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Content-Type: multipart/alternative; boundary="00000000000087d1e905efe6210e"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000087d1e905efe6210e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's also has a race condition.
Please see

https://lore.kernel.org/qemu-devel/20221206041715.314209-18-richard.henders=
on@linaro.org/


r~

On Thu, 15 Dec 2022, 13:33 Michael Tokarev, <mjt@tls.msk.ru> wrote:

> 04.10.2022 22:52, Richard Henderson wrote:
> > From: Leandro Lupori <leandro.lupori@eldorado.org.br>
> >
> > PowerPC64 processors handle direct branches better than indirect
> > ones, resulting in less stalled cycles and branch misses.
> >
> > However, PPC's tb_target_set_jmp_target() was only using direct
> > branches for 16-bit jumps, while PowerPC64's unconditional branch
> > instructions are able to handle displacements of up to 26 bits.
> > To take advantage of this, now jumps whose displacements fit in
> > between 17 and 26 bits are also converted to direct branches.
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> > [rth: Expanded some commentary.]
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   tcg/ppc/tcg-target.c.inc | 119 +++++++++++++++++++++++++++++---------=
-
> >   1 file changed, 88 insertions(+), 31 deletions(-)
> >
> > diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> > index 1cbd047ab3..e3dba47697 100644
> > --- a/tcg/ppc/tcg-target.c.inc
> > +++ b/tcg/ppc/tcg-target.c.inc
> ...
>
> > +    /*
> > +     * There's no convenient way to get the compiler to allocate a pai=
r
> > +     * of registers at an even index, so copy into r6/r7 and clobber.
> > +     */
> > +    asm("mr  %%r6, %1\n\t"
> > +        "mr  %%r7, %2\n\t"
> > +        "stq %%r6, %0"
> > +        : "=3DQ"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6", "r7")=
;
>
> This is the only place in qemu where __int128 is used (other places name
> it __int128_t), and is used *unconditionally*.  Is it right?
>
> In particular, this breaks compilation on powerpc:
>
> cc -m32 -Ilibqemu-aarch64-softmmu.fa.p... -c ../../tcg/tcg.c
> In file included from ../../tcg/tcg.c:432:
> /<<PKGBUILDDIR>>/tcg/ppc/tcg-target.c.inc: In function =E2=80=98ppc64_rep=
lace4=E2=80=99:
> /<<PKGBUILDDIR>>/tcg/ppc/tcg-target.c.inc:1885:18: error: expected
> expression before =E2=80=98__int128=E2=80=99
>   1885 |         : "=3DQ"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6",
> "r7");
>        |                  ^~~~~~~~
> /<<PKGBUILDDIR>>/tcg/ppc/tcg-target.c.inc:1885:29: error: expected =E2=80=
=98)=E2=80=99
> before =E2=80=98rw=E2=80=99
>   1885 |         : "=3DQ"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6",
> "r7");
>        |               ~             ^~
>
> Thanks,
>
> /mjt
>

--00000000000087d1e905efe6210e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It&#39;s also has a race condition.<div dir=3D"auto">Plea=
se see=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"=
https://lore.kernel.org/qemu-devel/20221206041715.314209-18-richard.henders=
on@linaro.org/">https://lore.kernel.org/qemu-devel/20221206041715.314209-18=
-richard.henderson@linaro.org/</a><br><br><br><div data-smartmail=3D"gmail_=
signature" dir=3D"auto">r~</div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 15 Dec 2022, 13:33 Michael To=
karev, &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">04.10.2022 22:52, Richard Henderson=
 wrote:<br>
&gt; From: Leandro Lupori &lt;<a href=3D"mailto:leandro.lupori@eldorado.org=
.br" target=3D"_blank" rel=3D"noreferrer">leandro.lupori@eldorado.org.br</a=
>&gt;<br>
&gt; <br>
&gt; PowerPC64 processors handle direct branches better than indirect<br>
&gt; ones, resulting in less stalled cycles and branch misses.<br>
&gt; <br>
&gt; However, PPC&#39;s tb_target_set_jmp_target() was only using direct<br=
>
&gt; branches for 16-bit jumps, while PowerPC64&#39;s unconditional branch<=
br>
&gt; instructions are able to handle displacements of up to 26 bits.<br>
&gt; To take advantage of this, now jumps whose displacements fit in<br>
&gt; between 17 and 26 bits are also converted to direct branches.<br>
&gt; <br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.=
org</a>&gt;<br>
&gt; Signed-off-by: Leandro Lupori &lt;<a href=3D"mailto:leandro.lupori@eld=
orado.org.br" target=3D"_blank" rel=3D"noreferrer">leandro.lupori@eldorado.=
org.br</a>&gt;<br>
&gt; [rth: Expanded some commentary.]<br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linar=
o.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tcg/ppc/tcg-target.c.inc | 119 +++++++++++++++++++++++++++=
++----------<br>
&gt;=C2=A0 =C2=A01 file changed, 88 insertions(+), 31 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc<br>
&gt; index 1cbd047ab3..e3dba47697 100644<br>
&gt; --- a/tcg/ppc/tcg-target.c.inc<br>
&gt; +++ b/tcg/ppc/tcg-target.c.inc<br>
...<br>
<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* There&#39;s no convenient way to get the compil=
er to allocate a pair<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* of registers at an even index, so copy into r6/=
r7 and clobber.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 asm(&quot;mr=C2=A0 %%r6, %1\n\t&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mr=C2=A0 %%r7, %2\n\t&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stq %%r6, %0&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;=3DQ&quot;(*(__int128 *)rw) : &qu=
ot;r&quot;(p[0]), &quot;r&quot;(p[1]) : &quot;r6&quot;, &quot;r7&quot;);<br=
>
<br>
This is the only place in qemu where __int128 is used (other places name<br=
>
it __int128_t), and is used *unconditionally*.=C2=A0 Is it right?<br>
<br>
In particular, this breaks compilation on powerpc:<br>
<br>
cc -m32 -Ilibqemu-aarch64-softmmu.fa.p... -c ../../tcg/tcg.c<br>
In file included from ../../tcg/tcg.c:432:<br>
/&lt;&lt;PKGBUILDDIR&gt;&gt;/tcg/ppc/tcg-target.c.inc: In function =E2=80=
=98ppc64_replace4=E2=80=99:<br>
/&lt;&lt;PKGBUILDDIR&gt;&gt;/tcg/ppc/tcg-target.c.inc:1885:18: error: expec=
ted expression before =E2=80=98__int128=E2=80=99<br>
=C2=A0 1885 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3DQ&quot;(*(__int12=
8 *)rw) : &quot;r&quot;(p[0]), &quot;r&quot;(p[1]) : &quot;r6&quot;, &quot;=
r7&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
/&lt;&lt;PKGBUILDDIR&gt;&gt;/tcg/ppc/tcg-target.c.inc:1885:29: error: expec=
ted =E2=80=98)=E2=80=99 before =E2=80=98rw=E2=80=99<br>
=C2=A0 1885 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;=3DQ&quot;(*(__int12=
8 *)rw) : &quot;r&quot;(p[0]), &quot;r&quot;(p[1]) : &quot;r6&quot;, &quot;=
r7&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
<br>
Thanks,<br>
<br>
/mjt<br>
</blockquote></div>

--00000000000087d1e905efe6210e--

