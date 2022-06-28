Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F1C55BFD0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:39:58 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67hN-000549-Qc
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67Fi-0002w6-BM; Tue, 28 Jun 2022 05:11:23 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67Fg-0003FR-1X; Tue, 28 Jun 2022 05:11:22 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N3bb3-1nfGtP3hkh-010alJ; Tue, 28 Jun 2022 11:11:13 +0200
Message-ID: <713cf57f-0a53-340b-e89c-c1d6151dfd1f@vivier.eu>
Date: Tue, 28 Jun 2022 11:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/pci-host/i440fx: Remove unused parameter from
 i440fx_init()
Content-Language: fr
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org
References: <20220612192800.40813-1-shentey@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220612192800.40813-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7mYohewAmdVKGNIt1fka+jUeaOlpZELNvbZdC5kZkca8osWMDGJ
 Z2DTRWU8yzSuyQcbexKLuh0cB+HbeTJVRBromW+fTqf3K/kpwj+It5Agtz+3NETe+FeaClq
 JdNXQnZoSUzq6ArYdZx99wotpFQicxGl5UXZKKlDKrgv2/4cKTX1Fmh6Rt97GRoG1+Bh0Rt
 hRDP3I//p/jBcRKgDqTyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jo23dqjCsMQ=:cWHrapqY4xTOwi74Q8njP/
 AMJ86dlWS5abg7pt4qeA3kKGp8h7YA4ZnykLc5l1gy3E/nd2P4e4rlqSau/0h8BU4+GxwxGGz
 KOEVtzPEotmpaP/hRLBELAzkg3ltF8qGtcJKqHyTnTQIOkWhAcQtAqWeXbonbPpJ/E6/ZeXQ2
 fnBwUGEy1Fli6xk+Y4dxXXRUPSIEgQWmbp3ZZSQyjEXKKxFcj9oXNXu6hof54HXDVz1RMS3v2
 eI2LDOBiN/hLxIb2L0WD7/76Mr3UfNErZJMCfrvviGnDY92LbMvj4gD67xgzVMVISevviv+2+
 d5oe7vbq3THVB/ixAJbEx4IGBMbh/NNInQ/mcucqtWTDmVueErbIp9dgxIrkktrMV4PYj/67d
 HclSf3WipUd8b+2cG+lB7zlUO5E2rLUb/TNIP01uZ3qnW4K4eIml1BZG6A5RZMul5hS5O8+w5
 kSR/B8J787p+N11XhOgWtAODCg79RLK+UMHuqiHt2hxPfYUFwjRg503jVRhtL9CethKCHcHsq
 94r8b+TIk4Tz0XMa4rU7U/mHpm917cqhIVhBCgDS5Z2Igy9tMgGkFqBU91/Q9St1LEgssd1mB
 lr5Iiw+E5/fxWz2qOcCpVlGuMBHEOPqmplObhjK30PQaHKPmDIDLptZxHsdOzpYRpdxfi+nwt
 3995QQ8Sct+NTPoUA2c5U/J7122e77Qw3aor116XKbL9CmJrpqVpeM6abW+PNs7mOfMrqx3Hr
 TYhIR8jYqfzNogEIvd7Tb5HtwlsYgPLyYMUEdg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 12/06/2022 à 21:28, Bernhard Beschow a écrit :
> pi440fx_state is an out-parameter which is never read by the caller.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c            | 3 ---
>   hw/pci-host/i440fx.c         | 4 +---
>   include/hw/pci-host/i440fx.h | 1 -
>   3 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 0fc2361ffe..a234989ac3 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -82,7 +82,6 @@ static void pc_init1(MachineState *machine,
>       MemoryRegion *system_io = get_system_io();
>       PCIBus *pci_bus;
>       ISABus *isa_bus;
> -    PCII440FXState *i440fx_state;
>       int piix3_devfn = -1;
>       qemu_irq smi_irq;
>       GSIState *gsi_state;
> @@ -203,7 +202,6 @@ static void pc_init1(MachineState *machine,
>   
>           pci_bus = i440fx_init(host_type,
>                                 pci_type,
> -                              &i440fx_state,
>                                 system_memory, system_io, machine->ram_size,
>                                 x86ms->below_4g_mem_size,
>                                 x86ms->above_4g_mem_size,
> @@ -217,7 +215,6 @@ static void pc_init1(MachineState *machine,
>           isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
>       } else {
>           pci_bus = NULL;
> -        i440fx_state = NULL;
>           isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
>                                 &error_abort);
>           pcms->hpet_enabled = false;
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index e08716142b..1c5ad5f918 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -238,7 +238,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>   }
>   
>   PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> -                    PCII440FXState **pi440fx_state,
>                       MemoryRegion *address_space_mem,
>                       MemoryRegion *address_space_io,
>                       ram_addr_t ram_size,
> @@ -264,8 +263,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>       d = pci_create_simple(b, 0, pci_type);
> -    *pi440fx_state = I440FX_PCI_DEVICE(d);
> -    f = *pi440fx_state;
> +    f = I440FX_PCI_DEVICE(d);
>       f->system_memory = address_space_mem;
>       f->pci_address_space = pci_address_space;
>       f->ram_memory = ram_memory;
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index f068aaba8f..52518dbf08 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -36,7 +36,6 @@ struct PCII440FXState {
>   #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>   
>   PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> -                    PCII440FXState **pi440fx_state,
>                       MemoryRegion *address_space_mem,
>                       MemoryRegion *address_space_io,
>                       ram_addr_t ram_size,

Applied to my trivial-patches branch.

Thanks,
Laurent


