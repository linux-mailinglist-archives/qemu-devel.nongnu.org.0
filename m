Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359A67EC2A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:11:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSFU-00008k-IL; Fri, 27 Jan 2023 12:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pLSFO-0008WT-PZ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:10:42 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pLSFK-0003Cm-7U
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:10:41 -0500
Received: by mail-ej1-x633.google.com with SMTP id vw16so15379786ejc.12
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OYMQG1/L0qTXMozPM3zDqMMG2/F0RUWN5RKyEl6dhtI=;
 b=pEdHl/R3KlG3DFjPde2mv9ODDYagQHtWGyl5e1LwR/QNzIxkt8oJwMZlZtimxXvsiT
 eWcnElLREOH94zRsr4UtuLjW/u9efx66V3BVuZoW3DfGI1SfYg0f4UWGo6gwIcNiwz+x
 mmOkAAPc/AIzJbCZbdAQ0pd03DIOfSvg+Rnx+Y/oiXaVg3bl5nzbldoWhZLRI8GHEt5f
 +5+bO6p8IdiBvip6hCfXknn+o2RH/egwCZDzL6zpe1rhKmXevb6rFhRP6Sfqqiu/Gob/
 HChWGsvOCf83l2hkKWBNfbbQM9ghQtberFRgRwklo/OjGJqTokkFnzmVYW0xe1uCcf32
 Qgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OYMQG1/L0qTXMozPM3zDqMMG2/F0RUWN5RKyEl6dhtI=;
 b=r7y4QPByNvTfdeztDykfTxzVDm0IOApnlftvoCuaFDd6NmojKkQL7nP4DhGf11njk7
 sNsrDiG11XJnhl1gznVbu2y8QRF/nZXX/IiFfncDPGTyoO1+pC6fY5CI3IIV6VNODvOm
 NpNyqtKbC2ZZfBJdnBTJVr0KjHS4ehDE2Lt2ECA5jDIlfgsUu98Mt4CDsSFL1LTeZ4Cg
 xhUwOapsfO8OAu5aBrtfHHkA/UR35UU2UXuetSMJ25vew6rviFdznsqN3Kypf6JOS2pl
 e8eoxvy8znDoaUDO4dSz2adUq+cvRzmsu8giyrfzHFa9qKSciwWohMEZebQ7MaoNG6k9
 XVuw==
X-Gm-Message-State: AFqh2kpRTdaCJDw07EuvgL6wRJVoL3BTQKthhkUQApOBDqZUMCsg+jS1
 mKpm+loQgzt8fHmd1RTdd7+L6nxziVo7rzSB68symWnrTGTj3HYV
X-Google-Smtp-Source: AMrXdXsZncLeuiLq5uGWDnC581B6LyzlZCMqOAxFHDYTfai57fBoxM0kfXBc5rWRZ3y4yCFa3wN0l+9pg+sAT42UTNE=
X-Received: by 2002:a17:906:7754:b0:86f:2cc2:7028 with SMTP id
 o20-20020a170906775400b0086f2cc27028mr5251937ejn.133.1674839434429; Fri, 27
 Jan 2023 09:10:34 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
In-Reply-To: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 27 Jan 2023 10:10:23 -0700
Message-ID: <CANCZdfo=Ay6ZYniYLYC=L2DCYKQ2-sS8zxwx+J_N5jZ3PO8XPQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008b9a2005f341f143"
Received-SPF: none client-ip=2a00:1450:4864:20::633;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008b9a2005f341f143
Content-Type: text/plain; charset="UTF-8"

[[ cc list trimmed to just qemu-devel ]]

On Fri, Jan 27, 2023 at 8:18 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> Dear QEMU, KVM, and rust-vmm communities,
> QEMU will apply for Google Summer of Code 2023
> (https://summerofcode.withgoogle.com/) and has been accepted into
> Outreachy May 2023 (https://www.outreachy.org/). You can now
> submit internship project ideas for QEMU, KVM, and rust-vmm!
>
> Please reply to this email by February 6th with your project ideas.
>
> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> be a mentor. Mentors support interns as they work on their project. It's a
> great way to give back and you get to work with people who are just
> starting out in open source.
>
> Good project ideas are suitable for remote work by a competent
> programmer who is not yet familiar with the codebase. In
> addition, they are:
> - Well-defined - the scope is clear
> - Self-contained - there are few dependencies
> - Uncontroversial - they are acceptable to the community
> - Incremental - they produce deliverables along the way
>
> Feel free to post ideas even if you are unable to mentor the project.
> It doesn't hurt to share the idea!
>

I've been a GSoC mentor for the FreeBSD project on and off for maybe
10-15 years now. I thought I'd share this for feedback here.

My project idea falls between the two projects. I've been trying
to get bsd-user reviewed and upstreamed for some time now and my
time available to do the upstreaming has been greatly diminished lately.
It got me thinking: upstreaming is more than just getting patches reviewed
often times. While there is a rather mechanical aspect to it (and I could
likely
automate that aspect more), the real value of going through the review
process
is that it points out things that had been done wrong, things that need to
be
redone or refactored, etc. It's often these suggestions that lead to the
biggest
investment of time on my part: Is this idea good? if I do it, does it break
things?
Is the feedback right about what's wrong, but wrong about how to fix it?
etc.
Plus the inevitable, I thought this was a good idea, implemented it only to
find
it broke other things, and how do I explain that and provide feedback to the
reviewer about that breakage to see if it is worth pursuing further or not?

So my idea for a project is two fold: First, to create scripts to automate
the
upstreaming process: to break big files into bite-sized chunks for review on
this list. git publish does a great job from there. The current backlog to
upstream
is approximately " 175 files changed, 30270 insertions(+), 640
deletions(-)" which
is 300-600 patches at the 50-100 line patch guidance I've been given. So
even
at .1hr (6 minutes) per patch (which is about 3x faster than I can do it by
hand),
that's ~60 hours just to create the patches. Writing automation should take
much less time. Realistically, this is on the order of 10-20 hours to get
done.

Second, it's to take feedback from the reviews for refactoring
the bsd-user code base (which will eventually land in upstream). I often
spend
a few hours creating my patches each quarter, then about 10 or so hours for
the
30ish patches that I do processing the review feedback by refactoring other
things
(typically other architectures), checking details of other architectures
(usually by
looking at the FreeBSD kernel), or looking for ways to refactor to share
code with
linux-user  (though so far only the safe signals is upstream: elf could be
too), or
chatting online about the feedback to better understand it, to see what I
can mine
from linux-user (since the code is derived from that, but didn't pick up
all the changes
linus-user has), etc. This would be on the order of 100 hours.

Third, the testing infrastructure that exists for linux-user is not well
leveraged to test
bsd-user. I've done some tests from time to time with it, but it's not in a
state that it
can be used as, say, part of a CI pipeline. In addition, the FreeBSD
project has some
very large jobs, a subset of which could be used to further ensure that
critical bits of
infrastructure don't break (or are working if not in a CI pipeline). Things
like building
and using go, rust and the like are constantly breaking for reasons too
long to enumerate
here. This job could be as little as 50 hours to do a minimal but complete
enough for CI job,
or as much as 200 hours to do a more complete jobs that could be used to
bisect breakage
more quickly and give good assurance that at any given time bsd-user is
useful and working.

That's in addition to growing the number of people that can work on this
code and
on the *-user code in general since they are quite similar.

Some of these tasks are squarely in the qemu-realm, while others are in the
FreeBSD realm,
but that's similar to linux-user which requires very heavy interfacing with
the linux realm. It's
just that a lot of that work is already complete so the needs are
substantially less there on an
ongoing basis. Since it does stratal the two projects, I'm unsure where to
propose this project
be housed. But since this is a call for ideas, I thought I'd float it to
see what the feedback is. I'm
happy to write this up in a more formal sense if it would be seriously
considered, but want to get
feedback as to what areas I might want to emphasize in such a proposal.

Comments?

Warner

I will review project ideas and keep you up-to-date on QEMU's
> acceptance into GSoC.
>
> Internship program details:
> - Paid, remote work open source internships
> - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> hrs/week for 12 weeks
> - Mentored by volunteers from QEMU, KVM, and rust-vmm
> - Mentors typically spend at least 5 hours per week during the coding
> period
>
> For more background on QEMU internships, check out this video:
> https://www.youtube.com/watch?v=xNVCX7YMUL8
>
> Please let me know if you have any questions!
>
> Stefan
>
>

--0000000000008b9a2005f341f143
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>[[ cc list trimmed to just qemu-devel ]]</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 2=
7, 2023 at 8:18 AM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com=
">stefanha@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Dear QEMU, KVM, and rust-vmm communities,<br>
QEMU will apply for Google Summer of Code 2023<br>
(<a href=3D"https://summerofcode.withgoogle.com/" rel=3D"noreferrer" target=
=3D"_blank">https://summerofcode.withgoogle.com/</a>) and has been accepted=
 into<br>
Outreachy May 2023 (<a href=3D"https://www.outreachy.org/" rel=3D"noreferre=
r" target=3D"_blank">https://www.outreachy.org/</a>). You can now<br>
submit internship project ideas for QEMU, KVM, and rust-vmm!<br>
<br>
Please reply to this email by February 6th with your project ideas.<br>
<br>
If you have experience contributing to QEMU, KVM, or rust-vmm you can<br>
be a mentor. Mentors support interns as they work on their project. It&#39;=
s a<br>
great way to give back and you get to work with people who are just<br>
starting out in open source.<br>
<br>
Good project ideas are suitable for remote work by a competent<br>
programmer who is not yet familiar with the codebase. In<br>
addition, they are:<br>
- Well-defined - the scope is clear<br>
- Self-contained - there are few dependencies<br>
- Uncontroversial - they are acceptable to the community<br>
- Incremental - they produce deliverables along the way<br>
<br>
Feel free to post ideas even if you are unable to mentor the project.<br>
It doesn&#39;t hurt to share the idea!<br></blockquote><div><br></div><div>=
I&#39;ve been a GSoC mentor for the FreeBSD project on and off for maybe</d=
iv><div>10-15 years now. I thought I&#39;d share this for feedback here.</d=
iv><div><br></div><div>My project idea falls between the two projects. I&#3=
9;ve been trying</div><div>to get bsd-user reviewed and upstreamed for some=
 time now and my</div><div>time available to do the upstreaming has been gr=
eatly diminished lately.</div><div>It got me thinking: upstreaming is more =
than just getting patches reviewed</div><div>often times. While there is a =
rather mechanical aspect to it (and I could likely</div><div>automate that =
aspect more), the real value of going through the review process</div><div>=
is that it points out things that had been done wrong, things that need to =
be</div><div>redone or refactored, etc. It&#39;s often these suggestions th=
at lead to the biggest</div><div>investment of time on my part: Is this ide=
a good? if I do it, does it break things?</div><div>Is the feedback right a=
bout what&#39;s wrong, but wrong about how to fix it? etc.</div><div>Plus t=
he inevitable, I thought this was a good idea, implemented it only to find<=
/div><div>it broke other things, and how do I explain that and provide feed=
back to the</div><div>reviewer about that breakage to see if it is worth pu=
rsuing further or not?</div><div><br></div><div>So my idea for a project is=
 two fold: First, to create scripts to automate the</div><div>upstreaming p=
rocess: to break big files into bite-sized chunks for review on</div><div>t=
his list. git publish does a great job from there. The current backlog to u=
pstream</div><div>is approximately &quot;=C2=A0175 files changed, 30270 ins=
ertions(+), 640 deletions(-)&quot; which</div><div>is 300-600 patches at th=
e 50-100 line patch guidance I&#39;ve been given. So even</div><div>at .1hr=
 (6 minutes) per patch (which is about 3x faster than I can do it by hand),=
</div><div>that&#39;s ~60 hours just to create the patches. Writing automat=
ion should take</div><div>much less time. Realistically, this is on the ord=
er of 10-20 hours to get done.</div><div><br></div><div>Second, it&#39;s to=
 take feedback from the reviews for refactoring</div><div>the bsd-user code=
 base (which will eventually land in upstream). I often spend</div><div>a f=
ew hours creating my patches each quarter, then about 10 or so hours for th=
e</div><div>30ish patches that I do processing the review feedback by refac=
toring other things</div><div>(typically other architectures), checking det=
ails of other architectures (usually by</div><div>looking at the FreeBSD ke=
rnel), or looking for ways to refactor to share code with</div><div>linux-u=
ser=C2=A0 (though so far only the safe signals is upstream: elf could be to=
o), or</div><div>chatting online about the feedback to better understand it=
, to see what I can mine</div><div>from linux-user (since the code is deriv=
ed from that, but didn&#39;t pick up all the changes</div><div>linus-user h=
as), etc. This would be on the order of 100 hours.</div><div><br></div><div=
>Third, the testing infrastructure that exists for linux-user is not well l=
everaged to test</div><div>bsd-user. I&#39;ve done some tests from time to =
time with it, but it&#39;s not in a state that it</div><div>can be used as,=
 say, part of a CI pipeline. In addition, the FreeBSD project has some</div=
><div>very large jobs, a subset of which could be used to further ensure th=
at critical bits of</div><div>infrastructure don&#39;t break (or are workin=
g if not in a CI pipeline). Things like building</div><div>and using go, ru=
st and the like are constantly breaking for reasons too long to enumerate</=
div><div>here. This job could be as little as 50 hours to do a minimal but =
complete enough for CI job,</div><div>or as much as 200 hours to do a more =
complete jobs that could be used to bisect breakage</div><div>more quickly =
and give good assurance that at any given time bsd-user is useful and worki=
ng.</div><div><br></div><div><div>That&#39;s in addition to growing the num=
ber of people that can work on this code and</div><div>on the *-user code i=
n general since they are quite similar.</div></div><div><br></div><div>Some=
 of these tasks are squarely in the qemu-realm, while others are in the Fre=
eBSD realm,</div><div>but that&#39;s similar to linux-user which requires v=
ery heavy interfacing with the linux realm. It&#39;s</div><div>just that a =
lot of that work is already complete so the needs are substantially less th=
ere on an</div><div>ongoing basis. Since it does stratal the two projects, =
I&#39;m unsure where to propose this project</div><div>be housed. But since=
 this is a call for ideas, I thought I&#39;d float it to see what the feedb=
ack is. I&#39;m</div><div>happy to write this up in a more formal sense if =
it would be seriously considered, but want to get</div><div>feedback as to =
what areas I might want to emphasize in such a proposal.</div><div><br></di=
v><div>Comments?</div><div><br></div><div>Warner</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
I will review project ideas and keep you up-to-date on QEMU&#39;s<br>
acceptance into GSoC.<br>
<br>
Internship program details:<br>
- Paid, remote work open source internships<br>
- GSoC projects are 175 or 350 hours, Outreachy projects are 30<br>
hrs/week for 12 weeks<br>
- Mentored by volunteers from QEMU, KVM, and rust-vmm<br>
- Mentors typically spend at least 5 hours per week during the coding perio=
d<br>
<br>
For more background on QEMU internships, check out this video:<br>
<a href=3D"https://www.youtube.com/watch?v=3DxNVCX7YMUL8" rel=3D"noreferrer=
" target=3D"_blank">https://www.youtube.com/watch?v=3DxNVCX7YMUL8</a><br>
<br>
Please let me know if you have any questions!<br>
<br>
Stefan<br>
<br>
</blockquote></div></div>

--0000000000008b9a2005f341f143--

