Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BB3C1DE5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 05:45:21 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1hS4-0005JY-EE
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 23:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1hQk-0004R9-5j
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 23:43:58 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1hQg-0003bq-Sn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 23:43:57 -0400
Received: by mail-pg1-x536.google.com with SMTP id w15so8569148pgk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 20:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p7DJ78v7QOzHLF2cD00PkdaVsvtKeetlsNlpmhcQuMI=;
 b=Rn6MzUlcwROIm7eeYUP52sYMLazrzvdA6mKp8w5XAzm4ijk3vcbd7Yb7a+DoJWX4UE
 InqwvgL5ewZtR2EY3gAFtYU2bZdw21DJ9fUWHhs1pnFxF3WMfC4jhPcicqgE+FKrkcOs
 H4Rf4XxtiI/58A6eNbLLjIj0XNQErfWx0I/XIkUYyXGol+B8R2mf/P2W+W381ojXt8Iy
 KYU0Au35p7Og4l1erTULMaOp0E5uEcNCQvBBtOf0xqmYWZS19ZANNb08JA49KSlNGdRs
 O2FE5Y7YfXlBhZXNoUN8N1t4kNS0EiLPz6Uuw/y48R990T/iKaDYqmb89MVatSNXHPSz
 0QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p7DJ78v7QOzHLF2cD00PkdaVsvtKeetlsNlpmhcQuMI=;
 b=kTXa2zmMgHdGmAcpchkB8uVK6FID1ui038giZ9NdZVQIInPAbmhYEex3YgMjBrxUH9
 IUbjCTaZVGqljELN/zewvbiI3s4HerDn+aKK7iSAXdfZ0f6m7a1VWEw7D6AocVNZfiM9
 3wojXOsHZTWqrH0Jy6bSjDO1Obn5wk63kHpW6ZzFlsZ3ppx2fELEEjjvm9ssgN5LqXNt
 RTJCb0ZTAaIkez8ObKHjD277FEDCnxtMImnpC3uZMHmymNuf/k/kPdWeUzlkHzJIn2ut
 Qqv5/W+2D2lkwFHdOuXONMStDUlXa5lvJpfcHXS83C3xsWonvjLO0AFnD3RNBBTmYyNC
 8Psw==
X-Gm-Message-State: AOAM533nJLSQ0FzBHKgsaxAFmkqKHj6WvacKJ3KUfy5tzqMnJTcA655y
 hGgtLeONzpZAca6Vx6O0X7GCbQ==
X-Google-Smtp-Source: ABdhPJz5tdejUBtQOAQgDNrlUXqKXIaqVCGEJSd7kE8vMAYI++FLPJGmiepbcLJSMysqTGm5N8NYxQ==
X-Received: by 2002:a63:4b49:: with SMTP id k9mr34904487pgl.87.1625802231346; 
 Thu, 08 Jul 2021 20:43:51 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 pj4sm10949864pjb.18.2021.07.08.20.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 20:43:50 -0700 (PDT)
Message-ID: <83533520-a1b6-29b3-66ee-c770ee2ff80c@ozlabs.ru>
Date: Fri, 9 Jul 2021 13:43:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <d18ddc97-2293-bd5e-f91d-2cc2cf1fcf89@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <d18ddc97-2293-bd5e-f91d-2cc2cf1fcf89@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 09/07/2021 08:34, BALATON Zoltan wrote:
> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>> This addresses the comments from v22.
>>
>> The functional changes are (the VOF ones need retesting with Pegasos2):
>>
>> (VOF) setprop will start failing if the machine class callback
>> did not handle it;
>> (VOF) unit addresses are lowered in path_offset();
>> (SPAPR) /chosen/bootargs is initialized from kernel_cmdline if
>> the client did not change it.
>>
>> Fixes: 5c991e5d4378 ("spapr: Implement Open Firmware client interface")
>> Cc: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> include/hw/ppc/spapr.h |   3 +--
>> pc-bios/vof/vof.h      |   2 --
>> hw/ppc/spapr.c         |  10 +---------
>> hw/ppc/spapr_hcall.c   |   5 ++---
>> hw/ppc/spapr_vof.c     |  32 +++++++++++++++++++++++---------
>> hw/ppc/vof.c           |  30 +++++++++++++++++-------------
>> pc-bios/vof/ci.c       |   2 +-
>> pc-bios/vof/libc.c     |  26 --------------------------
>> pc-bios/vof/main.c     |   2 +-
>> MAINTAINERS            |   4 ++--
>> pc-bios/vof.bin        | Bin 3784 -> 3456 bytes
>> 11 files changed, 48 insertions(+), 68 deletions(-)
>>
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index a25e69fe4cf4..779f707fb8b9 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -964,8 +964,7 @@ void spapr_set_all_lpcrs(target_ulong value, 
>> target_ulong mask);
>> hwaddr spapr_get_rtas_addr(void);
>> bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
>>
>> -void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>> -                     target_ulong *stack_ptr, Error **errp);
>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp);
>> void spapr_vof_quiesce(MachineState *ms);
>> bool spapr_vof_setprop(MachineState *ms, const char *path, const char 
>> *propname,
>>                        void *val, int vallen);
>> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
>> index 2d8958076907..5f12c077f513 100644
>> --- a/pc-bios/vof/vof.h
>> +++ b/pc-bios/vof/vof.h
>> @@ -10,11 +10,9 @@ typedef unsigned short uint16_t;
>> typedef unsigned long uint32_t;
>> typedef unsigned long long uint64_t;
>> #define NULL (0)
>> -#define PROM_ERROR (-1u)
>> typedef unsigned long ihandle;
>> typedef unsigned long phandle;
>> typedef int size_t;
>> -typedef void client(void);
>>
>> /* globals */
>> extern void _prom_entry(void); /* OF CI entry point (i.e. this 
>> firmware) */
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index e9b6d0f58756..3808d4705304 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1645,15 +1645,7 @@ static void spapr_machine_reset(MachineState 
>> *machine)
>>
>>     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>>     if (spapr->vof) {
>> -        target_ulong stack_ptr = 0;
>> -
>> -        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
>> -
>> -        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> -                                  stack_ptr, spapr->initrd_base,
>> -                                  spapr->initrd_size);
>> -        /* VOF is 32bit BE so enforce MSR here */
>> -        first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << 
>> MSR_LE));
>> +        spapr_vof_reset(spapr, fdt, &error_fatal);
>>         /*
>>          * Do not pack the FDT as the client may change properties.
>>          * VOF client does not expect the FDT so we do not load it to 
>> the VM.
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 80ae8eaadd34..0e9a5b2e4053 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1080,7 +1080,7 @@ target_ulong 
>> do_client_architecture_support(PowerPCCPU *cpu,
>>     SpaprOptionVector *ov1_guest, *ov5_guest;
>>     bool guest_radix;
>>     bool raw_mode_supported = false;
>> -    bool guest_xive, reset_fdt = false;
>> +    bool guest_xive;
>>     CPUState *cs;
>>     void *fdt;
>>     uint32_t max_compat = spapr->max_compat_pvr;
>> @@ -1233,8 +1233,7 @@ target_ulong 
>> do_client_architecture_support(PowerPCCPU *cpu,
>>         spapr_setup_hpt(spapr);
>>     }
>>
>> -    reset_fdt = spapr->vof != NULL;
>> -    fdt = spapr_build_fdt(spapr, reset_fdt, fdt_bufsize);
>> +    fdt = spapr_build_fdt(spapr, spapr->vof != NULL, fdt_bufsize);
>>     g_free(spapr->fdt_blob);
>>     spapr->fdt_size = fdt_totalsize(fdt);
>>     spapr->fdt_initial_size = spapr->fdt_size;
>> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
>> index 1d5bec146c49..951fed0e191d 100644
>> --- a/hw/ppc/spapr_vof.c
>> +++ b/hw/ppc/spapr_vof.c
>> @@ -9,6 +9,7 @@
>> #include "qapi/error.h"
>> #include "hw/ppc/spapr.h"
>> #include "hw/ppc/spapr_vio.h"
>> +#include "hw/ppc/spapr_cpu_core.h"
>> #include "hw/ppc/fdt.h"
>> #include "hw/ppc/vof.h"
>> #include "sysemu/sysemu.h"
>> @@ -30,13 +31,19 @@ target_ulong spapr_h_vof_client(PowerPCCPU *cpu, 
>> SpaprMachineState *spapr,
>> void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
>> {
>>     char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
>> -    int chosen;
>>
>>     vof_build_dt(fdt, spapr->vof);
>>
>> -    _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
>> -    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
>> -                            spapr->vof->bootargs ? : ""));
>> +    if (spapr->vof->bootargs) {
>> +        int chosen;
>> +
>> +        _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
>> +        /*
>> +         * If the client did not change "bootargs", spapr_dt_chosen() 
>> must have
>> +         * stored machine->kernel_cmdline in it before getting here.
>> +         */
>> +        _FDT(fdt_setprop_string(fdt, chosen, "bootargs", 
>> spapr->vof->bootargs));
>> +    }
>>
>>     /*
>>      * SLOF-less setup requires an open instance of stdout for early
>> @@ -49,20 +56,21 @@ void 
>> spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
>>     }
>> }
>>
>> -void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>> -                     target_ulong *stack_ptr, Error **errp)
>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp)
>> {
>> +    target_ulong stack_ptr;
>>     Vof *vof = spapr->vof;
>> +    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
>>
>>     vof_init(vof, spapr->rma_size, errp);
>>
>> -    *stack_ptr = vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
>> -    if (*stack_ptr == -1) {
>> +    stack_ptr = vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
>> +    if (stack_ptr == -1) {
>>         error_setg(errp, "Memory allocation for stack failed");
>>         return;
>>     }
>>     /* Stack grows downwards plus reserve space for the minimum stack 
>> frame */
>> -    *stack_ptr += VOF_STACK_SIZE - 0x20;
>> +    stack_ptr += VOF_STACK_SIZE - 0x20;
>>
>>     if (spapr->kernel_size &&
>>         vof_claim(vof, spapr->kernel_addr, spapr->kernel_size, 0) == 
>> -1) {
>> @@ -78,6 +86,12 @@ void spapr_vof_reset(SpaprMachineState *spapr, void 
>> *fdt,
>>
>>     spapr_vof_client_dt_finalize(spapr, fdt);
>>
>> +    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                              stack_ptr, spapr->initrd_base,
>> +                              spapr->initrd_size);
>> +    /* VOF is 32bit BE so enforce MSR here */
>> +    first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
>> +
>>     /*
>>      * At this point the expected allocation map is:
>>      *
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> index a17fd9d2fe94..8d307cd048ba 100644
>> --- a/hw/ppc/vof.c
>> +++ b/hw/ppc/vof.c
>> @@ -144,15 +144,16 @@ static int path_offset(const void *fdt, const 
>> char *path)
>>      * the lower case forms of the hexadecimal digits in the range a..f,
>>      * suppressing leading zeros".
>>      */
>> -    at = strchr(path, '@');
>> -    if (!at) {
>> -        return fdt_path_offset(fdt, path);
>> -    }
>> -
>>     p = g_strdup(path);
>> -    for (at = at - path + p + 1; *at; ++at) {
>> -        *at = tolower(*at);
>> +    for (at = strchr(p, '@'); at && *at; ) {
>> +            if (*at == '/') {
>> +                at = strchr(at, '@');
>> +            } else {
>> +                *at = tolower(*at);
>> +                ++at;
>> +            }
>>     }
>> +
>>     return fdt_path_offset(fdt, p);
>> }
>>
>> @@ -300,6 +301,7 @@ static uint32_t vof_setprop(MachineState *ms, void 
>> *fdt, Vof *vof,
>>     char trval[64] = "";
>>     char nodepath[VOF_MAX_PATH] = "";
>>     Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
>> +    VofMachineIfClass *vmc;
>>     g_autofree char *val = NULL;
>>
>>     if (vallen > VOF_MAX_SETPROPLEN) {
>> @@ -322,13 +324,13 @@ static uint32_t vof_setprop(MachineState *ms, 
>> void *fdt, Vof *vof,
>>         goto trace_exit;
>>     }
>>
>> -    if (vmo) {
>> -        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
>> +    if (!vmo) {
>> +        goto trace_exit;
>> +    }
>>
>> -        if (vmc->setprop &&
>> -            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
>> -            goto trace_exit;
>> -        }
>> +    vmc = VOF_MACHINE_GET_CLASS(vmo);
>> +    if (!vmc->setprop || !vmc->setprop(ms, nodepath, propname, val, 
>> vallen)) {
>> +        goto trace_exit;
>>     }
>>
>>     ret = fdt_setprop(fdt, offset, propname, val, vallen);
> 
> MorphOS still boots but this breaks Linux which changes a few things in 
> the device tree to fix it up to make it look the way it thinks is 
> better.


What are those things? What does the change break precisely? Does the 
kernel stop booting?
Can you please send output with the trace_vof_setprop tracepoint enabled?


> I suggest to drop these two hunks and keep the default to allow 
> setprop if there's no callback. If you want to disable it for a board 
> you can add a callback and spapr already has one which disallows all but 
> some props by default so this will only change pegasos2 where I'd need 
> to add an empty callback to revert this. So at the end this will be 
> ineffective, therefore just drop it unless there's a good reason to keep.
> 
> Other than this:
> 
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> with MorphOS and Linux (with above two hunks reverted).

Thanks!


-- 
Alexey

