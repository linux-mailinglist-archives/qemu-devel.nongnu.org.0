Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9A2B9849
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:45:56 +0100 (CET)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfn4F-0007l2-7Y
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfmyU-0000Rz-Kk
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:39:58 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfmyS-0006MG-IX
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:39:58 -0500
Received: by mail-ej1-x642.google.com with SMTP id o21so8824185ejb.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wHCeV+0wASxa7xKuZTzPc3uHjiByPnCWQmQdnty1SfE=;
 b=K7bWQ0Zc34TB663V4lX0Qpf54I3JpW4/Qv0E3aCd2FzmNzPEhOljrgVnmphkmOB1dc
 a6SoyQVZUAEKpTTkmOmFxaWEbyIHfNU1t5s4H+FGnQfBh3yN4A0dv3Jjpn7D4gdQJdwO
 Ju3cHL9f6IDj08kfEWIO22b2kY0KCvZqLgRoc06QwAaZrdQx8LsgIRI/fXWLbGC17jXb
 HMMexFgaVR1tx6U/qzRdJJFqAt6ocD2O2c/l/aEEZF7tOOrDJWmaySSX9sKRw4Ov4wXs
 joWmgV0j3pVCynbuzQOj93EchianKE39W9JT+KbSmq6jMP9MZyZAwS+f/yKTtTxNhQj6
 GEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wHCeV+0wASxa7xKuZTzPc3uHjiByPnCWQmQdnty1SfE=;
 b=SWgjRJLNTwZm7pcJ7YRyuA0YBzeU2aWsf0baQ4YIEsHq8ojdB5CDmXTvY49UrxVXNv
 +ap2hoQA0CbG3OVbSWGNQSgqsC8PgkSRVXT45OtkLPvvFnqOK0H0rbnxvWUWXJ0hf0KG
 fuSJity1ASWiAYWS5QbD0CL/X4t86VZN1vznPMKM0myXC8wKjNdp6OJHyuE0jIB2XbuI
 85OeXN4fb2k7lxeW87dvXs/jfJWsUCynlszcmXEumE5v1wTpkminkF5kF5pWtghL4Sw/
 0ogHhrXAL2znwDLiVoDA9eBzKo+7AWSTiw1LMi6R8taO+Q+vorQf4lrLRtJQmY2Fz7Zb
 9WAA==
X-Gm-Message-State: AOAM531U7BWp5DrzctUOS4JfIZ2A+jyEVQNHm8NOYV2Ws6/YA0Uy1E30
 PqSm7+MPmr4HE+99YO+j/fUbVI+OeLKzllv2O1KBRw==
X-Google-Smtp-Source: ABdhPJxohkqohF8Rold75mHYphEqgvgYH008wPvAAASt8psj0r6y3aoUKE/wT9nNKiSdXCRUmbbTz2P3mxtXYvrp7Oo=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr28777718ejb.85.1605803992789; 
 Thu, 19 Nov 2020 08:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <b434977d-08d7-f753-f95c-81fc533cae0a@arm.com>
In-Reply-To: <b434977d-08d7-f753-f95c-81fc533cae0a@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 16:39:41 +0000
Message-ID: <CAFEAcA_navHXiwJOwWas-TXdVhxY_kJjVNxHvDCY4ArizH_CQQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 15:57, Steven Price <steven.price@arm.com> wrote:
> On 19/11/2020 15:45, Peter Maydell wrote:
> > I'm a bit dubious about requring the VMM to map the guest memory
> > PROT_MTE unless somebody's done at least a sketch of the design
> > for how this would work on the QEMU side. Currently QEMU just
> > assumes the guest memory is guest memory and it can access it
> > without special precautions...
>
> I agree this needs some investigation - I'm hoping Haibo will be able to
> provide some feedback here as he has been looking at the QEMU support.
> However the VMM is likely going to require some significant changes to
> ensure that migration doesn't break, so either way there's work to be done.
>
> Fundamentally most memory will need a mapping with PROT_MTE just so the
> VMM can get at the tags for migration purposes, so QEMU is going to have
> to learn how to treat guest memory specially if it wants to be able to
> enable MTE for both itself and the guest.

If the only reason the VMM needs tag access is for migration it
feels like there must be a nicer way to do it than by
requiring it to map the whole of the guest address space twice
(once for normal use and once to get the tags)...

Anyway, maybe "must map PROT_MTE" is workable, but it seems
a bit premature to fix the kernel ABI as working that way
until we are at least reasonably sure that it is the right
design.

thanks
-- PMM

