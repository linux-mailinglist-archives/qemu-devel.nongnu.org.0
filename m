Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888FD64FF02
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 14:39:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6tsb-00045G-AT; Sun, 18 Dec 2022 08:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tsP-00041h-AO
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:38:50 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tsN-0005tE-9s
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:38:48 -0500
Received: by mail-ej1-x634.google.com with SMTP id jo4so7143104ejb.7
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=37QhoN10bmGsAPvDf6U4zyMww0DWM8TpBHyBi/8TDwI=;
 b=VZDYS8Wv8Vta/ed9cOMmM2LIgisRwXsqyqzvSJ33yjbYfhLhUwXX9yncuJSbMYr1Qm
 9MiwTMBvnx01/iSrDIUdjJuEjjjcvZjjZXxMRItTweVi383uWRuRXQ8Rp5hGMl+LtI6S
 dxMgsnbjn9QG2CarZOeSpjYtBzLV+jLfMuOynwl5yrzv3bkBXDazFBRbp2MAX0si5quj
 M6WuQngJgk0AtTFzad5LJyyq06g5vvthkLaYHOPosOrAMg5UcmB5ZT2qsb6nEv5Gb0AD
 IH23d+m6sfgYhgiz7VdjSDrVgS/Y5yIhDEkHW5qiqGsuelMxqeNoIA3dNgp5RI8JBJE+
 NeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37QhoN10bmGsAPvDf6U4zyMww0DWM8TpBHyBi/8TDwI=;
 b=oKXy9Lucv+4q0UIsscTgCRENeVGaf6uq3tyGuvuSE28/5kEzGHqU6yVai39P6NBX1B
 VbQWsq+i29fEdMQmvmOgts3cJDoThA134eVIwPO1E0Jn6qlVTsbQw8SVsqOn6U0Z7DCI
 6b8ECSo6HLijI/nK8O1/iPK2ZMcaxoiaxWz1/lv/pY1RqfkNnp+qLt3uA0tPaSmn7Xgs
 PH4GG79L3IRUi83wI+0QJ+ABi1XGytx+By/KpPMk5j7nXfvFtw9QaBxiKDDChf7GErii
 uuiZ4crvHWtCxa07E/flPs0zQeIMEn/NHPyqCnIC5ycujruUgDvuX/LsKDs9uOhX7tft
 lhxg==
X-Gm-Message-State: AFqh2kocftG7CiIbGPp7EsIre9YFB5J0SMoUqP5glqm6eDNqe9nXmoxA
 IHdZpcO6EGJCij/hfHbdCmzIyS5B9BmN08y/c7g=
X-Google-Smtp-Source: AMrXdXvqO2caJMZxmkdWWp95N0aFc8RQ18SrH761f1iD0qInYFIr2cR471w8yqVHllci/kcrshTJBg==
X-Received: by 2002:a17:906:8d86:b0:7cd:ffd:51f2 with SMTP id
 ry6-20020a1709068d8600b007cd0ffd51f2mr16644531ejc.57.1671370725769; 
 Sun, 18 Dec 2022 05:38:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a170906315b00b007c10d47e748sm3148746eje.36.2022.12.18.05.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 05:38:45 -0800 (PST)
Message-ID: <d7b6874d-a825-f2d3-5cf2-1817d288138d@linaro.org>
Date: Sun, 18 Dec 2022 14:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] KVM: remove support for kernel-irqchip=off
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221218000649.686882-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218000649.686882-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/22 01:06, Paolo Bonzini wrote:
> -machine kernel-irqchip=off is broken for many guest OSes; kernel-irqchip=split
> is the replacement that works, so remove the deprecated support for the former.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/deprecated.rst       |  7 -------
>   docs/about/removed-features.rst |  7 +++++++
>   hw/i386/amd_iommu.c             |  2 +-
>   hw/i386/intel_iommu.c           |  4 ++--
>   include/hw/i386/apic_internal.h |  2 +-
>   target/i386/cpu-sysemu.c        | 15 +++++++++++----
>   6 files changed, 22 insertions(+), 15 deletions(-)


> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 725f69095b9e..bcd016f5c5a5 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1368,7 +1368,7 @@ static MemTxResult amdvi_mem_ir_write(void *opaque, hwaddr addr,
>           return MEMTX_ERROR;
>       }
>   
> -    apic_get_class()->send_msi(&to);
> +    apic_get_class(NULL)->send_msi(&to);

&error_fatal?

> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index a08ee85edf2a..98a5c304a7d7 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -396,7 +396,7 @@ static void vtd_generate_interrupt(IntelIOMMUState *s, hwaddr mesg_addr_reg,
>   
>       trace_vtd_irq_generate(msi.address, msi.data);
>   
> -    apic_get_class()->send_msi(&msi);
> +    apic_get_class(NULL)->send_msi(&msi);
>   }
>   
>   /* Generate a fault event to software via MSI if conditions are met.
> @@ -3529,7 +3529,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwaddr addr,
>           return MEMTX_ERROR;
>       }
>   
> -    apic_get_class()->send_msi(&to);
> +    apic_get_class(NULL)->send_msi(&to);
>   
>       return MEMTX_OK;
>   }

>   #endif /* QEMU_APIC_INTERNAL_H */
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index fc97213a73cf..28115edf44f7 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -247,12 +247,16 @@ void x86_cpu_machine_reset_cb(void *opaque)
>       cpu_reset(CPU(cpu));
>   }
>   
> -APICCommonClass *apic_get_class(void)
> +APICCommonClass *apic_get_class(Error **errp)
>   {
>       const char *apic_type = "apic";
>   
>       /* TODO: in-kernel irqchip for hvf */
> -    if (kvm_apic_in_kernel()) {
> +    if (kvm_enabled()) {
> +        if (!kvm_apic_in_kernel()) {
> +            error_setg(errp, "KVM does not support userspace APIC");
> +            return NULL;
> +        }


