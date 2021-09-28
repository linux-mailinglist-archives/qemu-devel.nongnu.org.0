Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3B641B26F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:56:58 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVEXQ-0001AW-OH
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mVEVS-0000J0-L3
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:54:54 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mVEVQ-0005C2-DJ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:54:54 -0400
Received: by mail-vs1-xe32.google.com with SMTP id f18so22423050vsp.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 07:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YEcg1GjXydFaTu78WCRG+4dV0bmm3Tbtdu3eLSHg2xk=;
 b=8SZuKR4G9U8x/Rs3WkWzmUrVjVJ5E66wiQS5F+yoIML2W4K75qFeDIEnuKWo2mppTV
 VbI5H5FdfVaYdkbCkv91dYNP1Ak+B68ArCnEZa9orHvfcjs5dNa3NxAvvLuo1dL2yjP5
 AyjIX6oF7oPIN2IjAESQ+1tDr5sUUxHcbr8vlNScUK28zzoa2ZjeS/Gyc/dhr3jgroLT
 FPZ2HwdKXQsjZ5dfXP2rL6n3+3PAvV7clhkjXACqwXYqsOB0RKuVVtQF3jF7mZmgsktq
 6xHcfdZom0vcpv678q4gFcaqpUgmk+JOjgnMkmtHvqv/ILc7zS9/FYc/dSevckf2PZy/
 FrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEcg1GjXydFaTu78WCRG+4dV0bmm3Tbtdu3eLSHg2xk=;
 b=QEEstNvssLvfbD25pp+M9JN3LhZ/1PQCzW0QnPfu9tsBzhpx3Ook7NgVFyHpzwNpdR
 J/qI63DkF4cqxn1hfjQJcpIdVOai7rJUrtxzxpAiKKQ8ev8MQimikxdkavIeqiQfT9kp
 RSHqLccsFCgKUCPTExZarFHSQjlYPE2Qf0FOgho2Bgsj+htVwW7gwdxlAmE3AC62EW1p
 kPiotVj7S2mx20/Temg2uhNTvL+DNnRzEyMDcaCeO32o2Wx1jhuS5LY/JNGP9irzSGD+
 X5Dqq89K/kNQpi+YYoW7zZHAWYaDmd6MF8Nhz4K5IsLjZdXI6yVKee7mkgHJPIANc1Zq
 bV2g==
X-Gm-Message-State: AOAM533K0Tsv5RSgBWTJdD0lOdWmW8zpzxzMaaMbtZi3bVtllGbN4eQz
 XfBATBRneA5Q4AGHn+ouD9rvwcBdcoYxW3ju+tG1zg==
X-Google-Smtp-Source: ABdhPJylKdnGyKKxHTi804WzCEscbOnCNpavBVknq3AYXB/suk/QEoF6oLzOD5S921kinG5a5Yr9copiv4SdUeEqT64=
X-Received: by 2002:a05:6102:317a:: with SMTP id
 l26mr5620761vsm.6.1632840889570; 
 Tue, 28 Sep 2021 07:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <7ADF21C8-B567-4B66-B1F6-475626868561@fb.com>
In-Reply-To: <7ADF21C8-B567-4B66-B1F6-475626868561@fb.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 28 Sep 2021 08:54:38 -0600
Message-ID: <CANCZdfq5hqojAeCx6oEnhxewfm3DBd1gCa=zrP0V+_15jdfWdg@mail.gmail.com>
Subject: Re: Issue with time going backwards on OSX
To: Joe Tanen <jtanen@fb.com>
Content-Type: multipart/alternative; boundary="00000000000032a51205cd0f658a"
Received-SPF: none client-ip=2607:f8b0:4864:20::e32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe32.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dirty@apple.com" <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000032a51205cd0f658a
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 8:48 AM Joe Tanen <jtanen@fb.com> wrote:

> Hello,
>
>
>
> I posted this on qemu-discuss, but it doesn't seem like anybody else has
> seen this issue. I figured I'd try here to see if anybody had any thoughts.
>
>
>
> I'm using qemu-system-aarch64 v5.2 on OSX 11.6. While reading cntvct_el0,
> I've seen the ticks count go backwards. I dug into the qemu source a bit,
> and this register is eventually backed by a call to
> clock_gettime(CLOCK_MONOTONIC), which should not go backwards. This code
> seems to be the same on master as the branch I'm on.
>
>
>
> Before I started delving into debugging qemu, I wanted to verify that this
> wasn't an OS issue. I wrote a simple test that read CLOCK_MONOTONIC every
> 100ms, compared the values to make sure they always increased, and let it
> run overnight. Lo and behold, I saw time go backwards. I ran a concurrent
> test with CLOCK_MONOTONIC_RAW, and I did not see time go backwards.
> Successive reads of the CLOCK_MONOTONIC after it jumped backwards tracked
> the new time, so the jump wasn't a spurious error. When I ran this test on
> a Fedora 34 PC, I never saw time go backwards.
>
>
>
> Someone suggested as a test disabling networking so the NTP daemon
> couldn't mess with the clock, but that's not something I can do IRL. In any
> case, my understanding is that CLOCK_MONOTONIC should never go backwards
> and that any adjustments are made by temporarily slowing down or speeding
> up the tick rate. I'm going to pursue what I believe to be the underlying
> issue separately, but my qemu questions are these:
>
>
>
> - Has anybody else seen this or other timer registers go backwards under
> these or other conditions? I only see the behavior on OSX 11.6, but I'm a
> small sample size.
>
>
>
> - Would it make sense to use CLOCK_MONOTONIC_RAW (if available) instead of
> CLOCK_MONOTONIC in qemu? My issue aside, CLOCK_MONOTONIC_RAW feels closer
> to giving the guest direct access to a hardware clock. e.g., if I wanted to
> write my own NTP time adjustment daemon, I'd prefer to have an unadjusted
> clock. The code already checks to see if CLOCK_MONOTONIC is available, and,
> if not, it reverts to a simple gettimeofday(). It was easy to add another
> check to init_get_clock() to add a case checking for the availability of
> CLOCK_MONOTONIC_RAW. I've tested this myself, but I wanted to see if there
> was upstream interest in this and/or if there were reasons to prefer the
> current implementation.
>

Yea, CLOCK_MONOTONIC going backwards violates POSIX's description of it not
going backwards... Some operating systems with the not going backwards
property provide CLOCK_MONOTONIC_RAW as an alias for CLOCK_MONOTONIC, so
whatever you do, please make sure it works in this situation, or you'll
break at least FreeBSD...

Warner



> Thanks, and best regards,
>
> Joe
>
>
>

--00000000000032a51205cd0f658a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 28, 2021 at 8:48 AM Joe T=
anen &lt;<a href=3D"mailto:jtanen@fb.com">jtanen@fb.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-US">
<div class=3D"gmail-m_-974873084555951322WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:black">Hello,<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><u></u>=C2=A0<u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">I posted this on qemu-di=
scuss, but it doesn&#39;t seem like anybody else has seen this issue. I fig=
ured I&#39;d try here to see if anybody had any thoughts.<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">=C2=A0<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">I&#39;m using qemu-syste=
m-aarch64 v5.2 on OSX 11.6. While reading cntvct_el0, I&#39;ve seen the tic=
ks count go backwards. I dug into the qemu source a bit, and this register =
is eventually backed by a call to clock_gettime(CLOCK_MONOTONIC),
 which should not go backwards. This code seems to be the same on master as=
 the branch I&#39;m on.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">=C2=A0<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Before I started delving=
 into debugging qemu, I wanted to verify that this wasn&#39;t an OS issue. =
I wrote a simple test that read CLOCK_MONOTONIC every 100ms, compared the v=
alues to make sure they always increased,
 and let it run overnight. Lo and behold, I saw time go backwards. I ran a =
concurrent test with CLOCK_MONOTONIC_RAW, and I did not see time go backwar=
ds. Successive reads of the CLOCK_MONOTONIC after it jumped backwards track=
ed the new time, so the jump wasn&#39;t
 a spurious error. When I ran this test on a Fedora 34 PC, I never saw time=
 go backwards.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><u></u>=C2=A0<u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Someone suggested as a t=
est disabling networking so the NTP daemon couldn&#39;t mess with the clock=
, but that&#39;s not something I can do IRL. In any case, my understanding =
is that CLOCK_MONOTONIC should never go backwards
 and that any adjustments are made by temporarily slowing down or speeding =
up the tick rate. I&#39;m going to pursue what I believe to be the underlyi=
ng issue separately, but my qemu questions are these:<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:black">=C2=A0<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">- Has anybody else seen =
this or other timer registers go backwards under these or other conditions?=
 I only see the behavior on OSX 11.6, but I&#39;m a small sample size.<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><u></u>=C2=A0<u></u></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">- Would it make sense to=
 use CLOCK_MONOTONIC_RAW (if available) instead of CLOCK_MONOTONIC in qemu?=
 My issue aside, CLOCK_MONOTONIC_RAW feels closer to giving the guest direc=
t access to a hardware clock. e.g.,
 if I wanted to write my own NTP time adjustment daemon, I&#39;d prefer to =
have an unadjusted clock. The code already checks to see if CLOCK_MONOTONIC=
 is available, and, if not, it reverts to a simple gettimeofday(). It was e=
asy to add another check to init_get_clock()
 to add a case checking for the availability of CLOCK_MONOTONIC_RAW. I&#39;=
ve tested this myself, but I wanted to see if there was upstream interest i=
n this and/or if there were reasons to prefer the current implementation.<u=
></u><u></u></span></p>
</div></div></blockquote><div><br></div><div>Yea, CLOCK_MONOTONIC going bac=
kwards violates POSIX&#39;s description of it not going backwards... Some o=
perating systems with the not going backwards property provide CLOCK_MONOTO=
NIC_RAW as an alias for CLOCK_MONOTONIC, so whatever you do, please make su=
re it works in this situation, or you&#39;ll break at least FreeBSD...<br><=
/div><div><br></div><div>Warner<br></div><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap=
: break-word;" lang=3D"EN-US"><div class=3D"gmail-m_-974873084555951322Word=
Section1">
<p class=3D"MsoNormal"><span style=3D"color:black">Thanks, and best regards=
,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Joe<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div></div>

--00000000000032a51205cd0f658a--

