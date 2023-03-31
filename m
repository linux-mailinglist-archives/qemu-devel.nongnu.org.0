Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE53F6D295D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 22:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piLHp-0006Ef-Kx; Fri, 31 Mar 2023 16:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1piLHm-0006EB-Kb
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 16:23:46 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maverickk1778@gmail.com>)
 id 1piLHk-0002QH-M9
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 16:23:46 -0400
Received: by mail-io1-xd30.google.com with SMTP id n28so5804442ioz.11
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 13:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680294223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l+vLG7Ln558V1MVTv0IQoEIbwBCBiTC1MEHQjBkDkZk=;
 b=c+EVB1Plx6VmsXM0JBL9FXamxCQy2oPES7Lb63fBiXdiLrDDDM9t/clsAf8ei4uCSx
 Dy8yL9sKEl0qseY8B+tb99V+OxDgKdMCcQ8lhZBpDlext/vvEWzqe6zXZDD/68wdky9Q
 B9S/KGfdGV0vI3S8FAqOP86aReOP2hV2YWy8Pb8HCMapKDnpU9IaciEk/ZXWCOkpOyjA
 g9AHRmU2grRRcD4qFqJzkFQnkR2Z/4nXmxV9v47hCQDhdTtod6fa3Jwp0ScU2mXpBOqZ
 FmUukE/nhRE6gdlxd1sqTmmQu+YKnkqTMaa7apYN4EOX0JLr+kZv/z0FXp0+2eUb4Vtt
 O1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680294223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l+vLG7Ln558V1MVTv0IQoEIbwBCBiTC1MEHQjBkDkZk=;
 b=MjXnZ2JYcdONzF/BBGhMj4qjD/T5PNr0iZ/xmZNADzcXM3QpRuqdYrpIFLBKwuRw7S
 k1Ou8ONkqHoQ1ZuDHBGfw+sebk9SNK13LL2oBUQ7PIcQ4YYutLJ6osEeQWzTT4BfdH3/
 ljSyXBsihVOyWAbZmoDMBOc3Sya27VlUyWzal157HMsU4Fz4okUHgJte63JdMB1wVMXG
 Z+0AGBCgwMO0xtuek1vcV0PEHlpYBO8XRZt2J5xOGCd8rmJBGk7Zuys+bCgXsQqKCPKl
 nOIR5aSw8nW3alOrJAEy9/3CLo1pe80h2HyTcyNYajqVAS8hBUeCrN/OqpU75f1kHVHa
 ad0w==
X-Gm-Message-State: AO0yUKWFuO380897ANI2iRTTmjHpygoHCP/McK6FMN9Ct00iwnIUL/DR
 yw+V7uEGHKbhkJgmM/oWhFNmav4pOHvtDxWNUhEMeWB9yAc=
X-Google-Smtp-Source: AK7set/Mi6B1QuEvbC+MRl+wRAteVHO8aSbg/D9Bp/tTn5bfIqo7+/Bs/4VjxqcmU0rakUSNtlMg8v4Qkictc1Q65qk=
X-Received: by 2002:a5d:9e12:0:b0:745:70d7:4962 with SMTP id
 h18-20020a5d9e12000000b0074570d74962mr11204965ioh.0.1680294222984; Fri, 31
 Mar 2023 13:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALfBBTsN4fCW7fR+xMvoiMvaq=a2rTshCifYA6NVrUE-+GBwQg@mail.gmail.com>
 <20230328135858.00006392@Huawei.com>
In-Reply-To: <20230328135858.00006392@Huawei.com>
From: Maverickk 78 <maverickk1778@gmail.com>
Date: Sat, 1 Apr 2023 01:53:32 +0530
Message-ID: <CALfBBTsf_s9NB867qCYq=GSUjCQRMoNjwEcUnJ4buas4iOuM-A@mail.gmail.com>
Subject: Re: Cxl devel!
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=maverickk1778@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Hi Jonathan,

Thanks for the response, effort and time you spent to list down the
TODOs in CXL space.

I just started understanding CXL2.0, am part of a startup developing a
CXL2.0 switch to build
compostable architecture, it's been 6 weeks.

As part of it I have built QEMU and configured with CXL devices as
documented in
https://stevescargall.com/blog/2022/01/20/how-to-emulate-cxl-devices-using-kvm-and-qemu/

And use your PoC code to understand the FMAPI & MCTP message flow.

Going forward I will ramp-up on the existing support in QEMU,
especially regarding the points you listed and
get used to the development/debug/test workflow, maybe I need 2-3
weeks to process all the information
you provided.

Any cheatsheets from your side will be helpful and it will help me
catch up soon.

Looking forward to working with you.

Regards
Raghu



On Tue, 28 Mar 2023 at 18:29, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 24 Mar 2023 04:32:52 +0530
> Maverickk 78 <maverickk1778@gmail.com> wrote:
>
> > Hello Jonathan
> >
> > Raghu here, I'm going over your cxl patches for past few days, it's very
> > impressive.
> >
> > I want to get involved and contribute in your endeavor, may be bits &
> > pieces to start.
> >
> > If you're specific trivial task(cvl/pcie/fm) about cxl, please let me know.
> >
> > Regards
> > Raghu
> >
>
> Hi Raghu,
>
> Great that you are interested in getting involved.
>
> As to suggestions for what to do, it's depends on what interests you.
> I'll list some broad categories and hopefully we can focus in on stuff.
>
> Following is brainstorming on the spot, so I've probably forgotten lots
> of things.   There is an out of date todo at:
> https://gitlab.com/jic23/qemu/-/wikis/TODO%20list
>
> Smallish tasks.
> 1) Increase fidelity of emulation.  In many places we take short cuts in
>    the interests of supporting 'enough' to be able to test kernel code against..
>    A classic example of this is we don't perform any of the checks we should be
>    on HDM decoders.  Tightening those restrictions up would be great. Typically that
>    involves tweaking the kernel code to try and do 'wrong' things.
>    There are some other examples of this on gitlab.com/jic23/qemu around locking of
>    registers. This is rarely as high priority as 'new features' but we will want to
>    tidy up all these loose corners eventually.
> 2) Missing features.  An example of this is the security related stuff that went into
>    the kernel recently.  Whilst that is fairly easy to check using the cxl mocking
>    driver in the kernel, I'd also like to see a QEMU implementation.
>    Some of the big features don't interact as they should.  For instance we don't report
>    poison list overflow via the event log yet.  It would be great to get this all working
>    rather than requiring injection of poison and the event as currently needed (not all
>    upstream yet).
> 3) Cleanup some of the existing emulation that we haven't upstreamed yet.
>    - CPMU. Main challenge with this is finding balance between insane commandlines
>      and flexibility.  Right now the code on gitlab.com/jic23/qemu (cxl-<latest data>)
>      provides a fairly random set of counters that were handy for testing corners
>      of the driver that's at v3 on the kernel mailing lists.
>    - Review and testing of the stuff that is on my tree (all been on list I think) but
>      not yet at the top. Fixing up problems with that in advance will save us time
>      when proposing them for upstream.
>    - SPDM / CMA.  Right now this relies on a connection to SPDM-emu.  I'd like to explore
>      if we can use libspdm as a library instead.  Last time I checked this looked non
>      trivial but the dmtf tools team are keen to help.
>
>
> Bigger stuff - note that people are already looking at some of these but they
> may be interested in some help.
> 1) An example type 2 device.  We'd probably have to invent something along the
>    lines of a simple copy offload engine.  The intent being to prove out that
>    the kernel code works.  Dan has some stuff on the git.kernel.org tree to support
>    type 2 device.
> 2) Tests.  So far we test the bios table generation and that we can start qemu with
>    different topologies. I'd love to see a test that actually brings up a region and
>    tests some reading and writing + ideally looks at result in memory devices to check
>    everything worked.
> 3) Dynamic Capacity Devices - some stuff on going related to this, but there is a lot
>    to do.  Main focus today is on MHDs.   Perhaps look at the very earl code posted
>    for switch CCIs.  We have a lot of work to do in kernel for this stuff as well.
> 4) MCTP CCI.  I posted a PoC for this a long time back.  It works but we'd need to figure
>    out how to wire it up sensibly.
>
> Jonathan
>

