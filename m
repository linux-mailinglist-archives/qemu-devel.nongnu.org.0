Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C974FD345
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 11:24:43 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neClO-0004IZ-Df
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 05:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1neChh-0002q8-6E
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 05:20:53 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1neChf-0004OW-CU
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 05:20:52 -0400
Received: by mail-vs1-xe29.google.com with SMTP id l21so12419029vsm.1
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MoPmf7cPGlM7TqI4eCtqsvicpCw8UZyJFbAROideNE4=;
 b=Sp9JAZRcbE4ATtjrjt8lD1NqCOxuqn1xawAu1my30LCWVHWOTq88PebfqQTfUumN1W
 Yw6vauVZXQonBk4gucBME9jVNbLIcnkEnNDcDNO4WCHiefyi9m5GVQgUTOGROKgO5/WH
 BU1eKcmteAgCKCkKgeEIdOjYRD87sYNshvPuKBZT8Nc31gUYOCQBMlu8PTOOEWdFoTAV
 W/fhlpPFF6w8ipVDyK0lKp3QG3P+HX6O8OdaDInOhzA3bx9d8VWTOQcD3CLJccqX8xNl
 iY3tIYClYd/PHgXZcExWaeIPpLWjD7Rs/R3mdKi3byIcXjXBFjMhQgG0F5Y9ydOAUW8q
 RXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MoPmf7cPGlM7TqI4eCtqsvicpCw8UZyJFbAROideNE4=;
 b=hv2f9s44F3Jj+Yz2JjmtRq84WSjByZr9tZ6B40/ZThDuxM4xcAcfto2MEBNB5MIJyX
 qJxb15d1XzIkAeSRi+Gb1gCKJ9pTmDhi0ZFqgAqNgFdkh6xUoy1eFYBN0G9aGuYeVuVH
 EJFRsv/M04f2lKQFn9sK5cd+TIK+U2IAhdEQW52PErSYRppikFGS0ROhwg3W3A7+j8Uu
 f0Dfc553X0YFqiAljzcH8ZO5VfZ4Xb4Kg+FMPZGc5oElUfoQgKK8zJI8zCgyaalEpVMY
 xyNTdmDwntIWwNkV4lhiNj97CtynTJ/1VIVWv7nscCcJ+5dSYl8YVVFvR59CL7HAmPZ1
 vgIQ==
X-Gm-Message-State: AOAM533Lz/PzlNN7EmiLNZ8fqooLuLjTQ0INBgcOXDvcERyLXceowazu
 4FtTLwVNFI6hXGOG/fY585Opg81LkVXNJNMao58=
X-Google-Smtp-Source: ABdhPJzuk64VGJ46WyNfbd1LFVOQ0fzwxJsXJpXXZko5PrzEvLgHFKal8SIXpZBheEhxPUEZ2Miq0CZ2XDOk0rI1bPw=
X-Received: by 2002:a67:fd0b:0:b0:31b:e36d:31b1 with SMTP id
 f11-20020a67fd0b000000b0031be36d31b1mr11244813vsr.44.1649755249937; Tue, 12
 Apr 2022 02:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyuNovUDh7EpRni_f_pQBZv4g4E2QFWxaNW6amh9h-yanw@mail.gmail.com>
 <CAFEAcA9UsOqNhCu+o71YCMr6Og5as7Ht+LD3XLiujkKjSygc1g@mail.gmail.com>
 <CANW9uyt5UDNrygX_TS9FBDb5pJdJLkHAtHqDFEoyg1U0Mgz0Ug@mail.gmail.com>
 <87a6cr1w7x.fsf@linaro.org>
In-Reply-To: <87a6cr1w7x.fsf@linaro.org>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Tue, 12 Apr 2022 18:20:39 +0900
Message-ID: <CANW9uytZ9h2SYvV9fZ54DyP9C=nt=JhJaq_xAKGzL6Pwn69Pug@mail.gmail.com>
Subject: Re: Procedures adding new CPUs in sbsa-ref
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a38f4505dc71934d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a38f4505dc71934d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2022 at 0:22 Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

>
> Itaru Kitayama <itaru.kitayama@gmail.com> writes:
>
> > Good point; however per the SBSA specification, DEN0029F, there's the
> > PE architecture requirement at
> > each level from 1 to 7, so now I am wondering whether supporting
> > cortex-a57 and a72 are good enough to
> > set up a fully SBSA level 7 compliant "board" in QMEU.
>
> Not currently - we are working on cortex-a76/neoverse-n1 which will
> provide a v8.2 baseline for sbsa-ref. See:
>
>   Subject: [PATCH 00/16] target/arm: Implement features Debugv8p4, RAS,
> IESB
>   Date: Fri,  8 Apr 2022 17:07:26 -0700
>   Message-Id: <20220409000742.293691-1-richard.henderson@linaro.org>
>
> and:
>
>   Subject: [PATCH 0/7] target/arm: More trivial features, A76, N1
>   Date: Sat,  9 Apr 2022 22:57:18 -0700
>   Message-Id: <20220410055725.380246-1-richard.henderson@linaro.org>
>
> which are stepping stones to those concrete models. Please review if you
> can.


Sure, Shuichi and I will review Richard=E2=80=99s series and give feedback =
if
there=E2=80=99s any.

Itaru.


>
> > Also, the 'max'
> > is there, but does not boot.
>
> Generally the firmware has to be built with the knowledge of what system
> it is running on so will generally fall over if run on a different CPU
> feature set. However I believe Leif had a firmware branch which attempts
> to work with -cpu max by doing proper ID register probing before using
> features. However -cpu max is very a moving feast which is why there is
> a push for the concrete CPU types.
>
> I believe there is a proposal for a versioned sbsa-ref model which will
> step of the default CPU for higher levels.
>
> >
> > Itaru.
> >
> > On Sat, Apr 9, 2022 at 12:04 AM Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >>
> >> On Fri, 8 Apr 2022 at 15:59, Itaru Kitayama <itaru.kitayama@gmail.com>
> wrote:
> >> > I'd like to add a64fx cpu to the sbsa-ref board, if there's a quick
> and dirty
> >> > way of completing that, advice from the  maintainers is greatly
> appreciated.
> >>
> >> I have cc'd the sbsa-ref maintainers (as listed in the MAINTAINERS
> file).
> >>
> >> However, I'm not sure why you want to add the a64fx CPU to this
> >> board model? The sbsa-ref board is intended as a platform for
> >> developing firmware that runs on Server Base System Architecture
> >> hardware, so it deliberately doesn't have support for every CPU
> >> type QEMU implements.
> >>
> >> thanks
> >> -- PMM
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000a38f4505dc71934d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Apr 12, 2022 at 0:22 Alex Benn=C3=A9e &lt;<a href=3D"mailto:al=
ex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Itaru Kitayama &lt;<a href=3D"mailto:itaru.kitayama@gmail.com" target=3D"_b=
lank">itaru.kitayama@gmail.com</a>&gt; writes:<br>
<br>
&gt; Good point; however per the SBSA specification, DEN0029F, there&#39;s =
the<br>
&gt; PE architecture requirement at<br>
&gt; each level from 1 to 7, so now I am wondering whether supporting<br>
&gt; cortex-a57 and a72 are good enough to<br>
&gt; set up a fully SBSA level 7 compliant &quot;board&quot; in QMEU.<br>
<br>
Not currently - we are working on cortex-a76/neoverse-n1 which will<br>
provide a v8.2 baseline for sbsa-ref. See:<br>
<br>
=C2=A0 Subject: [PATCH 00/16] target/arm: Implement features Debugv8p4, RAS=
, IESB<br>
=C2=A0 Date: Fri,=C2=A0 8 Apr 2022 17:07:26 -0700<br>
=C2=A0 Message-Id: &lt;<a href=3D"mailto:20220409000742.293691-1-richard.he=
nderson@linaro.org" target=3D"_blank">20220409000742.293691-1-richard.hende=
rson@linaro.org</a>&gt;<br>
<br>
and:<br>
<br>
=C2=A0 Subject: [PATCH 0/7] target/arm: More trivial features, A76, N1<br>
=C2=A0 Date: Sat,=C2=A0 9 Apr 2022 22:57:18 -0700<br>
=C2=A0 Message-Id: &lt;<a href=3D"mailto:20220410055725.380246-1-richard.he=
nderson@linaro.org" target=3D"_blank">20220410055725.380246-1-richard.hende=
rson@linaro.org</a>&gt;<br>
<br>
which are stepping stones to those concrete models. Please review if you<br=
>
can. </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Sure, Shuic=
hi and I will review Richard=E2=80=99s series and give feedback if there=E2=
=80=99s any.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Itaru.</div=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><b=
r>
<br>
&gt; Also, the &#39;max&#39;<br>
&gt; is there, but does not boot.<br>
<br>
Generally the firmware has to be built with the knowledge of what system<br=
>
it is running on so will generally fall over if run on a different CPU<br>
feature set. However I believe Leif had a firmware branch which attempts<br=
>
to work with -cpu max by doing proper ID register probing before using<br>
features. However -cpu max is very a moving feast which is why there is<br>
a push for the concrete CPU types.<br>
<br>
I believe there is a proposal for a versioned sbsa-ref model which will<br>
step of the default CPU for higher levels.<br>
<br>
&gt;<br>
&gt; Itaru.<br>
&gt;<br>
&gt; On Sat, Apr 9, 2022 at 12:04 AM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 8 Apr 2022 at 15:59, Itaru Kitayama &lt;<a href=3D"mailto:=
itaru.kitayama@gmail.com" target=3D"_blank">itaru.kitayama@gmail.com</a>&gt=
; wrote:<br>
&gt;&gt; &gt; I&#39;d like to add a64fx cpu to the sbsa-ref board, if there=
&#39;s a quick and dirty<br>
&gt;&gt; &gt; way of completing that, advice from the=C2=A0 maintainers is =
greatly appreciated.<br>
&gt;&gt;<br>
&gt;&gt; I have cc&#39;d the sbsa-ref maintainers (as listed in the MAINTAI=
NERS file).<br>
&gt;&gt;<br>
&gt;&gt; However, I&#39;m not sure why you want to add the a64fx CPU to thi=
s<br>
&gt;&gt; board model? The sbsa-ref board is intended as a platform for<br>
&gt;&gt; developing firmware that runs on Server Base System Architecture<b=
r>
&gt;&gt; hardware, so it deliberately doesn&#39;t have support for every CP=
U<br>
&gt;&gt; type QEMU implements.<br>
&gt;&gt;<br>
&gt;&gt; thanks<br>
&gt;&gt; -- PMM<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--000000000000a38f4505dc71934d--

