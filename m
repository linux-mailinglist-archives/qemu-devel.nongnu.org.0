Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E32509E6C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:19:38 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUqX-0002BX-KC
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUkU-0004lS-I0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:13:22 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:40169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUkP-0002OK-Hl
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:13:22 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ec05db3dfbso48150497b3.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gdNiRxmPbt6xiQPF9q4pd2nyY5+TNI+hIroUMZV2/QU=;
 b=LCdSPv/ZHi0+hsg83FSfNnsH19n0gkBsfhcEi994A8SpjYx+ZFhigb0s68Po/4nS+E
 5CBs3TctpQPAKZddhmjBfflZLEAgc8OyP0jGX1Nci9reiJL0IV3ZRog0rtOVphgD4dQA
 NNwgr1+UJ4n3jWrXD0yq/yeTVOYywNVQ3Vn4c7P9Jj4+IzbJuZ28W+ymIcbLHvjjNoBH
 1CoSOas+vAum40EeVnfkZ/09um0dDO77XKOh+8d8CkcmiSUyhqOeqkYOHTDh0gfsAeFy
 D1YXk/H4Ii5i+TK7NjQxtXkyHWuUcfNjM2OHqgpivVM77fo61qpRUgp2Qnm4tPFsUE5I
 5Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdNiRxmPbt6xiQPF9q4pd2nyY5+TNI+hIroUMZV2/QU=;
 b=eacIQz27W+evQU0mOYLGUReC6gU80G5bO9f3DUBV6u/xyZgl+625jLS2oX+BN1JgBK
 3BOf59gDrpf6nneMtBElnumPNIot4rD7SVDK4f6clzjyi6O2XC9f/mtAPq5tl3Ik9vpA
 qpneQUzy9ZvZ+KW1u/2FdRlHmVZjQ8Cr4gPfAc44DP4KGn6keV6Ux9RsJc4NhRI0sASi
 cmQf2LHz8tPp7VXJNrD6x2q1Ok5Cqezs56YzZcxfHGC3rwTsO7zZ0EkS4sCYR97XYWAw
 mgOBdKcumMk+hU19Z/PzjnWZC+r1u2ilRHfNEONbT+yfXABorseh/HGIHd35nLA8ym7F
 appQ==
X-Gm-Message-State: AOAM531fw0t9cryo7Hb9mcvQ/1510e/yKEVPBM1kcHfICgVHspS2J1/0
 fXY+azu4kOGXYtj/yqYUgAQR17EFm1JBT8ao735FeQ==
X-Google-Smtp-Source: ABdhPJzwuLvTrPvRgjDV2lKIfSMK/Spc4e5goUQaQKh74FkvRJWY+VfyhDbX7rs3mm3RsitIrC3xV4K7vDMezhvOwXI=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr25494275ywf.347.1650539596490; Thu, 21
 Apr 2022 04:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-9-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-9-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:13:05 +0100
Message-ID: <CAFEAcA8V2oEyKuLPh8C1HaMXj5xyYZ-NJLyrNM5DhD14B5wvpg@mail.gmail.com>
Subject: Re: [PATCH for-7.1 08/11] hw/net: Add NPCM8XX PCS Module
To: Hao Wu <wuhaotsh@google.com>
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> The PCS exists in NPCM8XX's GMAC1 and is used to control the SGMII
> PHY. This implementation contains all the default registers and
> the soft reset feature that are required to load the Linux kernel
> driver. Further features have not been implemented yet.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>

> +static uint16_t npcm_pcs_read_sr_ctl(NPCMPCSState *s, hwaddr offset)
> +{
> +    hwaddr regno = offset / sizeof(uint16_t);
> +
> +    if (regno >= NPCM_PCS_NR_SR_CTLS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: SR_CTL read offset 0x%04" HWADDR_PRIx
> +                      " is out of range.",

qemu_log_mask strings need to have a trailing "\n" (here and below)


> +static uint64_t npcm_pcs_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    NPCMPCSState *s = opaque;
> +    uint16_t v = 0;
> +
> +    if (offset == NPCM_PCS_IND_AC_BA) {
> +        v = s->indirect_access_base;
> +    } else {
> +        switch (s->indirect_access_base) {
> +        case NPCM_PCS_IND_SR_CTL:
> +            v = npcm_pcs_read_sr_ctl(s, offset);
> +            break;
> +
> +        case NPCM_PCS_IND_SR_MII:
> +            v = npcm_pcs_read_sr_mii(s, offset);
> +            break;
> +
> +        case NPCM_PCS_IND_SR_TIM:
> +            v = npcm_pcs_read_sr_tim(s, offset);
> +            break;
> +
> +        case NPCM_PCS_IND_VR_MII:
> +            v = npcm_pcs_read_vr_mii(s, offset);
> +            break;
> +
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Read with invalid indirect address base: 0x%02"

Why are you specifying a width of 2 here? The valid values are definitely
larger than 2 digits wide, so presumably invalid values probably are as well...

> +                          PRIx16 "\n", DEVICE(s)->canonical_path,
> +                          s->indirect_access_base);
> +        }
> +    }
> +
> +    trace_npcm_pcs_reg_read(DEVICE(s)->canonical_path, s->indirect_access_base,
> +                            offset, v);
> +    return v;
> +}

> +static void npcm_pcs_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);

Not sure this is the right category -- this doesn't seem to
be a network device in the usual sense.


> +# npcm_pcs.c
> +npcm_pcs_reg_read(const char *name, uint16_t indirect_access_baes, uint64_t offset, uint16_t value) "%s: IND: 0x%02" PRIx16 " offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
> +npcm_pcs_reg_write(const char *name, uint16_t indirect_access_baes, uint64_t offset, uint16_t value) "%s: IND: 0x%02" PRIx16 " offset: 0x%04" PRIx64 " value: 0x%04" PRIx16

Typo : should be "_base" I assume.


> +
>  # dp8398x.c
>  dp8393x_raise_irq(int isr) "raise irq, isr is 0x%04x"
>  dp8393x_lower_irq(void) "lower irq"
> diff --git a/include/hw/net/npcm_pcs.h b/include/hw/net/npcm_pcs.h
> new file mode 100644
> index 0000000000..bd4f71bf3c
> --- /dev/null
> +++ b/include/hw/net/npcm_pcs.h
> @@ -0,0 +1,42 @@
> +/*
> + * Nuvoton NPCM8xx PCS Module
> + *
> + * Copyright 2022 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#ifndef NPCM_PCS_H
> +#define NPCM_PCS_H
> +
> +#include "hw/sysbus.h"
> +
> +#define NPCM_PCS_NR_SR_CTLS     (0x12 / sizeof(uint16_t))
> +#define NPCM_PCS_NR_SR_MIIS     (0x20 / sizeof(uint16_t))
> +#define NPCM_PCS_NR_SR_TIMS     (0x22 / sizeof(uint16_t))
> +#define NPCM_PCS_NR_VR_MIIS     (0x1c6 / sizeof(uint16_t))
> +
> +typedef struct NPCMPCSState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +
> +    uint16_t indirect_access_base;
> +    uint16_t sr_ctl[NPCM_PCS_NR_SR_CTLS];
> +    uint16_t sr_mii[NPCM_PCS_NR_SR_MIIS];
> +    uint16_t sr_tim[NPCM_PCS_NR_SR_TIMS];
> +    uint16_t vr_mii[NPCM_PCS_NR_VR_MIIS];
> +} NPCMPCSState;
> +
> +#define TYPE_NPCM_PCS "npcm-pcs"
> +OBJECT_DECLARE_SIMPLE_TYPE(NPCMPCSState, NPCM_PCS)

OBJECT_DECLARE_SIMPLE_TYPE does the 'typedef' for you, so you
don't need to do that in your struct definition if you're using that
macro.

thanks
-- PMM

