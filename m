Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306D489C69
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:41:18 +0100 (CET)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wnN-0005XK-3A
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:41:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wlE-0004RT-0m
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wlC-0001cX-7u
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641829141;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vn/4MITr303eLI/9sy4vZE7T+80p2T43/HHj8bjumUI=;
 b=EqGkm6LolTRYNRUUKoBJba5S/+i6bDTVHKDUjkqPtJwboI8zoZmcDHOlTgo5GQaeh+l4rM
 DyOo3/t9DFr4FewRBfigZUBQGPhNmJyPJ5XrBkVsDKxsSzSmnMgGlh/MMu+9Told5Annlv
 zvPiqVs2KRLTSRTVOJr/fRzVvS0YC6s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-nVD_mzmSM46dtANchNXdrQ-1; Mon, 10 Jan 2022 10:39:00 -0500
X-MC-Unique: nVD_mzmSM46dtANchNXdrQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso97274wme.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 07:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Vn/4MITr303eLI/9sy4vZE7T+80p2T43/HHj8bjumUI=;
 b=20e+Ur5Ym2n2o+1kSfKCu5LQxg9ZnDCINLBURGjP97IjcwsrntrRIx/9Yb4/1cAIg9
 2IeDF1DDKl36oJPWcNosP5X4sIkSJCLkx8YLRdl/1wpKGtUCfYXi7LlYa/EK1C/mPD/H
 Klu3py4rMq7m4D5y7lLrNZW5v2aBoeii6aA8uB876eYFDhaRDGInD/ctCL5w9Sgh0qXl
 aaK46SU36AXwgKzljRe3cWKYTl7jxth0uKpi/k7g7NwXYKXEdmq12Q/0PHTrTgvZF/Vd
 fPCAInxDvxrD6wY1xPjkZvzO8m/KMep/ptxti6DmyV5L7AHsftiRsYeaMsmjhsJmagX2
 OHvQ==
X-Gm-Message-State: AOAM531TZngrHLkmZ8eSS70ZVOT1esvaHq9YNCb6IcaQi/lQ6ZJZx/AA
 ThboG8CDGMJrYcmg5cWgQCfCC0QDouRZreJGTZFPxsQd6lq4H1emYJWcmOYwhGA/ZIBxHNdfwM3
 0YxzuXWrNtwXJp5E=
X-Received: by 2002:a5d:4609:: with SMTP id t9mr153683wrq.551.1641829139021;
 Mon, 10 Jan 2022 07:38:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZifhrLZp+3rpsOY24CeNlWG+k7+BKtRIYq4bZWPG5Q97FLrRELUVOFGLaCLaT/fCtp/nCcw==
X-Received: by 2002:a5d:4609:: with SMTP id t9mr153665wrq.551.1641829138790;
 Mon, 10 Jan 2022 07:38:58 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n12sm7169407wmq.30.2022.01.10.07.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 07:38:57 -0800 (PST)
Subject: Re: [PATCH v4 4/6] hw/arm/virt: Use the PA range to compute the
 memory map
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220107163324.2491209-1-maz@kernel.org>
 <20220107163324.2491209-5-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d7f793ab-bf78-32fb-e793-54a034ffd5d8@redhat.com>
Date: Mon, 10 Jan 2022 16:38:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220107163324.2491209-5-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 1/7/22 5:33 PM, Marc Zyngier wrote:
> The highmem attribute is nothing but another way to express the
> PA range of a VM. To support HW that has a smaller PA range then
> what QEMU assumes, pass this PA range to the virt_set_memmap()
> function, allowing it to correctly exclude highmem devices
> if they are outside of the PA range.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 53 ++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 57c55e8a37..db4b0636e1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1660,7 +1660,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> -static void virt_set_memmap(VirtMachineState *vms)
> +static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
>      hwaddr base, device_memory_base, device_memory_size, memtop;
> @@ -1678,6 +1678,13 @@ static void virt_set_memmap(VirtMachineState *vms)
>          exit(EXIT_FAILURE);
>      }
>  
> +    /*
> +     * !highmem is exactly the same as limiting the PA space to 32bit,
> +     * irrespective of the underlying capabilities of the HW.
> +     */
> +    if (!vms->highmem)
> +	    pa_bits = 32;
you need {} according to the QEMU coding style. Welcome to a new shiny
world :-)
> +
>      /*
>       * We compute the base of the high IO region depending on the
>       * amount of initial and device memory. The device memory start/size
> @@ -1691,8 +1698,9 @@ static void virt_set_memmap(VirtMachineState *vms)
>  
>      /* Base address of the high IO region */
>      memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> -    if (!vms->highmem && memtop > 4 * GiB) {
> -        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +    if (memtop > BIT_ULL(pa_bits)) {
> +	    error_report("Addressing limited to %d bits, but memory exceeds it by %llu bytes\n",
> +			 pa_bits, memtop - BIT_ULL(pa_bits));
>          exit(EXIT_FAILURE);
>      }
>      if (base < device_memory_base) {
> @@ -1711,7 +1719,13 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = (vms->highmem ? base : memtop) - 1;
> +
> +    /*
> +     * If base fits within pa_bits, all good. If it doesn't, limit it
> +     * to the end of RAM, which is guaranteed to fit within pa_bits.
> +     */
> +    vms->highest_gpa = (base <= BIT_ULL(pa_bits) ? base : memtop) - 1;
> +
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;
> @@ -1902,12 +1916,38 @@ static void machvirt_init(MachineState *machine)
>      unsigned int smp_cpus = machine->smp.cpus;
>      unsigned int max_cpus = machine->smp.max_cpus;
Move the cpu_type check before?

    if (!cpu_type_valid(machine->cpu_type)) {
        error_report("mach-virt: CPU type %s not supported",
machine->cpu_type);
        exit(1);
    }
>  
> +    possible_cpus = mc->possible_cpu_arch_ids(machine);
> +
>      /*
>       * In accelerated mode, the memory map is computed earlier in kvm_type()
>       * to create a VM with the right number of IPA bits.
>       */
>      if (!vms->memmap) {
> -        virt_set_memmap(vms);
> +        Object *cpuobj;
> +        ARMCPU *armcpu;
> +        int pa_bits;
> +
> +        /*
> +         * Instanciate a temporary CPU object to find out about what
> +         * we are about to deal with. Once this is done, get rid of
> +         * the object.
> +         */
> +        cpuobj = object_new(possible_cpus->cpus[0].type);
> +        armcpu = ARM_CPU(cpuobj);
> +
> +        if (object_property_get_bool(cpuobj, "aarch64", NULL)) {
> +            pa_bits = arm_pamax(armcpu);
> +        } else if (arm_feature(&armcpu->env, ARM_FEATURE_LPAE)) {
> +            /* v7 with LPAE */
> +            pa_bits = 40;
> +        } else {
> +            /* Anything else */
> +            pa_bits = 32;
> +        }
> +
> +        object_unref(cpuobj);
> +
> +        virt_set_memmap(vms, pa_bits);
>      }
>  
>      /* We can probe only here because during property set
> @@ -1989,7 +2029,6 @@ static void machvirt_init(MachineState *machine)
>  
>      create_fdt(vms);
>  
> -    possible_cpus = mc->possible_cpu_arch_ids(machine);
>      assert(possible_cpus->len == max_cpus);
>      for (n = 0; n < possible_cpus->len; n++) {
>          Object *cpuobj;
> @@ -2646,7 +2685,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>      max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
>  
>      /* we freeze the memory map to compute the highest gpa */
> -    virt_set_memmap(vms);
> +    virt_set_memmap(vms, max_vm_pa_size);
>  
>      requested_pa_size = 64 - clz64(vms->highest_gpa);
>  
Thanks

Eric


