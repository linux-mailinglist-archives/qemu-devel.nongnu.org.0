Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E55490303
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:39:27 +0100 (CET)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Mbu-00058p-Cf
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9MNn-0000vM-UY
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:24:51 -0500
Received: from [2607:f8b0:4864:20::935] (port=34543
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9MNk-0001Pc-Nd
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:24:50 -0500
Received: by mail-ua1-x935.google.com with SMTP id y4so28835520uad.1
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 23:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCsKIyCnkRM1rE09jDf5dcXQyOjBN5twKHQoGA5PQvs=;
 b=XYfH7hPHO0R+IQgnnh/QjrVQF80L3mpsVxnxEW32EdYDXC/iJVcFTn9yA7lwz1YnK8
 6kG9EdztKg+PVcMcVNIhuWdb4mPBQGp4/0de3M2kpGhcuF6IPorSl2zPCqL0e2bcDZks
 8cycxJSyrr8ZD8+6M85POngCLSDjmeG/jHklDFwrZmxuZutz+2u5lqCClvMUS7zCKvQN
 G6ksU2kMRAJIPtL6iZ2L2xD6hKwVtFsPF7uGc582TTuC4c/SZECh5UDEJlZV4KFgIkSk
 DTQlFENtF1ReQQQX1QbslsCSfsiUYAL13noZJwvyiK/80udaMM1nSncy0j3HYvjQK7He
 8rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCsKIyCnkRM1rE09jDf5dcXQyOjBN5twKHQoGA5PQvs=;
 b=6JWBgSH41NGx2GF9j6InI4NzqPik4h1/rcXlEBOIaOdfjiHnXv2D9w03mDsNzzFUbG
 /7+62+M8zF5NALLZ41jWQdJ+5qGljqMebhqdsfVajVdZ5E04NTwr+N5iHc3seHxpuaU4
 yk5bIiF4ddk2uFn12oKbrRgTbFulUSE6Pzy4Tu0ih7KLpR0lQ7qmHXHi3URWCQZQWm0R
 p1eZ+8k+KchcPNn+UA/ANrHWfG9ZGIDUSDN84ZHBc+AjToT8SmmJTdxBjTWV1sOI46cK
 opgnO7cED+pvUfSrQkjvs4q88TicCtPFgdx2xzPLSiCtqRqp8H3g9k1GgfQSVuG+xzAY
 3BdQ==
X-Gm-Message-State: AOAM532bLy3CT4+abE991c0sLwCyu/YnHRZpJXGh9gnhhasBFNG21n9E
 EUz2bAXSRpK+tT5CmpgH9iphqbgx8IzcD4r3n0y2RQ==
X-Google-Smtp-Source: ABdhPJw4JWvJ2sZpUOwj4HMwONCoLBvL5PxhTZyCJkfLxZm2XrklL4MWC6p0aQRAFp9bx9I8olhnxS89D7rueluoxls=
X-Received: by 2002:a67:ef1c:: with SMTP id j28mr7194177vsr.13.1642404287535; 
 Sun, 16 Jan 2022 23:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-25-imp@bsdimp.com>
 <CAFEAcA95+ufTnr1PQRHTFttai=9LVv4dXznPTAobSUAueg_QSA@mail.gmail.com>
 <CANCZdfqVbdwPUL0U01rRvPhcRctzSQDQsA4Xn5L62=AwcSmx3w@mail.gmail.com>
In-Reply-To: <CANCZdfqVbdwPUL0U01rRvPhcRctzSQDQsA4Xn5L62=AwcSmx3w@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 17 Jan 2022 00:24:36 -0700
Message-ID: <CANCZdfr9ZF12=asyzXqyvg8jEcWcgVj6QYwDxkgzCRYY58-LyQ@mail.gmail.com>
Subject: Re: [PATCH 24/30] bsd-user/signal.c: setup_frame
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000022ec0d05d5c20c1c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022ec0d05d5c20c1c
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 16, 2022 at 11:58 PM Warner Losh <imp@bsdimp.com> wrote:

> > +    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
>> > +        goto give_sigsegv;
>>
>> FreeBSD for Arm (haven't checked other BSDs or other archs)
>> gives a SIGILL for the "can't write signal frame to stack"
>> case, I think:
>>
>> https://github.com/freebsd/freebsd-src/blob/main/sys/arm/arm/exec_machdep.c#L316
>> I don't understand why they picked SIGILL, SIGSEGV seems much more
>> logical to me, but we should follow the kernel behaviour.
>>
>
> This is a good thing to find. I'm going to have to study all the
> architectures, but
> the first 5 I looked at all returned SIGILL, so this code has to change to
> reflect
> that...
>

Sorry to follow up my own message, but  this dates to 4.1BSD (4BSD sent a
SIGKILL),
but it's not present in V7, 32V or 3BSD.

So it's very old-school BSD behavior, dating from 1981 :)

Warner

--00000000000022ec0d05d5c20c1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 16, 2022 at 11:58 PM Warn=
er Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">&gt; +=C2=A0 =C2=A0 if (!lock_user_struct(VERIFY_WRITE, frame, frame_ad=
dr, 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto give_sigsegv;<br>
<br>
FreeBSD for Arm (haven&#39;t checked other BSDs or other archs)<br>
gives a SIGILL for the &quot;can&#39;t write signal frame to stack&quot;<br=
>
case, I think:<br>
<a href=3D"https://github.com/freebsd/freebsd-src/blob/main/sys/arm/arm/exe=
c_machdep.c#L316" rel=3D"noreferrer" target=3D"_blank">https://github.com/f=
reebsd/freebsd-src/blob/main/sys/arm/arm/exec_machdep.c#L316</a><br>
I don&#39;t understand why they picked SIGILL, SIGSEGV seems much more<br>
logical to me, but we should follow the kernel behaviour.<br></blockquote><=
div><br></div><div>This is a good thing to find. I&#39;m going to have to s=
tudy all the architectures, but<br></div><div>the first 5 I looked at all r=
eturned SIGILL, so this code has to change to reflect</div><div>that...</di=
v></div></div></blockquote><div><br></div><div>Sorry to follow up my own me=
ssage, but=C2=A0 this dates to 4.1BSD (4BSD sent a SIGKILL),</div><div>but =
it&#39;s not present in V7, 32V or 3BSD.</div><div><br></div><div>So it&#39=
;s very old-school BSD behavior, dating from 1981 :)</div><div><br></div><d=
iv>Warner</div></div></div>

--00000000000022ec0d05d5c20c1c--

