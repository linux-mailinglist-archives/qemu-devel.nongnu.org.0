Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB742D2895
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 11:12:40 +0100 (CET)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmZz4-0002VU-Qq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 05:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kmZxf-00022d-IP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 05:11:11 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kmZxY-0000Fc-Ps
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 05:11:11 -0500
Received: by mail-io1-xd41.google.com with SMTP id i9so16419345ioo.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rI1cpmvfLJH6kTfoQBqKr4p1uRHaWCiCfbric7yc3oU=;
 b=dNIn3iZoh8mC1iMR2GHayG7Dmsey5468YPYG+bQp3mApwT3AV55v0utWeiH+FyfOPR
 xMzkRjQWCES+3urWzSrFaYw3Wb6CLk5ZYExO6M73Lcy3/BC+b6jefT8+jvqDEii1lF2x
 vLurTuwD53UxyuzGI1GPvxsdl68S2a/LtEPPN7Gs/868QIsRj0XslCX+xuiE+nbV5Tla
 mTC7TIWsxh8cmM/gR8PwhCMnjYpfVmc8R4cgbR0llcidfH9fN949wv7Mw6p/CPkvu8Xn
 nzfXCWhuaFRIpnfL7YveIUN2mlKKVclIhlKIkbtMa1MTRZqAb8Aj0Jw0eqyfvg3BgYtd
 xQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rI1cpmvfLJH6kTfoQBqKr4p1uRHaWCiCfbric7yc3oU=;
 b=qym0EQl7ZI+RDm0Fm6/nTjB6zv6UeL0g1bR0Jbd0BzFb7BJSsBnivuCv0WRzLlXzR8
 JNLHtkASW2/r7WL7vDYG44PI8iNLVMMzKoLAUAQFH1LflPZ9s+BrUIpVPgjBNZ6BHdBi
 aZivRIYul/sA8qJXeccGHpFinHdm3AcV6PHBPnLAgKKstQqDGJwLKit+0EvJqH1kuG/J
 AoHYdD/wxxYeCbZdNyfNoQl61E/0GxfDJN3Me5o36p9GdgddbFmIdqfEifTcVn0veyaF
 yBDDKTGjp+yNW9rUHG9UVsdi1gjxjDbsM5ei/HwoBU+5A6D5+XyyE0WwkEjgUVb1Tpyw
 9UuA==
X-Gm-Message-State: AOAM531R/4fovMQsj/j1SKLHQ2VO/8PUt6sSbqiy4M0omBlSlXftr2r3
 e6Geey+JYIa4FCy6WF7Kmyl22BlNwo/fGFw4sehQ
X-Google-Smtp-Source: ABdhPJzzChXpGASUFHrcW55NeZaQFkmopErMJ5BvtCk7RK4Qi9bfAbL4Z4qf2qaNh1ATuEArKZuiqRpucQGGwd3Fp0s=
X-Received: by 2002:a02:c608:: with SMTP id i8mr25590358jan.125.1607422263337; 
 Tue, 08 Dec 2020 02:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAJc+Z1FRJR5LHw-xZvPpeYF6+v+ZOcLt99X41xOMAbFmB2DJ2A@mail.gmail.com>
 <b77efceaec433dd98fdf2cd535a9cf40@kernel.org>
In-Reply-To: <b77efceaec433dd98fdf2cd535a9cf40@kernel.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 8 Dec 2020 18:10:51 +0800
Message-ID: <CAJc+Z1EafkLezXv=+1aPbaXo9uWpcB77iM32M70oyP6zEzacjw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd41.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Juan Quintela <quintela@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Steven Price <steven.price@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-12-08 09:51, Haibo Xu wrote:
> > On Mon, 7 Dec 2020 at 22:48, Steven Price <steven.price@arm.com> wrote:
> >>
>
> [...]
>
> >> Sounds like you are making good progress - thanks for the update. Have
> >> you thought about how the PROT_MTE mappings might work if QEMU itself
> >> were to use MTE? My worry is that we end up with MTE in a guest
> >> preventing QEMU from using MTE itself (because of the PROT_MTE
> >> mappings). I'm hoping QEMU can wrap its use of guest memory in a
> >> sequence which disables tag checking (something similar will be needed
> >> for the "protected VM" use case anyway), but this isn't something I've
> >> looked into.
> >
> > As far as I can see, to map all the guest memory with PROT_MTE in VMM
> > is a little weird, and lots of APIs have to be changed to include this
> > flag.
> > IMHO, it would be better if the KVM can provide new APIs to load/store
> > the
> > guest memory tag which may make it easier to enable the Qemu migration
> > support.
>
> On what granularity? To what storage? How do you plan to synchronise
> this
> with the dirty-log interface?

The Qemu would migrate page by page, and if one page has been migrated but
becomes dirty again, the migration process would re-send this dirty page.
The current MTE migration POC codes would try to send the page tags just after
the page data, if one page becomes dirty again, the page data and the tags would
be re-sent.

>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...

