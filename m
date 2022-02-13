Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B5B4B395D
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 06:07:24 +0100 (CET)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ76Z-0005ok-5u
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 00:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ74x-0005AN-Bz
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 00:05:44 -0500
Received: from [2607:f8b0:4864:20::42e] (port=46991
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ74t-0002vy-Qe
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 00:05:42 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i21so22052228pfd.13
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 21:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:in-reply-to:content-transfer-encoding;
 bh=SvASqGw57nnd+VLnYfU88dyRPvfuj1Dziis/gpDvPDQ=;
 b=XBfoxrRuIu3fmcbhjJ9kr7VMkCaBcJPqOurHmRK/FiCs/ms8WaQX1+mimEBoUIpFTy
 xJbVxkqyJGJ+3UaCl4oKwzFlzG9jWw5b1pRVl2DvbkLXt03ATv+tkT6D1Dpp0xtWy8xv
 G/w5f5rX2k0b2B82um9zrqxd9V3zkCE+/AiXXRm+uP0S7fTIPQVH6S1pVpdsAYSvtmCf
 lo3U4Guzx78b+GBEBIboxzMUhDuEKvceAKQ6rXaYq6Xw5WUPmZyzrQhI3aq0IwY4C3x+
 kXP3BMcSfvyqPG/yUZpOrSqvpzoywuA8txl+CJiOghHDWc9QTtX3iOZOoh62DGcofK60
 uJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=SvASqGw57nnd+VLnYfU88dyRPvfuj1Dziis/gpDvPDQ=;
 b=ChuASwK9loxWZfcETYLLYgADXeGjty84edU4JlKykaaQ2nAywo0a3L1QCUXzCyF7Me
 jhzU/BelMGSGZk5Kddrjj3aMVKeApBiiXtsEpxcz7MCXUDDEkXAO9sovBmBnrW5czjGm
 +gVeRD8vX7Of2/rxT9qDGDqNiDKNzWzBoHqtsSJtlPftz4j+3bg43861O3AW/ksCzFk8
 /ohAfoKzdH9hAdc2dZn7ccXuFR3b39320Q4oEjTZnlSLWKIU7oXG4MoVACag6ppFIJH7
 ++mU8b97ORcL4N1koxPBaVaf6N5gAZm47cXyoiOmUYGnvZPPtcB6kZgwHfq34WclJ1fr
 M3Iw==
X-Gm-Message-State: AOAM533rA8hybKP4dUH8/lVwOuK1i50ITPkIAbwLzG1dq4x+U9HDLeaW
 xN71YROttr21GLtw9XdhuBI=
X-Google-Smtp-Source: ABdhPJyB1aKZywkCHJZjJmET0O2A221R61VkLCC7y5fqq25Y8mxu103Gzp1+U5B1a7FbncablDHLaQ==
X-Received: by 2002:a05:6a00:98e:: with SMTP id
 u14mr8601475pfg.12.1644728738382; 
 Sat, 12 Feb 2022 21:05:38 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 l8sm34061282pfc.187.2022.02.12.21.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 21:05:37 -0800 (PST)
Message-ID: <3f4f5e98-fcb8-bf4d-e464-6ad365af92f8@gmail.com>
Date: Sun, 13 Feb 2022 14:05:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 18/38] hw/arm/virt: Honor highmem setting when computing
 the memory map
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
 <20220120123630.267975-19-peter.maydell@linaro.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220120123630.267975-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/01/20 21:36, Peter Maydell wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> Even when the VM is configured with highmem=off, the highest_gpa
> field includes devices that are above the 4GiB limit.
> Similarily, nothing seem to check that the memory is within
> the limit set by the highmem=off option.
> 
> This leads to failures in virt_kvm_type() on systems that have
> a crippled IPA range, as the reported IPA space is larger than
> what it should be.
> 
> Instead, honor the user-specified limit to only use the devices
> at the lowest end of the spectrum, and fail if we have memory
> crossing the 4GiB limit.
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Message-id: 20220114140741.1358263-4-maz@kernel.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 62bdce1eb4b..3b839ba78ba 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1670,7 +1670,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>   static void virt_set_memmap(VirtMachineState *vms)
>   {
>       MachineState *ms = MACHINE(vms);
> -    hwaddr base, device_memory_base, device_memory_size;
> +    hwaddr base, device_memory_base, device_memory_size, memtop;
>       int i;
>   
>       vms->memmap = extended_memmap;
> @@ -1697,7 +1697,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>       device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
>   
>       /* Base address of the high IO region */
> -    base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> +    memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> +    if (!vms->highmem && memtop > 4 * GiB) {
> +        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +        exit(EXIT_FAILURE);
> +    }
>       if (base < device_memory_base) {
>           error_report("maxmem/slots too huge");
>           exit(EXIT_FAILURE);
> @@ -1714,7 +1718,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>           vms->memmap[i].size = size;
>           base += size;
>       }
> -    vms->highest_gpa = base - 1;
> +    vms->highest_gpa = (vms->highmem ? base : memtop) - 1;
>       if (device_memory_size > 0) {
>           ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>           ms->device_memory->base = device_memory_base;

Hi,
This breaks in a case where highmem is disabled but can have more than 4 
GiB of RAM. M1 (Apple Silicon) actually can have 36-bit PA with HVF, 
which is not enough for highmem MMIO but is enough to contain 32 GiB of RAM.

Where the magic number of 4 GiB / 32-bit came from? I also don't quite 
understand what failures virt_kvm_type() had.

Regards,
Akihiko Odaki

