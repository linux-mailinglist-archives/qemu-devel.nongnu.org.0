Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2978523C6B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 20:24:57 +0200 (CEST)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nor16-0002LR-KT
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 14:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1noqzQ-0001AT-U4; Wed, 11 May 2022 14:23:13 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1noqzP-0000Lx-00; Wed, 11 May 2022 14:23:12 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so1042257otu.4; 
 Wed, 11 May 2022 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xt11QQoz4SdXpM4qlgGpTcEfyJEu7ljwhAbsnDSI2is=;
 b=j4h83Jjmyv6AEuzRerCa8aEv7YhzV8TlzOjYuTwqnK+soFP8zMASITDPamvc80ChpZ
 P90j7wYve51RDc+quwEvs9FuctS51ox6NkHLw/oLu+SJsoBfUMGfCkUpE1jyysq/CzTi
 P1hEe62b5vVM11hRt3ONEW9zRidscifn89q5IQqShLEPXArpeIaUb6PrJfOLuT1vCgmr
 9RBCbe1tLwU5x4i4qwOSMFW9htHc/YgkgaaSBlLvvtHbkmV0zMh/VftnhDHfBhYyt2TP
 NKFDVqpekBioZekGgPZ51V8Uq+Yl4VhfmUn68k24oNQx7a2i+KEMZMU1Du/1YWfzLtZn
 ukRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xt11QQoz4SdXpM4qlgGpTcEfyJEu7ljwhAbsnDSI2is=;
 b=oV2m0wrKhqitZSaTx9mNrI/s7jiFfsZ8Skj1i/yxqA7aSAJAVSrylmY1ZwO76avHxk
 a8c4GJEzBEFPZQJvhHJw1KsHilhenjjcUKtjlkNfd1Ct5ESoJWzTjHgUFQaSpTOgoAPj
 JUTFZV6DmC6xurXb9AfcP2tt9NXJvisk6wLhj4mFz1mEOiysJz1Q16zQA9c9Kx9DWoSG
 yw+OWGIbLbViB2CqJdQhZDF92Km+/kkWd/3re5AdreLcLse74tqrAx5gIVSSdb6guM3R
 7z/KyvVMJdYs4XxWrcGXDQMxZ9dpIbM8bRytrJAIyY+87W75P2Yg7SDyZxfz5i24eKKU
 vQIw==
X-Gm-Message-State: AOAM53352ErWe9weaJ+Br1vq4Tqev6IH2B3XZxx/fWDDG2kMxPh8ybhI
 4iPnNg/2VILjN4nDYqMkebc=
X-Google-Smtp-Source: ABdhPJzMUoEbOaPrT4j7lhp2whwP09XwGIJG9oD/blvb6c8oMMAfX8DJ1NnPd5RUz4XE0WqlCCTsIA==
X-Received: by 2002:a9d:5d16:0:b0:5ce:127a:1c42 with SMTP id
 b22-20020a9d5d16000000b005ce127a1c42mr9969717oti.350.1652293389485; 
 Wed, 11 May 2022 11:23:09 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:6d99:130b:198b:b4b2:dcf0?
 ([2804:431:c7c7:6d99:130b:198b:b4b2:dcf0])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a056830408100b0060603221260sm1123406ott.48.2022.05.11.11.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 11:23:08 -0700 (PDT)
Message-ID: <a17d1a2d-41d1-1015-1b88-daf77ae25eee@gmail.com>
Date: Wed, 11 May 2022 15:23:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] pseries: allow setting stdout-path even on machines
 with a VGA
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220507054826.124936-1-pbonzini@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220507054826.124936-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/7/22 02:48, Paolo Bonzini wrote:
> -machine graphics=off is the usual way to tell the firmware or the OS that the
> user wants a serial console.  The pseries machine however does not support
> this, and never adds the stdout-path node to the device tree if a VGA device
> is provided.  This is in addition to the other magic behavior of VGA devices,
> which is to add a keyboard and mouse to the default USB bus.
> 
> Split spapr->has_graphics in two variables so that the two behaviors can be
> separated: the USB devices remains the same, but the stdout-path is added
> even with "-device VGA -machine graphics=off".
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And queued in gitlab.com/danielhb/qemu/tree/ppc-next.


Thanks,


Daniel

>   hw/ppc/spapr.c         | 12 ++++++++----
>   include/hw/ppc/spapr.h |  2 +-
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index fe9937e811..75189e4020 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1066,7 +1066,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
>               _FDT(fdt_setprop_string(fdt, chosen, "qemu,boot-device", boot_device));
>           }
>   
> -        if (!spapr->has_graphics && stdout_path) {
> +        if (spapr->want_stdout_path && stdout_path) {
>               /*
>                * "linux,stdout-path" and "stdout" properties are
>                * deprecated by linux kernel. New platforms should only
> @@ -2711,6 +2711,7 @@ static void spapr_machine_init(MachineState *machine)
>       const char *kernel_filename = machine->kernel_filename;
>       const char *initrd_filename = machine->initrd_filename;
>       PCIHostState *phb;
> +    bool has_vga;
>       int i;
>       MemoryRegion *sysmem = get_system_memory();
>       long load_limit, fw_size;
> @@ -2949,9 +2950,12 @@ static void spapr_machine_init(MachineState *machine)
>       }
>   
>       /* Graphics */
> -    if (spapr_vga_init(phb->bus, &error_fatal)) {
> -        spapr->has_graphics = true;
> +    has_vga = spapr_vga_init(phb->bus, &error_fatal);
> +    if (has_vga) {
> +        spapr->want_stdout_path = !machine->enable_graphics;
>           machine->usb |= defaults_enabled() && !machine->usb_disabled;
> +    } else {
> +        spapr->want_stdout_path = true;
>       }
>   
>       if (machine->usb) {
> @@ -2961,7 +2965,7 @@ static void spapr_machine_init(MachineState *machine)
>               pci_create_simple(phb->bus, -1, "nec-usb-xhci");
>           }
>   
> -        if (spapr->has_graphics) {
> +        if (has_vga) {
>               USBBus *usb_bus = usb_bus_find(-1);
>   
>               usb_create_simple(usb_bus, "usb-kbd");
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 14b01c3f59..072dda2c72 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -194,7 +194,7 @@ struct SpaprMachineState {
>       Vof *vof;
>       uint64_t rtc_offset; /* Now used only during incoming migration */
>       struct PPCTimebase tb;
> -    bool has_graphics;
> +    bool want_stdout_path;
>       uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
>   
>       /* Nested HV support (TCG only) */

