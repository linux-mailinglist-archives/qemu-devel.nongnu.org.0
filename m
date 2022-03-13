Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF94D7775
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 19:32:22 +0100 (CET)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTT0v-0005eX-8M
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 14:32:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTSyv-0004nb-Q9
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 14:30:21 -0400
Received: from [2607:f8b0:4864:20::a2f] (port=38527
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTSyq-00042J-2r
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 14:30:16 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id bk1so7262384vkb.5
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ev/SWvnevqodlvcv+5jZrgyzjUBPG9wwau9d2NLkIS0=;
 b=myVGvlx81KWezht0MTx0x1e0GzQ3/0B47sdwVSZp9LPjGfKRCRb3IYQJe8x3ON055L
 NyrvRZBb0qHhGtLjE/xo/G5r3FNPzbAn1p6Oj1N3mrEfj8iBD3GKkwTL3rEP9Hw60kJo
 9nVs+g7dJ1Li+LRWNifrHnfo5R73jt95/03S1dqptln/5vPHVRXUZ6feQ1ptoViTF10e
 inUhO3AyXnkguwm3v/RbXSyBP2Km7izcsXzVdWMEYMGiTvQcRJCnwZs7GAMx/WKm5rxg
 Sq3bv1GK+GJAt23m/ZzwJ5mqpkafP8XoaY32Yy91F5QzeauWB2vu9we0yh0mLcWZ4LyS
 maKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ev/SWvnevqodlvcv+5jZrgyzjUBPG9wwau9d2NLkIS0=;
 b=BDiotQqH3nOSOhdIP3ZZWjFdu6DHamw8Q5VaAB5R4eXsqiy58Gh4cgo8G6FU2fEiAt
 rJqXv92UOIdNJQ2uSFmgDbjKu71HXMfr1mYefV2UN/zLznTCWwClOAh+qdLdu1QyMqLJ
 zAKtBUWjCpHd3o/wqVqxcUpZkyhRkCS5MJpMVBh2wTe0PTITWjoaexfoR2yDLNONxr5p
 fH+d2i6E4ejdeWewQZOvoxxeecuX6ozCuo8p9KH6UWEKIdJlQtCPus2eQoBLevWJEl66
 NCpZvOF2rpCZK/VA900HWjqlUbaSVgXv6SkHU4/1Rrl3j6Juf+x4PUupLfvAMNcVvpjF
 ckpA==
X-Gm-Message-State: AOAM530F5VG5gznIdioQzmSKbs7PLy51KoJE87gbB6wN0/50LaUdqcub
 jwSejB9N2daVn6f9j/CJG4PyfjlSMnasNyg0SyJavw==
X-Google-Smtp-Source: ABdhPJwc3nTmSKh+bJE0KuZZSOJRp4Pw2l8TUBNzr4rJCUPZgldruLrrhpihuLUnCD31M8wVbSTiJU9Yu8a2tq3pyt4=
X-Received: by 2002:a05:6122:134f:b0:337:d3c0:816e with SMTP id
 f15-20020a056122134f00b00337d3c0816emr8033123vkp.5.1647196210411; Sun, 13 Mar
 2022 11:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
 <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
In-Reply-To: <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 13 Mar 2022 12:29:59 -0600
Message-ID: <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
Subject: Re: Question about atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ff520c05da1dc046"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff520c05da1dc046
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 13, 2022 at 11:03 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/13/22 09:57, Warner Losh wrote:
> >
> >
> > On Sun, Mar 13, 2022, 10:47 AM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     On 3/12/22 20:59, Warner Losh wrote:
> >      > FreeBSD's pthread_mutex is shared between the kernel and user
> land.
> >      > So it does a compare and set to take the lock. Uncontested and
> unheld
> >      > locks will mean we've taken the lock and return. Contested locks
> >      > are kicked to the kernel to wait. When userland releases the lock
> >      > it signals the kernel to wakeup via a system call. The kernel then
> >      > does a cas to try to acquire the lock. It either returns with the
> lock
> >      > held, or goes back to sleep. This we have atomics operating both
> in
> >      > the kernel (via standard host atomics) and userland atomics done
> >      > via start/end_exclusive.
> >
> >     You need to use standard host atomics for this case.
> >
> >
> > Or use the start/end_exclusive for both by emulating the kernel call, I
> presume? It's the
> > mixing that's the problem, right?
>
> Well, preferably no.  Use start/end_exclusive only when you have no
> alternative, which for
> a simple CAS should not be the case on any FreeBSD host.
>
> Using start/end_exclusive is entirely local to the current process, and
> means you don't
> have atomicity across processes.  Which can cause problems when emulating
> an entire chroot.
>

So I was assuming that the cas instructions for arm use start/end_exclsive
under the covers.
Is that the case? Or is there something clever there I've overlooked and
the start/end_exclusive
stuff is only used for fallbacks?

Warner

--000000000000ff520c05da1dc046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 13, 2022 at 11:03 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 3/13/22 09:57, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, Mar 13, 2022, 10:47 AM Richard Henderson &lt;<a href=3D"mailto=
:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.o=
rg</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 3/12/22 20:59, Warner Losh wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; FreeBSD&#39;s pthread_mutex is shared between=
 the kernel and user land.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; So it does a compare and set to take the lock=
. Uncontested and unheld<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; locks will mean we&#39;ve taken the lock and =
return. Contested locks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; are kicked to the kernel to wait. When userla=
nd releases the lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; it signals the kernel to wakeup via a system =
call. The kernel then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; does a cas to try to acquire the lock. It eit=
her returns with the lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; held, or goes back to sleep. This we have ato=
mics operating both in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the kernel (via standard host atomics) and us=
erland atomics done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; via start/end_exclusive.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You need to use standard host atomics for this case=
.<br>
&gt; <br>
&gt; <br>
&gt; Or use the start/end_exclusive for both by emulating the kernel call, =
I presume? It&#39;s the <br>
&gt; mixing that&#39;s the problem, right?<br>
<br>
Well, preferably no.=C2=A0 Use start/end_exclusive only when you have no al=
ternative, which for <br>
a simple CAS should not be the case on any FreeBSD host.<br>
<br>
Using start/end_exclusive is entirely local to the current process, and mea=
ns you don&#39;t <br>
have atomicity across processes.=C2=A0 Which can cause problems when emulat=
ing an entire chroot.<br></blockquote><div><br></div><div>So I was assuming=
 that the cas instructions for arm use start/end_exclsive under the covers.=
</div><div>Is that the case? Or is there something clever there I&#39;ve ov=
erlooked and the start/end_exclusive</div><div>stuff is only used for fallb=
acks?</div><div><br></div><div>Warner</div><div><br></div></div></div>

--000000000000ff520c05da1dc046--

