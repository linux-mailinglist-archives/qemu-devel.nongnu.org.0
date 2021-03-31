Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D1534FD64
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:45:01 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXPH-0005rl-Pp
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRXO3-0005KK-N0
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:43:45 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRXO1-0004eH-2K
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:43:43 -0400
Received: by mail-ej1-x635.google.com with SMTP id jy13so29130950ejc.2
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMiE+kC04pZeOxkIHTZ5n+tBWqrLCoxGcq+JX9IvLEo=;
 b=lwObbBzUMPtuNRTAfP+9LHPHy1w1N5WKNsRnTjJJGrzVo4LVAvJCNgNftqwGzM3PIH
 lIbKDnRu3gq1Nd5T2ch28v4b5Qkn/0b5UzaiiLkYDH1MCoSZ7kthlpc5G6RYMyyEsrQy
 O6Sa4pbZ2CsfpMZVY95ZulHz9ZbNa2cL4KVsXQWER+/xH1Lvr6KGD0tLpeDqkDdx5gKh
 4asJXZS1MvYwi574DOLJELleYJgFVTiYrTqtekDmOuvwHgtDRSGL/3K8eqW/FHipwU2p
 7KFj7xJJ7OfLBLnWkbLyQ8WCaUxXc9WD8zKn6ypNe6DQ/F3GtDUOEPEg3kc4m4ltT3ZF
 zbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMiE+kC04pZeOxkIHTZ5n+tBWqrLCoxGcq+JX9IvLEo=;
 b=MXXRa18et5niVdKWhdYXAghwkrnmANH2S9Asmuw1/JECHlWYapJyTgWPm5jtoGFMXl
 WcmtPcYSFqGtu3Ox/tZkg7cqWHVHGUU/9qv3tcL+YQ6SQL4OAvEKw/ykhAXm0EoTjWKZ
 dMzwxKd1K2dHpNaD4gqgqnlW14i37t+58563hPs3xFFinAVQPVWpdgSOPMY29/z9f29V
 dXkANMNVW86hE2wK3//Li2HRt0PKDDY6Zauifp36Oz5Xz2bfcvoBf/P4xX36AKpqtVQm
 UeN0nKwi8UtYN9TElN1g7xaJfYg8BREdeW9w1F5FKQobrJAhRy78vOeFYRTZ91I2LnXs
 wugw==
X-Gm-Message-State: AOAM531HDWG9QBI2y0XKez3jiv9SdXYh4aqdth2bu6uHc2uAFZoZ8zaP
 I+z9m7AVbYzEDf9I2DUxA62/iv7x01UOl9Sk7fyiUQ==
X-Google-Smtp-Source: ABdhPJxePNVOCJTxN2zlZTABC9hnir9T5tWDzXH8feCD2BHVtDpCs1F2rruAs6B0UY1WbwtbW2XXbLOlllYHasnaI5w=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr2641138ejc.250.1617183818442; 
 Wed, 31 Mar 2021 02:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210311165947.27470-1-peter.maydell@linaro.org>
 <431943c3-a603-7426-273f-b5a00f10ce41@huawei.com>
In-Reply-To: <431943c3-a603-7426-273f-b5a00f10ce41@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Mar 2021 09:43:06 +0000
Message-ID: <CAFEAcA-tyxfiJ_BXOkm9SOApOnOh-hXi+dvjOP0-SqASjt5bhQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
 Leif Lindholm <leif@nuviainc.com>, kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 31 Mar 2021 at 09:59, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> [+kvmarm, Marc]
>
> On 2021/3/12 0:59, Peter Maydell wrote:
> > Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> > means that we don't provide the 6 counters that are required by the
> > Arm BSA (Base System Architecture) specification if the CPU supports
> > the Virtualization extensions.

> So I've tested it with kvm and I get the following error before
> VM startup:
>
>    "qemu-system-aarch64: Failed to retrieve host CPU features"
>
> > ---
> >   target/arm/cpu.h     |  1 +
> >   target/arm/cpu64.c   |  3 +++
> >   target/arm/cpu_tcg.c |  5 +++++
> >   target/arm/helper.c  | 29 +++++++++++++++++------------
> >   target/arm/kvm64.c   |  2 ++
> >   5 files changed, 28 insertions(+), 12 deletions(-)
>
> [...]
>
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index dff85f6db94..581335e49d3 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -566,6 +566,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >                                 ARM64_SYS_REG(3, 0, 0, 7, 1));
> >           err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
> >                                 ARM64_SYS_REG(3, 0, 0, 7, 2));
> > +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
> > +                              ARM64_SYS_REG(3, 3, 9, 12, 0));
>
> Looks like we tried to access PMCR_EL0 *before* telling kvm that
> KVM_ARM_VCPU_PMU_V3 feature should be supported, which is now
> refused by kvm [*].
>
> [*] https://git.kernel.org/torvalds/c/11663111cd49

Oops, that's embarrassing. I should have tested with KVM, and
I forgot the PMU needs special enablement :-(

I'm on holiday right now so I probably won't have time to
look at a fix for rc2. I might just revert this commit.

thanks
-- PMM

