Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B33368A5D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 03:26:46 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZkaj-0001qA-55
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 21:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkZR-00015D-1v
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:25:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkZ7-0008NF-FL
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:25:19 -0400
Received: by mail-pl1-x633.google.com with SMTP id t22so24121398ply.1
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/v3ueyu767UR2a71ujrmoLFs5EhOGrkoQ0rgfThnahc=;
 b=GOR/qFhRZvfu105UOFwvo7fZV2GpZIopkU6A0DRQymL5H6S8SWfAhwHhA4vh0Mlj9K
 WOWoX7u6oUgLKvN+gZhdn9/9GK7nc62kUjbHIwg0wTcOSRilaLSS499Fy8C2n7PoodJf
 DBD6x6fuN+950K396NB0LKbNvhW8mk5KZLVPCfzmgD0l375+UEr/ce9TLwl+Yce6mtFe
 z2QR5bAeWN1n3ERq2e4EtnHkZA9zvA07nD/5XMwSCF6MyXFUOd+ZcLdS59/2OmqEMNFK
 4REh5lIk3lM82MiajAFpM3eaS8redxpjanuGAZVuM9sTCOwbVt4Zh5be4IYG4aYBAVeI
 zSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/v3ueyu767UR2a71ujrmoLFs5EhOGrkoQ0rgfThnahc=;
 b=NKvrc2tS6zlN2T6MCbq2TUiwsdMT9gez7qHcow8RAUeRQGIyoRuhxDiP/jzAoyeILa
 /Qn84LSBkcryKuKGjZsJHHYSG6T5ZJrKStQdmw1VKLS/JiBntrxhHN4slBvomgs9Yv4d
 9hvLoe3kwlyOg6ACqkQM4PTaTJfe+oov1Dl/3eMSzi4IRMrJ4JjAgKDSzbjgBmZyXndu
 CSRZdVaXBh/5u50RBqAP7UeWxy+AIztSxOz/hGbOul96b1p9jwGhlNvsPBq39+6EMICP
 Ls2/i2WQ03IKWO+N6IFvOKHpyfozDPZqkcOv0oAMuJyrII+wbUusYQ238jOOhC2Axmou
 BU5w==
X-Gm-Message-State: AOAM533vdSH52dEYhorMHEn/rfEdJfm0Uyd/qwoKKJnEBNKD5nOvc/2k
 abV6n45cPdgvDa+DXZN53H1P+g==
X-Google-Smtp-Source: ABdhPJzu8DoNrnpnltTN+rETfNORh6Llx4nULhsxSle3Ax014Sx8NB+SHiqQh+NvdLXWT50EGu1LIw==
X-Received: by 2002:a17:90a:a58f:: with SMTP id
 b15mr1557539pjq.135.1619141102090; 
 Thu, 22 Apr 2021 18:25:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h8sm3215390pjt.17.2021.04.22.18.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:25:01 -0700 (PDT)
Subject: Re: [PATCH v6 10/18] cpu: Move CPUClass::vmsd to SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc8cd5b3-3502-1937-1400-f471078cad9b@linaro.org>
Date: Thu, 22 Apr 2021 18:24:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Juan Quintela <quintela@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> Migration is specific to system emulation.
> 
> - Move the CPUClass::vmsd field to SysemuCPUOps,
> - restrict VMSTATE_CPU() macro to sysemu,
> - vmstate_dummy is now unused, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps riscv_sysemu_ops = {
> +    /* For now, mark unmigratable: */
> +    .legacy_vmsd = &vmstate_riscv_cpu,
>   };
>   #endif
>   
> @@ -628,8 +630,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>       cc->disas_set_info = riscv_cpu_disas_set_info;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
> -    /* For now, mark unmigratable: */
> -    cc->legacy_vmsd = &vmstate_riscv_cpu;

I'll note that the comment has been incorrect since f7697f0e629.


r~

>       cc->sysemu_ops = &riscv_sysemu_ops;
>       cc->write_elf64_note = riscv_cpu_write_elf64_note;
>       cc->write_elf32_note = riscv_cpu_write_elf32_note;
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 7503b9e0c8b..131e7dfdf82 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
>   
>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps s390_sysemu_ops = {
> +    .legacy_vmsd = &vmstate_s390_cpu,
>   };
>   #endif
>   
> @@ -522,7 +523,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
>       cc->gdb_write_register = s390_cpu_gdb_write_register;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
> -    cc->legacy_vmsd = &vmstate_s390_cpu;
>       cc->get_crash_info = s390_cpu_get_crash_info;
>       cc->write_elf64_note = s390_cpu_write_elf64_note;
>       cc->sysemu_ops = &s390_sysemu_ops;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 743a7287a4f..543853c24dc 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -850,6 +850,7 @@ static Property sparc_cpu_properties[] = {
>   
>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps sparc_sysemu_ops = {
> +    .legacy_vmsd = &vmstate_sparc_cpu,
>   };
>   #endif
>   
> @@ -894,7 +895,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>       cc->gdb_write_register = sparc_cpu_gdb_write_register;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
> -    cc->legacy_vmsd = &vmstate_sparc_cpu;
>       cc->sysemu_ops = &sparc_sysemu_ops;
>   #endif
>       cc->disas_set_info = cpu_sparc_disas_set_info;
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index b15abc36851..e3f2f2fefa3 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -10880,6 +10880,7 @@ static Property ppc_cpu_properties[] = {
>   
>   #ifndef CONFIG_USER_ONLY
>   static const struct SysemuCPUOps ppc_sysemu_ops = {
> +    .legacy_vmsd = &vmstate_ppc_cpu,
>   };
>   #endif
>   
> @@ -10925,7 +10926,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>       cc->gdb_write_register = ppc_cpu_gdb_write_register;
>   #ifndef CONFIG_USER_ONLY
>       cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
> -    cc->legacy_vmsd = &vmstate_ppc_cpu;
>       cc->sysemu_ops = &ppc_sysemu_ops;
>   #endif
>   #if defined(CONFIG_SOFTMMU)
> 


