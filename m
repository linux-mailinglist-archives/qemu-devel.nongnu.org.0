Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3320A6A4EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWm7X-0004eX-Pj; Mon, 27 Feb 2023 17:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWm7V-0004e4-Oh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:37:21 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWm7T-0003ZI-QL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:37:21 -0500
Received: by mail-wr1-x433.google.com with SMTP id r18so7859934wrx.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ayHZc6ONIf0DTAL1z8VWOF7fViKga5Yvvt2mtDqrgvk=;
 b=YG/wCi/XMnJVL9us2LkxxBs5gE7zRmLAf8Ns+FJHzIpHNVc818m7AFSZxu+wAwmFjo
 w0KDqHpKzyAEywQ/wQj+HyPB3duMrHydec1gMopfqrufWJzsFXp79f7x+yjhvXYp5WG0
 D2TAIZdaByfWTfxTGktFRAboqbPgHqP8Ei9R3a8etgoRnEythiB9L8kJQgD/Qf/WhNm+
 HJoZDu98L6vbM0V/mSjRJmVGSlU/ZfEe+B1/Z1SJal8pu48tyv1WlgQMJq0jFWH03ez5
 FsuRjwTb3IvQWZrvnCy0eP74u6IJ0cXA/yO6nXdwb95XV06RVsX2HOSiMQdwH/KnZguD
 GXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ayHZc6ONIf0DTAL1z8VWOF7fViKga5Yvvt2mtDqrgvk=;
 b=v3dlC+u0JGKb+GPos8YkWGFMR+SXacXXvu9l5J8AWA5z+RAi301VvyRWctyZ/IcPsm
 +rZySDUjNm2mc1jy2Mwz/853t/knPcaILaEHtwwh/B2zikIXhkNmrtmHdpCfxNHkbZK5
 gr2lS1iWNwaPRQd/Sn9B3kEJJxB0SLXoJCssun5mvXmjBio9n+x23W3N3N0IFaIlS6Nl
 r6sP9JWUnPMO0UcAXnJCx4qlUpsIgqPUR7RFV9TMR2PxNdQEdQpvi9FroMvOJ6zC7opb
 itmqRc941LmATM3amFWdp2y9hNDD2H0buNaKCS1I5YRfxA3NJe4HLHzf8umaxlDRRBM8
 C+Ag==
X-Gm-Message-State: AO0yUKWLNIK2bu0ys2ysq7N/5kn+0RqIUSwbzKF3b2QfxzrbX20VWYk5
 G6jVuOcaDwWizJZrdGUeQ6p7vw==
X-Google-Smtp-Source: AK7set/gLeKToQgN6j/5v7tZPDt9u8OCqOQwtct8PKVCICMJVe7dy2gtGbQD49AOa3rSxGdZR+hWMg==
X-Received: by 2002:a5d:6d51:0:b0:2c9:b3a9:b080 with SMTP id
 k17-20020a5d6d51000000b002c9b3a9b080mr611290wri.16.1677537438060; 
 Mon, 27 Feb 2023 14:37:18 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a5d5234000000b002c5493a17efsm8272712wra.25.2023.02.27.14.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:37:17 -0800 (PST)
Message-ID: <31fa46c5-cd5e-47b3-f971-a6465d6d4b02@linaro.org>
Date: Mon, 27 Feb 2023 23:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v14 15/60] i386/xen: add pc_machine_kvm_type to initialize
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
References: <20230227142908.503517-1-dwmw2@infradead.org>
 <20230227142908.503517-16-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227142908.503517-16-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 27/2/23 15:28, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The xen_overlay device (and later similar devices for event channels and
> grant tables) need to be instantiated. Do this from a kvm_type method on
> the PC machine derivatives, since KVM is only way to support Xen emulation
> for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/pc.c         | 11 +++++++++++
>   include/hw/i386/pc.h |  3 +++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a7a2ededf9..9eb572b64b 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -89,6 +89,7 @@
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/virtio/virtio-pmem-pci.h"
>   #include "hw/virtio/virtio-mem-pci.h"
> +#include "hw/i386/kvm/xen_overlay.h"
>   #include "hw/mem/memory-device.h"
>   #include "sysemu/replay.h"
>   #include "target/i386/cpu.h"
> @@ -1843,6 +1844,16 @@ static void pc_machine_initfn(Object *obj)
>       cxl_machine_init(obj, &pcms->cxl_devices_state);
>   }
>   
> +int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
> +{
> +#ifdef CONFIG_XEN_EMU
> +    if (xen_mode == XEN_EMULATE) {
> +        xen_overlay_create();
> +    }
> +#endif
> +    return 0;
> +}
> +
>   static void pc_machine_reset(MachineState *machine, ShutdownCause reason)
>   {
>       CPUState *cs;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 66e3d059ef..740497a961 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -291,12 +291,15 @@ extern const size_t pc_compat_1_5_len;
>   extern GlobalProperty pc_compat_1_4[];
>   extern const size_t pc_compat_1_4_len;
>   
> +extern int pc_machine_kvm_type(MachineState *machine, const char *vm_type);

No 'extern' qualifier for function prototype please.

>   #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
>       static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
>       { \
>           MachineClass *mc = MACHINE_CLASS(oc); \
>           optsfn(mc); \
>           mc->init = initfn; \
> +        mc->kvm_type = pc_machine_kvm_type; \
>       } \
>       static const TypeInfo pc_machine_type_##suffix = { \
>           .name       = namestr TYPE_MACHINE_SUFFIX, \


