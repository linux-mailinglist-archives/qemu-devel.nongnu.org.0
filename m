Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598442C726
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:04:13 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahfo-0004II-AB
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mahc5-0001tg-Af
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:00:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mahc1-0002Xz-Tp
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:00:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id u18so10650515wrg.5
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ThTCOOGqXs6fzHon0AGWQBLn/+vLJ6wh2dWsZtUb10=;
 b=Owd5sj/LOz02IKpWgIuEZQL6WdFh3RyNxVZutpLbF+3jPKKkYwYU/5Nd4frOD/Hslv
 tUnvLNaNcHk3ux/nA0HxASHtRNAzofSAg9D+zaPNfajDhgUv/G4bx0Fm4mfoglGsMWYC
 m8YDv9D0yYH6oE7HlxaY1tXBUImFD56Ur9971IMDAHs6KSchU08cyfMvhQAApljkj2Ia
 x9fIVz4A8mCn19y1FX+JJr68Chfg+9LP4ZDen7wRJBj3IxgKPAqxkccxmPchYSuyEN9l
 Jc9VeCrFRAWxO5spGvIdsfC3jYhDEoPqqQ9kTU2TJRVc781CEwUVqVqtoMj4HN6dIc/5
 UnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ThTCOOGqXs6fzHon0AGWQBLn/+vLJ6wh2dWsZtUb10=;
 b=DJHBD9eLJO8ESIUXLjw/Q0bYK79/2sV+WAGta0zIAKRcaFLwaxFOOz92yZQk2kG2ln
 7lTYRqW76FVYIsA5/UukPRsLJ51JOwWtzXh9UNM6ZJgNDqqMmiX+EdK7YueEuARwLpcd
 WiE3Qi+8vBgYX0noXM6ACE4PO2Etw9OGPbVCpx1uq5yvkk0nLyTCZ6NLfGuOXIslnWsL
 37zVbVUeY0I4kboHL38/BJ0iP8zoW57Pp9apgZlWRjYGzlIHljq4rOr4zU8WY9Yr8ieA
 LsweLlo/FkB+xQoxx/pQ3qYhobpkPgVK2OCNiI7oKH9h74zSEVMBshFv0JFTwqXkBVEe
 TW5g==
X-Gm-Message-State: AOAM5324gw7DE596SxuGg47gy1pokILKG+GnL6akhCqn8ADn2Y6W7iGw
 K8+xF30el09cGGnzNvp0+0cTxAly/fhxegzpIJfkYQ==
X-Google-Smtp-Source: ABdhPJwzWo4KsEdlL9wG4Bo68sDbtIuj7qC3Ce++Wig5HLgaII9tj1R5yVwEGMr2B5OsJpp61RrbSbG4Drr6NIf5sYw=
X-Received: by 2002:a1c:9ad4:: with SMTP id c203mr409256wme.41.1634144415352; 
 Wed, 13 Oct 2021 10:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
 <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
 <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
 <CAAeLtUBSZ-=+06SowthZds0r19w66S-ibn18st4=DU81SeJk6Q@mail.gmail.com>
 <CAOojN2Ub=ig3akjXRdtq0WkwTn+wqy_q85UzTgV=UD5Y6y+9iA@mail.gmail.com>
 <CAAeLtUDSss2dco5QsT1wXQJ=bBS5ZAwjmXrH5dceZwxmqKKbSg@mail.gmail.com>
 <fe85a41a-af02-2c1e-cec6-af4668f7519c@rivosinc.com>
 <9c5d9243-7801-408d-1faa-46657a3541ff@linaro.org>
In-Reply-To: <9c5d9243-7801-408d-1faa-46657a3541ff@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Oct 2021 19:00:04 +0200
Message-ID: <CAAeLtUCG5V0bOkZjdz5cKxYa-r=V=Pt40tvyhBuQA3pRCcH_ow@mail.gmail.com>
Subject: Re: [PULL 11/26] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000063a22705ce3ee528"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Anup Patel <anup@brainfault.org>,
 Vineet Gupta <vineetg@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Vincent Palatin <vpalatin@rivosinc.com>, Jim Wilson <jimw@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063a22705ce3ee528
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Oct 2021 at 18:51, Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/13/21 9:20 AM, Vineet Gupta wrote:
> > off topic but relates, for Zb (and similar things in the future) whats
> the strategy for
> > change management/discovery. I understand you can hardcode things for
> quick test, but for
> > a proper glibc implementation this would be an IFUNC but there seems to
> be no
> > architectural way per spec (for software/kernel) to discover this.
>
> Since the architecture restricted access to these CSRs, you do have to
> coordinate with the
> kernel.
>

Zb[abcs] will not be discoverable via MISA bits.
A unified low-level discovery mechanisms (and a way to inject this
information to userspace via the auxiliary vector) are being developed at
the moment.

There is an AT_HWCAP value that is given to userland, but it is currently
> masked to only
> provide a few of the MISA bits.  This will need to be extended for both V
> and Zb.  It
> doesn't help that Zb has been split into lots of smaller extensions, whic=
h
> (if done
> simplistically) will quickly consume all of the bits within AT_HWCAP.
>

It looks like HWCAP, HWCAP2 and AT_PLATFORM and AT_BASE_PLATFORM will be
used.
Kito presented the (then current) state of thinking at the Linux Plumbers
Conference=E2=80=A6


> So: I strongly suggest that RISC-V spend a few moments considering a way
> to represent this
> that will easily support the myriad extensions.  One possibility is to ad=
d
> more AT_*
> entries straight away -- AT_HWCAP_ZB, which contains one bit for all of
> the Zb[abcs]
> extensions.  Possibly set the "main" AT_HWCAP "b" bit if Zb is present at
> some minimal level.
>
> > Same issue is with building linux kernel with Zb - how do we make sure
> that hardware/sim
> > supports Zb when running corresponding software.
>
> On the kernel side this is easier -- read the CSRs then patch the kernel.
> There are existing ways to manage this sort of thing.
>
>
> r~
>

--00000000000063a22705ce3ee528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 13 Oct 2021 at 18:51, Richard=
 Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hend=
erson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 10/13/21 9:20 AM, Vineet Gupta wrote:<br>
&gt; off topic but relates, for Zb (and similar things in the future) whats=
 the strategy for <br>
&gt; change management/discovery. I understand you can hardcode things for =
quick test, but for <br>
&gt; a proper glibc implementation this would be an IFUNC but there seems t=
o be no <br>
&gt; architectural way per spec (for software/kernel) to discover this.<br>
<br>
Since the architecture restricted access to these CSRs, you do have to coor=
dinate with the <br>
kernel.<br></blockquote><div><br></div><div>Zb[abcs] will not be discoverab=
le via MISA bits.</div><div>A unified low-level discovery mechanisms (and a=
 way to inject this information to userspace via the auxiliary vector) are =
being developed at the moment.</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">There is an AT_HWCAP value that is given to userl=
and, but it is currently masked to only <br>
provide a few of the MISA bits.=C2=A0 This will need to be extended for bot=
h V and Zb.=C2=A0 It <br>
doesn&#39;t help that Zb has been split into lots of smaller extensions, wh=
ich (if done <br>
simplistically) will quickly consume all of the bits within AT_HWCAP.<br></=
blockquote><div><br></div><div>It looks like HWCAP, HWCAP2 and AT_PLATFORM =
and AT_BASE_PLATFORM will be used.</div><div>Kito presented the (then curre=
nt) state of thinking at the Linux Plumbers Conference=E2=80=A6</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
So: I strongly suggest that RISC-V spend a few moments considering a way to=
 represent this <br>
that will easily support the myriad extensions.=C2=A0 One possibility is to=
 add more AT_* <br>
entries straight away -- AT_HWCAP_ZB, which contains one bit for all of the=
 Zb[abcs] <br>
extensions.=C2=A0 Possibly set the &quot;main&quot; AT_HWCAP &quot;b&quot; =
bit if Zb is present at some minimal level.<br>
<br>
&gt; Same issue is with building linux kernel with Zb - how do we make sure=
 that hardware/sim <br>
&gt; supports Zb when running corresponding software.<br>
<br>
On the kernel side this is easier -- read the CSRs then patch the kernel.<b=
r>
There are existing ways to manage this sort of thing.<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--00000000000063a22705ce3ee528--

