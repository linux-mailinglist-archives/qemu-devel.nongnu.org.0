Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2EE40E19C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:35:20 +0200 (CEST)
Received: from localhost ([::1]:42782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQuM1-0003nf-5v
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQtkU-0006sW-8W
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:56:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQtkR-00074a-Uy
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:56:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id w17so2131990wrv.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/NXuPuG7h9Ohs5uPZKjte9gsdg347Wf5yRF8oIx/co=;
 b=UAy1I8DyidsoFE6sYocjFKuwMRdVjS9/+kvGARc4OniZao4zuhdKicm7THVLfMHLli
 rTnMtY4n+0tuQBL8/i7il/LT/XTGunpDcuX8Q/OqOszmV6lUYFdek2eONu0srsPQZ6PX
 jEoNFjTN/ixD+xUW6vBCG/mM+rxCHQoosHox1Zrv5sO3IAnCEdIFTlz2gJHnm6SPNfp6
 0tN4TU3NI6Dzpg36q3pkwpOqNiovYUp3+VQeothjm6WGKfwllTH62rxA2oVo6coRwzBe
 HW+HWGWX98GGT2dkdQJcBV33jVsZ0OmeyPwsMn6WkE1hONl4NzHxdeDJ1s8MWLE861eU
 s6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/NXuPuG7h9Ohs5uPZKjte9gsdg347Wf5yRF8oIx/co=;
 b=PS/Km/UipV51dRRSGDDo0YqKnQw4fzPCG9f58gCxGcKBw+Rf5yF0JuCBodWMcRRgvM
 l/FQJOmU6JxmsqaEy1iSf1QK3SgaUOIkhXhaNrxQZXGXpQyleU5rmHOAz05Zy67OuE9P
 ldCamYC3iQoZcioU+y+OqVjvrzfI+NRqIwGKHt123GHTwNsgDJEj5OWhHKPj6sWovJHM
 hpFB7MCQ6GPjExeytPEDJC0QQYMM+jUwz+EIAm9ybw2TY0zSyXtAMBL0V18UAIM1NkZl
 s2x65CpHwuEe4PaiSXN1xANV6P3egtJNF/34DBzv4FAThnJMmpfM7BSW8wFGL6lXYQ8x
 gCfQ==
X-Gm-Message-State: AOAM533EmnKj25VCaaMCWEoI1JNfEKicNOSx5gBlMbBycKDTRny8SX60
 o/P+D3drisAyY1zH8d5ueNHEESi9VK0alz4voXd/Yg==
X-Google-Smtp-Source: ABdhPJwL005Ey1Ks+CyhwbAYuWQbl9pXYmKdohn+7mAqofAM7XwhJeUn8KD+RbIuAeI1axPcdtdYGyBQgQJ5T1WCY64=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr6780568wrr.376.1631807786077; 
 Thu, 16 Sep 2021 08:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
In-Reply-To: <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 16:55:34 +0100
Message-ID: <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 16:30, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 16.09.21 14:24, Peter Maydell wrote:
> > On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
> >> Now that we have working system register sync, we push more target CPU
> >> properties into the virtual machine. That might be useful in some
> >> situations, but is not the typical case that users want.
> >>
> >> So let's add a -cpu host option that allows them to explicitly pass all
> >> CPU capabilities of their host CPU into the guest.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> >> Reviewed-by: Sergio Lopez <slp@redhat.com>
> >>
> >> +    /*
> >> +     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
> >> +     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97

Side note: SCTLR_EL1 is a 64-bit register, do you have anything that
prints the full 64-bits to confirm that [63:32] are indeed all 0?

> >> +     */
> >> +    ahcf->reset_sctlr = 0x30100180;
> >> +    /* OVMF chokes on boot if SPAN is not set, so default it to on */
> >> +    ahcf->reset_sctlr |= 0x00800000;
> > Isn't that just an OVMF bug ? If you want this then you need to
> > convince me why this isn't just a workaround for a buggy guest.
>
>
> I couldn't find anything in the ARMv8 spec that explicitly says "If you
> support PAN, SCTLR.SPAN should be 1 by default". It is RES1 for CPUs
> that do not implement PAN. Beware that for SPAN, "1" means disabled and
> "0" means enabled.

It's UNKNOWN on reset. So unless OVMF is relying on whatever
is launching it to set SCTLR correctly (ie there is some part of
the "firmware-to-OVMF" contract it is relying on) then it seems to
me that it's OVMF's job to initialize it to what it needs. (Lots of
SCTLR is like that.)

Linux does this here:
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/head.S?h=v5.15-rc1#n485
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/include/asm/sysreg.h?h=v5.15-rc1#n695
because the INIT_SCTLR_EL1_MMU_OFF constant includes forcing
all "this kernel expects these to be RES0/RES1 because that's all
the architectural features we know about at this time" bits to
their RESn values.

But we can probably construct an argument for why having it set
makes sense, yes.

-- PMM

