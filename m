Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DA2F0255
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 18:36:52 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyIAU-0003go-Cm
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 12:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kyI9L-00035i-7w
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 12:35:39 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kyI9I-0005pp-Mn
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 12:35:39 -0500
Received: by mail-qt1-x833.google.com with SMTP id b9so8753578qtr.2
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EBrbpoNLzK5iNhZbrnJHS4KKqsRtXJ7d/K/xoFpU1gY=;
 b=KbXZy4r8FSw9BW5QuiyMOehvS+ag2pJ9Ws06uXYu7trRu9bUrQJEtmvHFF/Uqu5DfW
 bQohObj/Zh4qPQuG6wiT1YiJMuTtffxjsv+ZHkPZZ1TSxl9xpU4Fb5RIRL8aSt2cQ4P5
 AtSVgP/u1P4QPJFTdWHm2MmMR8eD9kzrDnDRi/cOSuCXPV0K6SoB+CDfQDeG5Umz3eKF
 mCVbQmWiBJ5ulR2ytrsZi6oeM33L63tP9tu17BY+36f8m/edRfqaUR26jOn/gJ4R2muw
 9VPfLbumDKfQHig6gVHzCJh2kKJpLuc6EfFEoUJvrJPw14YxOcAJ75e2JokurIKBCZ9o
 d0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EBrbpoNLzK5iNhZbrnJHS4KKqsRtXJ7d/K/xoFpU1gY=;
 b=Z2M4OpZX4bbxlonN0wdxZbrKUs0ngd9yWnODxgHzaDLApBxKD7tJxcihz/dtDvPpBv
 OfG0pOS3Etm/sLqVUSXSSbA+bNIkGDtYRsLIhN/IlPV61uLrn+xUQcjWdIpmx4NwUB99
 CmZ6PvCjWkUdKq4p6NTmHFY07PvVmjkYXA1tNc0anxrZiGuIh1n+we0wDJVXhH5zg+oT
 HyBQOYpMfP3xVgbAYcILnsg9SyB/UzhPBDGeCrl8kFB0i7JHiPcC+1xQgpPS++x1757r
 164n9+cKN5DuiJEG/xd2x/pMsrTIsKlU0djw1CpwTMJ4AuLlVEhmd99A2DAYHwhUrN4p
 1yAw==
X-Gm-Message-State: AOAM533dSQWlGLL5IHxnxSKY4bQcnQb5oQCxc7vXqUudkr7lrxR+P6Yx
 lifyPFk+w39JOxivhW0+BJPytPgUNaLR6yTyyrpR1w==
X-Google-Smtp-Source: ABdhPJzl69ap7YAIuZogDZxD3vi4MFLgkjlLdqNgZVbglGk3X+9c9Oh9PLHFLYUhipCgh9Cm6h4X1Nodv37KWRUQC+k=
X-Received: by 2002:ac8:51d8:: with SMTP id d24mr8572636qtn.73.1610213735353; 
 Sat, 09 Jan 2021 09:35:35 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
 <CAFEAcA-UUFng5AwFgOEKiQqR3XQEQa+pBejisuFvhUqqfxMA8Q@mail.gmail.com>
 <CANCZdfoeQba=mO7OisVN6jvvxj4Eggd5S4_V5_vHN_B92F7ipw@mail.gmail.com>
 <CACNAnaFAOdZMiJxVvn_7E=Gh_s0iadkyp4g=rppe4uBtmWbhwQ@mail.gmail.com>
In-Reply-To: <CACNAnaFAOdZMiJxVvn_7E=Gh_s0iadkyp4g=rppe4uBtmWbhwQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 9 Jan 2021 10:35:24 -0700
Message-ID: <CANCZdfphNtg-k_YfEWeHEGPhvM-2T99xitz9GRZsbcH3qOsBhQ@mail.gmail.com>
Subject: Re: qemu bsd-user plans
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000b5799a05b87b196f"
Received-SPF: none client-ip=2607:f8b0:4864:20::833;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x833.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Bruno <sbruno@freebsd.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5799a05b87b196f
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 9, 2021 at 10:03 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Fri, 8 Jan 2021 at 19:43, Warner Losh <imp@bsdimp.com> wrote:
> >
> > The FreeBSD project has rewritten bsd-user. We've been working on this
> for quite some time (the earliest commits date from 2013). Maybe a dozen
> people have worked on this over time, and there's 3 or 4 active developers
> focused on FreeBSD changes at the moment.
> >
> > For a while, we'd merge in upstream changes from qemu. This worked great
> for us, but left us with a big backlog that was hard to upstream. Each of
> the updates took some time, so we got a little behind.
> >
> > So, a few years ago, I spent several weeks converting the tangled merge
> mess into a set of linear patches and started moving that forward. This was
> around the time 4.0 was released. I only managed to get the rebase forward
> to 3.1 release at the time before I hit problems related to poor testing
> environment making it hard to verify newer versions were still working.
> Plus, we found a few bugs that took a while to resolve for a number of
> reasons. Now that they are resolved, we're able to use qemu-bsd-user to
> build ~30k packages for arm, and ~20k for different types of mips in
> FreeBSD "ports" system. We now have great confidence that it's working well
> again.
> >
> > Now that those bugs are resolved, I started trying to forward-port the
> two-year-old base and immediately found myself hitting a number of
> problems. A big problem was that I was re-doing a lot of work that was due
> to innoculous changes upstream that I wouldn't have to do if the bsd-user
> changes were upstream. These changes get in the way of dealing with the
> more substantial structural changes in qemu that have happened.
> >
> > There had been talk of doing a remove and replace update of bsd-user.
> This talk was before I managed to rebase things as far forward as 3.1 even.
> This appealed to me because we've accumulated about 150 patches to date,
> many quite large, and curating them into a set of maybe 400 or 500 changes
> to match the size and scope of most patches I've seen posted to qemu-devel
> seemed overwhelming.
> >
> > However, it's been another year since that plan was hatched, and it's
> become clear to me that plan won't end in success. The closest I've been
> able to get is 3.1 when 4.1 was current (about 6 months behind). It's time
> for a new plan.
> >
>
> As one of the developers on the FreeBSD side, I agree with this. In
> addition to the reasons cited, reintroducing it would really take a
> lot more time and effort and I'm not convinced it would ever be
> completed because, IMO, going that route should really entail
> redesigning it from the ground-up based on an abstraction of
> linux-user. I find that right now I'm playing a lot of catch-up
> because we seem to be largely copied from linux-user without later
> improvement; there is a really healthy amount of platform-independent
> stuff that really should end up ultimately shared in a qemu-user or
> something to that effect to mitigate duplication of effort.
>

Yes. Once we have things upstream the normal 'refactoring' work can be done
there, rather than in a side repo where it will quickly go stale. Also,
once it's in upstream, then the NetBSD and OpenBSD folks can come back to
the table with a much smaller delta to get things working again than they
have today.


> > So, my new plan is to rebase what changes I can to the tip of master and
> submit those for review. I'll work with the developers on the FreeBSD side
> to ensure they are included in reviews in addition to the normal qemu-devel
> list. This will allow us to pare down the deltas between our code and
> upstream to allow us to make progress. The changes will be held to the
> standard 'makes things better'. Given how broken bsd-user is today in qemu
> upstream, at first that will a very easy standard to make.
> >
> > The first patch I'll submit will be changing MAINTAINERS to point to me,
> since I'm acting as the point person in this effort. I'll then re-submit
> some other changes that I've submitted in the past, but CC the FreeBSD
> folks that are currently active (they were only CC'd to former developers
> who lack the time to review).
> >
>
> Thanks for taking this on!
>

You bet.

Warner

--000000000000b5799a05b87b196f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 9, 2021 at 10:03 AM Kyle =
Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 8=
 Jan 2021 at 19:43, Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The FreeBSD project has rewritten bsd-user. We&#39;ve been working on =
this for quite some time (the earliest commits date from 2013). Maybe a doz=
en people have worked on this over time, and there&#39;s 3 or 4 active deve=
lopers focused on FreeBSD changes at the moment.<br>
&gt;<br>
&gt; For a while, we&#39;d merge in upstream changes from qemu. This worked=
 great for us, but left us with a big backlog that was hard to upstream. Ea=
ch of the updates took some time, so we got a little behind.<br>
&gt;<br>
&gt; So, a few years ago, I spent several weeks converting the tangled merg=
e mess into a set of linear patches and started moving that forward. This w=
as around the time 4.0 was released. I only managed to get the rebase forwa=
rd to 3.1 release at the time before I hit problems related to poor testing=
 environment making it hard to verify newer versions were still working. Pl=
us, we found a few bugs that took a while to resolve for a number of reason=
s. Now that they are resolved, we&#39;re able to use qemu-bsd-user to build=
 ~30k packages for arm, and ~20k for different types of mips in FreeBSD &qu=
ot;ports&quot; system. We now have great confidence that it&#39;s working w=
ell again.<br>
&gt;<br>
&gt; Now that those bugs are resolved, I started trying to forward-port the=
 two-year-old base and immediately found myself hitting a number of problem=
s. A big problem was that I was re-doing a lot of work that was due to inno=
culous changes upstream that I wouldn&#39;t have to do if the bsd-user chan=
ges were upstream. These changes get in the way of dealing with the more su=
bstantial structural changes in qemu that have happened.<br>
&gt;<br>
&gt; There had been talk of doing a remove and replace update of bsd-user. =
This talk was before I managed to rebase things as far forward as 3.1 even.=
 This appealed to me because we&#39;ve accumulated about 150 patches to dat=
e, many quite large, and curating them into a set of maybe 400 or 500 chang=
es to match the size and scope of most patches I&#39;ve seen posted to qemu=
-devel seemed overwhelming.<br>
&gt;<br>
&gt; However, it&#39;s been another year since that plan was hatched, and i=
t&#39;s become clear to me that plan won&#39;t end in success. The closest =
I&#39;ve been able to get is 3.1 when 4.1 was current (about 6 months behin=
d). It&#39;s time for a new plan.<br>
&gt;<br>
<br>
As one of the developers on the FreeBSD side, I agree with this. In<br>
addition to the reasons cited, reintroducing it would really take a<br>
lot more time and effort and I&#39;m not convinced it would ever be<br>
completed because, IMO, going that route should really entail<br>
redesigning it from the ground-up based on an abstraction of<br>
linux-user. I find that right now I&#39;m playing a lot of catch-up<br>
because we seem to be largely copied from linux-user without later<br>
improvement; there is a really healthy amount of platform-independent<br>
stuff that really should end up ultimately shared in a qemu-user or<br>
something to that effect to mitigate duplication of effort.<br></blockquote=
><div><br></div><div>Yes. Once we have things upstream the normal &#39;refa=
ctoring&#39; work can be done there, rather than in a side repo where it wi=
ll quickly go stale. Also, once it&#39;s in upstream, then the NetBSD and O=
penBSD folks can come back to the table with a much smaller delta to get th=
ings working again than they have today.</div><div>=C2=A0<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; So, my new plan is to rebase what changes I can to the tip of master a=
nd submit those for review. I&#39;ll work with the developers on the FreeBS=
D side to ensure they are included in reviews in addition to the normal qem=
u-devel list. This will allow us to pare down the deltas between our code a=
nd upstream to allow us to make progress. The changes will be held to the s=
tandard &#39;makes things better&#39;. Given how broken bsd-user is today i=
n qemu upstream, at first that will a very easy standard to make.<br>
&gt;<br>
&gt; The first patch I&#39;ll submit will be changing MAINTAINERS to point =
to me, since I&#39;m acting as the point person in this effort. I&#39;ll th=
en re-submit some other changes that I&#39;ve submitted in the past, but CC=
 the FreeBSD folks that are currently active (they were only CC&#39;d to fo=
rmer developers who lack the time to review).<br>
&gt;<br>
<br>
Thanks for taking this on!<br></blockquote><div><br></div><div>You bet.</di=
v><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000b5799a05b87b196f--

