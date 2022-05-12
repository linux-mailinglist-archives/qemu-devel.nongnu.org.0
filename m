Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E8452495A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:44:44 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5ND-0006tK-D7
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np4iX-0003Sf-1E
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:02:41 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np4iV-0002hL-As
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:02:40 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f863469afbso49023447b3.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M2Vy5VttRP5azgXjlwp/Ysbk2gFxTinyeN3lLDqNCeY=;
 b=wEODipZP/YLI3JGOqJBSUBG1Oh/o98/9bRJJSeUg9Cd5sS7MeshUBB1ufVaVt7zQ0A
 R9dfBf6jQjOiL9FJ7f2GEj7eDnHaFSJbI07w3yWcf7pEN5T+F6q8b1PqrW1c961+B8Bx
 aDLPimJAqV4zLB55zkK54mcKM9yxJtvNdDHyowzBSkCpj5WmIWthYw1K/DUENOIB059K
 lYBW4oQr7J97I713Jjrk3m3VkVA7FrxjwoCgGIZyovhZZybKAZcfW2OAKRnE5kAW8XUI
 1OjGVnIdh0maJuDV9lMj/T+HbvftMIMGKzyxDgt/tY6w9UcQvf7dTTRqtza3fqyEYI2r
 ZBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M2Vy5VttRP5azgXjlwp/Ysbk2gFxTinyeN3lLDqNCeY=;
 b=UkgQoIvlXG36Wsf8f5LDSuWrVDKxHmFVFSGFPT7jpYGgP6jJAcD5/q6aVvr5qmpDn6
 oV8UEBfg7PVLhBugZ7vrUvoIHYbZcoYWSedN6p24JTxgk+Obo5ncTfTt7WPzKfQjbfx+
 2tEBvToOZjxKSiCZGJupxtfpWQMsHZSvq7c/NUkhT8RtWLckDmik1PwU9dkICzGRb29Q
 FRVIshtvPrSgw746rUS8T8KkkMHstfpGe7G5XpdIrMQM/hKDC8yt5uU8yht3WHGvySFf
 hE1m/wV3MiECmCpfNWmAvk1juVv/LruQ1r0+9R+4yV5VL2uEj+QkO96dWpuh1ZVcB/nc
 dKNw==
X-Gm-Message-State: AOAM530tJrIJUz8AMrh1gNI2rfDHamN/OLGDvpCbyyW+KxXa+yrjmgyU
 R6ZZsS3HWSZ9VVY+ItCw/WQsFQjSTIAD0XGEc458kQ==
X-Google-Smtp-Source: ABdhPJwDI8jtFupEsbVKyNTKwSWARvInApAplAam65kueZDm2Xrpe9vFlJ/dU58DvG2GGdEhId2s+NvxNqBZqDh0zW0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr30449764ywb.257.1652346158201; Thu, 12
 May 2022 02:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <b27e80a2-56e3-8197-a1a6-0b62e3f20c5a@linaro.org>
In-Reply-To: <b27e80a2-56e3-8197-a1a6-0b62e3f20c5a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 10:02:27 +0100
Message-ID: <CAFEAcA9-MxU48vDGD90B5fUP_Dnzc0VVdnPinecF_F1J9HPsbA@mail.gmail.com>
Subject: Re: [PATCH 0/5] gicv3: Use right number of prio bits for the CPU
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 7 May 2022 at 12:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/6/22 11:21, Peter Maydell wrote:
> > This patchset fills in an odd inconsistency in our GICv3 emulation
> > that I noticed while I was doing the GICv4 work. At the moment we
> > allow the CPU to specify the number of bits of virtual priority
> > (via the ARMCPU::gic_vpribits field), but we always use 8 bits of
> > physical priority, even though to my knowledge no real Arm CPU
> > hardware has that many.
> >
> > This series makes the GICv3 emulation use a runtime-configurable
> > number of physical priority bits, and sets it to match the number
> > used by the various CPUs we implement (which is 5 for all the
> > Cortex-Axx CPUs we emulate). Because changing the number of
> > priority bits is a migration compatibility break, we use a compat
> > property to keep the number of priority bits at 8 for older
> > versions of the virt board.
> >
> > There is one TODO left in this series, which is that I don't know
> > the right value to use for the A64FX, so I've guessed that it
> > is 5, like all the Arm implementations.
> >
> > Patch 1 is an independent bugfix; patch 5 is cleanup.
> >
> > thanks
> > -- PMM
> >
> > Peter Maydell (5):
> >    hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
> >    hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
> >    hw/intc/arm_gicv3: Support configurable number of physical priority
> >      bits
> >    hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
> >    hw/intc/arm_gicv3: Provide ich_num_aprs()
> >
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; I've applied this to target-arm.next, with the 'TODO' note
for the A64FX removed, with the "retain local variable" tweak in
the last patch made, and with "cpu->gic_pribits = 5" statements added
for the new cortex-a76 and neoverse-n1 CPU types (confirmed correct
via their TRMs).

-- PMM

