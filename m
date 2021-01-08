Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DB2EF8EB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 21:19:22 +0100 (CET)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxyEC-0005Ny-KT
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 15:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kxyD3-0004us-F5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:18:09 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kxyCx-0005Rv-2C
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:18:09 -0500
Received: by mail-qt1-x833.google.com with SMTP id 7so7480876qtp.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 12:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rl5taJ2oilOkiAkd8IBhS4BNyite4Ge8GywcCrdKpgQ=;
 b=QvdU6CF9vLgFBhgTvDpwGd6OPl5lmCqR3bipTBx5++2vc+PBXFQhGwGs6R6+XBAe+T
 SclDzq7UmQ2mZTS4w5CTyPKaptX8ODfvXRT0lhwJKDgdd5o3oTjHd5C4C+N88m8BTc2g
 OY1JVWmmkQJmSGT58jwRSLs6ThaxYYiD7S94QYTtpElBJ+XEYPz9AMPwwM6TjK8ifWyL
 NuwzYFx71WSCjqXXPaupmwQwnJo8p2UYeCwgBXAY9QsuyKe3q7rVWwexFJURI0bnzYkT
 9XytkxopvBBFYPsPw0C7RNvKYGfpthM5BBDdodz7r91yxCJ8jqRDamAu5Tb5+5clwu+/
 DXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rl5taJ2oilOkiAkd8IBhS4BNyite4Ge8GywcCrdKpgQ=;
 b=jUps9y6deAwIsow4jRRuqP6b0W0CpOBKpEF+ZqdXc6yPJ3KaGZIPl8xDDpAmBpxSiu
 FEg0NbMGn7crx8xnEncgmKVYPqYEh2G8RBhn3KPCWtNoaUG33O+EqIf/q63Wbl48RR+P
 4sa1m8mRtOjeuQ9HCaZOUr2tVAFUyqEA/dl60ClXqkUtv2F1e/gkGK1zQvknyJuRJvdW
 wWj6bvbxvLdIs3i2si2Zb/119j952MfUKl81EoxxChBquAjr/Q0r5TnNJ+h4EMG0lWzH
 jJSY0WYpITayr5E8yEGc6u6CqGk3UNSNZh5JjPQ6Rnl39zOpy9sQYUnGJGK/zf1//iaI
 9Rkw==
X-Gm-Message-State: AOAM5301SzbQ+0LoWnGwNmajGbK7pduRVrtsMriu+Ov5w0mL4VjjfkT3
 6KL6dIO/NVJO3mlmZ253Pbh5HgzYNh0tCq/Im9KrqQ==
X-Google-Smtp-Source: ABdhPJyrVT6ObHa02vjH3snGLzchpXlYqrwyq8mFIrO3J6QCXrnaF3Rv7IxUaIHaJTwGS3YL5rNOgoYw+YBXI1hlnk8=
X-Received: by 2002:ac8:70c2:: with SMTP id g2mr5039097qtp.49.1610137081680;
 Fri, 08 Jan 2021 12:18:01 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
 <CAFEAcA-UUFng5AwFgOEKiQqR3XQEQa+pBejisuFvhUqqfxMA8Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-UUFng5AwFgOEKiQqR3XQEQa+pBejisuFvhUqqfxMA8Q@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 8 Jan 2021 13:17:50 -0700
Message-ID: <CANCZdfoeQba=mO7OisVN6jvvxj4Eggd5S4_V5_vHN_B92F7ipw@mail.gmail.com>
Subject: Re: qemu bsd-user plans
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cb296505b8694052"
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
Cc: Sean Bruno <sbruno@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Alex Richardson <arichardson@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cb296505b8694052
Content-Type: text/plain; charset="UTF-8"

And add a couple of FreeBSD people I also forgot to CC.

Warner

On Fri, Jan 8, 2021 at 12:56 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Adding the people to the CC list who were on the previous discussion
> thread...
>
> -- PMM
>
>
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
> > But before I get too far down this path, I thought I'd send out what's
> going on to qemu-devel so I can get feedback and adjust the plan into
> something that's mutually agreeable so time I put towards this is not
> wasted.
> >
> > So, what do people think of these plans?
> >
> > Warner
>

--000000000000cb296505b8694052
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And add a couple of FreeBSD people I also forgot to CC.<di=
v><br></div><div>Warner</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jan 8, 2021 at 12:56 PM Peter Maydell=
 &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ad=
ding the people to the CC list who were on the previous discussion thread..=
.<br>
<br>
-- PMM<br>
<br>
<br>
On Fri, 8 Jan 2021 at 19:43, Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
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
&gt; But before I get too far down this path, I thought I&#39;d send out wh=
at&#39;s going on to qemu-devel so I can get feedback and adjust the plan i=
nto something that&#39;s mutually agreeable so time I put towards this is n=
ot wasted.<br>
&gt;<br>
&gt; So, what do people think of these plans?<br>
&gt;<br>
&gt; Warner<br>
</blockquote></div>

--000000000000cb296505b8694052--

