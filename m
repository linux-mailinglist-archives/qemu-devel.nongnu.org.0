Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E05E5848
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 03:53:30 +0200 (CEST)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obBP7-0002gW-CI
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 21:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1obBMi-00012b-Ii
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1obBMe-0003Rf-JJ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 21:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663811445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1um9klPdk3CcEerjvvH7WZmMwhJGzjlCdLbZamzUYtg=;
 b=fEPPekq47m7qupbQlDPysslTiZrK68tQilmyf3rd2uN4E6DJCotumsu2TF++EzwiH40O3B
 7VWAbmX/T4M/+JOXCq0KOmm0hoc99CEbDpXR/CVPe9w4Wg1EOqplLwUzfaaOqEOgTRjt9N
 lUrlw4dVnVytFacUYZ9U3yKmvGvPWGY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-56vhf-dYNle1iTuz_yBfNg-1; Wed, 21 Sep 2022 21:50:44 -0400
X-MC-Unique: 56vhf-dYNle1iTuz_yBfNg-1
Received: by mail-ej1-f69.google.com with SMTP id
 sa15-20020a1709076d0f00b00781d793f51fso984328ejc.18
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 18:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1um9klPdk3CcEerjvvH7WZmMwhJGzjlCdLbZamzUYtg=;
 b=6NYc45x/PzSQX+hxm5KaQ4ki7pj2t+L0UgjvL2NMeWO+ARoGSwMP58fqULBYEx/22H
 Ksbw3hvzg0LvVwvblnk2wy2nIkKhILhzT9dSDrcopRbrkwr/SWLPVn+nOgBAme4T8cpQ
 vf6ZFZAcBM7/XAoJiSR+frCKe4NdBsDqoKDjm7b7wWyER3WOd4hCjmklbiJfQ7qQxxdQ
 Tg2pVIJB9CVeezbH83PMKxSsLhXca2xvZ2UHEZKjz9G2whEtUBbscYeHN9WP/Ez2nLUC
 TZIkTketDcmjOmHZ0XxPN/v5XIn+5F2atwBwr5HRxByuMu6A5/sxNHSGkKYKk2Y0fa6B
 UfYw==
X-Gm-Message-State: ACrzQf27LgNv2m/dQOWF2vmG2SMajncvPrKmuEf/MWwz2fDdN2xSrM/K
 2Zw20ib+3IN0a3ic+cjWopjoVE3fuAaA/4Iwg9WkTUgCvuzMsswF/RbY0dtAxslXYvN6YqacpGU
 lFmgXTdpbUz3YhCVxt1OV0Z3idmfBBfY=
X-Received: by 2002:a17:906:fd8b:b0:779:dcbe:3a9d with SMTP id
 xa11-20020a170906fd8b00b00779dcbe3a9dmr867352ejb.235.1663811441061; 
 Wed, 21 Sep 2022 18:50:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7idB2rWUb8OsOqpvjSW7KC9rszjyEjmvRYJb27RKkv0TZSscnvj+EXbQ+pLTUclc7a+CusGQQ1wILm0rujrwM=
X-Received: by 2002:a17:906:fd8b:b0:779:dcbe:3a9d with SMTP id
 xa11-20020a170906fd8b00b00779dcbe3a9dmr867330ejb.235.1663811440670; Wed, 21
 Sep 2022 18:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220921231349.274049-1-gshan@redhat.com>
In-Reply-To: <20220921231349.274049-1-gshan@redhat.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Thu, 22 Sep 2022 09:50:04 +0800
Message-ID: <CAJFLiBKDY8TRRXMkoUcA0nT0MTb2K_U24iTUQm0AExczuCXtnw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/arm/virt: Improve address assignment for high
 memory regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org, 
 eric.auger@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 peter.maydell@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[PATCH v3 0/5] hw/arm/virt: Improve address assignment for high memory regions
Author: Gavin Shan <gshan@redhat.com>
Date:   Thu Sep 22 07:13:45 2022 +0800

    PATCH[1-3] preparatory work for the improvment
    PATCH[4]   improve high memory region address assignment
    PATCH[5]   adds 'highmem-compact' to enable or disable the optimization

    Signed-off-by: Gavin Shan <gshan@redhat.com>

The patchs works well on "IPA Size Limit: 40" FUJITSU machine.
I added some debug code to show high memory region address.
The test results are as expected.

1. virt-7.2 default
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.2 -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_MMIO] enabled, highest_gpa=0xffffffffff

2. When virt-7.2,highmem-compact=off
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.2,highmem-compact=off -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x8003ffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x801fffffff    [no] [yes]
[HIGH_PCIE_MMIO]: disabled, highest_gpa=0x801fffffff    [no] [no]

3. virt-7.1 default
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.1 -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x8003ffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x801fffffff    [no] [yes]
[HIGH_PCIE_MMIO]: disabled, highest_gpa=0x801fffffff    [no] [no]

2. When virt-7.1,highmem-compact=on
# /home/qemu/build/qemu-system-aarch64 -accel kvm -cpu host -machine
virt-7.1,highmem-compact=on -m 4G,maxmem=511G -monitor stdio
=====> virt_set_high_memmap: pa_bits=40, base=0x8000000000
[HIGH_GIC_REDIST2]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_ECAM]: disabled, highest_gpa=0x7fffffffff    [no] [yes]
[HIGH_PCIE_MMIO] enabled, highest_gpa=0xffffffffff


Tested-by: Zhenyu Zhang<zhenyzha@redhat.com>

On Thu, Sep 22, 2022 at 7:13 AM Gavin Shan <gshan@redhat.com> wrote:
>
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
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
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> The series intends to improve the address assignment for these
> high memory regions.
>
> PATCH[1-3] preparatory work for the improvment
> PATCH[4]   improve high memory region address assignment
> PATCH[5]   adds 'highmem-compact' to enable or disable the optimization
>
> History
> =======
> v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
>
> Changelog
> ==========
> v3:
>   * Reorder the patches                                        (Gavin)
>   * Add 'highmem-compact' property for backwards compatibility (Eric)
> v2:
>   * Split the patches for easier review                        (Gavin)
>   * Improved changelog                                         (Marc)
>   * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
>
> Gavin Shan (5):
>   hw/arm/virt: Introduce virt_set_high_memmap() helper
>   hw/arm/virt: Rename variable size to region_size in
>     virt_set_high_memmap()
>   hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
>   hw/arm/virt: Improve high memory region address assignment
>   hw/arm/virt: Add 'highmem-compact' property
>
>  docs/system/arm/virt.rst |   4 ++
>  hw/arm/virt.c            | 116 ++++++++++++++++++++++++++++-----------
>  include/hw/arm/virt.h    |   2 +
>  3 files changed, 89 insertions(+), 33 deletions(-)
>
> --
> 2.23.0
>


