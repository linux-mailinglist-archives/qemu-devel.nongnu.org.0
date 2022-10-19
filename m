Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CAD60510B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 22:09:54 +0200 (CEST)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olFNx-0001GM-Nu
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 16:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olFLl-00084J-IW
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 16:07:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olFLW-0008QK-OB
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 16:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666210039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zuhJbAgevZhYQIgB4M0gLNgTtbVMni6J+ZHX+ty1PI=;
 b=CKMKVfiMr6KV4yEHtNwDrcYSmGjWjt15CgwYp/HsqhXK5pzvb3yQhc1mxsobHpJAAExK50
 jZ5v3FOaqTPoblPHrABI+rgY7iNHP1aEpQol2/V6HSXIsb+h9HtE1TAgFL81/FjRMnwcNr
 MX6H6FB7lmgpnZtJraytf5+OyYLG5Ao=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-eEomAsIPNTWh4zRTs9tgWA-1; Wed, 19 Oct 2022 16:07:08 -0400
X-MC-Unique: eEomAsIPNTWh4zRTs9tgWA-1
Received: by mail-qv1-f72.google.com with SMTP id
 lu3-20020a0562145a0300b004b1d6f4130eso11259510qvb.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 13:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9zuhJbAgevZhYQIgB4M0gLNgTtbVMni6J+ZHX+ty1PI=;
 b=KSpZMHwaR+4T+jBOo5kCyS/W4b5PgctQvfn86mj7aO5wT3zFY6jd5TWdQ4WJ8SCSxT
 QNui8Fb+IHmWgvbAWwKrSyFItSfQo2jWZawKgbnjRtAAI6g5Nl7Pb/LkdVGZh80bEu9t
 FLtPCMaw85fggUfTvNsmoMO6LRLYVKy5rTFnMVR5IhyukMWUoB3s01lnc7Mr/QDjaWd1
 mXB2NYdFXiD4F5PU0tU3VXvSV6l/9GGmJTl6pOKRtH3v2cM76bdt4xiJWfIMWgk5pyKk
 McH++HsqHMXrhqonmmp2YcYSdyh3h4QRHQQLN1N2Hdd34dTTpN98Raa4tl/LcVXmNtD0
 y1pw==
X-Gm-Message-State: ACrzQf1r3Gl9/CU+QDWQootQDq9gCHzH0cRP4gC+0KC+plgq34KRdOVo
 kiPR8qufgvLOWy+kPt1fL6uQJgkHyywoMmMStVFJ311hcNZeqy/4qG8TBSqC+xJ4D4EX0dRsC2r
 HF4qK5tK0UvVDkPo=
X-Received: by 2002:a05:6214:3017:b0:4b1:bfdc:d4c1 with SMTP id
 ke23-20020a056214301700b004b1bfdcd4c1mr8297321qvb.42.1666210027482; 
 Wed, 19 Oct 2022 13:07:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4icgwv5M9ApP4fwlV2bK7Nmi5y49cime+FJBeEhlnAqFm6G0ZtEvbW+TZA0GlsAxj3l3GHhw==
X-Received: by 2002:a05:6214:3017:b0:4b1:bfdc:d4c1 with SMTP id
 ke23-20020a056214301700b004b1bfdcd4c1mr8297299qvb.42.1666210027190; 
 Wed, 19 Oct 2022 13:07:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05620a298800b006be8713f742sm5851738qkp.38.2022.10.19.13.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 13:07:06 -0700 (PDT)
Message-ID: <73b398c9-52d7-88fa-7e84-f9ed082799b0@redhat.com>
Date: Wed, 19 Oct 2022 22:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 5/6] hw/arm/virt: Improve high memory region address
 assignment
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-6-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221011231832.149839-6-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gavin

On 10/12/22 01:18, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
I would replace the above sentence by

One specific high memory region is likely to be disabled by the code by toggling vms->highmem_{redists, ecam, mmio}:

>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3).
I would suggest:
isn't optimized because the high memory region PA range is always

reserved whatever the actual state of the corresponding vms->highmem_
* flag.

>  In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> This improves the address assignment for those three high memory
s/This improves/Improve
> region by skipping the address assignment for one specific high
> memory region if it has been disabled in case (1), (2) and (3).
> 'vms->high_compact' is false for now, meaning that we don't have
s/hight_compat/highmem_compact

You also may justify the introduction of this new field.
> any behavior changes until it becomes configurable through property
> 'compact-highmem' in next patch.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c         | 23 +++++++++++++++--------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ee98a8a3b6..c05cfb5314 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1717,22 +1717,29 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>          region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> -        vms->memmap[i].base = region_base;
> -        vms->memmap[i].size = region_size;
> -
>          /*
>           * Check each device to see if they fit in the PA space,
while we are at it, you can change s/they fit/it fits
> -         * moving highest_gpa as we go.
> +         * moving highest_gpa as we go. For compatibility, move
> +         * highest_gpa for disabled fitting devices as well, if
> +         * the compact layout has been disabled.
>           *
>           * For each device that doesn't fit, disable it.
>           */
>          fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> +        if (*region_enabled && fits) {
> +            vms->memmap[i].base = region_base;
> +            vms->memmap[i].size = region_size;
>              vms->highest_gpa = region_base + region_size - 1;
> +            base = region_base + region_size;
> +        } else {
> +            *region_enabled = false;
> +            if (!vms->highmem_compact) {
> +                base = region_base + region_size;
> +                if (fits) {
> +                    vms->highest_gpa = region_base + region_size - 1;
> +                }
> +            }
>          }
> -
> -        *region_enabled &= fits;
> -        base = region_base + region_size;
>      }
>  }
This looks quite complicated to me. It is not obvious for instance we
have the same code as before when highmem_compact is not set. Typically

vms->memmap[i].base/size are not always set as they were to be and impact on the rest of the code must be double checked.

Could this be rewritten in that way (pseudocode totally untested).


static void fit_highmem_slot(vms, *base, i, pa_bits)
{
    region_enabled = virt_get_high_memmap_enabled(vms, i);
    region_base = ROUND_UP(*base, extended_memmap[i].size);
    region_size = extended_memmap[i].size;
    fits = (region_base + region_size) <= BIT_ULL(pa_bits);
    *region_enabled &= fits;
    vms->memmap[i].base = region_base;
    vms->memmap[i].size = region_size;

    /* compact layout only allocates space for the region if this latter
is enabled & fits*/
    if (vms->highmem_compact && !region_enabled) {
        return;
    }

    /* account for the region and update the base address/highest_gpa if
needed*/ 
    *base = region_base + region_size;
    if (fits) { 
        vms->highest_gpa = *base - 1;
    }
}

static void virt_set_high_memmap(VirtMachineState *vms,
                                 hwaddr base, int pa_bits)
{
    hwaddr region_base, region_size;
    bool *region_enabled, fits;
    int i;

    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
        /* we do not break in case the region does not fit since
fit_highmem_slot also updates the enabled status of the region */
        fit_highmem_slot(vms, &base, i, pa_bits);
    }
}

>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 6ec479ca2b..709f623741 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -144,6 +144,7 @@ struct VirtMachineState {
>      PFlashCFI01 *flash[2];
>      bool secure;
>      bool highmem;
> +    bool highmem_compact;
>      bool highmem_ecam;
>      bool highmem_mmio;
>      bool highmem_redists;
Thanks

Eric


