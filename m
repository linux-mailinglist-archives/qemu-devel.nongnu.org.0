Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AB2F2448
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:37:19 +0100 (CET)
Received: from localhost ([::1]:51680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7gT-0006E9-Ko
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kz7dW-0005Af-9t
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:34:14 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kz7dS-0007l9-IX
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:34:14 -0500
Received: by mail-qk1-x736.google.com with SMTP id 143so510024qke.10
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/tfQhQcPylqQJGQk0ELoz5z5KRO6wY7/ebAxXFbToE=;
 b=ORrm0t2/L4RciNaGzS1qilV3cNunhsERTmiU2YB+Hn1vEOZylAMGHW3rpAxPjOzZFI
 /UkJHvJ7qSd6HgD2JcgllARwPelIM7V6sECpbC7zl3cnpffpM/P1toaL+rw6jRMBNKcy
 KSvZ9TAYJ0tH0KOY4GgDlCNcRx7uAQlNehQrMpRLEkHUDzU1YbwBQ70/KOAKezNAIv7f
 OfjflEeghDba2dGkxCXLoBuwvNAFcmRWSjbL42zJ/08f5tsBRiotO/sqZRqgX5sP7ftx
 IYOgWSbLxSlDiPc5H7Iv9OPf0sAZChw+rT0qcxQYT1mlegX1hGStEbDeycj1zqnr07tq
 hblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/tfQhQcPylqQJGQk0ELoz5z5KRO6wY7/ebAxXFbToE=;
 b=RlZopXI6gY73xPKN914Zy3XcQpDKLjcrkSOdPF+1AI2NGoUocodTgP1yjk4W7H632N
 50nA5HaP0tpISXrnEv/7xZhPZUbyND7UOkmFsFdnLgAdMwrJsaNL1jZR4STZ5X4Y7BIu
 QBCpC4Jl8A969e0moC/BHGCsqODP0IxJN3BM2IbgJkoMWnQcUVndZFo4t60c6Er2m8Hi
 XC7UBPJgkEubP6ptYU6D6z0KjEwzl0QM6/KNIqszqWZsb2upYDtRgRAsTsXCSChJHBW0
 4fC3wX9sAH9GDvhWvzNpH2Wf67DDMeAp/UktlSDqzdlHgkD4u0BLDeXAQz6Xth0uuse4
 ZdEA==
X-Gm-Message-State: AOAM532bYFMoag8mwhiK+C5KGrdE/pHEbAhxjZx8dVHypfH5wU8enVmH
 f673wUOISvFRIZVcVVsXJ8FYt2stlKqrotnIOpZ28g==
X-Google-Smtp-Source: ABdhPJwqB/yA4yEFS5VEro5MX7O6HAFjaqOiMTS4mTZCvaviNn6QBrPfoTj+tpo5vK6zoVFPxBvAEN8SQpcpYHJ2+L8=
X-Received: by 2002:a37:8505:: with SMTP id h5mr1992091qkd.44.1610411648971;
 Mon, 11 Jan 2021 16:34:08 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
 <20210111132701.GD1172772@redhat.com>
In-Reply-To: <20210111132701.GD1172772@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Jan 2021 17:33:57 -0700
Message-ID: <CANCZdfowQSzi34redL=vt-xcKCKVAv2DQqeFNhsZvym7BHu-5A@mail.gmail.com>
Subject: Re: qemu bsd-user plans
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000478cc305b8a92e9c"
Received-SPF: none client-ip=2607:f8b0:4864:20::736;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x736.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000478cc305b8a92e9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 6:27 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, Jan 08, 2021 at 12:41:30PM -0700, Warner Losh wrote:
> > The FreeBSD project has rewritten bsd-user. We've been working on this
> for
> > quite some time (the earliest commits date from 2013). Maybe a dozen
> people
> > have worked on this over time, and there's 3 or 4 active developers
> focused
> > on FreeBSD changes at the moment.
>
> The fact that you have 3-4 people involved in this work is will be very
> helpful to you going forward with a QEMU maintenance.
>
> The biggest problem with getting code merged into QEMU is an insufficient
> number of reviewers for the amount of patches sent. Since we have a rule
> that patches need a review from someone else who isn't the author, if the=
re
> are two people with expertize to review patches in a given QEMU subsystem=
,
> then they can become self-sufficient and review each others patches on
> qemu-devel, which then makes merging much more productive.
>

Yes. That's my hope too. We've been doing this internally for changes we've
been landing lately, so I think expanding our process to also do this with
qemu upstream will be a natural progression...


> If anyone wants to be automatically CC'd on patches for bsd-user for the
> purposes of acting as a designated reviewer, they can added to MAINTAINER=
S
> file to, alongside the primary maintainer(s).
>

I'll be adding myself, at least, to MAINTAINERS and encouraging the others
that have been working on this to take the time to review when I post. They
are quite willing, but may lack the time, alas, so I'll do what I can to
time the patches such that at least one of them has the time in a
reasonable time frame...


> > So, my new plan is to rebase what changes I can to the tip of master an=
d
> > submit those for review. I'll work with the developers on the FreeBSD
> side
> > to ensure they are included in reviews in addition to the normal
> qemu-devel
> > list. This will allow us to pare down the deltas between our code and
> > upstream to allow us to make progress. The changes will be held to the
> > standard 'makes things better'. Given how broken bsd-user is today in
> qemu
> > upstream, at first that will a very easy standard to make.
> >
> > The first patch I'll submit will be changing MAINTAINERS to point to me=
,
> > since I'm acting as the point person in this effort. I'll then re-submi=
t
> > some other changes that I've submitted in the past, but CC the FreeBSD
> > folks that are currently active (they were only CC'd to former develope=
rs
> > who lack the time to review).
>
> > But before I get too far down this path, I thought I'd send out what's
> > going on to qemu-devel so I can get feedback and adjust the plan into
> > something that's mutually agreeable so time I put towards this is not
> > wasted.
>
> No objections from me. Since current bsd-user is orphaned, largely
> unusable, and you're volunteering your time to make it better, I'm
> supportive of whatever you believe is the most time efficient way
> to improve bsd-user.
>
> I presume some of the current QEMU maintainers knowledgable about
> linux-user will be able to review the patches, and as mentioned
> above, if other BSD devs currently active in bsd-user work can
> also provide reviews on qemu-devel that'll be useful long term.
>

Yes. Many of the patches are copied from there, as well as the initial
version coming largely from there as well (it seems, I wasn't around at the
time and base this entirely on code similarities).

The FreeBSD project makes such heavy use of this, that I really want to
find some way we can stay current and maybe even have better abstractions
that make all user-mode emulation easier...

Warner

--000000000000478cc305b8a92e9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 11, 2021 at 6:27 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, Jan 08, 2021 at 12:41:30PM -0700, Warner Losh wrote:<br>
&gt; The FreeBSD project has rewritten bsd-user. We&#39;ve been working on =
this for<br>
&gt; quite some time (the earliest commits date from 2013). Maybe a dozen p=
eople<br>
&gt; have worked on this over time, and there&#39;s 3 or 4 active developer=
s focused<br>
&gt; on FreeBSD changes at the moment.<br>
<br>
The fact that you have 3-4 people involved in this work is will be very<br>
helpful to you going forward with a QEMU maintenance.<br>
<br>
The biggest problem with getting code merged into QEMU is an insufficient<b=
r>
number of reviewers for the amount of patches sent. Since we have a rule<br=
>
that patches need a review from someone else who isn&#39;t the author, if t=
here<br>
are two people with expertize to review patches in a given QEMU subsystem,<=
br>
then they can become self-sufficient and review each others patches on<br>
qemu-devel, which then makes merging much more productive.<br></blockquote>=
<div><br></div><div>Yes. That&#39;s my hope too. We&#39;ve been doing this =
internally for changes we&#39;ve been landing lately, so I think expanding =
our process to also do this with qemu upstream will be a natural progressio=
n...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
If anyone wants to be automatically CC&#39;d on patches for bsd-user for th=
e<br>
purposes of acting as a designated reviewer, they can added to MAINTAINERS<=
br>
file to, alongside the primary maintainer(s).<br></blockquote><div><br></di=
v><div>I&#39;ll be adding myself, at least, to MAINTAINERS and encouraging =
the others that have been working on this to take the time to review when I=
 post. They are quite willing, but may lack the time, alas, so I&#39;ll do =
what I can to time the patches such that at least one of them has the time =
in a reasonable time frame...</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; So, my new plan is to rebase what changes I can to the tip of master a=
nd<br>
&gt; submit those for review. I&#39;ll work with the developers on the Free=
BSD side<br>
&gt; to ensure they are included in reviews in addition to the normal qemu-=
devel<br>
&gt; list. This will allow us to pare down the deltas between our code and<=
br>
&gt; upstream to allow us to make progress. The changes will be held to the=
<br>
&gt; standard &#39;makes things better&#39;. Given how broken bsd-user is t=
oday in qemu<br>
&gt; upstream, at first that will a very easy standard to make.<br>
&gt;<br>
&gt; The first patch I&#39;ll submit will be changing MAINTAINERS to point =
to me,<br>
&gt; since I&#39;m acting as the point person in this effort. I&#39;ll then=
 re-submit<br>
&gt; some other changes that I&#39;ve submitted in the past, but CC the Fre=
eBSD<br>
&gt; folks that are currently active (they were only CC&#39;d to former dev=
elopers<br>
&gt; who lack the time to review).<br>
<br>
&gt; But before I get too far down this path, I thought I&#39;d send out wh=
at&#39;s<br>
&gt; going on to qemu-devel so I can get feedback and adjust the plan into<=
br>
&gt; something that&#39;s mutually agreeable so time I put towards this is =
not<br>
&gt; wasted.<br>
<br>
No objections from me. Since current bsd-user is orphaned, largely<br>
unusable, and you&#39;re volunteering your time to make it better, I&#39;m<=
br>
supportive of whatever you believe is the most time efficient way<br>
to improve bsd-user.<br>
<br>
I presume some of the current QEMU maintainers knowledgable about<br>
linux-user will be able to review the patches, and as mentioned<br>
above, if other BSD devs currently active in bsd-user work can<br>
also provide reviews on qemu-devel that&#39;ll be useful long term.<br></bl=
ockquote><div><br></div><div>Yes. Many of the patches are copied from there=
, as well as the initial version coming largely from there as well (it seem=
s, I wasn&#39;t around at the time and base this entirely on code similarit=
ies).</div><div><br></div><div>The FreeBSD project makes such heavy use of =
this, that I really want to find some way we can stay current and maybe eve=
n have better abstractions that make all user-mode emulation easier...</div=
><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000478cc305b8a92e9c--

