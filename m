Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128E2CE986
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:27:18 +0100 (CET)
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl6Qv-0007p8-2Q
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kl6PU-0007OB-6k
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 03:25:48 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:46840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kl6PS-0003A3-4t
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 03:25:47 -0500
Received: by mail-il1-x143.google.com with SMTP id b8so4437640ila.13
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 00:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/TF5i4Gpjq2x74Bg7OwEl9WA0OZL7YpdQhrSnvWrv4=;
 b=OPghMrWVhw0KraiEKIxFNUIiv9v/utgcP8RFjVVwweLxyG1yQ6badbCjfRCz8Yn/a/
 K8XVmn2OQhZVNM/SPJ+hSXWZPcprNliCA96iA5H2YTPIkSI+To7TM+ncl5TP3TLFQX8G
 ZgyS/WCmMszzpdtiErIxepqQziNv5JIAYG1rIbw4pbI4WfU1rAqOLmjgWZqpx5vJTa6C
 NaCQl1EMRJIjPVMh/VbKRSzmsgnPEodsCDY7OKRg+vGNisWXYhlGsvL4LeZwcSTERFjc
 2tbQdvxblnTk0ocqfgkRuM1uVsz9zq0P9UhaxwMq8TufgrPltfbvWaovagbC7sd3OSd+
 MThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/TF5i4Gpjq2x74Bg7OwEl9WA0OZL7YpdQhrSnvWrv4=;
 b=A6rCpbPQTgbGXG89emPhe2cKYBeFYiBmBd3cPtAq0wLUs4PrzMu5ZggTdXezsWbu6d
 taBa+7hlggwJ1Cx6F/MvlbMq8V/sEnZnBDAJ2Qeh8oH+DnSCtbSPJ00mFqEXn5ljs+mK
 9mgA+yKXdE1jY7dtCCiJfKVevW0GeaZ8aWTZx7PH2k6biQL3EO+OE3zT2MxQnR3kKmYp
 tDl0KbRagv68WbFCiwemu/Ky+agHrEPoAup8wKN+OWe5pQJQasbLtMt8dV20PplaTV4x
 5dD8RuYkrCYSxJvOeWLCHjUEKtm5lAG/jYi1T6AByGPoMwQXfEmMl9OlqsXr+Q2F2kY7
 /FrQ==
X-Gm-Message-State: AOAM5302ZvIn5muyHvof1u4y8K4Tiv2xU2Nowp5HWKhr0aOn4Aux1t8S
 nyz7/71+BbP3/Ybs7KriPJ5gR6YnG1Xi3S+5J641
X-Google-Smtp-Source: ABdhPJxOUP7ZPr/TNKGDu7k4ned1HHOOyRF1U5Rs11h7us/dHdLm0ThGcpAs0FZbo8LMkEqfsiU+DKkBEQh37fbmq7w=
X-Received: by 2002:a92:98db:: with SMTP id a88mr4401294ill.106.1607070344665; 
 Fri, 04 Dec 2020 00:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
In-Reply-To: <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 4 Dec 2020 16:25:33 +0800
Message-ID: <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x143.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 17:51, Steven Price <steven.price@arm.com> wrote:
>
> On 19/11/2020 19:11, Marc Zyngier wrote:
> > On 2020-11-19 18:42, Andrew Jones wrote:
> >> On Thu, Nov 19, 2020 at 03:45:40PM +0000, Peter Maydell wrote:
> >>> On Thu, 19 Nov 2020 at 15:39, Steven Price <steven.price@arm.com> wrote:
> >>> > This series adds support for Arm's Memory Tagging Extension (MTE) to
> >>> > KVM, allowing KVM guests to make use of it. This builds on the
> >>> existing
> >>> > user space support already in v5.10-rc1, see [1] for an overview.
> >>>
> >>> > The change to require the VMM to map all guest memory PROT_MTE is
> >>> > significant as it means that the VMM has to deal with the MTE tags
> >>> even
> >>> > if it doesn't care about them (e.g. for virtual devices or if the VMM
> >>> > doesn't support migration). Also unfortunately because the VMM can
> >>> > change the memory layout at any time the check for PROT_MTE/VM_MTE has
> >>> > to be done very late (at the point of faulting pages into stage 2).
> >>>
> >>> I'm a bit dubious about requring the VMM to map the guest memory
> >>> PROT_MTE unless somebody's done at least a sketch of the design
> >>> for how this would work on the QEMU side. Currently QEMU just
> >>> assumes the guest memory is guest memory and it can access it
> >>> without special precautions...
> >>>
> >>
> >> There are two statements being made here:
> >>
> >> 1) Requiring the use of PROT_MTE when mapping guest memory may not fit
> >>    QEMU well.
> >>
> >> 2) New KVM features should be accompanied with supporting QEMU code in
> >>    order to prove that the APIs make sense.
> >>
> >> I strongly agree with (2). While kvmtool supports some quick testing, it
> >> doesn't support migration. We must test all new features with a migration
> >> supporting VMM.
> >>
> >> I'm not sure about (1). I don't feel like it should be a major problem,
> >> but (2).
>
> (1) seems to be contentious whichever way we go. Either PROT_MTE isn't
> required in which case it's easy to accidentally screw up migration, or
> it is required in which case it's difficult to handle normal guest
> memory from the VMM. I get the impression that probably I should go back
> to the previous approach - sorry for the distraction with this change.
>
> (2) isn't something I'm trying to skip, but I'm limited in what I can do
> myself so would appreciate help here. Haibo is looking into this.
>

Hi Steven,

Sorry for the later reply!

I have finished the POC for the MTE migration support with the assumption
that all the memory is mapped with PROT_MTE. But I got stuck in the test
with a FVP setup. Previously, I successfully compiled a test case to verify
the basic function of MTE in a guest. But these days, the re-compiled test
can't be executed by the guest(very weird). The short plan to verify
the migration
is to set the MTE tags on one page in the guest, and try to dump the migrated
memory contents.

I will update the status later next week!

Regards,
Haibo

> >>
> >> I'd be happy to help with the QEMU prototype, but preferably when there's
> >> hardware available. Has all the current MTE testing just been done on
> >> simulators? And, if so, are there regression tests regularly running on
> >> the simulators too? And can they test migration? If hardware doesn't
> >> show up quickly and simulators aren't used for regression tests, then
> >> all this code will start rotting from day one.
>
> As Marc says, hardware isn't available. Testing is either via the Arm
> FVP model (that I've been using for most of my testing) or QEMU full
> system emulation.
>
> >
> > While I agree with the sentiment, the reality is pretty bleak.
> >
> > I'm pretty sure nobody will ever run a migration on emulation. I also doubt
> > there is much overlap between MTE users and migration users, unfortunately.
> >
> > No HW is available today, and when it becomes available, it will be in
> > the form of a closed system on which QEMU doesn't run, either because
> > we are locked out of EL2 (as usual), or because migration is not part of
> > the use case (like KVM on Android, for example).
> >
> > So we can wait another two (five?) years until general purpose HW becomes
> > available, or we start merging what we can test today. I'm inclined to
> > do the latter.
> >
> > And I think it is absolutely fine for QEMU to say "no MTE support with KVM"
> > (we can remove all userspace visibility, except for the capability).
>
> What I'm trying to achieve is a situation where KVM+MTE without
> migration works and we leave ourselves a clear path where migration can
> be added. With hindsight I think this version of the series was a wrong
> turn - if we return to not requiring PROT_MTE then we have the following
> two potential options to explore for migration in the future:
>
>   * The VMM can choose to enable PROT_MTE if it needs to, and if desired
> we can add a flag to enforce this in the kernel.
>
>   * If needed a new kernel interface can be provided to fetch/set tags
> from guest memory which isn't mapped PROT_MTE.
>
> Does this sound reasonable?
>
> I'll clean up the set_pte_at() change and post a v6 later today.
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

