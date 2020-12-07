Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5D2D1C65
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:54:57 +0100 (CET)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOT9-000102-S5
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmOOs-00076p-C9
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:50:30 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmOOj-0003ii-MZ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:50:30 -0500
Received: by mail-ed1-x541.google.com with SMTP id k4so15454003edl.0
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 13:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wnq1iAZeGOV5Yb1O/nbPsxk67J/+sVkSv8bXFemPnAk=;
 b=iNtEiHymaFcTLL7K//ZWuHTYQAQHFiVL/6/j5Q+DyJQFMlp5qqmJWOUQvUlXnLnQVs
 NB/Bnoq99a/UKFJaMh7MX0NWf93Mv+JXNZL3q9E/tTRwDI4D2D72HhaAvGazjFvrc4fn
 Vidlcbv80Zxifb59AhUoRIV6syCyqVboxyj6qWuktGwhtwA5EX0+h51VXA4JPCJJzxU2
 JOhodeKXE7zla2+hbzozylOb9IyMAzVh84uM+pQbSMd7xBNTnsSjhKeB95XM6POv9Tsm
 oloOpM8xwJTq1e2s4K4ac3YZGTvUlXhCzckYvaLbgo7XD8H91BL33IlxQptEESs81YA5
 3j4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wnq1iAZeGOV5Yb1O/nbPsxk67J/+sVkSv8bXFemPnAk=;
 b=kWYfhNlAp8h4lMHadKjeMwyYdWz+S+r7cbU/HwZHY9NJa1rq1nWoL3vyXMI3EwbB0i
 XTYTI6D7bRykhByatS2v1vclc3N8CV4Xmn8uLOLgBxo9V4AlFVcCJinT8qBvjdubZIkJ
 EH2YRr4VUVXi3ZnJ3mIJX+cqzwRklTOJOlqG5yNBPqubkZJkKYq1L7y06faBo4dOGDNr
 aNIy3QcfkbSdpj/ofJ+iPA6RHafS4zKaikR4r40Je9H687Rt03NfSEk3bElcrGA7Yu9C
 lkZFfL3hlSOR08Cg/vyY4z+dELAKJ0ltEmDXzCCcBkk6lz9UBnWo4x7N7h+q079wLVmX
 0nPw==
X-Gm-Message-State: AOAM530kIBgFM8kqApLS9/cW8WB7OZfr9a77CTNeuM+rFgayZBnKB0Ge
 62WyF6wwEEUOnN3A544KV34+vh6ROPWJQ7qBBB6ybQ==
X-Google-Smtp-Source: ABdhPJzkFa7GhQGZj4vGe0af7iGxN6+EvSC3QQJr7gi/0wGlNsa/ekgvyN+4DC1VO6FOBT02W8T9mu75g46qOkqyXac=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr21638925edr.251.1607377819550; 
 Mon, 07 Dec 2020 13:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
 <20201207212638.GI1289986@habkost.net>
In-Reply-To: <20201207212638.GI1289986@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 21:50:07 +0000
Message-ID: <CAFEAcA_CNHucoBoq9_jWw9HLc_WneYko5s42z853NVJZdLCGuQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 21:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
> My understanding is that there's no reason for ARM KVM to use
> another approach, and that CPUClass.do_interrupt is not really
> TCG-specific.
>
> Do we have any case where the CPUClass.do_interrupt
> implementation is really TCG-specific, or it is just a
> coincidence that most other accelerators simply don't to call the
> method?  It looks like the only cases where the
> CPUClass.do_interrupt assignment is conditional on CONFIG_TCG are
> i386 and s390x.

Looking at PPC, its kvm_handle_debug() function does a
direct call to ppc_cpu_do_interrupt(). So the code of
its do_interrupt method must be ok-for-KVM, it's just that
it doesn't use the method pointer. (It's doing the same thing
Arm is -- if a debug event turns out not to be for QEMU itself,
inject a suitable exception into the guest.)

So of our 5 KVM-supporting architectures:

 * i386 and s390x have kernel APIs for "inject suitable
   exception", don't need to call do_interrupt, and make
   the cc->do_interrupt assignment only ifdef CONFIG_TCG,
   so that the code for do_interrupt need not be compiled
   into a KVM-only binary. (In both cases the code for the
   function is in a source file that the meson.build puts
   into the source list only if CONFIG_TCG)
 * ppc and arm both need to use this code even in a KVM
   only binary. Neither of them #ifdef the cc->do_interrupt
   assignment, because there's not much point at the moment
   if you're not going to try to compile out the code.
   ppc happens to do a direct function call, and arm happens
   to go via the cc->do_interrupt pointer, but I don't
   think there's much significance in the choice either way.
   In both cases, the only places making the call are within
   architecture-specific KVM code.
 * mips KVM does neither of these things, probably because it is
   not sufficiently featureful to have run into the cases
   where you might want to re-inject an exception and it's
   not being sufficiently used in production for anybody to
   have looked at minimising the amount of code in a
   KVM-only QEMU binary for it.

So in conclusion we have a basically 50:50 split between
"use the same do_interrupt code as TCG" and "have a kernel
API to make the kernel do the work", plus one arch that
probably hasn't had to make the choice yet.   =C2=AF\_(=E3=83=84)_/=C2=AF

> Oh, I thought you were arguing that CPUClass.do_interrupt is
> not TCG_specific.

Well, I don't think it really is TCG-specific. But as
a pragmatic thing, if these two lines in the Arm code
are getting in the way of stopping us from having a
useful compile-time check that code that's not supposed
to call this method isn't calling it, I think the balance
maybe leans towards just making the direct function call.
I guess it depends whether you think people are likely to
accidentally make cc->do_interrupt calls in non-target-specific
code that gets used by KVM (which currently would crash if that
code path is exercised on x86 or s390x, but under the
proposed change would become a compile error).

thanks
-- PMM

