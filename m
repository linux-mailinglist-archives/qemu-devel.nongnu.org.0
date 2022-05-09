Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D352041F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 20:06:14 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7lt-0008Ij-Gt
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 14:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no7kG-0007cH-Bc
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:04:32 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no7kE-00057Z-Lp
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:04:32 -0400
Received: by mail-yb1-xb35.google.com with SMTP id j2so26478721ybu.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 11:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZqEgkC3eglY2EOcmLcVtN/yFJDeYTiyxGsGrzpDhhxk=;
 b=Uaympg0OtulFo5RmzSXvtNVX5xCr41oQpYCQT/Wm/oVQbl/R4hJ79I/zLoz/XYT3ow
 kYKMzSL4FBAzofAJH/solFo+phUy+E1NLrmJitr7TBYru8ig9r+h2NZRceY3yAZHtUjw
 fxOQcx37RWQCu1SC2lYFZBeNRNGjWbp/wEWOO1YAui4DjtVUzGP62RFAElHgIQykRftI
 m5dwH8CVk3iBdsxDqKWPIAB+L4i1gmDSOulQ7B+j7EaocJrCkaLdJE4VEZoTeyGHp/Bc
 3RlQ9LFblEMKWMSHUiwV2xz+4StHWv/swukz1AKH/VPXNbI9rgOdK24AtPQvWyp2ruHd
 VfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZqEgkC3eglY2EOcmLcVtN/yFJDeYTiyxGsGrzpDhhxk=;
 b=dJXyLannlCRlXNme0e/Ni2CAS1UXsgG7V+wYwwHCfa4TdUOsiR9vOEJ4pr9aI97FqE
 3gketamjCLdF/hbIj6pw2SoU/V7acNCBTRr98AgFwrUJ4SXamfZLVXgtbdd9t6dB+7bh
 PGlwDspfhTbDPFTiz/fKTknTdhf4vudvNqXgZIAKocM6Kq/gtHPceuuPVTUm+z9iSoA9
 56m9fAJbgzYPZGfFmpWfErdG/hqkJlOKuzJD+V4mVoA+OwTLNuHNmMaMQHF9Zwvk6YyO
 i8Luld1CnsJ6OjKj4xCMbxrfep+2emcPKsLsJoE+60e5pnCGsvClPMd6jqG7Taz3VzPq
 gLwg==
X-Gm-Message-State: AOAM533DToRSTuqJhUbxPqXYTz5Odi5M+hHMhLzvPkY9ekWJrvfOhSVH
 WeB3JilxwF0aPMtjgffwFNCs78iRltS+Sfz4yYQoNQ==
X-Google-Smtp-Source: ABdhPJwDddgajOKMqN8nCmv7wAOKkVsYcmG464tECyaq/NsEEffUP9y7UyHcLbVOveIQ4Q/s+emFADUhX5+JEgG7+k0=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14695518ybq.67.1652119469666; Mon, 09
 May 2022 11:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
In-Reply-To: <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2022 19:04:17 +0100
Message-ID: <CAFEAcA8y-ZVeEHDXUv2bAwKL9EumTmrJ-Xz1r23C7Lm0yajBdQ@mail.gmail.com>
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Mon, 9 May 2022 at 18:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I'm not 100% sure how this "Other configuration control register" should be handled, but
> definitely not like this.
>
> I see you're putting control of this register into loongarch_qemu_read in
> target/loongarch/cpu.c.  Which, I suppose is fair, because this is documented as part of
> the 3A5000 cpu documentation.  But then you split out all of the devices which are *also*
> documented as part of the cpu into the board configuration.
>
> This reminds me of the memory-mapped interface that the armv7m cpu has with its own
> registers.  I believe that you need to model this similarly, where you will have a device
> that represents the cpu, and then instantiates all of the devices that are listed in the
> Loongson 3A5000 TRM -- call this ls3a to match the ls7a name you have for the 7A1000
> bridge device.
>
> When there is a write to the ls3a "Other function configuration register", the ls3a will
> need to communicate the changes to the various bits to its various sub-devices.  I do not
> think it unreasonable to have direct function calls between the components.
>
> Peter, do you have any advice from the armv7m side?

Nothing concrete. I'm not sure that we'd structure the armv7m stuff the way
we have now if we were writing it from scratch, but it's functional enough.
(In particular, if MMIO regions were part of Device rather than SysBusDevice
then I'd be tempted to suggest that CPUs with MMIO-mapped registers should
directly own their MemoryRegions for them. But they aren't, so we can't do
that.)

-- PMM

