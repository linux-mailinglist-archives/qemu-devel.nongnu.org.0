Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9CD68FCA0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 02:25:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPvh3-0008K1-WA; Wed, 08 Feb 2023 20:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPvh2-0008Jd-FO
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 20:25:44 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pPvh0-0001fI-1h
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 20:25:44 -0500
Received: by mail-yb1-xb34.google.com with SMTP id q9so660259ybk.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 17:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zlD1dJi/BZR32qy29073xPTAr3hvz4F/Euc0BZ1YlMc=;
 b=o+5AXyPf4N7P86fOohQbIVyeeytAhU91B6Ze+oEisI3coowJ/LcH7VTld9vDv3XdZ5
 DqPlb1z3GNgNXttqPl48qlgsnJQQaxC//L6hCyQ7sCKIa+GFMB7IBrx2BqI249ObyyJ0
 BiR2xpd01gMDZt0gNGC6wdT44nbxftc2C6r15SXE1Gjn9xSj6fmA6XM+VHer/C1oilNL
 GCLg37bVe05+063+9VvRpAy9Og9LHjtSvq9kD9EEYFxZTNivx+zZbtFYrEtIZeDM1SFS
 J1puDVrMGxIqB0PWL6cEzKsyDIfSgFeGH9pjVQZR9NCD5814mb8rWLdm0wOQSDEQuASm
 q8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zlD1dJi/BZR32qy29073xPTAr3hvz4F/Euc0BZ1YlMc=;
 b=ptXXk+dOazymNH9ERmTNNggy3HBg6fvwTM0zT+1NpqOr18psDph9EIGv402LItLxIY
 Owb9T1l6Jz50Rk+JYvIfA+Pi8oOLqp5R9MMrmSIBb7hEl4GlC0XDGJOFHCI+4ME2tK38
 QTcwC42KbtyVMwLm/x5fPMose5vk8PdKcOUQ9U6rHbDGbNrOl3YMPxOTEd1i0CW7OIZO
 Xdxmcpy9oKmhJ9ep8zk7Nn4ag3CATMc1Hx8IimyCUQuazx97LPy5uGEH4Tzb7t+jgAmK
 9KM96DpxknvVQllXr06dQGiU0kgh8x0JsrVxq3pNdpJE3JwqaW8/5bzQuwjGQVamVhmF
 c/8g==
X-Gm-Message-State: AO0yUKXVD8VjNlDnBzyGlCt5TOrDsMRvz6+49FuhD2Xxo1gEIYUvpz3P
 S0g1nBT3Zg13WPHmdFYdayJ9z+dU0XVu8r1eES3DHVMQ4Ns=
X-Google-Smtp-Source: AK7set8vYJX50vSQw43thJOSE58hreINvBZJVSTZBqB9XQitoLMk2fGaRKU0E8atJ6Xd+7TV/QTalvizcJnLNo3zhYs=
X-Received: by 2002:a5b:b8f:0:b0:8ca:26ed:3f5b with SMTP id
 l15-20020a5b0b8f000000b008ca26ed3f5bmr260343ybq.366.1675905940850; Wed, 08
 Feb 2023 17:25:40 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CANCZdfo=Ay6ZYniYLYC=L2DCYKQ2-sS8zxwx+J_N5jZ3PO8XPQ@mail.gmail.com>
 <CAJSP0QXFcUq4XTA6_oQAzvhs_A-PGrjTRDqhQ8N-We0jtHnRNg@mail.gmail.com>
 <CANCZdfp0LJTkG1cPF0W0Oc8cJ2wW_+mxeSW7YWWtkCNjdkx3Jg@mail.gmail.com>
In-Reply-To: <CANCZdfp0LJTkG1cPF0W0Oc8cJ2wW_+mxeSW7YWWtkCNjdkx3Jg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 8 Feb 2023 20:25:28 -0500
Message-ID: <CAJSP0QXOgUgkF9St9MyBw=02WRPSwg4fX4R5EsPfZLoL0a1yRA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 8 Feb 2023 at 18:02, Warner Losh <imp@bsdimp.com> wrote:
> On Fri, Jan 27, 2023 at 3:02 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> On Fri, 27 Jan 2023 at 12:10, Warner Losh <imp@bsdimp.com> wrote:
>> >
>> > [[ cc list trimmed to just qemu-devel ]]
>> >
>> > On Fri, Jan 27, 2023 at 8:18 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> >>
>> >> Dear QEMU, KVM, and rust-vmm communities,
>> >> QEMU will apply for Google Summer of Code 2023
>> >> (https://summerofcode.withgoogle.com/) and has been accepted into
>> >> Outreachy May 2023 (https://www.outreachy.org/). You can now
>> >> submit internship project ideas for QEMU, KVM, and rust-vmm!
>> >>
>> >> Please reply to this email by February 6th with your project ideas.
>> >>
>> >> If you have experience contributing to QEMU, KVM, or rust-vmm you can
>> >> be a mentor. Mentors support interns as they work on their project. It's a
>> >> great way to give back and you get to work with people who are just
>> >> starting out in open source.
>> >>
>> >> Good project ideas are suitable for remote work by a competent
>> >> programmer who is not yet familiar with the codebase. In
>> >> addition, they are:
>> >> - Well-defined - the scope is clear
>> >> - Self-contained - there are few dependencies
>> >> - Uncontroversial - they are acceptable to the community
>> >> - Incremental - they produce deliverables along the way
>> >>
>> >> Feel free to post ideas even if you are unable to mentor the project.
>> >> It doesn't hurt to share the idea!
>> >
>> >
>> > I've been a GSoC mentor for the FreeBSD project on and off for maybe
>> > 10-15 years now. I thought I'd share this for feedback here.
>> >
>> > My project idea falls between the two projects. I've been trying
>> > to get bsd-user reviewed and upstreamed for some time now and my
>> > time available to do the upstreaming has been greatly diminished lately.
>> > It got me thinking: upstreaming is more than just getting patches reviewed
>> > often times. While there is a rather mechanical aspect to it (and I could likely
>> > automate that aspect more), the real value of going through the review process
>> > is that it points out things that had been done wrong, things that need to be
>> > redone or refactored, etc. It's often these suggestions that lead to the biggest
>> > investment of time on my part: Is this idea good? if I do it, does it break things?
>> > Is the feedback right about what's wrong, but wrong about how to fix it? etc.
>> > Plus the inevitable, I thought this was a good idea, implemented it only to find
>> > it broke other things, and how do I explain that and provide feedback to the
>> > reviewer about that breakage to see if it is worth pursuing further or not?
>> >
>> > So my idea for a project is two fold: First, to create scripts to automate the
>> > upstreaming process: to break big files into bite-sized chunks for review on
>> > this list. git publish does a great job from there. The current backlog to upstream
>> > is approximately " 175 files changed, 30270 insertions(+), 640 deletions(-)" which
>> > is 300-600 patches at the 50-100 line patch guidance I've been given. So even
>> > at .1hr (6 minutes) per patch (which is about 3x faster than I can do it by hand),
>> > that's ~60 hours just to create the patches. Writing automation should take
>> > much less time. Realistically, this is on the order of 10-20 hours to get done.
>> >
>> > Second, it's to take feedback from the reviews for refactoring
>> > the bsd-user code base (which will eventually land in upstream). I often spend
>> > a few hours creating my patches each quarter, then about 10 or so hours for the
>> > 30ish patches that I do processing the review feedback by refactoring other things
>> > (typically other architectures), checking details of other architectures (usually by
>> > looking at the FreeBSD kernel), or looking for ways to refactor to share code with
>> > linux-user  (though so far only the safe signals is upstream: elf could be too), or
>> > chatting online about the feedback to better understand it, to see what I can mine
>> > from linux-user (since the code is derived from that, but didn't pick up all the changes
>> > linus-user has), etc. This would be on the order of 100 hours.
>> >
>> > Third, the testing infrastructure that exists for linux-user is not well leveraged to test
>> > bsd-user. I've done some tests from time to time with it, but it's not in a state that it
>> > can be used as, say, part of a CI pipeline. In addition, the FreeBSD project has some
>> > very large jobs, a subset of which could be used to further ensure that critical bits of
>> > infrastructure don't break (or are working if not in a CI pipeline). Things like building
>> > and using go, rust and the like are constantly breaking for reasons too long to enumerate
>> > here. This job could be as little as 50 hours to do a minimal but complete enough for CI job,
>> > or as much as 200 hours to do a more complete jobs that could be used to bisect breakage
>> > more quickly and give good assurance that at any given time bsd-user is useful and working.
>> >
>> > That's in addition to growing the number of people that can work on this code and
>> > on the *-user code in general since they are quite similar.
>> >
>> > Some of these tasks are squarely in the qemu-realm, while others are in the FreeBSD realm,
>> > but that's similar to linux-user which requires very heavy interfacing with the linux realm. It's
>> > just that a lot of that work is already complete so the needs are substantially less there on an
>> > ongoing basis. Since it does stratal the two projects, I'm unsure where to propose this project
>> > be housed. But since this is a call for ideas, I thought I'd float it to see what the feedback is. I'm
>> > happy to write this up in a more formal sense if it would be seriously considered, but want to get
>> > feedback as to what areas I might want to emphasize in such a proposal.
>> >
>> > Comments?
>>
>> Hi Warner,
>> Don't worry about it spanning FreeBSD and QEMU, you're welcome to list
>> the project idea through QEMU. You can have co-mentors that are not
>> part of the QEMU community in order to bring in additional FreeBSD
>> expertise.
>>
>> My main thought is that getting all code upstream sounds like a
>> sprawling project that likely won't be finished within one internship.
>> Can you pick just a subset of what you described? It should be a
>> well-defined project that depends minimally on other people finishing
>> stuff or reaching agreement on something controversial? That way the
>> intern will be able to come up with specific tasks for their project
>> plan and there is little risk that they can't complete them due to
>> outside factors.
>
>
> I like this notion of limiting the  scope. There's three or maybe four main areas
> that I can call out. I got to thinking about all the details I have to do for how
> I've been upstreaming things, and realized that there's a lot due to the complicated
> history here...
>
>> One way to go about this might be for you to define a milestone that
>> involves completing, testing, and upstreaming just a subset of the
>> out-of-tree code. For example, it might implement a limited set of
>> core syscall families. The intern will then focus on delivering that
>> instead of worrying about the daunting task of getting everything
>> merged. Finishing this subset would advance bsd-user FreeBSD support
>> by a useful degree (e.g. ability to run certain applications).
>>
>> Does that sound good?
>
>
> Yes. I like this, but it's hard to know what that might be because many things are
> hidden behind the scenes... But I'll try running a quick build to see if I can gather
> enough stats to come up with a good set of tests... But maybe I'll start with building
> 'hello world' with clang on armv7 running on an amd64 host to see what's missing
> today. I also have an aarch64 set of patches I might try hard to get in ASAP so that
> might be the target instead (since it might be a bit more useful).

Hi Warner,
Great to hear back from you. Don't worry if you don't have the details
right now. I have created a placeholder on the ideas list that you can
fill in over the coming days:
https://wiki.qemu.org/Internships/ProjectIdeas/FreeBSDUser

You can either reply via email and I'll post your project description
on the wiki, or feel free to edit the above wiki page directly.

Thanks,
Stefan

