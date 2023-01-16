Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873066CBE6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:20:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHT7j-0003nx-MZ; Mon, 16 Jan 2023 12:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHT7M-0003mD-RL
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:17:58 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHT7L-0002Bq-5O
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:17:56 -0500
Received: by mail-wr1-x433.google.com with SMTP id r9so5354493wrw.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DSWs+BBEnO1AWEL4eh+8vWNWzNALrrJvFuB29WGjs6M=;
 b=q6grtuJxlKiqohOv1HBRHzrb/9lm9QWn8Xock5ewbrXbACMECKZzDmtIIAYu7AHFcI
 AD99mZszbBvL376NvZuB/YsDanbscgqu0UOSxbjLz391AqccGsYGoCHAyFe49/uLcq00
 pT/u/fGZu1g2OYj1d+oqgwe7EfOVVNDa7B/803XQXZgO/bVABgc8eQ+fIUjSwW6nW/ij
 sHUo8XH4OMq0dpSlIGPxWj8dWt9IGxl8R+v49grm31TwsRjLv85ooGQhQETHZ9MG0tD1
 FjAH7khft2rO27hP3dpQdutXnUQX5No1LNkeuVTO/p6ypmhQxFvJMm7mLUhPTQ6Tg04T
 QMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSWs+BBEnO1AWEL4eh+8vWNWzNALrrJvFuB29WGjs6M=;
 b=utHnChLqwv0iRAJH5WDfYfxRfrEYRAL+hpvfz6yA8qYzcKNSrQBKZAdGduHX5HlEVP
 ueJaVIJPx0K6LNZ+8Xs9PUij8GC4HvMWukD+JMJd3zOXExVdICYzMbk3xL74feVL00W2
 HFoFZRH41cWnmfbtHUKAs3lNAcu384Qi2JO++zvCPL1jXPPcT3SahVpTWUeGlR1kfzqg
 yjRpFwjRt8wFT+b6oLClDVtqikjhdOkdyHbOeO2XkNTGMeBg06yBGtKckb/7eeKPBxsV
 Xg2pzTyCS45A9RAKszlkWL2P3p7XURcaJGYc9ZZsaIzJbkBUHInt2h6xa6WpJMY9lbbi
 MQsg==
X-Gm-Message-State: AFqh2koLIRKntN+Apo8O0AR1yudyRX2NF6Ds5bpM+BR7HRU1HJXT09IN
 poIAxQX4dwpyZtuJJDKpoKI=
X-Google-Smtp-Source: AMrXdXs2VVHouT70mhF+DnljbQh+4JQ3edZmv9wy4ezqakQziq47qZhbXMbVm7hdRWxc3YNFsJaXig==
X-Received: by 2002:adf:fad2:0:b0:2bd:c83a:6e3 with SMTP id
 a18-20020adffad2000000b002bdc83a06e3mr8124571wrs.7.1673889473300; 
 Mon, 16 Jan 2023 09:17:53 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002bddac15b3dsm11024331wrw.33.2023.01.16.09.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:17:52 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0fb0fe9d-977e-a148-408b-455e6e6a123c@xen.org>
Date: Mon, 16 Jan 2023 17:17:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 14/51] i386/xen: add pc_machine_kvm_type to initialize
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-15-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x433.google.com
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

On 10/01/2023 12:20, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The xen_overlay device (and later similar devices for event channels and
> grant tables) need to be instantiated. Do this from a kvm_type method on
> the PC machine derivatives, since KVM is only way to support Xen emulation
> for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc.c         | 11 +++++++++++
>   include/hw/i386/pc.h |  3 +++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d489ecc0d1..0ddae2f6ad 100644
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
> @@ -1844,6 +1845,16 @@ static void pc_machine_initfn(Object *obj)
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
> index 991f905f5d..b866567b7b 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -293,12 +293,15 @@ extern const size_t pc_compat_1_5_len;
>   extern GlobalProperty pc_compat_1_4[];
>   extern const size_t pc_compat_1_4_len;
>   
> +extern int pc_machine_kvm_type(MachineState *machine, const char *vm_type);
> +
>   #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
>       static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
>       { \
>           MachineClass *mc = MACHINE_CLASS(oc); \
>           optsfn(mc); \
>           mc->init = initfn; \
> +        mc->kvm_type = pc_machine_kvm_type; \

Given that it does nothing in the non-Xen-emulate case, would it not be 
neater to simply wrap the above line, and the definition of the 
function, in #ifdef CONFIG_XEN_EMU?

   Paul

>       } \
>       static const TypeInfo pc_machine_type_##suffix = { \
>           .name       = namestr TYPE_MACHINE_SUFFIX, \


