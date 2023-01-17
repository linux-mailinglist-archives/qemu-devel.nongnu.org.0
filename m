Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880F66DBF3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjsJ-0005ST-PJ; Tue, 17 Jan 2023 06:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHjsH-0005SK-R7
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:11:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHjsG-0005GC-28
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:11:29 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so24141067wms.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wceFyE7BsQWEZA1YU7Ca4+iBTO0HVlLZzZ3+zXMCBeQ=;
 b=ExPuG1P8GV8gcQ/8Dgd/kERAMvSBLnnvkne+tL/qhgHBLBrmOpIO15GAoZyf0S+GDt
 GvxK4xeQ5ttvZWIHcdNOzWvfekDZ2cYWSjDXER+myqP1+bA3rZ0/fKmyMyxqdtBKa9Qo
 itXX16zvaoVWr+mXZP+8zyKFqsjyTlHYZqC39hvV/w9HlLZ93gApSxiJ9Qbw9Cj6SdHm
 +m3tdVkkNVCbB+IRHtCiwmAVhqGexB2EVaH8MSvcASyH3303f5Agh2mZoRmB1dVa3dNO
 8hlZi4JrOg3OL/H0RFNwhVMqhInWcpNw77D9y3ym+c4qsKmUX+eELw4IsPneVUAgJdsd
 VvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wceFyE7BsQWEZA1YU7Ca4+iBTO0HVlLZzZ3+zXMCBeQ=;
 b=z8Xym8mK4JzTyExWxOcdZEuEk2xn86suEzyg7HMTiZZvM8wOP+yz3dCmstgsWhFtgC
 h5vomNmYWzvENmTs5q1CO61K9W//IEGiMYDy1mmj0E5FgayGC+Oz8tqtdCsObXkEsf0D
 sm5Di6UrD7aTZ2OCvGyjHFN7TzutBe3c2GYuZ28dSu0vO0MPtEoMpieGTXVl8d3kRRqP
 M/fuAM9fT1G1FOiuFB1sM5NT7wAkBuV9eGf8/C5uBLXh6nqv3yUTMi8x+CurFgiLkfPF
 qLku/10kiIuZ/2VvgRVNpfhOr7LQLM42yObXCzaH8oxXdo16T0ZimRG/+VBz4Vu9juge
 ER/w==
X-Gm-Message-State: AFqh2kqrut6nKr18ctUtzsEfKYEF9rz74ubVm7T1K4gNSWh5nqxBCib9
 eAOZIzshfd4Om+Uli7VqB7U=
X-Google-Smtp-Source: AMrXdXvjUUuRTZmG0q3/l3tVCWIwEeu3DQeWGNVDNpk4KYzR4qkXYsihO6OYEC09hXP1JHkYJiVJ0g==
X-Received: by 2002:a05:600c:3545:b0:3c6:e60f:3f4a with SMTP id
 i5-20020a05600c354500b003c6e60f3f4amr2683771wmq.1.1673953886462; 
 Tue, 17 Jan 2023 03:11:26 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 e36-20020a5d5964000000b002be0b1e556esm3984420wri.59.2023.01.17.03.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:11:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <823d166c-a00e-6c46-a8e9-eb8734200401@xen.org>
Date: Tue, 17 Jan 2023 11:11:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 27/51] i386/xen: Add support for Xen event channel
 delivery to vCPU
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-28-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230116215805.1123514-28-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/01/2023 21:57, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The kvm_xen_inject_vcpu_callback_vector() function will either deliver
> the per-vCPU local APIC vector (as an MSI), or just kick the vCPU out
> of the kernel to trigger KVM's automatic delivery of the global vector.
> Support for asserting the GSI/PCI_INTX callbacks will come later.
> 
> Also add kvm_xen_get_vcpu_info_hva() which returns the vcpu_info of
> a given vCPU.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/sysemu/kvm_xen.h  |  2 +
>   target/i386/cpu.h         |  2 +
>   target/i386/kvm/xen-emu.c | 86 ++++++++++++++++++++++++++++++++++++---
>   3 files changed, 84 insertions(+), 6 deletions(-)
> 
> diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
> index 3e43cd7843..ee53294deb 100644
> --- a/include/sysemu/kvm_xen.h
> +++ b/include/sysemu/kvm_xen.h
> @@ -17,6 +17,8 @@
>   #define INVALID_GFN UINT64_MAX
>   
>   uint32_t kvm_xen_get_caps(void);
> +void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
> +void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
>   
>   #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
>                                    KVM_XEN_HVM_CONFIG_ ## cap))
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 938a1b9c8b..c9b12e7476 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1788,6 +1788,8 @@ typedef struct CPUArchState {
>   #endif
>   #if defined(CONFIG_KVM)
>       struct kvm_nested_state *nested_state;
> +    MemoryRegion *xen_vcpu_info_mr;
> +    void *xen_vcpu_info_hva;
>       uint64_t xen_vcpu_info_gpa;
>       uint64_t xen_vcpu_info_default_gpa;
>       uint64_t xen_vcpu_time_info_gpa;
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index b0e7620b16..d04d858912 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -20,6 +20,8 @@
>   #include "trace.h"
>   #include "sysemu/runstate.h"
>   
> +#include "hw/pci/msi.h"
> +#include "hw/i386/apic-msidef.h"
>   #include "hw/i386/kvm/xen_overlay.h"
>   #include "hw/i386/kvm/xen_evtchn.h"
>   
> @@ -247,6 +249,35 @@ static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data data)
>       }
>   }
>   
> +static int set_vcpu_info(CPUState *cs, uint64_t gpa)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +    MemoryRegionSection mrs;
> +    int ret;
> +
> +    ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
> +    if (ret || gpa == INVALID_GPA) {
> +    fail:

Ick. Do we really want cross-block gotos? For me it would look a lot 
nicer if you did a forward jump here and later and put the label+code 
after the `return 0`.

> +        if (env->xen_vcpu_info_mr) {
> +            memory_region_unref(env->xen_vcpu_info_mr);
> +            env->xen_vcpu_info_mr = NULL;
> +        }
> +        env->xen_vcpu_info_hva = NULL;
> +        return ret;
> +    }
> +
> +    mrs = memory_region_find(get_system_memory(), gpa, sizeof(struct vcpu_info));
> +    if (!mrs.mr || !mrs.mr->ram_block || mrs.size < sizeof(struct vcpu_info) ||
> +        !(env->xen_vcpu_info_hva = qemu_map_ram_ptr(mrs.mr->ram_block,
> +                                                    mrs.offset_within_region))) {
> +        ret = -EINVAL;
> +        goto fail;
> +    }
> +    env->xen_vcpu_info_mr = mrs.mr;
> +    return 0;
> +}


