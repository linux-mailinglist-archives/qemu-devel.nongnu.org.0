Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5320367F0D5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLWnY-0007Dt-VJ; Fri, 27 Jan 2023 17:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pLWnW-0007Dk-Q7
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:02:14 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pLWnT-0000JR-TB
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:02:14 -0500
Received: by mail-yb1-xb33.google.com with SMTP id u72so7655296ybi.7
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SHG7DYURCPz27Nn6VvMryRbqpxol2Ifnun8CrjsXcGQ=;
 b=T57bD/MBRvoepgVHMwlOpMIHyl16PcFu2tLd562v49eRSCrPGMwYKyyqCBAtBoW1Uw
 ERbck5sRjIj9vEWvPecpfYnj0Tk79hXR2OGqX7qa4LEfexQ4EpNp/BgXij4xyLLZR3Jl
 ALJluWQsH8Asqm0Oe9zlJ+3ZHsn45tHFxLV33pchRojGvp/VM7XtQkjh7MnNQoEnPveN
 b1cjrdPTe80p2HEWd/0n+qI2jZdwoRkiq2HMhiSl5cjR1DR7xMy3X+u1Ui7CcKZg6dr2
 uHAt98ubfUkLVowMgxdKa/0xr5UG2nAONa1cTgEhfTIA1Bww+mlbsj9jN1Ax/LY2esxr
 VnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SHG7DYURCPz27Nn6VvMryRbqpxol2Ifnun8CrjsXcGQ=;
 b=mrOwkTEW4K4TzH78oPsyC9o5Xu64nKrXazpBaSB9UyajQddpLjMJFEk4rPOuXjUZy+
 xNI6tMxnEomCt9HvScdLt8bia7xU/ALBSTc0lfauFYxellenq6Ky7QVgHA4M7r+wh5LP
 XOWCQwV6QYp80DnMq076Avr8dXeeBk83CHWrhWNbAdI+gMMzjVCW2sGPzJ+x35K0CM9O
 aPRl45X5zgWPbkC0x1BwRzvKkQOib7DLPklWDi6/7o0EEPfDrS6bTUA2fCyEPih7bT54
 4v1xXobT3foNmeCXsD0rH/lTh7r3dW2h94gUWJX1AjWKZIApaJ8Z5plbD3T1mvzagZ+u
 nFxA==
X-Gm-Message-State: AO0yUKXXEc1CGzOYsFKCjSb6Wh8am8Q7kN1DB2al6600vG2uHrTlSzfr
 wXobJO9ax6hNAM3HLyvDWEPvehCkjJAl/YJ7wtIJiOFq
X-Google-Smtp-Source: AK7set/7X0Fm6isQlnDlLtkVMiynxWw0MF9UBTNhr4xbmC3pYKE4eM70JyWKj/xiXhpFu6XChbryQEnVrFMsCO1tkHE=
X-Received: by 2002:a25:e0cd:0:b0:80b:7727:8363 with SMTP id
 x196-20020a25e0cd000000b0080b77278363mr1336062ybg.366.1674856930728; Fri, 27
 Jan 2023 14:02:10 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CANCZdfo=Ay6ZYniYLYC=L2DCYKQ2-sS8zxwx+J_N5jZ3PO8XPQ@mail.gmail.com>
In-Reply-To: <CANCZdfo=Ay6ZYniYLYC=L2DCYKQ2-sS8zxwx+J_N5jZ3PO8XPQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 27 Jan 2023 17:01:58 -0500
Message-ID: <CAJSP0QXFcUq4XTA6_oQAzvhs_A-PGrjTRDqhQ8N-We0jtHnRNg@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
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

On Fri, 27 Jan 2023 at 12:10, Warner Losh <imp@bsdimp.com> wrote:
>
> [[ cc list trimmed to just qemu-devel ]]
>
> On Fri, Jan 27, 2023 at 8:18 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> Dear QEMU, KVM, and rust-vmm communities,
>> QEMU will apply for Google Summer of Code 2023
>> (https://summerofcode.withgoogle.com/) and has been accepted into
>> Outreachy May 2023 (https://www.outreachy.org/). You can now
>> submit internship project ideas for QEMU, KVM, and rust-vmm!
>>
>> Please reply to this email by February 6th with your project ideas.
>>
>> If you have experience contributing to QEMU, KVM, or rust-vmm you can
>> be a mentor. Mentors support interns as they work on their project. It's a
>> great way to give back and you get to work with people who are just
>> starting out in open source.
>>
>> Good project ideas are suitable for remote work by a competent
>> programmer who is not yet familiar with the codebase. In
>> addition, they are:
>> - Well-defined - the scope is clear
>> - Self-contained - there are few dependencies
>> - Uncontroversial - they are acceptable to the community
>> - Incremental - they produce deliverables along the way
>>
>> Feel free to post ideas even if you are unable to mentor the project.
>> It doesn't hurt to share the idea!
>
>
> I've been a GSoC mentor for the FreeBSD project on and off for maybe
> 10-15 years now. I thought I'd share this for feedback here.
>
> My project idea falls between the two projects. I've been trying
> to get bsd-user reviewed and upstreamed for some time now and my
> time available to do the upstreaming has been greatly diminished lately.
> It got me thinking: upstreaming is more than just getting patches reviewed
> often times. While there is a rather mechanical aspect to it (and I could likely
> automate that aspect more), the real value of going through the review process
> is that it points out things that had been done wrong, things that need to be
> redone or refactored, etc. It's often these suggestions that lead to the biggest
> investment of time on my part: Is this idea good? if I do it, does it break things?
> Is the feedback right about what's wrong, but wrong about how to fix it? etc.
> Plus the inevitable, I thought this was a good idea, implemented it only to find
> it broke other things, and how do I explain that and provide feedback to the
> reviewer about that breakage to see if it is worth pursuing further or not?
>
> So my idea for a project is two fold: First, to create scripts to automate the
> upstreaming process: to break big files into bite-sized chunks for review on
> this list. git publish does a great job from there. The current backlog to upstream
> is approximately " 175 files changed, 30270 insertions(+), 640 deletions(-)" which
> is 300-600 patches at the 50-100 line patch guidance I've been given. So even
> at .1hr (6 minutes) per patch (which is about 3x faster than I can do it by hand),
> that's ~60 hours just to create the patches. Writing automation should take
> much less time. Realistically, this is on the order of 10-20 hours to get done.
>
> Second, it's to take feedback from the reviews for refactoring
> the bsd-user code base (which will eventually land in upstream). I often spend
> a few hours creating my patches each quarter, then about 10 or so hours for the
> 30ish patches that I do processing the review feedback by refactoring other things
> (typically other architectures), checking details of other architectures (usually by
> looking at the FreeBSD kernel), or looking for ways to refactor to share code with
> linux-user  (though so far only the safe signals is upstream: elf could be too), or
> chatting online about the feedback to better understand it, to see what I can mine
> from linux-user (since the code is derived from that, but didn't pick up all the changes
> linus-user has), etc. This would be on the order of 100 hours.
>
> Third, the testing infrastructure that exists for linux-user is not well leveraged to test
> bsd-user. I've done some tests from time to time with it, but it's not in a state that it
> can be used as, say, part of a CI pipeline. In addition, the FreeBSD project has some
> very large jobs, a subset of which could be used to further ensure that critical bits of
> infrastructure don't break (or are working if not in a CI pipeline). Things like building
> and using go, rust and the like are constantly breaking for reasons too long to enumerate
> here. This job could be as little as 50 hours to do a minimal but complete enough for CI job,
> or as much as 200 hours to do a more complete jobs that could be used to bisect breakage
> more quickly and give good assurance that at any given time bsd-user is useful and working.
>
> That's in addition to growing the number of people that can work on this code and
> on the *-user code in general since they are quite similar.
>
> Some of these tasks are squarely in the qemu-realm, while others are in the FreeBSD realm,
> but that's similar to linux-user which requires very heavy interfacing with the linux realm. It's
> just that a lot of that work is already complete so the needs are substantially less there on an
> ongoing basis. Since it does stratal the two projects, I'm unsure where to propose this project
> be housed. But since this is a call for ideas, I thought I'd float it to see what the feedback is. I'm
> happy to write this up in a more formal sense if it would be seriously considered, but want to get
> feedback as to what areas I might want to emphasize in such a proposal.
>
> Comments?

Hi Warner,
Don't worry about it spanning FreeBSD and QEMU, you're welcome to list
the project idea through QEMU. You can have co-mentors that are not
part of the QEMU community in order to bring in additional FreeBSD
expertise.

My main thought is that getting all code upstream sounds like a
sprawling project that likely won't be finished within one internship.
Can you pick just a subset of what you described? It should be a
well-defined project that depends minimally on other people finishing
stuff or reaching agreement on something controversial? That way the
intern will be able to come up with specific tasks for their project
plan and there is little risk that they can't complete them due to
outside factors.

One way to go about this might be for you to define a milestone that
involves completing, testing, and upstreaming just a subset of the
out-of-tree code. For example, it might implement a limited set of
core syscall families. The intern will then focus on delivering that
instead of worrying about the daunting task of getting everything
merged. Finishing this subset would advance bsd-user FreeBSD support
by a useful degree (e.g. ability to run certain applications).

Does that sound good?

Stefan

