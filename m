Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17A3CFD4E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:19:30 +0200 (CEST)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rWr-0001M8-S0
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m5rQp-0006TE-HA
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:13:16 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:38805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m5rQn-0002Ks-2V
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:13:14 -0400
Received: by mail-oi1-x229.google.com with SMTP id w194so24857119oie.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDf1tiGtasW7KyC9jM3mD4Ri5nWsJEP0rBlv0HcltUY=;
 b=TA8Fn8I2v68l5hz4fD5qyXYH++ARzo8O5a3m3wKzzwMOLXoS+JCsrcVN6PC5+7iDXU
 CpnRfx5Y8Ib0pmnQTaRueFEhjPjLK0X4FCpm4iWLDS7dxq/1DHAeHU3ouKGPN5fOsc0d
 pyzNA41i7nlHyitgwfsULXxlnMcuOtdDnnFwRlxPWvCge57gxuDLsq+VeMEjsxjoXUg8
 Jz9nPb2MZRMHDiJjIWd3FU2LZUUHqp+rQG6SYCZM+o/do4RjKBn1a8BQ4uIlr1P66WIT
 /zUjzIWDfhzO3Bj5nkHhBDTz4FaVcyB6fYwihCye50zoG601FTcKTGbEAyk15itG46eS
 /XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDf1tiGtasW7KyC9jM3mD4Ri5nWsJEP0rBlv0HcltUY=;
 b=NUbFTzMNWPZ4dAyEOGLB/qybI5PuhGVY5A9bZyDNMQ+vSn9JbgYV3RuHyAd8NC+ua5
 /hU6V791wkmmiWKQqNkwVd8NEUNbUv3QT8za/vN/w7QY1Syr+LhrL+wnm+Q4xG32RSEV
 YYwvvfGYSgzSQjM4KTkG9niDVSCwsTZ8fE/GdLdOQUJ0OX4vPKMtkQ9UZHK5xrglFltl
 ZyHYTRDcEanC2+QCwYnbzUuu3KTGhxP4X0H2ijUFl6Ckdc3y0Jzr8mmC2Ylaj5HQg0a6
 vcGS95bG8VWrCED+HMsyPVHsrQxomaAMN+ujtJDUUhjOZjOJKVIKHACWm65gUXlfmyKP
 C7Dg==
X-Gm-Message-State: AOAM5314gsIwU2kMPQSQiy+Mcbe7S0wSR1G2eX5h+a5sOFMDpIZ2FKcp
 5uRg4wggeC+6Lvy4Y0dfLnI6hLou4+yIlLluk+M=
X-Google-Smtp-Source: ABdhPJwLwyAqJLh37+j4lRSs22ESIS3jqMLEcSjSG1NBRmJduwTRhvnRlV9/gQmy01jao/sDZFcVA/0Gkz2qgBva/Y0=
X-Received: by 2002:aca:d805:: with SMTP id p5mr21424318oig.60.1626793991791; 
 Tue, 20 Jul 2021 08:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
 <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
 <CAFEAcA_cYZHr=Kz2JakLpxkdyBWGJUUpJWZyyV_yMq59X7YJGw@mail.gmail.com>
 <CAFEAcA-sq2GfHkpVc8BF-n=KEVwwrtzsbhM9w+_O=GmN+gg5WQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-sq2GfHkpVc8BF-n=KEVwwrtzsbhM9w+_O=GmN+gg5WQ@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 20 Jul 2021 11:13:00 -0400
Message-ID: <CAK7rcp-qm1v-fuNvH8-978SHV=sXOK8DhzMUfmWSEwGQ+utJ4A@mail.gmail.com>
Subject: Re: Error in accel/tcg?
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000000e93505c78f7eae"
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000e93505c78f7eae
Content-Type: text/plain; charset="UTF-8"

See of course I thought about editing code outside of my target too, but
thought against it. And doing it that way may make the compiler happier,
but then would it be inviting a runtime error?

On Tue, Jul 20, 2021 at 11:08 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 20 Jul 2021 at 16:06, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Tue, 20 Jul 2021 at 10:06, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > >
> > > On Mon, 19 Jul 2021 at 23:20, Kenneth Adam Miller
> > > <kennethadammiller@gmail.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > I get the following error:
> > > >
> > > > <long cmd here> -c ../accel/tcg/cputlb.c
> > > > ../qemu/accel/tcg/cputlb.c: In function 'tlb_flush_page_by_mmuidx':
> > > > ../qemu/accel/tcg/cputlb.c:602:23: error: comparison is always true
> due to limited range of data type [-Werror=type-limits]
> > > >     } else if (idxmap < TARGET_PAGE_SIZE) {
> > > >
> > > > I don't know why that suddenly shows up.
>
> > You'll get this warning, incidentally, if you have a
> > target which sets TARGET_PAGE_BITS to 16 or more.
> > Currently the only target which does that is hexagon, and
> > that is linux-user only, so it doesn't run into this (yet).
> >
> > The warning is harmless (apart from preventing compilation with
> > -Werror), but there's no in-theory reason why softmmu shouldn't
> > work with 64K pages, so we should figure out a way to rephrase
> > the cputlb.c code to suppress it.
>
> Assuming you do have something with TARGET_PAGE_BITS 16, if
> you rewrite the conditions to
>  "if ((uint32_t)idxmap < TARGET_PAGE_SIZE)" does that make
> the compiler happier ?
>
> -- PMM
>

--00000000000000e93505c78f7eae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See of course I thought about editing code outside of my t=
arget too, but thought against it. And doing it that way may make the compi=
ler happier, but then would it be inviting a runtime error?</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, =
2021 at 11:08 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.o=
rg">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue, 20 Jul 2021 at 16:06, Peter Maydell &lt=
;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydel=
l@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 20 Jul 2021 at 10:06, Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 19 Jul 2021 at 23:20, Kenneth Adam Miller<br>
&gt; &gt; &lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_bla=
nk">kennethadammiller@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I get the following error:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &lt;long cmd here&gt; -c ../accel/tcg/cputlb.c<br>
&gt; &gt; &gt; ../qemu/accel/tcg/cputlb.c: In function &#39;tlb_flush_page_=
by_mmuidx&#39;:<br>
&gt; &gt; &gt; ../qemu/accel/tcg/cputlb.c:602:23: error: comparison is alwa=
ys true due to limited range of data type [-Werror=3Dtype-limits]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0} else if (idxmap &lt; TARGET_PAGE_SIZE) =
{<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t know why that suddenly shows up.<br>
<br>
&gt; You&#39;ll get this warning, incidentally, if you have a<br>
&gt; target which sets TARGET_PAGE_BITS to 16 or more.<br>
&gt; Currently the only target which does that is hexagon, and<br>
&gt; that is linux-user only, so it doesn&#39;t run into this (yet).<br>
&gt;<br>
&gt; The warning is harmless (apart from preventing compilation with<br>
&gt; -Werror), but there&#39;s no in-theory reason why softmmu shouldn&#39;=
t<br>
&gt; work with 64K pages, so we should figure out a way to rephrase<br>
&gt; the cputlb.c code to suppress it.<br>
<br>
Assuming you do have something with TARGET_PAGE_BITS 16, if<br>
you rewrite the conditions to<br>
=C2=A0&quot;if ((uint32_t)idxmap &lt; TARGET_PAGE_SIZE)&quot; does that mak=
e<br>
the compiler happier ?<br>
<br>
-- PMM<br>
</blockquote></div>

--00000000000000e93505c78f7eae--

