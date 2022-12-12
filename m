Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AC5649F12
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:49:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iEq-0003Nz-AF; Mon, 12 Dec 2022 07:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4iEc-0003LF-M9
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:48:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4iEa-0005iL-Ir
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:48:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so5006651wms.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=NTGE9zzHtWg8SDkvMU8angT1U+1HUB1gmp4uh26Og5M=;
 b=a9CLGkL2Dl6+4ReZBjSyUsqgtnSjVoey75LLACiX+a0MbQylOLkfNmEJHuO79tFZUo
 bdY+95ANKQShfjpULmMk22tjBUMFg0lEJk5ttkjvpEqjjX/McdHTINNEIvVA3zOvERVC
 opYmLlAHBaC9JvOix3dSJ+EVoJXRyreNjJLg2q7OPt9JhpBsrm0xdCVlSvWw0nCZ2bNH
 0tO9M/o4c1OZS1Iswz0bIDMg2Dhz8Jei9rAyC2DxsBrwUygQ4GFSqqmD7AQSukbXNlli
 6zBxbpOP9L6ao/79Alqu3XWqIbO1a1+/g49kpgqWKRS4NwN9Ybv4R+yznM2j5hLSHi2g
 /CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NTGE9zzHtWg8SDkvMU8angT1U+1HUB1gmp4uh26Og5M=;
 b=AXnWP3FOa7o6B7I54rsGaSFuMMRaYwEBh1Y3vtj8dMo5AL3Sxq/9CISZ05Aylzp6wu
 2PsuGzyftwn/ktCRtTSDnU8+XZ+dlNwodctfH6I9l0wSdghFiqecqi9/eTdHSRAlq8n9
 6qDU/7KKEas54ReQPJPHnQv3Gf/fgWoJSfbWAriQKTzADBydm6w3OmyHkcmwz8UYt1a9
 Bc0+6zjRGzNFypHWpAIauEVDz4j3XEGCXDsIqr6NFzkvsDDRONFBlrVY5kfEbE6ZEseJ
 XrIH7xs25nTvEaXmYlYyhPABlus190sf/OfJkpIAyE+4PqaGGsSdExWz+xzSCoEus64d
 SwoA==
X-Gm-Message-State: ANoB5pkaK7nbpH2oO3xKhXniov35a0PEgCx0BLfOoz0x7X1DUPz4UF1Z
 hLm4H9HSFFD2/mfopjMgpS8=
X-Google-Smtp-Source: AA0mqf7yFKwjFAeITrDOUcbZ3EmEqFGm85ikwuM7TzuIEuNsX5K8A4DDTY0sBbza+vb0yun/Scdvng==
X-Received: by 2002:a05:600c:1d09:b0:3c6:e63d:adb3 with SMTP id
 l9-20020a05600c1d0900b003c6e63dadb3mr12189372wms.35.1670849318741; 
 Mon, 12 Dec 2022 04:48:38 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a05600c54c300b003d220ef3232sm5850232wmb.34.2022.12.12.04.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 04:48:38 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <a77183db-1e3d-3bc5-cbda-9c5d8a13c333@xen.org>
Date: Mon, 12 Dec 2022 12:48:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 03/22] i386/xen: Add xen-version machine property
 and init KVM Xen support
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
 <20221209095612.689243-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
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

On 09/12/2022 09:55, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is a machine property for two main reasons. One is that it allows
> us to set it in default_machine_opts for the xenfv platform when not
> running on actual Xen. The other is that theoretically we *could* do
> this with TCG too; we'd just have to implement a bunch of the stuff that
> KVM already does for us.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc.c            | 32 +++++++++++++++++++++++++++
>   hw/i386/pc_piix.c       | 10 +++++++--
>   include/hw/i386/pc.h    |  3 +++
>   target/i386/kvm/kvm.c   | 26 ++++++++++++++++++++++
>   target/i386/meson.build |  1 +
>   target/i386/xen.c       | 49 +++++++++++++++++++++++++++++++++++++++++
>   target/i386/xen.h       | 19 ++++++++++++++++
>   7 files changed, 138 insertions(+), 2 deletions(-)
>   create mode 100644 target/i386/xen.c
>   create mode 100644 target/i386/xen.h
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 546b703cb4..9bada1a8ff 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1811,6 +1811,32 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
>       pcms->max_fw_size = value;
>   }
>   
> +static void pc_machine_get_xen_version(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    uint32_t value = pcms->xen_version;
> +
> +    visit_type_uint32(v, name, &value, errp);
> +}
> +
> +static void pc_machine_set_xen_version(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    Error *error = NULL;
> +    uint32_t value;
> +
> +    visit_type_uint32(v, name, &value, &error);
> +    if (error) {
> +        error_propagate(errp, error);
> +        return;
> +    }
> +
> +    pcms->xen_version = value;
> +}
>   
>   static void pc_machine_initfn(Object *obj)
>   {
> @@ -1978,6 +2004,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>           NULL, NULL);
>       object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
>           "SMBIOS Entry Point type [32, 64]");
> +
> +    object_class_property_add(oc, "xen-version", "uint32",
> +        pc_machine_get_xen_version, pc_machine_set_xen_version,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, "xen-version",
> +        "Xen version to be emulated (in XENVER_version form e.g. 0x4000a for 4.10)");
>   }

Since this is e properly of the general pc machine class, could it be 
made to report the actual version if running on real Xen and be 
read-only? AFAICT I could specify "accel=xen,xen-version=<blah>" and the 
feels like it should be an error.

>   
>   static const TypeInfo pc_machine_info = {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 0ad0ed1603..13286d0739 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -876,7 +876,10 @@ static void xenfv_4_2_machine_options(MachineClass *m)
>       pc_i440fx_4_2_machine_options(m);
>       m->desc = "Xen Fully-virtualized PC";
>       m->max_cpus = HVM_MAX_VCPUS;
> -    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    if (xen_enabled())
> +            m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    else
> +            m->default_machine_opts = "accel=kvm,xen-version=0x40002";
>   }
>   
>   DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
> @@ -888,7 +891,10 @@ static void xenfv_3_1_machine_options(MachineClass *m)
>       m->desc = "Xen Fully-virtualized PC";
>       m->alias = "xenfv";
>       m->max_cpus = HVM_MAX_VCPUS;
> -    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    if (xen_enabled())
> +            m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
> +    else
> +            m->default_machine_opts = "accel=kvm,xen-version=0x30001";
>   }
>   
>   DEFINE_PC_MACHINE(xenfv, "xenfv-3.1", pc_xen_hvm_init,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index c95333514e..9b14b18836 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -52,6 +52,9 @@ typedef struct PCMachineState {
>       bool default_bus_bypass_iommu;
>       uint64_t max_fw_size;
>   
> +    /* Xen HVM emulation */
> +    uint32_t xen_version;
> +
>       /* ACPI Memory hotplug IO base address */
>       hwaddr memhp_io_base;
>   
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a213209379..0a2069b117 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -31,6 +31,7 @@
>   #include "sysemu/runstate.h"
>   #include "kvm_i386.h"
>   #include "sev.h"
> +#include "xen.h"
>   #include "hyperv.h"
>   #include "hyperv-proto.h"
>   
> @@ -774,6 +775,17 @@ static inline bool freq_within_bounds(int freq, int target_freq)
>           return false;
>   }
>   
> +static uint32_t kvm_arch_xen_version(MachineState *ms)
> +{
> +    uint32_t v = object_property_get_int(OBJECT(ms), "xen-version", NULL);
> +
> +    /* If it was unset, return zero */
> +    if (v == (uint32_t) -1)
> +            return 0;
> +
> +    return v;
> +}
> +
>   static int kvm_arch_set_tsc_khz(CPUState *cs)
>   {
>       X86CPU *cpu = X86_CPU(cs);
> @@ -2459,6 +2471,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
>       uint64_t identity_base = 0xfffbc000;
>       uint64_t shadow_mem;
> +    uint32_t xen_version;
>       int ret;
>       struct utsname utsname;
>       Error *local_err = NULL;
> @@ -2513,6 +2526,19 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>           }
>       }
>   
> +    xen_version = kvm_arch_xen_version(ms);
> +    if (xen_version) {
> +#ifdef CONFIG_XEN_EMU
> +            ret = kvm_xen_init(s, xen_version);
> +            if (ret < 0) {
> +                    return ret;
> +            }
> +#else
> +            error_report("kvm: Xen support not enabled in qemu");
> +            return -ENOTSUP;
> +#endif
> +    }
> +
>       ret = kvm_get_supported_msrs(s);
>       if (ret < 0) {
>           return ret;
> diff --git a/target/i386/meson.build b/target/i386/meson.build
> index ae38dc9563..9f3ef246b8 100644
> --- a/target/i386/meson.build
> +++ b/target/i386/meson.build
> @@ -7,6 +7,7 @@ i386_ss.add(files(
>     'cpu-dump.c',
>   ))
>   i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
> +i386_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen.c'))
>   
>   # x86 cpu type
>   i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> new file mode 100644
> index 0000000000..bc183dce4e
> --- /dev/null
> +++ b/target/i386/xen.c
> @@ -0,0 +1,49 @@
> +/*
> + * Xen HVM emulation support in KVM
> + *
> + * Copyright © 2019 Oracle and/or its affiliates. All rights reserved.
> + * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "kvm/kvm_i386.h"
> +#include "xen.h"
> +
> +int kvm_xen_init(KVMState *s, uint32_t xen_version)
> +{
> +    const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
> +        KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL | KVM_XEN_HVM_CONFIG_SHARED_INFO;
> +    struct kvm_xen_hvm_config cfg = {
> +        .msr = XEN_HYPERCALL_MSR,
> +        .flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
> +    };
> +    int xen_caps, ret;
> +
> +    xen_caps = kvm_check_extension(s, KVM_CAP_XEN_HVM);
> +    if (required_caps & ~xen_caps) {
> +        error_report("kvm: Xen HVM guest support not present or insufficient");
> +        return -ENOSYS;
> +    }
> +
> +    if (xen_caps & KVM_XEN_HVM_CONFIG_EVTCHN_SEND) {
> +        struct kvm_xen_hvm_attr ha = {
> +            .type = KVM_XEN_ATTR_TYPE_XEN_VERSION,
> +            .u.xen_version = xen_version,
> +        };
> +        (void)kvm_vm_ioctl(s, KVM_XEN_HVM_SET_ATTR, &ha);

Should you not handle the error here? If the cap is present then surely 
it ought to work.

> +
> +        cfg.flags |= KVM_XEN_HVM_CONFIG_EVTCHN_SEND;
> +    }
> +
> +    ret = kvm_vm_ioctl(s, KVM_XEN_HVM_CONFIG, &cfg);
> +    if (ret < 0) {
> +        error_report("kvm: Failed to enable Xen HVM support: %s", strerror(-ret));
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> diff --git a/target/i386/xen.h b/target/i386/xen.h
> new file mode 100644
> index 0000000000..6c4f3b7822
> --- /dev/null
> +++ b/target/i386/xen.h
> @@ -0,0 +1,19 @@
> +/*
> + * Xen HVM emulation support in KVM
> + *
> + * Copyright © 2019 Oracle and/or its affiliates. All rights reserved.
> + * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef QEMU_I386_XEN_H
> +#define QEMU_I386_XEN_H
> +
> +#define XEN_HYPERCALL_MSR 0x40000000

This is a moveable MSR if Hyper-V is also enabled. Is that configuration 
being explicitly denied?

   Paul

> +
> +int kvm_xen_init(KVMState *s, uint32_t xen_version);
> +
> +#endif /* QEMU_I386_XEN_H */


