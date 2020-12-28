Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE12E6986
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 18:02:37 +0100 (CET)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktvum-0008IF-4u
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 12:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ktvrm-0007kM-5w
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 11:59:30 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:46398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ktvrk-0003rA-0j
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 11:59:29 -0500
Received: by mail-qk1-x72d.google.com with SMTP id d14so9246566qkc.13
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 08:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nnJIwkLFeX3Fq70HwRs76kbbpNE/NvCaPaaXPCOYLY=;
 b=wrGpaYtPYprYnHZrvJLWcYafyfFua1M8QuPlf7vfUanXQ09tOItewN+BfJmnwSqbTE
 vNI5bhayFkk6Y3VmzM6NfJthZEGVSzE0rmVg7JRt9/hgpHpK2HodMCa/cabbJnpY01zZ
 EHRXM32QPRD9AKVV4GJjRTyEYOdL83TKOU25G8m0Euiny0tMEIVa2rGvHEjgDr01K7K9
 mvZnDIAIF0wR27iW2f755AwfbjF9Kd7/CJo9BD6OR6FlzJERtnNt5KkQhT5HHp+XMw/m
 SZtvAKyVBjuKLHBBtDYR4nyV66Y/mcmhXVULiZN9PH7isfq2Dbw9XtCCI+1ef2ggInPh
 7NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nnJIwkLFeX3Fq70HwRs76kbbpNE/NvCaPaaXPCOYLY=;
 b=huAgtVOjf//57vhPe+tbIpGMTUrZI5SWxXSjUs2mEVB26CSEN/HRR82R9I8++e0V/h
 DsYLF0cGy+tH2IMJBSSo0JbSbw8Icmclq6xuM5ai9GPCKuQnl9+Di0YcpcGbtuv/nVpB
 KZMLf/7Hkehm1ka/iRGJ0HipMsWUKHYncJ4ytaOu90N2gOhhI31xXPXtgQpZn0Awvo84
 qV6SELdDJJoOMZQCJwC2G2TXBCk+5fCx+VCHqOR1hGbNlaSQ2YBudU6rd7dHjbFjFVsu
 O7ptvcRtCedPlJS9geSWbnBS9EmSXuPMWGNXAZoXT16Fxd5waw8LuBFAAroxxy8bHEn4
 Wmjg==
X-Gm-Message-State: AOAM532O6DCg0C7Q4DRjxBQO1CQjWbJ1c1JSgbcK5Tdy4AYA1HHZftgq
 EL3nBuJ1/rtM1o90kWRzaWHuRiwY9RUm3TKLAQPWHg==
X-Google-Smtp-Source: ABdhPJyk9PbKN4STzV9r/utaZOE7u/Co+RsrJFq712zy3hLx+IJAOc4Sszi3cE0rsuyMb7egnGChWfI5lOVSJbRdMt0=
X-Received: by 2002:a37:a614:: with SMTP id p20mr44291657qke.359.1609174766810; 
 Mon, 28 Dec 2020 08:59:26 -0800 (PST)
MIME-Version: 1.0
References: <CA+XhMqwjq99QdTKntxbQ_rZ-L3bQX7D3WHLkwMdK6zmiP=_56w@mail.gmail.com>
 <CANCZdfpt0vEvJR7BYpPSxKdHs6r0BoUtXsHL1gi+x6ZopzZ1OA@mail.gmail.com>
 <CA+XhMqwVS7nOCdf0Ji_=ZpWQYp03z4dcTwkHqBwOCCkEQv8_sQ@mail.gmail.com>
In-Reply-To: <CA+XhMqwVS7nOCdf0Ji_=ZpWQYp03z4dcTwkHqBwOCCkEQv8_sQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 28 Dec 2020 09:59:15 -0700
Message-ID: <CANCZdfp5QQpK-GmNZ-j0Pak5RRXruYcHSV0sGrT75YnUMT0zbw@mail.gmail.com>
Subject: Re: [PATCH 0/2] bsd-user, FreeBSD update
To: David CARLIER <devnexen@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005b8c7d05b7893226"
Received-SPF: none client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72d.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b8c7d05b7893226
Content-Type: text/plain; charset="UTF-8"

Yes. I've picked 4 changes to make sure that I've got the size and
groupings of patches right for this project. I've heard nothing back on
them, so I'll try again after the first of the year.

I'd thought about just removing it all and pushing up the current state,
but I think even that might be unreviewable.

Warner

On Mon, Dec 28, 2020 at 9:39 AM David CARLIER <devnexen@gmail.com> wrote:

> Oh good to know I understand better why syscalls not updated for so long.
>
> To upstream I would suggest not to push straight all these changes in
> one shot and focus on FreeBSD at first, much less to review and so on.
>
> Regards.
>
> On Mon, 28 Dec 2020 at 16:21, Warner Losh <imp@bsdimp.com> wrote:
> >
> >
> >
> > On Mon, Dec 28, 2020 at 1:15 AM David CARLIER <devnexen@gmail.com>
> wrote:
> >>
> >> From 10b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 2001
> >> From: David Carlier <devnexen@gmail.com>
> >> Date: Mon, 28 Dec 2020 08:10:43 +0000
> >> Subject: [PATCH 0/2] *** SUBJECT HERE ***
> >>
> >> bsd-user, FreeBSD update.
> >>
> >> David Carlier (2):
> >>   bsd-user, updating the FreeBSD's syscall list, based on the 11.x
> >>   bsd-user, Adding more strace support for a handful of syscalls.
> >>
> >>  bsd-user/freebsd/strace.list  | 12 ++++++++++++
> >>  bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---
> >>  2 files changed, 34 insertions(+), 3 deletions(-)
> >
> >
> > Have you seen my patches in this area? Are you familiar with the
> bsd-user efforts we've been doing at
> https://github.com/qemu-bsd-user/qemu-bsd-user We have about 300 patches
> in the queue and the more that others change things, the harder it is to
> get them in. They are a twisty maze of conflicts early in the series and
> some not-updated API calls dealing with the evolution of the qemu cpu model
> as well.
> >
> > I posted this series two weeks ago:
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05528.html
> >
> > This part
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.html
> updates the system call numbers to the latest FreeBSD 13 numbers.
> >
> > Perhaps you could help in these efforts? They have been going on since
> around Qemu 1.0 and we were bad about getting them upstreamed early, and so
> are paying the price now. We use the code in the above repo to build about
> 40k packages for a couple of different architectures.
> >
> > Warner
> >
> >>
> >> --
> >> 2.30.0.rc2
> >>
>

--0000000000005b8c7d05b7893226
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes. I&#39;ve picked 4 changes to make sure that I&#39;ve =
got the size and groupings of patches right for this project. I&#39;ve hear=
d nothing back on them, so I&#39;ll try again after the first of the year.<=
div><br></div><div>I&#39;d thought about just removing it all and pushing u=
p the current state, but I think even that might be unreviewable.</div><div=
><br></div><div>Warner</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 28, 2020 at 9:39 AM David CARLIER=
 &lt;<a href=3D"mailto:devnexen@gmail.com">devnexen@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Oh good to kno=
w I understand better why syscalls not updated for so long.<br>
<br>
To upstream I would suggest not to push straight all these changes in<br>
one shot and focus on FreeBSD at first, much less to review and so on.<br>
<br>
Regards.<br>
<br>
On Mon, 28 Dec 2020 at 16:21, Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Dec 28, 2020 at 1:15 AM David CARLIER &lt;<a href=3D"mailto:de=
vnexen@gmail.com" target=3D"_blank">devnexen@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From 10b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 =
2001<br>
&gt;&gt; From: David Carlier &lt;<a href=3D"mailto:devnexen@gmail.com" targ=
et=3D"_blank">devnexen@gmail.com</a>&gt;<br>
&gt;&gt; Date: Mon, 28 Dec 2020 08:10:43 +0000<br>
&gt;&gt; Subject: [PATCH 0/2] *** SUBJECT HERE ***<br>
&gt;&gt;<br>
&gt;&gt; bsd-user, FreeBSD update.<br>
&gt;&gt;<br>
&gt;&gt; David Carlier (2):<br>
&gt;&gt;=C2=A0 =C2=A0bsd-user, updating the FreeBSD&#39;s syscall list, bas=
ed on the 11.x<br>
&gt;&gt;=C2=A0 =C2=A0bsd-user, Adding more strace support for a handful of =
syscalls.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 bsd-user/freebsd/strace.list=C2=A0 | 12 ++++++++++++<br>
&gt;&gt;=C2=A0 bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---=
<br>
&gt;&gt;=C2=A0 2 files changed, 34 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt;<br>
&gt; Have you seen my patches in this area? Are you familiar with the bsd-u=
ser efforts we&#39;ve been doing at <a href=3D"https://github.com/qemu-bsd-=
user/qemu-bsd-user" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/qemu-bsd-user/qemu-bsd-user</a> We have about 300 patches in the queue and=
 the more that others change things, the harder it is to get them in. They =
are a twisty maze of conflicts early in the series and some not-updated API=
 calls dealing with the evolution of the qemu cpu model as well.<br>
&gt;<br>
&gt; I posted this series two weeks ago: <a href=3D"https://lists.gnu.org/a=
rchive/html/qemu-devel/2020-12/msg05528.html" rel=3D"noreferrer" target=3D"=
_blank">https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05528.html=
</a><br>
&gt;<br>
&gt; This part <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/202=
0-12/msg05530.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.=
org/archive/html/qemu-devel/2020-12/msg05530.html</a> updates the system ca=
ll numbers to the latest FreeBSD 13 numbers.<br>
&gt;<br>
&gt; Perhaps you could help in these efforts? They have been going on since=
 around Qemu 1.0 and we were bad about getting them upstreamed early, and s=
o are paying the price now. We use the code in the above repo to build abou=
t 40k packages for a couple of different architectures.<br>
&gt;<br>
&gt; Warner<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.30.0.rc2<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000005b8c7d05b7893226--

