Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DFF64A43D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:36:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kpN-0000Eu-Lb; Mon, 12 Dec 2022 10:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4kpL-0000CN-B8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:34:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4kpI-0005xA-Ro
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:34:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ja17so2850809wmb.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 07:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DUEk9rLxcxeX94kOOQMv4/OgIDkNDdMiC0fxIOfiL3I=;
 b=OwIcBTVCqwLlzww24J07Z1tJpt3aujV56DzEtPju0XPleRn6i1CsGM+6GLI4fpcz1/
 DidceH/plDhhmZA7JdcrrDfwY+y5idT9qbCMa/Ts0LdQJvPgeDTqzcGBDBcWio/GWk7I
 Emw+a4dSYK7h2NQ0oTyNQ+SUU/rqinq9hzskCtqnfGcvPLyFA+7hds/zjOeYBjcxpZmS
 bQyV9bshnDLiIbRVBr2NAZduqYOayvV0evI/Fzfu217s+oUupLeYt0pp2F4YyB8Ih0+7
 6UzgWuNpUWEFCkQaeAN8L+Nq8RvhMBpFk/0s6ObVHgSHHntqvIbV/g7wgj2ujvvcenTN
 BTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DUEk9rLxcxeX94kOOQMv4/OgIDkNDdMiC0fxIOfiL3I=;
 b=6P3IgBuoWVj+6jiN+y7haTf4wubiemyIJNOefB8PqX69PNjMnr/bcKbkvjlftCgCAN
 Snr+sNXtPhdcPmjkfsiBa5bUO3U+AgIsvf/IujUQlC5lSCy9tbTmAPp75/qjMRshN54m
 lp/3HSMzd91/ZVTUZcWwI+XyV9rclAm8qFYC9JzGYC5wFAOPYwF3LDE+dMVOnt+0RApG
 J8sDI/TIFo0ztGY8mRQU6GnPRW7RkrDHNDu4LsFYdAYmYvQ6nnLnDifCZeKsKQKQRKXs
 c/SxfvHPSpjorpVSBIXvEA8vrGN0RCl04hWBzOVEnmhBj08BOiC9oPh2qPwYyU1e48m5
 EU7Q==
X-Gm-Message-State: ANoB5plLbT5yoQSX9B5mIsTObJKhlT4zZ0jzijj6zGagnxs3NanxGF36
 7sy8JFu/Z5LEG6stwy8soco=
X-Google-Smtp-Source: AA0mqf69focTdojT274TXwNcp37AJnrcmcU3cZwAadJ4KW1mT+7sieKQu4DxpwQhz2bT50o8097F0w==
X-Received: by 2002:a05:600c:4e41:b0:3cf:8b72:e6fd with SMTP id
 e1-20020a05600c4e4100b003cf8b72e6fdmr12900891wmq.20.1670859283058; 
 Mon, 12 Dec 2022 07:34:43 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c21c800b003cf6e1df4a8sm9318794wmj.15.2022.12.12.07.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 07:34:42 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <de303284-0604-ed40-bf8a-ec25a7b11776@xen.org>
Date: Mon, 12 Dec 2022 15:34:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 17/22] i386/xen: handle
 VCPUOP_register_vcpu_time_info
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-18-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-18-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> In order to support Linux vdso in Xen.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.h     |  1 +
>   target/i386/kvm/kvm.c |  9 ++++++
>   target/i386/machine.c |  4 ++-
>   target/i386/xen.c     | 70 ++++++++++++++++++++++++++++++++++++-------
>   4 files changed, 72 insertions(+), 12 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 109b2e5669..96c2d0d5cb 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1790,6 +1790,7 @@ typedef struct CPUArchState {
>       struct kvm_nested_state *nested_state;
>       uint64_t xen_vcpu_info_gpa;
>       uint64_t xen_vcpu_info_default_gpa;
> +    uint64_t xen_vcpu_time_info_gpa;
>   #endif
>   #if defined(CONFIG_HVF)
>       HVFX86LazyFlags hvf_lflags;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index fa45e2f99a..3f19fff21f 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1813,6 +1813,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>   
>       env->xen_vcpu_info_gpa = UINT64_MAX;
>       env->xen_vcpu_info_default_gpa = UINT64_MAX;
> +    env->xen_vcpu_time_info_gpa = UINT64_MAX;

Another few candidates for INVALID_GPA.

>   
>       xen_version = kvm_arch_xen_version(MACHINE(qdev_get_machine()));
>       if (xen_version) {
> @@ -4744,6 +4745,14 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
>                   return ret;
>               }
>           }
> +
> +        gpa = x86_cpu->env.xen_vcpu_time_info_gpa;
> +        if (gpa != UINT64_MAX) {
> +            ret = kvm_xen_set_vcpu_attr(cpu, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO, gpa);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
>       }
>   #endif
>   
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 104cd6047c..9acef102a3 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -1263,7 +1263,8 @@ static bool xen_vcpu_needed(void *opaque)
>       CPUX86State *env = &cpu->env;
>   
>       return (env->xen_vcpu_info_gpa != UINT64_MAX ||
> -            env->xen_vcpu_info_default_gpa != UINT64_MAX);
> +            env->xen_vcpu_info_default_gpa != UINT64_MAX ||
> +            env->xen_vcpu_time_info_gpa != UINT64_MAX);
>   }
>   
>   static const VMStateDescription vmstate_xen_vcpu = {
> @@ -1274,6 +1275,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
>           VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
> +        VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index cd816bb711..427729ab4d 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -21,28 +21,41 @@
>   #include "standard-headers/xen/hvm/hvm_op.h"
>   #include "standard-headers/xen/vcpu.h"
>   
> +static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
> +                           size_t *len, bool is_write)
> +{
> +        struct kvm_translation tr = {
> +            .linear_address = gva,
> +        };
> +
> +        if (len) {
> +                *len = TARGET_PAGE_SIZE - (gva & ~TARGET_PAGE_MASK);
> +        }
> +
> +        if (kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr) || !tr.valid ||
> +            (is_write && !tr.writeable)) {
> +            return false;
> +        }
> +        *gpa = tr.physical_address;
> +        return true;
> +}
> +
>   static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
>                         bool is_write)
>   {
>       uint8_t *buf = (uint8_t *)_buf;
>       size_t i = 0, len = 0;
> -    int ret;
>   
>       for (i = 0; i < sz; i+= len) {
> -        struct kvm_translation tr = {
> -            .linear_address = gva + i,
> -        };
> +        uint64_t gpa;
>   
> -        len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
> +        if (!kvm_gva_to_gpa(cs, gva + i, &gpa, &len, is_write)) {
> +                return -EFAULT;
> +        }
>           if (len > sz)
>               len = sz;
>   
> -        ret = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr);
> -        if (ret || !tr.valid || (is_write && !tr.writeable)) {
> -            return -EFAULT;
> -        }
> -
> -        cpu_physical_memory_rw(tr.physical_address, buf + i, len, is_write);
> +        cpu_physical_memory_rw(gpa, buf + i, len, is_write);
>       }
>   
>       return 0;
> @@ -166,6 +179,17 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
>                             env->xen_vcpu_info_gpa);
>   }
>   
> +static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +
> +    env->xen_vcpu_time_info_gpa = data.host_ulong;
> +
> +    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
> +                          env->xen_vcpu_time_info_gpa);
> +}
> +
>   static int xen_set_shared_info(CPUState *cs, uint64_t gfn)
>   {
>       uint64_t gpa = gfn << TARGET_PAGE_BITS;
> @@ -258,6 +282,27 @@ static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
>       return 0;
>   }
>   
> +static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
> +                                          uint64_t arg)
> +{
> +    struct vcpu_register_time_memory_area tma;
> +    uint64_t gpa;
> +    size_t len;
> +
> +    if (kvm_copy_from_gva(cs, arg, &tma, sizeof(*tma.addr.v))) {
> +        return -EFAULT;
> +    }
> +
> +    if (!kvm_gva_to_gpa(cs, tma.addr.p, &gpa, &len, false) ||
> +        len < sizeof(tma)) {
> +        return -EFAULT;
> +    }

Xen stashes the GVA, not the GPA, and so it would be possible to 
register the same GVA on different vcpus to point at different areas of 
memory.

   Paul

> +
> +    async_run_on_cpu(target, do_set_vcpu_time_info_gpa,
> +                     RUN_ON_CPU_HOST_ULONG(gpa));
> +    return 0;
> +}
> +
>   static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>                                     int cmd, int vcpu_id, uint64_t arg)
>   {
> @@ -266,6 +311,9 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>       int err;
>   
>       switch (cmd) {
> +    case VCPUOP_register_vcpu_time_memory_area:
> +            err = vcpuop_register_vcpu_time_info(cs, dest, arg);
> +            break;
>       case VCPUOP_register_vcpu_info:
>               err = vcpuop_register_vcpu_info(cs, dest, arg);
>               break;


