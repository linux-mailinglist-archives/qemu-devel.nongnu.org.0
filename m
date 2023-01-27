Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9433D67F286
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYat-0008Ix-Rc; Fri, 27 Jan 2023 18:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYar-0008Hx-Eo
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:57:17 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYap-00083J-Nn
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:57:17 -0500
Received: by mail-wm1-x330.google.com with SMTP id m15so4554893wms.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 15:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=83C/sqLpYcRoe72UESTSQaaVCL+73bpf4QRcam6XkOQ=;
 b=KsUF4JL9cfOoJtRyznvNR/BwaPQD7NpThV9G5oCpMmQ14t+0dU95I0IO8bOWUH4ArQ
 boN2ct+k+O39oW9PF0tjs6rSRtDGbOIGu4QJvk7Iqmz9kSTblMBSvbSkcpqFGhq1yg6Y
 27WMuEjSGgRSPVcgfz6fH5LVZtwFSUQgx2hA7QAqwn8IjnT1cwZDLMoRXg4QIJsuhik0
 IVP2lq+OKg2UqCxALQqHNNsl+PdfDzh3CcV5s6h+ISZ6NDiZDmuPmoS8xRZuNMhnt567
 oPMXOIaC6EWp0q5Q7XfHSFyn3xU+pxCVUGtBzMkAQB4zIcJ+i87QcwLl4ijwM94suV5d
 xiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=83C/sqLpYcRoe72UESTSQaaVCL+73bpf4QRcam6XkOQ=;
 b=v9faD5rglEUQLjlYtvb0sq61a6PO7esgmWU2ra6asnDm00joUQiH/1BPWo/KOJHNrO
 Kid0baAUgS9ltY40E20PNtJgu/dUKNmhAGzkYdyqamUhz+77s6GH16ra26P8sA4UtG/3
 N1LR4hCUF4pt6B8C+vLdr3Da8ylvd7hnOo3a5s1dx01oI25qraEnUCfkBnr3HUd5FEw6
 zCbQZp0GEnzUx3Ng0FlT2RHL5cIJPFyjnKr4fp6D+0xr9IAGNO58MINZYvYDWjU0ZKiK
 hPSyBxHakH2CGbgzMkm2msVOHZkXdXWg6g3YprKCGA7ktqeNikUvxE/GAEaebkkKXQ4t
 Pgdw==
X-Gm-Message-State: AFqh2kpqYsbZD5ZrePLjbC0mqprcp/q2nfZHbBgZVHXxpsBXI0NHqxFZ
 f7OkRra6+WMYbub92oP1S5MKQg==
X-Google-Smtp-Source: AMrXdXtwL+SC1CEsaB+gZBcbt+ILUbPRKm89eURC+M+uo7XJxNmJawyVIaj/H+xHnHamksdM/k6fzg==
X-Received: by 2002:a05:600c:5025:b0:3db:14dc:8cff with SMTP id
 n37-20020a05600c502500b003db14dc8cffmr37244799wmr.33.1674863834222; 
 Fri, 27 Jan 2023 15:57:14 -0800 (PST)
Received: from [192.168.0.114] ([196.77.14.77])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db0bb81b6asm5975351wmb.1.2023.01.27.15.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:57:13 -0800 (PST)
Message-ID: <cd7b2036-b203-5cd7-4efe-281dfaa0c186@linaro.org>
Date: Sat, 28 Jan 2023 00:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 7/7] hw/i386/pc: Initialize ram_memory variable directly
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20230127164718.98156-1-shentey@gmail.com>
 <20230127164718.98156-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230127164718.98156-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 27/1/23 17:47, Bernhard Beschow wrote:
> Going through pc_memory_init() seems quite complicated for a simple
> assignment.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   include/hw/i386/pc.h | 1 -
>   hw/i386/pc.c         | 2 --
>   hw/i386/pc_piix.c    | 4 ++--
>   hw/i386/pc_q35.c     | 5 ++---
>   4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 88a120bc23..5331b9a5c5 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -163,7 +163,6 @@ void xen_load_linux(PCMachineState *pcms);
>   void pc_memory_init(PCMachineState *pcms,
>                       MemoryRegion *system_memory,
>                       MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory,
>                       uint64_t pci_hole64_size);
>   uint64_t pc_pci_hole64_start(void);
>   DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969..8898cc9961 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -936,7 +936,6 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
>   void pc_memory_init(PCMachineState *pcms,
>                       MemoryRegion *system_memory,
>                       MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory,
>                       uint64_t pci_hole64_size)
>   {
>       int linux_boot, i;
> @@ -994,7 +993,6 @@ void pc_memory_init(PCMachineState *pcms,
>        * Split single memory region and use aliases to address portions of it,
>        * done for backwards compatibility with older qemus.
>        */
> -    *ram_memory = machine->ram;
>       ram_below_4g = g_malloc(sizeof(*ram_below_4g));
>       memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
>                                0, x86ms->below_4g_mem_size);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5bde4533cc..00ba725656 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -143,6 +143,7 @@ static void pc_init1(MachineState *machine,
>       if (xen_enabled()) {
>           xen_hvm_init_pc(pcms, &ram_memory);
>       } else {
> +        ram_memory = machine->ram;
>           if (!pcms->max_ram_below_4g) {
>               pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
>           }
> @@ -205,8 +206,7 @@ static void pc_init1(MachineState *machine,
>   
>       /* allocate ram and load rom/bios */
>       if (!xen_enabled()) {
> -        pc_memory_init(pcms, system_memory,
> -                       rom_memory, &ram_memory, hole64_size);
> +        pc_memory_init(pcms, system_memory, rom_memory, hole64_size);
>       } else {
>           pc_system_flash_cleanup_unused(pcms);
>           if (machine->kernel_filename != NULL) {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b97979bebb..8559924eb4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -128,7 +128,7 @@ static void pc_q35_init(MachineState *machine)
>       MemoryRegion *system_io = get_system_io();
>       MemoryRegion *pci_memory;
>       MemoryRegion *rom_memory;
> -    MemoryRegion *ram_memory;
> +    MemoryRegion *ram_memory = machine->ram;
>       GSIState *gsi_state;
>       ISABus *isa_bus;
>       int i;
> @@ -215,8 +215,7 @@ static void pc_q35_init(MachineState *machine)
>       }
>   
>       /* allocate ram and load rom/bios */
> -    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
> -                   pci_hole64_size);
> +    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
>   
>       object_property_add_child(OBJECT(machine), "q35", OBJECT(phb));
>       object_property_set_link(OBJECT(phb), MCH_HOST_PROP_RAM_MEM,


