Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A082EF852
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:43:38 +0100 (CET)
Received: from localhost ([::1]:55972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxfd-0004Cu-1s
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kxxdq-0003jb-2D
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:41:46 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kxxdn-0000vT-Ir
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:41:45 -0500
Received: by mail-qk1-x732.google.com with SMTP id v126so9490539qkd.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=PaqCf76Z8/+m4c+ziqwWR+P3gQU3bqtzZLdA7a12q4o=;
 b=FvhrwTFhCdXpEhOiStijMOR6iBAx4ohxCr3NkvvVj0tvmNEeAHOqXDWzrBFIKOSFSQ
 Zx6fTSZ11GaBdH9lGjHFFCHP/HLScuNZmIyb52SBsdrpjjTXbpXuU0pI/K/x5OiCKREW
 +0w678qHtfGnjRZyEHDKFVFWpbnnPGlUXl3bn0/ItltwVRIIP2o4Q15rrDq5jy675kW9
 91hMZDxWVKHuf4igqGFCrM7ipHgKWDPO26x4vmbPwscNZi5gRJJfjov0AlwEMCjuCeRM
 +uvQ9d9TtBpu9upsaFgNjkFn0Er9Zk6HKKlhqPKH+RlrwoLTUDzKbgB4eUvlB0AQ0Egl
 hQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PaqCf76Z8/+m4c+ziqwWR+P3gQU3bqtzZLdA7a12q4o=;
 b=He3ai1ePmXw+Zsg1yFmbaVL+USBSX64piF58YPeeETEu0ErqtNZqs3Bi9N5TP6lVMz
 M2wcQNkmIKlaR4LbKw5CnOkFBn5RBqSBmd7HZV8x4zbLBGGe2cGhsIHF71vPCYpkyUlc
 dzba8YATucRquBmnyjw66cb5rsBcnLVyu7I5mA4TKNYnMB7MRets6Y7ayzFVHmead0ok
 oAx7+HG6tPO/2/FUZzkeBusIg4i47RRg2bBa3/fF/BqeVaQqbwUUQB7X42g8o3rC0MGt
 X8VmW2sK7DnY9Lz2mVNe8iTRmGmvuP7J4F5zaVU8HrVWArna2wIdDLXM8iRyqsviGZid
 XiCg==
X-Gm-Message-State: AOAM530mVCeYFdAxiRqifJ4KPZyTpBpGAsJqc9VwmbXiL0DB+bA5ZcHJ
 Wwu3jfbppA5IGluJrPdHJFsLO/Ay0zLUochGhZW3Osw4zyFiBdA3
X-Google-Smtp-Source: ABdhPJz/tUVKlI5lB1DycsR1AnyRHIfYelXdEbHEkdk4SfWiZaOYeBVhH2C/+5/GeR8lzqQRyWO8Yry83Dbig3Bjh7M=
X-Received: by 2002:a37:4a4e:: with SMTP id x75mr5503544qka.89.1610134901221; 
 Fri, 08 Jan 2021 11:41:41 -0800 (PST)
MIME-Version: 1.0
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 8 Jan 2021 12:41:30 -0700
Message-ID: <CANCZdfo_CDqyG339HwNQb_K+sbsV0t+3nJMXVFf=mYrS3nsv-Q@mail.gmail.com>
Subject: qemu bsd-user plans
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d4029a05b868be62"
Received-SPF: none client-ip=2607:f8b0:4864:20::732;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x732.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d4029a05b868be62
Content-Type: text/plain; charset="UTF-8"

The FreeBSD project has rewritten bsd-user. We've been working on this for
quite some time (the earliest commits date from 2013). Maybe a dozen people
have worked on this over time, and there's 3 or 4 active developers focused
on FreeBSD changes at the moment.

For a while, we'd merge in upstream changes from qemu. This worked great
for us, but left us with a big backlog that was hard to upstream. Each of
the updates took some time, so we got a little behind.

So, a few years ago, I spent several weeks converting the tangled merge
mess into a set of linear patches and started moving that forward. This was
around the time 4.0 was released. I only managed to get the rebase forward
to 3.1 release at the time before I hit problems related to poor testing
environment making it hard to verify newer versions were still working.
Plus, we found a few bugs that took a while to resolve for a number of
reasons. Now that they are resolved, we're able to use qemu-bsd-user to
build ~30k packages for arm, and ~20k for different types of mips in
FreeBSD "ports" system. We now have great confidence that it's working well
again.

Now that those bugs are resolved, I started trying to forward-port the
two-year-old base and immediately found myself hitting a number of
problems. A big problem was that I was re-doing a lot of work that was due
to innoculous changes upstream that I wouldn't have to do if the bsd-user
changes were upstream. These changes get in the way of dealing with the
more substantial structural changes in qemu that have happened.

There had been talk of doing a remove and replace update of bsd-user. This
talk was before I managed to rebase things as far forward as 3.1 even. This
appealed to me because we've accumulated about 150 patches to date, many
quite large, and curating them into a set of maybe 400 or 500 changes to
match the size and scope of most patches I've seen posted to qemu-devel
seemed overwhelming.

However, it's been another year since that plan was hatched, and it's
become clear to me that plan won't end in success. The closest I've been
able to get is 3.1 when 4.1 was current (about 6 months behind). It's time
for a new plan.

So, my new plan is to rebase what changes I can to the tip of master and
submit those for review. I'll work with the developers on the FreeBSD side
to ensure they are included in reviews in addition to the normal qemu-devel
list. This will allow us to pare down the deltas between our code and
upstream to allow us to make progress. The changes will be held to the
standard 'makes things better'. Given how broken bsd-user is today in qemu
upstream, at first that will a very easy standard to make.

The first patch I'll submit will be changing MAINTAINERS to point to me,
since I'm acting as the point person in this effort. I'll then re-submit
some other changes that I've submitted in the past, but CC the FreeBSD
folks that are currently active (they were only CC'd to former developers
who lack the time to review).

But before I get too far down this path, I thought I'd send out what's
going on to qemu-devel so I can get feedback and adjust the plan into
something that's mutually agreeable so time I put towards this is not
wasted.

So, what do people think of these plans?

Warner

--000000000000d4029a05b868be62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The FreeBSD project has rewritten bsd-user. We&#39;ve been=
 working on this for quite some time (the earliest commits date from 2013).=
 Maybe a dozen people have worked on this over time, and there&#39;s 3 or 4=
 active developers focused on FreeBSD changes at the moment.<br><br>For a w=
hile, we&#39;d merge in upstream changes from qemu. This worked great for u=
s, but left us with a big backlog that was hard to upstream. Each of the up=
dates took some time, so we got a little behind.<br><br>So, a few years ago=
, I spent several weeks converting the tangled merge mess into a set of lin=
ear patches and started moving that forward. This was around the time 4.0 w=
as released. I only managed to get the rebase forward to 3.1 release at the=
 time before I hit problems related to poor testing environment making it h=
ard to verify newer versions were still working. Plus, we found a few bugs =
that took a while to resolve for a number of reasons. Now that they are res=
olved, we&#39;re able to use qemu-bsd-user to build ~30k packages for arm, =
and ~20k for different types of mips in FreeBSD &quot;ports&quot; system. W=
e now have great confidence that it&#39;s working well again.<br><br>Now th=
at those bugs are resolved, I started trying to forward-port the two-year-o=
ld base and immediately found myself hitting a number of problems. A big pr=
oblem was that I was re-doing a lot of work that was due to innoculous chan=
ges upstream that I wouldn&#39;t have to do if the bsd-user changes were up=
stream. These changes get in the way of dealing with the more substantial s=
tructural changes in qemu that have happened.<br><br>There had been talk of=
 doing a remove and replace update of bsd-user. This talk was before I mana=
ged to rebase things as far forward as 3.1 even. This appealed to me becaus=
e we&#39;ve accumulated about 150 patches to date, many quite large, and cu=
rating them into a set of maybe 400 or 500 changes to match the size and sc=
ope of most patches I&#39;ve seen posted to qemu-devel seemed overwhelming.=
<br><br>However, it&#39;s been another year since that plan was hatched, an=
d it&#39;s become clear to me that plan won&#39;t end in success. The close=
st I&#39;ve been able to get is 3.1 when 4.1 was current (about 6 months be=
hind). It&#39;s time for a new plan.<br><br>So, my new plan is to rebase wh=
at changes I can to the tip of master and submit those for review. I&#39;ll=
 work with the developers on the FreeBSD side to ensure they are included i=
n reviews in addition to the normal qemu-devel list. This will allow us to =
pare down the deltas between our code and upstream to allow us to make prog=
ress. The changes will be held to the standard &#39;makes things better&#39=
;. Given how broken bsd-user is today in qemu upstream, at first that will =
a very easy standard to make.<br><br>The first patch I&#39;ll submit will b=
e changing MAINTAINERS to point to me, since I&#39;m acting as the point pe=
rson in this effort. I&#39;ll then re-submit some other changes that I&#39;=
ve submitted in the past, but CC the FreeBSD folks that are currently activ=
e (they were only CC&#39;d to former developers who lack the time to review=
).<br><br>But before I get too far down this path, I thought I&#39;d send o=
ut what&#39;s going on to qemu-devel so I can get feedback and adjust the p=
lan into something that&#39;s mutually agreeable so time I put towards this=
 is not wasted.<div><br></div><div>So, what do people think of these plans?=
<br><br>Warner<br></div></div>

--000000000000d4029a05b868be62--

